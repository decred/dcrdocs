# **Program Options**

---

The default options are sane for most users (although you may need to
set your credentials. This means `dcrd` will
work 'out of the box' for most users. However, there are also a wide
variety of flags that can be used to control its behavior. The following section
provides a usage overview which enumerates the flags.An interesting
point to note is that the long form of all of these options (except
`-C`) can be specified in a configuration file that is automatically
parsed when dcrd starts up.
The `-C` (`--configfile`)
flag, as shown below, can be used to override the default location.
You can always get a list of all options by using the `-h` option.

---

## **Usage**

```
dcrd [OPTIONS]
```

---

## **Application options**

Option                      | Description
---                         | ---
`-A` or `--appdata=`        | Path to dcrd home directory ($HOME/.dcrd)
`-V` or `--version`         | Display version information and exit
`-C` or `--configfile=`     | Path to configuration file
`-b` or `--datadir=`        | Directory to store data
`--logdir=`                 | Directory to log output. ($HOME/.dcrd/logs)
`-a` or `--addpeer=`        | Add a peer to connect with at startup
`--connect=`                | Connect only to the specified peers at startup
`--nolisten`                | Disable listening for incoming connections -- NOTE: Listening is automatically disabled if the `--connect` or `--proxy` options are used without also specifying listen interfaces via `--listen`
`--listen=`                 | Add an interface/port to listen for connections (default all interfaces port: `9108`, testnet: `19108`)
`--maxpeers=`               | Max number of inbound and outbound peers (125)
`--banduration=`            | How long to ban misbehaving peers. Valid time units are {s, m, h}.  Minimum 1 second (24h0m0s)
`-u` or `--rpcuser=`        | Username for RPC connections
`-P` or `--rpcpass=`        | Password for RPC connections
`--rpclimituser=`           | Username for limited RPC connections
`--rpclimitpass=`           | Password for limited RPC connections
`--rpclisten=`              | Add an interface/port to listen for RPC connections (default port: `8334`, testnet: `18334`)
`--rpccert=`                | File containing the certificate file
`--rpckey=`                 | File containing the certificate key
`--rpcmaxclients=`          | Max number of RPC clients for standard connections (10)
`--rpcmaxwebsockets=`       | Max number of RPC clients for standard connections (25)
`--norpc`                   | Disable built-in RPC server -- NOTE: The RPC server is disabled by default if no `rpcuser`/`rpcpass` is specified
`--notls`                   | Disable TLS for the RPC server -- NOTE: This is only allowed if the RPC server is bound to localhost
`--nodnsseed`               | Disable DNS seeding for peers
`--externalip:`             | Add an ip to the list of local addresses we claim to listen on to peers
`--proxy=`                  | Connect via SOCKS5 proxy (eg. 127.0.0.1:9050)
`--proxyuser=`              | Username for proxy server
`--proxypass=`              | Password for proxy server
`--onion=`                  | Connect to tor hidden services via SOCKS5 proxy (eg. 127.0.0.1:9050)
`--onionuser=`              | Username for onion proxy server
`--onionpass=`              | Password for onion proxy server
`--noonion=`                | Disable connecting to tor hidden services
`--torisolation`            | Enable Tor stream isolation by randomizing user credentials for each connection
`--testnet `                | Use the test network
`--simnet`                  | Use the simulation test network
`--nocheckpoints=`          | Disable built-in checkpoints. Don't do this unless you know what you're doing.
`--dbtype=`                 | Database backend to use for the Block Chain (leveldb)
`--profile=`                | Enable HTTP profiling on given port -- NOTE port must be between 1024 and 65536 (6060)
`--cpuprofile=`             | Write CPU profile to the specified file
`--memprofile=`             | Write mem profile to the specified file
`--dumpblockchain=`         | Write blockchain as a gob-encoded map to the specified file
`--miningtimeoffset=`       | Offset the mining timestamp of a block by this many seconds (positive values are in the past)
`-d` or `--debuglevel:`     | Logging level for all subsystems {trace, debug, info, warn, error, critical} -- You may also specify &lt;subsystem&gt;=&lt;level&gt;,&lt;subsystem2&gt;=&lt;level&gt;,... to set the log level for individual subsystems -- Use show to list available subsystems (info)
`--upnp`                    | Use UPnP to map our listening port outside of NAT
`--limitfreerelay=`         | Limit relay of transactions with no transaction fee to the given amount in thousands of bytes per minute (15)
`--norelaypriority`         | Do not require free or low-fee transactions to have high priority for relaying
`--maxorphantx=`            | Max number of orphan transactions to keep in memory (1000)
`--generate=`               | Generate (mine) decreds using the CPU
`--miningaddr=`             | Add the specified payment address to the list of addresses to use for generated blocks -- At least one address is required if the generate option is set
`--blockminsize=`           | Mininum block size in bytes to be used when creating a block
`--blockmaxsize=`           | Maximum block size in bytes to be used when creating a block (750000)
`--blockprioritysize=`      | Size in bytes for high-priority/low-fee transactions when creating a block (50000)
`--getworkkey=`             | DEPRECATED -- Use the --miningaddr option instead
`--addrindex=`              | Build and maintain a full address index. Currently only supported by leveldb.
`--dropaddrindex=`          | Deletes the address-based transaction index from the database on start up, and the exits.
`--nonaggressive`           | Disable mining off of the parent block of the blockchain if there aren't enough voters
`--nominingstatesync`       | Disable synchronizing the mining state with other nodes

---

## **Help options**

Option                      | Description
---                         | ---
`-h` or `--help`            | Show this help message

---

## **PoS Commands**

While it's easy to get started PoS mining, there's a lot happening in
the background. Let's have a look at some of the information
available:

```
dcrctl -u <daemon username> - P <daemon password> --wallet <command>
```

```getbalance ("account" minconf=1 "balancetype")``` Gets the balance
for the given account (not address). On its own it will display
spendable coins. To see all coins, you need to set balancetype to all
e.g. ‘getbalance * 0 all' will show the total balance in wallet.

```
getstakeinfo
  "poolsize": 42208,
  "difficulty": 17.4973371,
  "allmempooltix": 0,
  "ownmempooltix": 0,
  "immature": 0,
  "live": 213,
  "proportionlive": 0.005046436694465504,
  "voted": 129,
  "totalsubsidy": 239.06504718,
  "missed": 50,
  "proportionmissed": 0.0011832079132945241,
  "revoked": 50
```

The `getstakeinfo` command returns a list of data about your PoS mining results.

Output             | Description
---                |---
`poolsize`         | The number of tickets current in the voting pool.
`difficulty`       | This is the cost of a ticket. It goes up or down depending on the number of tickets currently in the pool as well as the number of tickets over the last 2880 blocks using an exponential moving average <LINK>Source(https://github.com/decred/dcrd/blob/master/chaincfg/params.go#L336). The network will adjust the price to try to keep the pool size near the target of 40,960 tickets. Note this doesn't mean the price will always go up if above this number, nor will it always go down if below. The rate that tickets enter the pool also affects the price. It is adjusted every 144 blocks.
`allmempooltix`    | Only 20 tickets per block are accepted in to the voting pool. Extra tickets wait in the mempool. Tickets are accepted into the voting pool according to txfee which is 0.05 by default. See PoS mining#Purchasing-Tickets for more information.
`ownmempooltix`    | Your tickets that are waiting in the mempool.
`immature`         | All tickets have a 256 (about a day) maturity time during which they cannot be selected to vote. This indicates how many of your tickets are in this state.
`live`             | Tickets in the voting pool that are active and able to vote when selected.
`proportionlive`   | Proportion of your live tickets in the voting pool.
`voted`            | Number of your tickets that have voted in this wallet.
`totalsubsidy`     | Total amount this wallet has earned through voting.
`missed`           | Tickets that were selected to vote but didn't, likely because the wallet was offline.
`proportionmissed` | Proportion of all missed tickets that were yours.
`revoked`          | Number of revoked tickets. Since missed tickets are revoked (removed from the voting pool without voting) this number will usually (but not always) equal missed tickets.

---

## **PoS network parameters**

Parameter               | Value              | Description
---                     | ---                | ---
`MinimumStakeDiff`      | 2                  | The minimum price for a stake ticket.
`TicketPoolSize`        | 8,192              | This is multiplied by TicketsPerBlock to get the desired voting pool size (40,960).
`TicketsPerBlock`       | 5                  | This many tickets will be chosen to vote each block.
`TicketMaturity`        | 256                | Time in blocks (about a day) until a ticket is able to vote after being purchased.
`TicketExpiry`          | 40,960             | Tickets that haven't voted after this many blocks will be revoked (about 142 days).
`CoinbaseMaturity`      | 256                | Historic. Before this block coins could not be transferred.
`SStxChangeMaturity`    | 1                  | After voting, this many blocks must pass for stake and reward to return to PoS miners.
`TicketPoolSizeWeight`  | 4                  | Tickets will not change price up or down by more than this multiplier in one update.
`StakeDiffAlpha`        | 1                  | This is the stake difficulty EMA calculation alpha (smoothing) value. It is different from a normal EMA alpha. Closer to 1 --> smoother.
`StakeDiffWindowSize`   | 144                | The number of blocks in a window. Averaged per window, used below.
`StakeDiffWindows`      | 20                 | An exponential moving average over this many windows is used to calculate stake cost.
`MaxFreshStakePerBlock` | 20                 | This many new tickets will be added from the mempool to the voting pool each block.
`StakeEnabledHeight`    | 256 + 256          | Historic. This is the height in which the first ticket could possibly mature. Since coins were locked until block 256, no tickets could be purchased until then. After that, there was another 256 blocks before they matured.
`StakeValidationHeight` | 4,096              | Historic. Stake mining did not occur before this block.
`StakeBaseSigScript`    | []byte{0x00, 0x00} | This is the consensus stakebase signature script for all votes on the network. This isn't signed in any way, so without forcing it to be this value, miners/daemons could freely change it. Ensures the block is on the right network.

---

## **Blockchain parameters**

Paramater               | Value        | Description
---                     | ---          | ---
Initial block reward    | 31.1958      | This was the initial reward for mining a block.
Block reward multiplier | 100/101      | The block reward is multiplied by this whenever the block price changes. Basically what that means is that every reward cycle (see below) the block reward given for mining a block is reduced by approximately 1%.
Block reward change     | 6,144 blocks | The number of blocks between block reward changes. This occurs approximately every 3 weeks. Decred uses a more frequent change cycle (about 3 weeks compared to Bitcoins 4 years), but the magnitude of the change is much less (about 1% per cycle whereas Bitcoin is 50%). This is designed to reduce the shock in markets when a change occurs.
Block reward share      | 60/30/10     | The reward for a block is split between miners and the Decred development team as follows: PoW miners get 60% of the reward to reimburse them for electricity and hardware expenses. PoS miners get 6% of the reward each (30% for 5 votes) <what happens if less than 5 vote?>. This encourages people to hold their coins and invest in the Decred network. The development team receives 10% to help ensure the future of Decred by funding ongoing development.

---

## **dcrctl parameters**

### Chain server commands

Note that some commands have been omitted from this list. They include
duplicate commands, unimplemented commands and those that have limited
utility to the general user base.  You can always see all commands
with `dcrctl -l`.

Command              | Description
---                  | ---
`getbestblock`       | Get the most recent block and hash in the chain.
`getbestblockhash`   | Get the hash of the most recent block in the chain.
`getblockcount`      | Get the current number of blocks in the chain.
`getdifficulty`      | Get the current PoW mining difficulty.
`gethashespersec`    | Get the network hash rate.
`getinfo`           | Displays some basic info about the network including current block number and network difficulty.
`getmininginfo`      | Probably the most useful PoW command. Shows the current block, size and difficulty, as well as the total network hash rate per second.
`getnettotals`       | Gets the amount of data sent and received by the daemon.
`getpeerinfo`        | Similar to getnettoals, includes network data transfer, time connected, block height when daemon was started and current block height.
`getstakedifficulty` | Returns current PoS difficulty.
`getticketpoolvalue` | Gets the DCR value of all tickets in the pool.
`help ("command")`   | Show the help for a command.
`missedtickets`      | Show all of your tickets that missed voting.
`gebroadcastmissed` | Rebroadcast missed tickets to the network. This is done automatically on starting the wallet.
`rebroadcastwinners` | As above, but for voted tickets.
`stop`               | Stop the daemon.

### Wallet server commands (\-\-wallet)

Command                                                                         | Description
---                                                                             | ---
`addmultisigaddress nrequired ["key",...] ("account")`                          | Adds an address that requires multiple signatures to use.
`consolidate inputs ("account")`                                                | Cleans up funds in multiple addresses in an account and puts it in a single address. Note there is a transaction fee to use this command.
`createmultisig nrequired ["key",...]`                                          | Used for multi signature wallets.
`createnewaccount "account"`                                                    | Create a new account. Note, this makes a new account within the current wallet, NOT a new wallet.
`dumpprivkey "address"`                                                         | Disabled on mainnet for security reasons.
`encryptwallet "passphrase"`                                                    | Encrypt the wallet with the given phrase
`getaccount "address"`                                                          | This command will tell you what account the given address belongs to.
`getaccountaddress "account"`                                                   | Return the first address in the given account (default is ‘default').
`getaddressesbyaccount "account"`                                               | Get all the addresses in the given account.
`getbalance ("account" minconf=1 "balancetype")`                                | Get the spendable balance in the given account. To get the entire balance in the wallet, use ‘getbalance * 0 all'.
`getbalancetomaintain`                                                          | This is the minimum balance to maintain in the wallet when using auto stake buying.
`getmasterpubkey`                                                               | Get the public key for your wallet. This will allow people to view, but not spend funds in your wallet. It is safe to provide to others.
`getnewaddress ("account" verbose=false)`                                       | Get a new address in the given account.
`getreceivedbyaccount "account" (minconf=1)`                                    | Gets the total amount of DCR ever received by this wallet. This includes stake returns so it could be quite large if you're PoS mining.
`getreceivedbyaddress "address" (minconf=1)`                                    | Get funds received by the given address.
`getseed`                                                                       | Disabled on mainnet for security.
`getstakeinfo`                                                                  | Retreive useful information on the current status of the PoS pool. See <LINK>PoS Commands.
`getticketfee`                                                                  | Get the average fee being paid for tickets.
`getticketmaxprice`                                                             | Get the maximum price that your wallet will auto purchase tickets for.
`gettickets includeimmature`                                                    | Get all your current tickets. Second argument should be true if you want to see immature tickets too.
`gettransaction "txid" (includewatchonly=false)`                                | Get the transaction associated with the given id.
`listaccounts (minconf=1)`                                                      | See all accounts and their spendable balance in your wallet.
`listreceivedbyaccount (minconf=1 includeempty=false includewatchonly=false)`   | Get a list of all your accounts and the amount of DCR that has been received by them.
`listreceivedbyaddress (minconf=1 includeempty=false includewatchonly=false)`   | Get a list of all your addresses and the amount of DCR that has been received by them.
`listsinceblock ("blockhash" targetconfirmations=1 includewatchonly=false)`     | List transactions that occurred since the given block hash.
`listtransactions ("account" count=10 from=0 includewatchonly=false)`           | List the number of transactions as specified by ‘count' in the given account.
`move "fromaccount" "toaccount" amount (minconf=1 "comment")`                   | Move funds between accounts in the same wallet.
`purchaseticket "fromaccount" spendlimit (minconf=1 "ticketaddress" "comment")` | Manually purchase PoS tickets. ‘fromaccount' will usually be "default". ‘spendlimit' is the amount you want to spend on tickets in total, not per ticket.
`renameaccount "oldaccount" "newaccount"`                                       | Rename an account in your wallet.
`sendfrom "fromaccount" "toaddress" amount (minconf=1 "comment" "commentto")`   | Send DCR from the given account to the given address. You can add an optional comment.
`sendtoaddress "address" amount ("comment" "commentto")`                        | Similar to above but uses the default account to send from.
`setbalancetomaintain balance`                                                  | Used for auto staking. The wallet will auto buy tickets until it reaches this threshold.
`setticketfee fee`                                                              | Set the (non-refunable) fee for purchasing stake tickets. See <LINK>FAQ#Ticket fee
`setticketmaxprice max`                                                         | Set the maximum price the wallet will pay when auto buying tickets.
`setticketvotebits "txhash" votebits ("votebitsext")`                           | Sets the given ticket to vote ‘yes' or ‘no' (default yes)
`settxfee amount`                                                               | Sets the fee per kB of transaction data you are willing to pay. Note this is NOT the same as setticketfee above.
`walletlock`                                                                    | Lock the wallet (no funds can be sent).
`walletpassphrase "passphrase" timeout`                                         | Unlock the wallet using the given pass phrase for the given time period in seconds. 0 will unlock the wallet until it is restarted.
`walletpassphrasechange "oldpassphrase" "newpassphrase"`                        | Change your wallet passphrase.
