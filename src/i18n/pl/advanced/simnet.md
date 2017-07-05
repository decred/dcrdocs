# Simnet 

---

## Overview 

When developing Decred applications or testing potential changes, it is often extremely useful to have a test network where difficulty levels are low enough to generate blocks as needed.

In order to facilitate these scenarios, dcrd provides a simulation network (`--simnet`).  The following is an overview of the most important properties that distinguish it from the main network:

* The difficulty starts extremely low to enable fast CPU mining of blocks
* Networking changes:
    * All code related to peer discovery and IP address dissemination is disabled to help ensure the network remains private
    * The peer and RPC network ports are different
    * A unique network byte sequence is used in the peer-to-peer message protocol so the blocks can't accidentally be crossed with the main network
* All chain and payment address parameters are unique to prevent confusion with the main network:
    * Different genesis block
    * Payment addresses start with different prefixes:
        * Standard pay-to-pubkeyhash (P2PKH) starts with uppercase `S`
        * Standard pay-to-scripthash (P2SH) starts with lowercase `s`
    * Exported hierarchical deterministic extended keys (BIP32) start with different prefixes:
        * Public extended keys start with `spub`
        * Private extended keys start with `sprv`
    * The BIP44 coin type used in HD key paths is lowercase `s`

  ---

## Getting Started 

Running a single `dcrd` node on simnet is simply starting `dcrd` with the `--simnet` flag.  However, in order to be really useful, you'll typically want to be able to send coins amongst addresses which implies that blocks will need to be mined and interfacing with a wallet will be needed.

In addition, since there are effectively no coins yet on the new private network, an initial series of blocks will need to be mined which pay to an address you own so there are usable coins to spend.

As previously mentioned, simnet uses unique addresses to prevent confusion with the main network.  Thus, it means that a wallet which supports the address format must be used.  For this, `dcrwallet` with the `--simnet` flag can be used.

The following is a command reference to get going:

**NOTE: All of these commands can be simplified by creating config files and making use of them, however the commands here use all switches on the command line to show exactly what is needed for each.**

* Start dcrd on simnet:

    `$ dcrd --simnet --rpcuser=<username> --rpcpass=<password>`

* Create a new simnet wallet:

    `$ dcrwallet --simnet --create`

* Start dcrwallet on simnet:

    `$ dcrwallet --simnet --username=<username> --password=<password>`

* Create a new simnet Decred address:

    `$ dcrctl --simnet --wallet --rpcuser=<username> --rpcpass=<password> getnewaddress`

* Stop the initial dcrd process and restart it with the mining address set to the output from the previous command:

    `$ dcrd --simnet --rpcuser=<username> --rpcpass=<password> --miningaddr=<S....>`

* Instruct dcrd to generate enough initial blocks for the first coinbase to mature:

    `$ dcrctl --simnet --rpcuser=<username> --rpcpass=<password> generate 100`

* Check the wallet balance to ensure the coins are available:

    `$ dcrctl --simnet --wallet --rpcuser=<username> --rpcpass=<password> getbalance`
  
At this point, there is a fully functional private simnet with coins available to send to other simnet addresses.  Any time one or more transactions are sent, a `generate 1` RPC must be issued to mine a new block with the transactions included.
