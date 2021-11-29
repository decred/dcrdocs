# LN Data Backup

---

!!! danger "Critical Information to Prevent Fund Loss"

    In order to redeem funds from a channel in case of seed restores, LN users need to maintain an up to date backup of data by way of an SCB file.

!!! info "SCB Decryption Errors"

    An SCB file is only valid for the exact same wallet/account that generated it. Trying to restore it on a different wallet or account will cause a generic decryption error.

!!! info "Watchtowers Required"

    For complete safety from possible malicious remote nodes, users should also use third party, reputable watchtowers to ensure that if the remote nodes executes the DLP protocol with an invalid state they are correctly punished for it.

Due to its nature as a second-layer network, Lightning Network related wallet data is **not** stored in the blockchain itself. This means that the standard wallet seed is **not sufficient** to restore the LN balance of a wallet in case of a restore from seed.

LN users need to **also** regularly and safely store the _Static Channel Backup_ (SCB) file so that a restored lightning wallet might be used to close the channels opened by the previous wallet.

The backup should be updated every time a channel is opened or closed on the local LN node (including when a _remote_ node opens a channel back to the local node).

The rest of this document details what exactly the SCB-based backup method entails, how to perform backups and restores using it, and its limitations.

## Overview of Backup Issues for LN nodes

The next sections provide a high level overview of _why_ backups are needed for Lightning Network nodes and how they work.

