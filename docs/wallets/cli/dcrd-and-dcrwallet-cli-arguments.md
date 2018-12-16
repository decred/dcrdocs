# <img class="dcr-icon" src="/img/dcr-icons/Options2.svg" /> `dcrd` and `dcrwallet` CLI Arguments

Last updated for CLI release v{{ cliversion.mac }}.

---
Both the `dcrd` and `dcrwallet` daemons should work with default configuration for most users, however there is a wide variety of command line aguments to change the way they behave if required. For example, the following command can be used to change the log directory `dcrd` will write to.

```bash
dcrd --logdir=/my/custom/log/directory
```

`dcrd` and `dcrwallet` both support a `--help` argument which will print details of all the arguments they support and then exit immediately.

---

## `dcrd`

??? info "Click to expand full list of `dcrd` CLI arguments"
    Argument                          |Description
    ----------------------------------|-------------
    `-A` or `--appdata=`              | Path to application home directory (default: `~/.dcrd`)
    `-V` or `--version`               | Display version information and exit
    `-C` or `--configfile=`           | Path to configuration file (default: `~/.dcrd/dcrd.conf`)
    `-b` or `--datadir=`              | Directory to store data (default: `~/.dcrd/data`)
            `--logdir=`               | Directory to log output. (default: `~/.dcrd/logs`)
            `--nofilelogging`         | Disable file logging.
    `-a` or `--addpeer=`              | Add a peer to connect with at startup
            `--connect=`              | Connect only to the specified peers at startup
            `--nolisten`              | Disable listening for incoming connections -- **NOTE:** Listening is automatically disabled if the `--connect` or `--proxy` options are used without also specifying listen interfaces via `--listen`
            `--listen=`               | Add an interface/port to listen for connections (default all interfaces port: 9108, testnet: 19108)
            `--maxsameip=`            | Max number of connections with the same IP -- 0 to disable (default: 5)
            `--maxpeers=`             | Max number of inbound and outbound peers (default: 125)
            `--nobanning`             | Disable banning of misbehaving peers
            `--banduration=`          | How long to ban misbehaving peers.  Valid time units are {s, m, h}.  Minimum 1 second (default: 24h0m0s)
            `--banthreshold=`         | Maximum allowed ban score before disconnecting and banning misbehaving peers. (default: 100)
            `--whitelist=`            | Add an IP network or IP that will not be banned. (eg. 192.168.1.0/24 or ::1)
    `-u` or `--rpcuser=`              | Username for RPC connections
    `-P` or `--rpcpass=`              | Password for RPC connections
            `--rpclimituser=`         | Username for limited RPC connections
            `--rpclimitpass=`         | Password for limited RPC connections
            `--rpclisten=`            | Add an interface/port to listen for RPC connections (default port: 9109, testnet: 19109)
            `--rpccert=`              | File containing the certificate file (default: `~/.dcrd/rpc.cert`)
            `--rpckey=`               | File containing the certificate key (default: `~/.dcrd/rpc.key`)
            `--rpcmaxclients=`        | Max number of RPC clients for standard connections (default: 10)
            `--rpcmaxwebsockets=`     | Max number of RPC websocket connections (default: 25)
            `--rpcmaxconcurrentreqs=` | Max number of concurrent RPC requests that may be processed concurrently (default: 20)
            `--norpc`                 | Disable built-in RPC server -- **NOTE:** The RPC server is disabled by default if no rpcuser/rpcpass or rpclimituser/rpclimitpass is specified
            `--notls`                 | Disable TLS for the RPC server -- **NOTE:** This is only allowed if the RPC server is bound to localhost
            `--nodnsseed`             | Disable DNS seeding for peers
            `--externalip=`           | Add an ip to the list of local addresses we claim to listen on to peers
            `--proxy=`                | Connect via SOCKS5 proxy (eg. 127.0.0.1:9050)
            `--proxyuser=`            | Username for proxy server
            `--proxypass=`            | Password for proxy server
            `--onion=`                | Connect to tor hidden services via SOCKS5 proxy (eg. 127.0.0.1:9050)
            `--onionuser=`            | Username for onion proxy server
            `--onionpass=`            | Password for onion proxy server
            `--noonion`               | Disable connecting to tor hidden services
            `--torisolation`          | Enable Tor stream isolation by randomizing user credentials for each connection.
            `--testnet`               | Use the test network
            `--simnet`                | Use the simulation test network
            `--regnet`                | Use the regression test network
            `--nocheckpoints`         | Disable built-in checkpoints.  Don't do this unless you know what you're doing.
            `--dbtype=`               | Database backend to use for the Block Chain (default: ffldb)
            `--profile=`              | Enable HTTP profiling on given [addr:]port -- **NOTE:** port must be between 1024 and 65536
            `--cpuprofile=`           | Write CPU profile to the specified file
            `--memprofile=`           | Write mem profile to the specified file
            `--dumpblockchain=`       | Write blockchain as a flat file of blocks for use with addblock, to the specified filename
            `--miningtimeoffset=`     | Offset the mining timestamp of a block by this many seconds (positive values are in the past)
    `-d` or `--debuglevel=`           | Logging level for all subsystems {trace, debug, info, warn, error, critical} -- You may also specify <subsystem>=<level>,<subsystem2>=<level>,... to set the log level for individual subsystems -- Use show to list available subsystems (default: info)
            `--upnp`                  | Use UPnP to map our listening port outside of NAT
            `--minrelaytxfee=`        | The minimum transaction fee in DCR/kB to be considered a non-zero fee. (default: 0.0001)
            `--limitfreerelay=`       | Limit relay of transactions with no transaction fee to the given amount in thousands of bytes per minute (default: 15)
            `--norelaypriority`       | Do not require free or low-fee transactions to have high priority for relaying
            `--maxorphantx=`          | Max number of orphan transactions to keep in memory (default: 1000)
            `--generate`              | Generate (mine) coins using the CPU
            `--miningaddr=`           | Add the specified payment address to the list of addresses to use for generated blocks -- At least one address is required if the generate option is set
            `--blockminsize=`         | Mininum block size in bytes to be used when creating a block
            `--blockmaxsize=`         | Maximum block size in bytes to be used when creating a block (default: 375000)
            `--blockprioritysize=`    | Size in bytes for high-priority/low-fee transactions when creating a block (default: 20000)
            `--getworkkey=`           | **DEPRECATED** -- Use the `--miningaddr` option instead
            `--sigcachemaxsize=`      | The maximum number of entries in the signature verification cache (default: 100000)
            `--nonaggressive`         | Disable mining off of the parent block of the blockchain if there aren't enough voters
            `--nominingstatesync`     | Disable synchronizing the mining state with other nodes
            `--allowoldvotes`         | Enable the addition of very old votes to the mempool
            `--blocksonly`            | Do not accept transactions from remote peers.
            `--acceptnonstd`          | Accept and relay non-standard transactions to the network regardless of the default settings for the active network.
            `--rejectnonstd`          | Reject non-standard transactions regardless of the default settings for the active network.
            `--txindex`               | Maintain a full hash-based transaction index which makes all transactions available via the getrawtransaction RPC
            `--droptxindex`           | Deletes the hash-based transaction index from the database on start up and then exits.
            `--addrindex`             | Maintain a full address-based transaction index which makes the searchrawtransactions RPC available
            `--dropaddrindex`         | Deletes the address-based transaction index from the database on start up and then exits.
            `--noexistsaddrindex`     | Disable the exists address index, which tracks whether or not an address has even been used.
            `--dropexistsaddrindex`   | Deletes the exists address index from the database on start up and then exits.
            `--nocfilters`            | Disable compact filtering (CF) support
            `--dropcfindex`           | Deletes the index used for compact filtering (CF) support from the database on start up and then exits.
            `--piperx=`               | File descriptor of read end pipe to enable parent -> child process communication
            `--pipetx=`               | File descriptor of write end pipe to enable parent <- child process communication
            `--lifetimeevents`        | Send lifetime notifications over the TX pipe
            `-altdnsnames=`           | Specify additional dns names to use when generating the rpc server certificate [$DCRD_ALT_DNSNAMES]
