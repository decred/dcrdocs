# dcrlncli Options and Commands

Last updated for dcrlnd release v{{ lndversion }}.

---

`dcrlncli` - a client which controls Decred Lightning Network Daemon (`dcrlnd`) via RPC calls.
You can use `dcrlncli` for many things, such as checking your balance, managing channels,
creating transactions, and viewing network information.

`dcrlncli` is not a daemon - it does not run permanently in the background - it calls the
requested RPC method, prints the response, and then terminates immediately.

### Usage

```no-highlight
   dcrlncli [global options] command [command options] [arguments...]
```

---

## Global Options

|Flag|Info|
|--|--|
|`--rpcserver value`|Host:port of Decred LN daemon (default: "localhost:10009")|
|`--dcrlnddir value`|Path to dcrlnd's base directory|
|`--tlscertpath value`|Path to TLS certificate|
|`--chain value`, `-c value`|The chain dcrlnd is running on e.g. decred (default: "decred")|
|`--network value`, `-n value`|The network drlnd is running on e.g. mainnet, testnet, etc. (default: "mainnet")|
|`--no-macaroons`|Disable macaroon authentication|
|`--macaroonpath value`|Path to macaroon file|
|`--macaroontimeout value`|Anti-replay macaroon validity time in seconds (default: 60)|
|`--macaroonip value`|If set, lock macaroon to specific IP address|
|`--help`, `-h`|Show help|
|`--version`, `-v`|Print the version|

---

## Commands

### General Commands

|Command|Info|
|--|--|
|getinfo|Returns basic information related to the active daemon.|
|debuglevel|Set the debug level.|
|stop|Stop and shutdown the daemon.|
|help, h|Shows a list of commands or help for one command|

### Channel Commands

|Command|Info|
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

### On-chain commands

|Command|Info|
|--|--|
|[estimatefee](estimatefee.md)|Get fee estimates for sending decred on-chain to multiple addresses.|
|[sendmany](sendmany.md)|Send decred on-chain to multiple addresses.|
|[sendcoins](sendcoins.md)|Send decred on-chain to an address.|
|[listunspent](listunspent.md)|List UTXOs available for spending.|
|[listchaintxns](listchaintxns.md)|List transactions from the wallet.|

### Payment commands

|Command|Info|
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

### Peer commands

|Command|Info|
|--|--|
|[connect](connect.md)|Connect to a remote dcrlnd peer.|
|[disconnect](disconnect.md)|Disconnect a remote dcrlnd peer identified by public key.|
|[listpeers](listpeers.md)|List all active, currently connected peers.|
|[describegraph](describegraph.md)|Describe the network graph.|
|[getnodeinfo](getnodeinfo.md)|Get information on a specific node.|

### Startup commands

|Command|Info|
|--|--|
|[create](create.md)|Initialize a wallet when starting dcrlnd for the first time.|
|[unlock](unlock.md)|Unlock an encrypted wallet at startup.|
|[changepassword](changepassword.md)|Change an encrypted wallet's password at startup.|

### Wallet commands

|Command|Info|
|--|--|
|[newaddress](newaddress.md)|Generates a new address.|
|[walletbalance](walletbalance.md)|Compute and display the wallet's current balance.|
|[signmessage](signmessage.md)|Sign a message with the node's private key.|
|[verifymessage](verifymessage.md)|Verify a message signed with the signature.|

### Watchtower commands

|Command|Info|
|--|--|
|[wtclient](wtclient.md)|Interact with the watchtower client.|
