# <img class="dcr-icon" src="/img/dcr-icons/Options2.svg" /> Program Options

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
`allmempooltix`    | Only 20 tickets per block are accepted into the voting pool. Extra tickets wait in the mempool. Tickets are accepted into the voting pool according to ticketfee which is 0.001 DCR/kB by default. See PoS mining#Purchasing-Tickets for more information.
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