---

## `dcrwallet`

??? info "Click to expand full list of `dcrwallet` CLI arguments"
    Argument                                           |Description
    ---------------------------------------------------|-------------
    `-C` or `--configfile=`                            | Path to configuration file (default: `~/.dcrwallet/dcrwallet.conf`)
    `-V` or `--version`                                | Display version information and exit
            `--create`                                 | Create the wallet if it does not exist
            `--createtemp`                             | Create a temporary simulation wallet (pass=password) in the data directory indicated; must call with `--appdata`
            `--createwatchingonly`                     | Create the wallet and instantiate it as watching only with an HD extended pubkey
    `-A` or `--appdata=`                               | Application data directory for wallet config, databases and logs (default: `~/.dcrwallet`)
            `--testnet`                                | Use the test network
            `--simnet`                                 | Use the simulation test network
            `--noinitialload`                          | Defer wallet creation/opening on startup and enable loading wallets over RPC
    `-d` or `--debuglevel=`                            | Logging level {trace, debug, info, warn, error, critical} (default: info)
            `--logdir=`                                | Directory to log output. (default: `~/.dcrwallet/logs`)
            `--profile=`                               | Enable HTTP profiling this interface/port
            `--memprofile=`                            | Write mem profile to the specified file
            `--walletpass=`                            | The public wallet password -- Only required if the wallet was created with one
            `--promptpass`                             | The private wallet password is prompted for at start up, so the wallet starts unlocked without a time limit
            `--pass=`                                  | The private wallet passphrase
            `--promptpublicpass`                       | The public wallet password is prompted for at start up
            `--disallowfree`                           | Force transactions to always include a fee
            `--enableticketbuyer`                      | Enable the automatic ticket buyer
            `--enablevoting`                           | Enable creation of votes and revocations for owned tickets
            `--reuseaddresses`                         | Reuse addresses for ticket purchase to cut down on address overuse
            `--purchaseaccount=`                       | Name of the account to buy tickets from (default: default)
            `--pooladdress=`                           | The ticket pool address where ticket fees will go to
            `--poolfees=`                              | The per-ticket fee mandated by the ticket pool as a percent (e.g. 1.00 for 1.00% fee)
            `--gaplimit=`                              | The size of gaps between used addresses.  Used for address scanning and when generating addresses with the wrap option. (default: 20)
            `--stakepoolcoldextkey=`                   | Enables the wallet as a stake pool with an extended key in the format of "xpub...:index" to derive cold wallet addresses to send fees to
            `--allowhighfees`                          | Force the RPC client to use the 'allowHighFees' flag when sending transactions
            `--txfee=`                                 | Sets the wallet's tx fee per kb (default: 0.0001 DCR)
            `--ticketfee=`                             | Sets the wallet's ticket fee per kb (default: 0.0001 DCR)
            `--accountgaplimit=`                       | Number of accounts that can be created in a row without using any of them (default: 10)
    `-c` or `--rpcconnect=`                            | Hostname/IP and port of dcrd RPC server to connect to
            `--cafile=`                                | File containing root certificates to authenticate a TLS connections with dcrd
            `--noclienttls`                            | Disable TLS for the RPC client -- **NOTE:** This is only allowed if the RPC client is connecting to localhost
            `--dcrdusername=`                          | Username for dcrd authentication
            `--dcrdpassword=`                          | Password for dcrd authentication
            `--proxy=`                                 | Connect via SOCKS5 proxy (eg. 127.0.0.1:9050)
            `--proxyuser=`                             | Username for proxy server
            `--proxypass=`                             | Password for proxy server
            `--spv`                                    | Sync using simplified payment verification
            `--spvconnect=`                            | Full node addresses to SPV sync from
            `--rpccert=`                               | File containing the certificate file (default: `~/.dcrwallet/rpc.cert`)
            `--rpckey=`                                | File containing the certificate key (default: `~/.dcrwallet/rpc.key`)
            `--tlscurve=`                              | Curve to use when generating TLS keypairs (default: P-521)
            `--onetimetlskey`                          | Generate a new TLS certpair at startup, but only write the certificate to disk
            `--noservertls`                            | Disable TLS for the RPC servers -- **NOTE:** This is only allowed if the RPC server is bound to localhost
            `--grpclisten=`                            | Listen for gRPC connections on this interface/port
            `--rpclisten=`                             | Listen for legacy JSON-RPC connections on this interface/port
            `--nogrpc`                                 | Disable the gRPC server
            `--nolegacyrpc`                            | Disable the legacy JSON-RPC server
            `--rpcmaxclients=`                         | Max number of legacy JSON-RPC clients for standard connections (default: 10)
            `--rpcmaxwebsockets=`                      | Max number of legacy JSON-RPC websocket connections (default: 25)
    `-u` or `--username=`                              | Username for legacy JSON-RPC and dcrd authentication (if dcrdusername is unset)
    `-P` or `--password=`                              | Password for legacy JSON-RPC and dcrd authentication (if dcrdpassword is unset)
            `--pipetx=`                                | File descriptor or handle of write end pipe to enable child -> parent process communication
            `--piperx=`                                | File descriptor or handle of read end pipe to enable parent -> child process communication
            `--rpclistenerevents`                      | Notify JSON-RPC and gRPC listener addresses over the TX pipe
    `-b` or `--datadir=`                               | **DEPRECATED** -- use `--appdata` instead
            `--prunetickets`                           | **DEPRECATED** -- old tickets are always pruned
            `--ticketaddress=`                         | **DEPRECATED** -- use `--ticketbuyer.votingaddress` instead
            `--addridxscanlen=`                        | **DEPRECATED** -- use `--gaplimit` instead (default: 20)
            `--ticketbuyer.balancetomaintainabsolute=` | Amount of funds to keep in wallet when stake mining (default: 0 DCR)
            `--ticketbuyer.votingaddress=`             | Purchase tickets with voting rights assigned to this address
            `--ticketbuyer.avgpricemode=`              | **DEPRECATED** -- The mode to use for calculating the average price if pricetarget is disabled (vwap, pool, dual) (default: vwap)
            `--ticketbuyer.avgpricevwapdelta=`         | **DEPRECATED** -- The number of blocks to use from the current block to calculate the VWAP (default: 2880)
            `--ticketbuyer.maxfee=`                    | **DEPRECATED** -- Maximum ticket fee per KB (default: 0.01 DCR)
            `--ticketbuyer.minfee=`                    | **DEPRECATED** -- Minimum ticket fee per KB (default: 0.001 DCR)
            `--ticketbuyer.feesource=`                 | **DEPRECATED** -- The fee source to use for ticket fee per KB (median or mean) (default: median)
            `--ticketbuyer.maxperblock=`               | **DEPRECATED** -- Maximum tickets per block, with negative numbers indicating buy one ticket every 1-in-n blocks (default: 1)
            `--ticketbuyer.blockstoavg=`               | **DEPRECATED** -- Number of blocks to average for fees calculation (default: 11)
            `--ticketbuyer.feetargetscaling=`          | **DEPRECATED** -- Scaling factor for setting the ticket fee, multiplies by the average fee (default: 1)
            `--ticketbuyer.maxinmempool=`              | **DEPRECATED** -- The maximum number of your tickets allowed in mempool before purchasing more tickets (default: 40)
            `--ticketbuyer.expirydelta=`               | **DEPRECATED** -- Number of blocks in the future before the ticket expires (default: 16)
            `--ticketbuyer.maxpriceabsolute=`          | **DEPRECATED** -- Maximum absolute price to purchase a ticket (default: 0 DCR)
            `--ticketbuyer.maxpricescale=`             | **DEPRECATED** -- Attempt to prevent the stake difficulty from going above this multiplier (>1.0) by manipulation, 0 to disable
            `--ticketbuyer.maxpricerelative=`          | **DEPRECATED** -- Scaling factor for setting the maximum price, multiplies by the average price (default: 1.25)
            `--ticketbuyer.balancetomaintainrelative=` | **DEPRECATED** -- Proportion of funds to leave in wallet when stake mining (default: 0.3)
            `--ticketbuyer.pricetarget=`               | **DEPRECATED** -- A target to try to seek setting the stake price to rather than meeting the average price, 0 to disable (default: 0 DCR)
            `--ticketbuyer.nospreadticketpurchases`    | **DEPRECATED** -- Do not spread ticket purchases evenly throughout the window
            `--ticketbuyer.spreadticketpurchases`      | **DEPRECATED** -- Spread ticket purchases evenly throughout the window
            `--ticketbuyer.dontwaitfortickets`         | **DEPRECATED** -- Don't wait until your last round of tickets have entered the blockchain to attempt
