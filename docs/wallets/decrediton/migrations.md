# ![](../../img/dcr-icons/Wallet.svg){ .dcr-icon } Decrediton Migrations

This page lists migrations performed by recent versions of Decrediton, what exactly they entail and possible impacts on custom setups.

Migrations are listed by the version they first appeared, so users upgrading across multiple versions will be affected by multiple migrations.


## Version 1.6.3

!!! info "Requires unlocking the wallet"

    The upgrade for version 1.6.3 requires unlocking the wallet with the private passphrase. This is a one-time request and you should **NOT** be asked for the passphrase after reopening the wallet.
    
### Per-account locking

Version 1.6.3 introduces early support for Decred's [DEX](https://github.com/decred/dcrdex) on Decrediton.

The DEX requires an always-unlocked account in order to perform its operations. Thus, to increase security, `dcrwallet` has introduced a per-account locking mode: instead of completely unlocking the wallet, only specific accounts may be selected for unlocking, preventing funds from other accounts from being drained in case of certain attack scenarios.

This is also helpful for ticket-buying and privacy-enabled wallets: only those accounts remain unlocked during their respective operations.

To enable this behavior, during the first startup in v1.6.3, Decrediton will ask for the wallet's current private passphrase and will use the same passphrase for every account. 

Usage in this new mode is transparent to the user: accounts will be individually unlocked as needed.
