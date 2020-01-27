`dcrlncli` - control plane for your Decred Lightning Network Daemon (dcrlnd)

### Usage:
```
   dcrlncli [global options] command [command options] [arguments...]
```

### Version:
   0.2.0-pre commit=v0.1.0-1592-g18388616d89bbb775d98cc77e10bd6631a7a84b7

### Commands:
|command|info|
|--|--|
|getinfo|Returns basic information related to the active daemon.|
|debuglevel|Set the debug level.|
|stop|Stop and shutdown the daemon.|
|help, h|Shows a list of commands or help for one command|

### Channels:
|command|info|
|--|--|
|[openchannel](openchannel.md)|Open a channel to a node or an existing peer.|
|[closechannel](closechannel.md)|Close an existing channel.|
|[closeallchannels](closeallchannels.md)|Close all existing channels.|
|[abandonchannel](abandonchannel.md)|Abandons an existing channel.|
|[channelbalance](channelbalance.md)|Returns the sum of the total available channel balance across all open channels.|
|[pendingchannels](pendingchannels.md)|Display information pertaining to pending channels.|
|[listchannels](listchannels.md)|List all open channels.|
|[closedchannels](closedchannels.md)|List all closed channels.|
|[getchaninfo](getchaninfo.md)|Get the state of a channel.|
|[getnetworkinfo](getnetworkinfo.md)|Get statistical information about the current state of the network.|
|[feereport](feereport.md)|Display the current fee policies of all active channels.|
|[updatechanpolicy](updatechanpolicy.md)|Update the channel policy for all channels, or a single channel.|
|[exportchanbackup](exportchanbackup.md)|Obtain a static channel back up for a selected channels, or all known channels|
|[verifychanbackup](verifychanbackup.md)|Verify an existing channel backup|
|[restorechanbackup](restorechanbackup.md)|Restore an existing single or multi-channel static channel backup|

### On-chain:
|command|info|
|--|--|
|[estimatefee](estimatefee.md)|Get fee estimates for sending bitcoin on-chain to multiple addresses.|
|[sendmany](sendmany.md)|Send decred on-chain to multiple addresses.|
|[sendcoins](sendcoins.md)|Send decred on-chain to an address.|
|[listunspent](listunspent.md)|List utxos available for spending.|
|[listchaintxns](listchaintxns.md)|List transactions from the wallet.|

### Payments:
|command|info|
|--|--|
|[sendpayment](sendpayment.md)|Send a payment over lightning.|
|[payinvoice](payinvoice.md)|Pay an invoice over lightning.|
|[sendtoroute](sendtoroute.md)|Send a payment over a predefined route.|
|[addinvoice](addinvoice.md)|Add a new invoice.|
|[lookupinvoice](lookupinvoice.md)|Lookup an existing invoice by its payment hash.|
|[listinvoices](listinvoices.md)|List all invoices currently stored within the database. Any active debug invoices are ignored.|
|[listpayments](listpayments.md)|List all outgoing payments.|
|[queryroutes](queryroutes.md)|Query a route to a destination.|
|[decodepayreq](decodepayreq.md)|Decode a payment request.|
|[fwdinghistory](fwdinghistory.md)|Query the history of all forwarded HTLCs.|
|[cancelinvoice](cancelinvoice.md)|Cancels a (hold) invoice|
|[addholdinvoice](addholdinvoice.md)|Add a new hold invoice.|
|[settleinvoice](settleinvoice.md)|Reveal a preimage and use it to settle the corresponding invoice.|

### Peers:
|command|info|
|--|--|
|[connect](connect.md)|Connect to a remote dcrlnd peer.|
|[disconnect](disconnect.md)|Disconnect a remote dcrlnd peer identified by public key.|
|[listpeers](listpeers.md)|List all active, currently connected peers.|
|[describegraph](describegraph.md)|Describe the network graph.|
|[getnodeinfo](getnodeinfo.md)|Get information on a specific node.|

### Startup:
|command|info|
|--|--|
|[create](create.md)|Initialize a wallet when starting dcrlnd for the first time.|
|[unlock](unlock.md)|Unlock an encrypted wallet at startup.|
|[changepassword](changepassword.md)|Change an encrypted wallet's password at startup.|

### Wallet:
|command|info|
|--|--|
|[newaddress](newaddress.md)|Generates a new address.|
|[walletbalance](walletbalance.md)|Compute and display the wallet's current balance.|
|[signmessage](signmessage.md)|Sign a message with the node's private key.|
|[verifymessage](verifymessage.md)|Verify a message signed with the signature.|

### Watchtower:
|command|info|
|--|--|
|[wtclient](wtclient.md)|Interact with the watchtower client.|

## Global Options:
|flag|info|
|--|--|
|`--rpcserver value`|host:port of Decred LN daemon (default: "localhost:10009")|
|`--dcrlnddir value`|path to dcrlnd's base directory|
|`--tlscertpath value`|path to TLS certificate|
|`--chain value`, `-c value`|the chain lnd is running on e.g. decred (default: "decred")|
|`--network value`, `-n value`|the network drlnd is running on e.g. mainnet, testnet, etc. (default: "mainnet")|
|`--no-macaroons`|disable macaroon authentication|
|`--macaroonpath value`|path to macaroon file|
|`--macaroontimeout value`|anti-replay macaroon validity time in seconds (default: 60)|
|`--macaroonip value`|if set, lock macaroon to specific IP address|
|`--help`, `-h`|show help|
|`--version`, `-v`|print the version|
