# خيارات البرنامج

---

الخيارات الافتراضية هي سليمة بالنسبة لمعظم المستخدمين، على الرغم من أنك قد تحتاج إلى 
تعيين بيانات الاعتماد الخاصة بك. وهذا يعني أن `dcrd` ستعمل
 'خارج نطاق' معظم المستخدمين. ومع ذلك، هناك أيضا مجموعة 
متنوعة من الأعلام التي  يمكن أن تستخدم للسيطرة على سلوكها. القسم التالي
 يوفر نظرة عامة للاستخدام الذي يعدد الأعلام. نقطة مثيرة للاهتمام
أن نلاحظ أن شكل طويل من كل هذه الخيارات (باستثناء 
`-C`) يمكن تحديدها  في ملف تهيئة الذي يتم تحليله تلقائيا
 عند بدء تشغيل دكرد.
و العلم (`C` (`--configfile`-
، كما هو مبين أدناه، يمكن استخدامه لتجاوز الموقع الافتراضي.
 يمكنك دائما الحصول على قائمة بجميع الخيارات باستخدام علامة `-h`.

---

## الإستخدام

```
dcrd [خيارات]
```

---

## خيارات التطبيق

اختيار                      | وصف
---                         | ---
`-A` أو` --appdata = `        | المسار إلى الدليل الرئيسي للديكريد (HOME/.dcrd$)
`-V` أو` --version`         | عرض معلومات الإصدار والخروج
`-C` أو` --configfile = `     | المسار إلى ملف التهيئة
`-b` أو` --datadir = `        | دليل تخزين البيانات
`--logdir=`                 | دليل لتسجيل الإخراج. (HOME/.dcrd/logs$)
`-a` أو` --addpeer = `        | إضافة نظير للتواصل معه عند بدء التشغيل
`--connect=`                | الاتصال فقط بالنظير المحدد عند بدء التشغيل
`--nolisten`                | تعطيل الاستماع للاتصالات الواردة - ملاحظة: يتم تعطيل الاستماع تلقائيا إذا تم استخدام خيارات `--connect` أو` --proxy`  دون  تحديد واجهات الاستماع عبر `--listen`
`--listen=`                 | إضافة واجهة / منفذ  الاستماع للاتصالات ( كافة واجهات المنافذ الافتراضية : `9108`، تستنيت:` 19108`)
`--maxpeers=`               | الحد الأقصى لعدد النظراء الوارد والصادر (125)
`--nobanning`               | Disable banning of misbehaving peers
`--banduration=`            | How long to ban misbehaving peers. Valid time units are {s, m, h}.  Minimum 1 second (24h0m0s)
`--banthreshold`            | Maximum allowed ban score before disconnecting banning misbehaving peers. (default: 100)
`--whitelist=`              | Add an IP network or IP that will not be banned. (eg. 192.168.1.0/24 or ::1)
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
`--externalip=`             | Add an ip to the list of local addresses we claim to listen on to peers
`--proxy=`                  | Connect via SOCKS5 proxy (eg. 127.0.0.1:9050)
`--proxyuser=`              | Username for proxy server
`--proxypass=`              | Password for proxy server
`--onion=`                  | Connect to tor hidden services via SOCKS5 proxy (eg. 127.0.0.1:9050)
`--onionuser=`              | Username for onion proxy server
`--onionpass=`              | Password for onion proxy server
`--noonion=`                | Disable connecting to tor hidden services
`--torisolation`            | Enable Tor stream isolation by randomizing user credentials for each connection
`--testnet`                 | Use the test network
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
`--minrelaytxfee`           | The minimum transaction fee in DCR/kB to be considered a non-zero fee. (default: 0.001)
`--limitfreerelay=`         | Limit relay of transactions with no transaction fee to the given amount in thousands of bytes per minute (15)
`--norelaypriority`         | Do not require free or low-fee transactions to have high priority for relaying
`--maxorphantx=`            | Max number of orphan transactions to keep in memory (1000)
`--generate=`               | Generate (mine) decreds using the CPU
`--miningaddr=`             | Add the specified payment address to the list of addresses to use for generated blocks -- At least one address is required if the generate option is set
`--blockminsize=`           | Mininum block size in bytes to be used when creating a block
`--blockmaxsize=`           | Maximum block size in bytes to be used when creating a block (750000)
`--blockprioritysize=`      | Size in bytes for high-priority/low-fee transactions when creating a block (50000)
`--getworkkey=`             | DEPRECATED -- Use the --miningaddr option instead
`--nopeerbloomfilters`      | Disable bloom filtering support
`--sigcachemaxsize=`        | The maximum number of entries in the signature verification cache (default: 100000)
`--nonaggressive`           | Disable mining off of the parent block of the blockchain if there aren't enough voters
`--nominingstatesync`       | Disable synchronizing the mining state with other nodes
`--allowoldvotes`           | Enable the addition of very old votes to the mempool
`--blocksonly`              | Do not accept transactions from remote peers.
`--relaynonstd`             | Relay non-standard transactions regardless of the default settings for the active network.
`--rejectnonstd`            | Reject non-standard transactions regardless of the default settings for the active network.
`--txindex`                 | Maintain a full hash-based transaction index which makes all transactions available via the getrawtransaction RPC
`--droptxindex`             | Deletes the hash-based transaction index from the database on start up and then exits.
`--addrindex`               | Maintain a full address-based transaction index which makes the searchrawtransactions RPC available
`--dropaddrindex`           | Deletes the address-based transaction index from the database on start up and then exits.
`--noexistsaddrindex`       | Disable the exists address index, which tracks whether or not an address has even been used.
`--dropexistsaddrindex`     | Deletes the exists address index from the database on start up and then exits.
`--piperx=`                 | File descriptor of read end pipe to enable parent -> child process communication
`--pipetx=`                 | File descriptor of write end pipe to enable parent <- child process communication
`--lifetimeevents`          | Send lifetime notifications over the TX pipe

---

## Help options

Option                      | Description
---                         | ---
`-h` or `--help`            | Show this help message

---

## PoS Commands

While it's easy to get started PoS mining, there's a lot happening in
the background. Let's have a look at some of the information
available:

```
dcrctl -u <username> - P <password> --wallet <command>
```

```getbalance ("account" minconf=1 "balancetype")``` Gets the balance
for the given account (not address). On its own it will display
spendable coins. To see all coins, you need to set balancetype to all
e.g. ‘getbalance * 0 all' will show the wallet’s total balance.

```
getstakeinfo
{
  "blockheight": 171403,
  "poolsize": 40957,
  "difficulty": 68.20149389,
  "allmempooltix": 9,
  "ownmempooltix": 0,
  "immature": 4,
  "live": 25,
  "proportionlive": 0.000061527943941663,
  "voted": 50,
  "totalsubsidy": 81.95590153,
  "missed": 3,
  "proportionmissed": 0.026713124274099883,
  "revoked": 3,
  "expired": 0
}
```

The `getstakeinfo` command returns a list of data about your PoS mining results.

Output             | Description
---                |---
`blockheight`      | The lastest block number.
`poolsize`         | The number of tickets currently in the voting pool.
`difficulty`       | This is the cost of a ticket. It goes up or down depending on the number of tickets currently in the pool as well as the number of tickets over the last 2880 blocks using an exponential moving average <LINK>Source(https://github.com/decred/dcrd/blob/master/chaincfg/params.go#L336). The network will adjust the price to try to keep the pool size near the target of 40,960 tickets. Note this doesn't mean the price will always go up if above this number, nor will it always go down if below. The rate that tickets enter the pool also affects the price. It is adjusted every 144 blocks.
`allmempooltix`    | Only 20 tickets per block are accepted into the voting pool. Extra tickets wait in the mempool. Tickets are accepted into the voting pool according to ticketfee which is 0.01 DCR/kB by default. See PoS mining#Purchasing-Tickets for more information.
`ownmempooltix`    | Your tickets that are waiting in the mempool.
`immature`         | All tickets have a 256 (about a day) maturity time during which they cannot be selected to vote. This indicates how many of your tickets are in this state.
`live`             | Tickets in the voting pool that are active and able to vote when selected.
`proportionlive`   | Proportion of your live tickets in the voting pool.
`voted`            | Number of your tickets that have voted in this wallet.
`totalsubsidy`     | Total amount this wallet has earned through voting.
`missed`           | Tickets that were selected to vote but didn't, likely because the wallet was offline.
`proportionmissed` | Proportion of all missed tickets that were yours.
`revoked`          | Number of revoked tickets. Since missed tickets are revoked (removed from the voting pool without voting) this number will usually (but not always) equal missed tickets.
`expired`          | Number of tickets that did not vote and reached the expiry (40960 blocks). The chance of this is about 1 in 200 and funds used to purchase the ticket (but not fees) are returned.

---

## dcrctl parameters

### Chain server commands

Note that some commands have been omitted from this list. They include
duplicate commands, unimplemented commands and those that have limited
utility to the general userbase.  You can always see all commands
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
`getpeerinfo`        | Similar to getnettotals, includes network data transfer, time connected, block height when daemon was started and current block height.
`getstakedifficulty` | Returns current PoS difficulty.
`getticketpoolvalue` | Gets the DCR value of all tickets in the pool.
`help ("command")`   | Show the help for a command.
`missedtickets`      | Show all of your tickets that missed voting.
`rebroadcastmissed` | Rebroadcast missed tickets to the network. This is done automatically upon starting the wallet.
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
`getstakeinfo`                                                                  | Retrieve useful information on the current status of the PoS pool. See <LINK>PoS Commands.
`getticketfee`                                                                  | Get the average fee being paid for tickets.
`getticketmaxprice`                                                             | Get the maximum price that your wallet will auto purchase tickets for.
`gettickets includeimmature`                                                    | Get all your current tickets. Second argument should be true if you want to see immature tickets too.
`gettransaction "txid" (includewatchonly=false)`                                | Get the transaction associated with the given id.
`listaccounts (minconf=1)`                                                      | See all accounts and their spendable balance in your wallet.
`listreceivedbyaccount (minconf=1 includeempty=false includewatchonly=false)`   | Get a list of all your accounts and the amount of DCR that has been received by them.
`listreceivedbyaddress (minconf=1 includeempty=false includewatchonly=false)`   | Get a list of all your addresses and the amount of DCR that has been received by them.
`listsinceblock ("blockhash" targetconfirmations=1 includewatchonly=false)`     | List transactions that have occurred since the given block hash.
`listtransactions ("account" count=10 from=0 includewatchonly=false)`           | List the number of transactions as specified by ‘count' in the given account.
`move "fromaccount" "toaccount" amount (minconf=1 "comment")`                   | Move funds between accounts in the same wallet.
`purchaseticket "fromaccount" spendlimit (minconf=1 "ticketaddress" "comment")` | Manually purchase PoS tickets. ‘fromaccount' will usually be "default". ‘spendlimit' is the amount you want to spend on tickets in total, not per ticket.
`renameaccount "oldaccount" "newaccount"`                                       | Rename an account in your wallet.
`sendfrom "fromaccount" "toaddress" amount (minconf=1 "comment" "commentto")`   | Send DCR from the given account to the given address. You can add an optional comment.
`sendtoaddress "address" amount ("comment" "commentto")`                        | Similar to above but uses the default account to send from.
`setbalancetomaintain balance`                                                  | Used for auto staking. The wallet will auto buy tickets until it reaches this threshold.
`setticketfee fee`                                                              | Set the (non-refundable) fee for purchasing stake tickets. See <LINK>FAQ#Ticket fee
`setticketmaxprice max`                                                         | Set the maximum price the wallet will pay when auto buying tickets.
`setticketvotebits "txhash" votebits ("votebitsext")`                           | Sets the given ticket to vote ‘yes' or ‘no' (default yes)
`settxfee amount`                                                               | Sets the fee per kB of transaction data you are willing to pay. Note this is NOT the same as setticketfee above.
`walletlock`                                                                    | Lock the wallet (no funds can be sent).
`walletpassphrase "passphrase" timeout`                                         | Unlock the wallet using the given pass phrase for the given time period in seconds. 0 will unlock the wallet until it is restarted.
`walletpassphrasechange "oldpassphrase" "newpassphrase"`                        | Change your wallet passphrase.
