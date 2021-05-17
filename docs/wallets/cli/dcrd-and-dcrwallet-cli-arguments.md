# <img class="dcr-icon" src="/img/dcr-icons/Options2.svg" /> `dcrd` and `dcrwallet` CLI Arguments

Last updated for CLI release v{{ cliversion }}.

---
Both the `dcrd` and `dcrwallet` daemons should work with default configuration for most users, however there is a wide variety of command line arguments to change the way they behave if required. For example, the following command can be used to change the log directory `dcrd` will write to.

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
            `--peeridletimeout=`      | The duration of inactivity before a peer is timed out. Valid time units are {s,m,h}. Minimum 15 seconds (default: 2m0s)
            `--dialtimeout=`          | How long to wait for TCP connection completion.  Valid time units are {s, m, h}.  Minimum 1 second (default: 30s)
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
            `--tlscurve=`             | Curve to use when generating TLS keypairs (default: P-256)
            `--nodnsseed`             | **DEPRECATED** -- use --noseeders
            `--noseeders`             | Disable seeding for peer discovery
            `--externalip=`           | Add an ip to the list of local addresses we claim to listen on to peers
            `--proxy=`                | Connect via SOCKS5 proxy (eg. 127.0.0.1:9050)
            `--proxyuser=`            | Username for proxy server
            `--proxypass=`            | Password for proxy server
            `--onion=`                | Connect to Tor hidden services via SOCKS5 proxy (eg. 127.0.0.1:9050)
            `--onionuser=`            | Username for onion proxy server
            `--onionpass=`            | Password for onion proxy server
            `--noonion`               | Disable connecting to Tor hidden services
            `--nodiscoverip`          | Disable automatic network address discovery of local external IPs
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
            `--maxorphantx=`          | Max number of orphan transactions to keep in memory (default: 100)
            `--generate`              | Generate (mine) coins using the CPU
            `--miningaddr=`           | Add the specified payment address to the list of addresses to use for generated blocks -- At least one address is required if the generate option is set
            `--blockminsize=`         | Minimum block size in bytes to be used when creating a block
            `--blockmaxsize=`         | Maximum block size in bytes to be used when creating a block (default: 375000)
            `--blockprioritysize=`    | Size in bytes for high-priority/low-fee transactions when creating a block (default: 20000)
            `--sigcachemaxsize=`      | The maximum number of entries in the signature verification cache (default: 100000)
            `--nonaggressive`         | Disable mining off of the parent block of the blockchain if there aren't enough voters
            `--nominingstatesync`     | Disable synchronizing the mining state with other nodes
            `--allowoldvotes`         | Enable the addition of very old votes to the mempool
            `--allowunsyncedmining`   | Allow block templates to be generated even when the chain is not considered synced on networks other than the main network.  This is automatically enabled when the simnet option is set.  Don't do this unless you know what you're doing
            `--blocksonly`            | Do not accept transactions from remote peers.
            `--acceptnonstd`          | Accept and relay non-standard transactions to the network regardless of the default settings for the active network.
            `--rejectnonstd`          | Reject non-standard transactions regardless of the default settings for the active network.
            `--txindex`               | Maintain a full hash-based transaction index which makes all transactions available via the getrawtransaction RPC
            `--droptxindex`           | Deletes the hash-based transaction index from the database on startup and then exits.
            `--addrindex`             | Maintain a full address-based transaction index which makes the searchrawtransactions RPC available
            `--dropaddrindex`         | Deletes the address-based transaction index from the database on startup and then exits.
            `--noexistsaddrindex`     | Disable the exists address index, which tracks whether or not an address has even been used.
            `--dropexistsaddrindex`   | Deletes the exists address index from the database on startup and then exits.
            `--nocfilters`            | **DEPRECATED** -- Disable compact filtering (CF) support
            `--dropcfindex`           | **DEPRECATED** -- Deletes the index used for compact filtering (CF) support from the database on startup and then exits.
            `--piperx=`               | File descriptor of read end pipe to enable parent -> child process communication
            `--pipetx=`               | File descriptor of write end pipe to enable parent <- child process communication
            `--lifetimeevents`        | Send lifetime notifications over the TX pipe
            `--altdnsnames=`          | Specify additional DNS names to use when generating the RPC server certificate [$DCRD_ALT_DNSNAMES]
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
            `--enableticketbuyer`                      | Enable the automatic ticket buyer
            `--enablevoting`                           | Enable creation of votes and revocations for owned tickets
            `--purchaseaccount=`                       | Name of the account to buy tickets from (default: default)
            `--pooladdress=`                           | The ticket pool address where ticket fees will go to
            `--poolfees=`                              | The per-ticket fee mandated by the ticket pool as a percent (e.g. 1.00 for 1.00% fee)
            `--gaplimit=`                              | The size of gaps between used addresses.  Used for address scanning and when generating addresses with the wrap option. (default: 20)
            `--stakepoolcoldextkey=`                   | Enables the wallet as a stake pool with an extended key in the format of "xpub...:index" to derive cold wallet addresses to send fees to
            `--manualtickets`                          | Do not discover new tickets through network synchronization
            `--allowhighfees`                          | Force the RPC client to use the 'allowHighFees' flag when sending transactions
            `--txfee=`                                 | Sets the wallet's tx fee per kb (default: 0.0001 DCR)
            `--accountgaplimit=`                       | Number of accounts that can be created in a row without using any of them (default: 10)
            `--disablecointypeupgrades`                | Never upgrade from legacy to SLIP0044 coin type keys
    `-c` or `--rpcconnect=`                            | Hostname/IP and port of dcrd RPC server to connect to
            `--cafile=`                                | File containing root certificates to authenticate a TLS connections with dcrd
            `--clientcafile=`                          | Certficate Authority to verify TLS client certificates (default: `~/.dcrwallet/clients.pem`)
            `--noclienttls`                            | Disable TLS for the RPC client -- **NOTE:** This is only allowed if the RPC client is connecting to localhost
            `--dcrdusername=`                          | Username for dcrd authentication
            `--dcrdpassword=`                          | Password for dcrd authentication
            `--proxy=`                                 | Connect via SOCKS5 proxy (eg. 127.0.0.1:9050)
            `--proxyuser=`                             | Username for proxy server
            `--proxypass=`                             | Password for proxy server
            `--circuitlimit=`                          | Set maximum number of open Tor circuits; used only when `--torisolation` is enabled (default: 32)
            `--torisolation`                           | Enable Tor stream isolation by randomizing user credentials for each connection
            `--nodcrdproxy`                            | Never use configured proxy to dial dcrd websocket connectons
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
            `--jsonrpcauthtype=`                       | Method for JSON-RPC client authentication (basic or clientcert) (default: basic)
            `--pipetx=`                                | File descriptor or handle of write end pipe to enable child -> parent process communication
            `--piperx=`                                | File descriptor or handle of read end pipe to enable parent -> child process communication
            `--rpclistenerevents`                      | Notify JSON-RPC and gRPC listener addresses over the TX pipe
            `--issueclientcert`                        | Notify a client cert and key over the TX pipe for RPC authentication
            `--csppserver=`                            | Network address of CoinShuffle++ server
            `--csppserver.ca=`                         | CoinShuffle++ Certificate Authority
            `--mixedaccount=`                          | Account/branch used to derive CoinShuffle++ mixed outputs and voting rewards
            `--ticketsplitaccount=`                    | Account to derive fresh addresses from for mixed ticket splits; uses mixedaccount if unset
            `--changeaccount=`                         | Account used to derive unmixed CoinJoin outputs in CoinShuffle++ protocol
            `--mixchange`                              | Use CoinShuffle++ to mix change account outputs into mix account
            `--ticketbuyer.balancetomaintainabsolute=` | Amount of funds to keep in wallet when stake mining (default: 0 DCR)
            `--ticketbuyer.votingaddress=`             | Purchase tickets with voting rights assigned to this address
            `--ticketbuyer.limit=`                     | Buy no more than specified number of tickets per block (0 disables limit)
            `--ticketbuyer.votingaccount=`             | Account used to derive addresses specifying voting rights
            `--vsp.url=`                               | Base URL of the VSP server
            `--vsp.pubkey=`                            | VSP server pubkey
            `--vsp.sync`                               | sync tickets to vsp
            `--vsp.maxfee=`                            | Maximum VSP fee (default: 0.1 DCR)