For the operational instructions on generating and applying backups see the section on [Operating SCB Backups](#operating-scb-backups).

### What data does an LN wallet store?

This can be skipped for those familiar with how LN operates.

Payments over the Lightning Network happen across _channels_. An LN channel can be understood as an agreement between two entities (nodes) to allow payments up to some pre-defined amount.

While a lightning channel is realized as an on-chain output, spendable by a multisig 2-of-2 signature script, the channel state evolves completely off-chain by having _relative balances_ and _in-flight payments_ (HTLCs) only known to the parties of channel.

This means that while other participants of the network know that a given channel exists (due to the output being stored and confirmed on the blockchain), the data about which portion (how many coins) each of the two nodes own in the channel, as well as which payments are currently outstanding, is only known to them.

Every sequential update to the channel state is summarized by a corresponding _commitment transaction_: a transaction that is usually kept off-chain (never broadcast) but works as a sort of insurance that either party can recover their funds if the other node stops working properly.

This transaction is updated and re-signed every time a new payment changes the relative balances of the channel. It is then stored on a local database, along with some other metadata such as the current state number, the specific keys used to sign this update and information about older, revoked states.

A lightning node must **never** publish a state older than the most recent one agreed by the two parties of a channel. Due to how the LN protocol works, publishing the commitment transaction of an old, revoked state means that party forfeits their funds to the other node, who can then send the _entire_ channel amount to a regular key under their sole control.

Notice that since the commitment data is never published to the blockchain during the regular operation of an LN node, any event that causes loss of data means the node cannot recover their funds if the counterparty disappears.

It also means the node cannot even advance the state of the channel, since it doesn't know what the current state _is_ to begin with.

### Danger of copying the dcrlnd database

!!! danger "Do not perform full-db backups"

    This section details why full-db backups are **not safe** in the current implementation of `dcrlnd`. 

    Do **not** perform full-db backups unless you have very deep knowledge on how LN operates, and how `dcrlnd` is implemented, and the _complete_ loss of funds that might occur when using an incorrect db backup.

Given the need to prevent loss of funds by having some backup channel data, the initial idea for most sysadmins would be to perform a full backup of the `dcrlnd` DB in regular intervals (via `cp`, `rsync` or similar commands). This could, in principle, allow a node to pick up the channel states and resume operations from where it had the initial malfunction.

There is a fundamental problem in using backups created from a running `dcrlnd` instance, however: there are **no** assurances that a given backup DB copy has the _most recent_, unrevoked channel state.

Using an older backup with a revoked state (i.e. a revoked commitment transaction) would cause the local node to publish a transaction that is now completely redeemable by the remote node.

In other words, using a backup with an old state causes _all funds to be sent to the remote party_. On the public blockchain, this looks as if the local node tried to steal funds (by broadcasting an older commitment tx) and the remote node then performed the "breach" protocol, exacting justice for the incorrect behavior of their counterparty.

Therefore, trying to do a simple, continous backup of the `dcrlnd` DB is _unsafe_, in the sense that attempting to use such a backup risks all the funds in all of the node's channels.

While it might be possible to offer some form of DB replication to increase reliability and safety for larger nodes and operators, this remains an open problem within the `dcrlnd` design and implementation.

### The Data Loss Protect option

The Lightning Network [BOLTs](https://github.com/lightningnetwork/lightning-rfc) define a special channel feature called `option_data_loss_protect` (DLP). Triggering this option during channel re-establishment (for example, after suffering data loss) causes the other node to publish their most recent (unrevoked) commitment transaction, thus in principle allowing a node to get their funds back.

However to retrieve those funds a node still needs some minimal metadata about a channel - mainly the specific keys and scripts used to redeem the local funds of the commitment transaction.

In dcrlnd, this metadata and the mechanism to trigger restores is called the _Static Channel Backup_ (SCB) data.

Note that since the DLP protocol involves asking the _remote_ node to close a channel due to some local data loss, the remote node could attempt to send an older state that is more to its advantage.

However, nodes are disincentivized to do this because the local node could be lying to force the triggering of the DLP, and if the remote node publishes an old state, the local node would be able to use its newer state to send a justice transaction which claims all of the channel funds. Additionally, the local node could have previously set up a watchtower to remedy any breach attempts by their counterparty.

### SCB File Contents

The SCB file contains information about the node's currently open channels. For each channel, it stores the funding outpoint (that is, the transaction hash and index of the output that realizes the channel on-chain) plus the index of the keys necessary to redeem funds from the channel, along with some extra metadata such as the node ID and IP addresses of the corresponding remote node.

Note that the SCB file does **not** contain up-to-date information about the channels. That is, it does **not** store the current commitment transaction, commitment index, in-flight payments, revocation keys, etc.

In other words, an SCB file contains only a sort of _shell_ channel information: the minimum amount of info necessary to locate and redeem funds that belong to the local node on commitments created by and stored by the _remote_ party.

Therefore, this file doesn't change during regular operations of a single, specific channel: the data in the SCB is valid for the entirety of the channel's lifetime.

The SCB file is only updated once new channels are created (in which case the new channels are added to it) or closed (when a channel is finally removed from it).

The contents of the file are also _encrypted_ using one of the node's private keys so they are only valid and decodable by the original node that created them.

Note that SCB-based backups do not suffer from the limitations of the full DB copy procedure outlined previously. This is due to the fact that this method of backups does _not_ attempt to restore channel operations but only to trigger a remote channel closure via the DLP protocol so that a node may retrive its funds.

## Operating SCB Backups

The next sections provide a quick review on how to generate and use SCB-based LN backups.

### Creating the SCB file

`dcrlnd` automatically creates a valid SCB file named `channel.backup` every time a channel is opened or closed. This file can be found in the data dir of a `dcrlnd` install, in the `chain/decred/[network]` subdir. CLI users can use `dcrlncli` to generate an SCB file on-demand via the `exportchanbackups` command, containing the information of either a single or multiple channels.

Decrediton users can also generate a file by using the appropriate option in the GUI.

Users must maintain up to date copies of their SCB files so that they can retrieve their funds in case of data loss.

### Restoring a Backup

Once a seed has been restored and the on-chain funds verified to be correct, the SCB file can be used to restore the channel shells and initiate the DLP protocol with the respective remote nodes.

CLI users can use the `restorechanbackup` command to apply the contents of an SCB file to the node.

Decrediton users can specify an SCB file during the initial creation of the LN wallet, which will trigger the DLP process.

!!! danger "Wallet and Account Matching"

    When using an SCB file to restore the channel data, the wallet seed and account used for LN operations (in case of Decrediton based wallets) **must** match the ones that created the SCB file, otherwise the restore operation fails.

    In particular, Decrediton users **must** select the correct account to base their LN wallet on, when initializing it on a restored wallet, otherwise the setup of the LN node fails.
