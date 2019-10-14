# Simple Payment Verification (SPV)

---

## What is SPV?

Simple Payment Verification (SPV) allows the use of a Decred wallet without having to download the entire Decred blockchain. A wallet operating in SPV mode only needs to download full blocks containing transactions relevant to it (i.e. transactions involving the wallet’s addresses). In a typical case, this means downloading tens of megabytes, rather than multiple gigabytes. This reduces the wallet's hardware requirements and greatly reduces the initial load time for new wallets.

SPV has been built directly into the dcrwallet CLI tool — what Decredition and other official wallets use behind the scenes — so all users of official wallets are able to enable SPV.

## Why was SPV added to `dcrwallet`?

The hardware requirements to run a Decred wallet are drastically reduced when operating in SPV mode. Storage and download requirements are reduced because rather than downloading the whole blockchain, an SPV wallet will only download the blocks which contain relevant transactions, and for all of the other blocks in the chain only the headers are downloaded. The amount of processing power required is reduced because a device running an SPV wallet will only validate the proof-of-work and the header chain rather than validating every transaction in every block and ensuring the block contents are consistent with the headers.

As a result of these decreased requirements, Decred wallets can operate on a wider set of devices - particularly mobile devices. Smartphones and tablets are typically limited in at least one of CPU power, storage or download capacity, and mobile operating systems limit the amount of background work processing each application can perform, which makes running a full node either impractical or impossible.

Another benefit offered by SPV is an extreme reduction in the time required for a brand new wallet to become operational, offering a huge improvement to the user experience.

## How does SPV work?

At the start of every block added to the Decred blockchain is 180 bytes of data called the [block header](../advanced/block-header-specifications.md). The block header describes key information about the block including the hash of the block, the merkle root (the sum of all the transaction hashes in the block), and the nonce calculated by the proof-of-work miners. A predetermined filter is also created for every block, based on the all of the transactions within the block.

When an SPV wallet initialises it will connect to the Decred network using peer-to-peer connections, and it will download the full set of headers and filters. It will then validate the header chain to ensure that the chain and its proof-of-work are valid. Once this is complete, the wallet will use the filters to locally identify which blocks contain owned transactions without uploading any private data to remote nodes. The wallet can then use the peer-to-peer network to download these blocks, scan them for relevant transactions and select these to update personal transaction history and balance.

## How is this different from a "light" wallet?

"Light" wallets such as [Exodus](https://www.exodus.io/) or [Atomic](https://atomicwallet.io/) already bring some of the benefits of an SPV wallet - for example these wallets allow sending and receiving Decred transactions with a minimal start-up time and without downloading the full chain. Light wallets certainly provide a level of convenience but there are often subtle consequences because they depend upon an API provided by a centralised service:

- Light wallets depend on a remote service to watch owned addresses and provide notifications when transactions are received by the addresses. Notifications could be missed or incorrect.

- Users will often be required to upload an extended public key to the central server so it is aware of all of owned addresses, potentially compromising the users' privacy.

- Light wallets do not validate the information they receive by checking the blockchain directly - they have to blindly trust the information provided by the central server.

These concerns do not apply to SPV wallets because they connect directly to the decentralised, peer-to-peer Decred network. They upload no private data to remote nodes and they discover their own transactions by inspecting the blockchain directly.

## Are there any disadvantages?

- SPV does not support voting wallets. Voting wallets have the responsibility to vote on the validity of the last block, and a wallet cannot be sure of the validity unless it fully validates the whole blockchain leading up to that block. It is possible to purchase tickets and allocate the voting rights to a [Voting Service Provider](../proof-of-stake/how-to-stake.md#pos-using-a-voting-service-provider-vsp). Be aware that if a VSP fails to revoke a missed ticket, it is not possible for an SPV wallet to revoke the missed ticket until the it has reached the confirmation depth of an expired ticket.

- SPV wallets only download blocks which have transactions related to their owned addresses, which could potentially reveal more information about the wallet than if it downloaded every single block. This only presents a very minor decrease in privacy, but it is a decrease nonetheless. This can be mitigated by downloading blocks from multiple peers so no single peer is able to see the full list of blocks downloaded by a wallet. Even if a passive observer on the network is able to see which blocks are downloaded by a wallet, they are not able to identify which transactions in those blocks are relevant.

- Wallets operating in SPV mode are only able to validate the block headers they download and not the filters. This makes a "false-negative" attack possible, whereby a malicious peer that knows a wallet is waiting for a particular transaction could send the wallet a fake filter which does not include the transaction, resulting in the wallet not downloading the block and so not becoming aware of the transactions existence. This transaction would still be visible to all fully validating nodes and wallets, and it will still appear in the [block explorer](../getting-started/using-the-block-explorer.md). One way to prevent this vulnerability is to add the hash of the filter into the part of the block header that is PoW validated, enabling SPV wallets to easily check the validity of the filters without having to download their blocks. A proposal to make this change has [already been suggested](https://github.com/decred/dcrd/issues/971), however a hard fork will be required to make the required change to the block header format.  A "false-positive" scenario is not possible. If a malicious node provides a fake filter which includes a non-existent transaction, the wallet will simply download the full block, compare it to the filter and discover that the filter is not genuine.

## How do I use SPV?

#### `dcrwallet` CLI

To enable SPV mode in `dcrwallet` simply provide the `--spv` flag when starting the process. There is also an optional `--spvconnect` flag which disables DNS seeding and allows you to specify the IP of a full node you wish to sync from. `--spvconnect` can be specified multiple times to sync from multiple peers.

#### Decrediton

When Decrediton is started for the first time, a dedicated screen is displayed during the setup wizard which asks if you would like to enable SPV mode.

If Decrediton has already been used before, it is possible to change to SPV mode through the settings tab. There is also a "SPV Connect" textbox on this tab, which will allow you to specify the IP address of a full node you wish to sync from.
