# <img class="dcr-icon" src="/img/dcr-icons/Dcrtl.svg" /> `dcrctl` RPC Commands

Last updated for CLI release v{{ cliversion }}.

The dcrd and dcrwallet daemons have APIs that can be used to access lower-level functionality not available in their respective [Command-line Interfaces (CLIs)](dcrd-and-dcrwallet-cli-arguments.md). These APIs are called using Remote Procedure Calls (RPCs). RPCs also allow for integrations with clients written in any language that supports RPCs. 

Below are some common RPC commands for dcrd and dcrwallet. For a full list of supported RPC commands and more detailed documentation, see the [dcrd RPC API](https://github.com/decred/dcrd/blob/master/docs/json_rpc_api.mediawiki) and [dcrwallet RPC Documentation](https://github.com/decred/dcrwallet/tree/master/rpc/documentation).

---

## `dcrd` RPC Commands

??? info "Click to expand full list of `dcrd` RPC commands"
    RPC Method                |Params
    --------------------------|-------------
    `addnode`                 | `"addr"` `"add|remove|onetry"`
    `createrawssrtx`          | `[{"amount":n.nnn,"txid":"value","vout":n,"tree":n},...]` (`fee`)
    `createrawsstx`           | `[{"txid":"value","vout":n,"tree":n,"amt":n},...] amount [{"addr":"value","commitamt":n,"changeaddr":"value","changeamt":n},...]`
    `createrawtransaction`    | `[{"amount":n.nnn,"txid":"value","vout":n,"tree":n},...]` `{"address":amount,...}` (`locktime` `expiry`)
    `debuglevel`              | `"levelspec"`
    `decoderawtransaction`    | `"hextx"`
    `decodescript`            | `"hexscript"` (`version`)
    `estimatefee`             | `numblocks`
    `estimatesmartfee`        | `confirmations` (`mode="conservative"`)
    `estimatestakediff`       | (`tickets`)
    `existsaddress`           | `"address"`
    `existsaddresses`         | `["address",...]`
    `existsexpiredtickets`    | `["txhash",...]`
    `existsliveticket`        | `"txhash"`
    `existslivetickets`       | `["txhash",...]`
    `existsmempooltxs`        | `["txhash",...]`
    `existsmissedtickets`     | `["txhash",...]`
    `generate`                | `numblocks`
    `getaddednodeinfo`        | `dns` (`"node"`)
    `getbestblock`            |
    `getbestblockhash`        |
    `getblock`                | `"hash"` (`verbose=true` `verbosetx=false`)
    `getblockchaininfo`       |
    `getblockcount`           |
    `getblockhash`            | `index`
    `getblockheader`          | `"hash"` (`verbose=true`)
    `getblocksubsidy`         | `height` `voters`
    `getcfilter`              | `"hash"` `"filtertype"`
    `getcfilterheader`        | `"hash"` `"filtertype"`
    `getcfilterv2`            | `"blockhash"`
    `getchaintips`            |
    `getcoinsupply`           |
    `getconnectioncount`      |
    `getcurrentnet`           |
    `getdifficulty`           |
    `getgenerate`             |
    `gethashespersec`         |
    `getheaders`              | `["blocklocator",...]` `"hashstop"`
    `getinfo`                 |
    `getmempoolinfo`          |
    `getmininginfo`           |
    `getnettotals`            |
    `getnetworkhashps`        | (`blocks=120` `height=-1`)
    `getnetworkinfo`          |
    `getpeerinfo`             |
    `getrawmempool`           | (`verbose=false` `"txtype"`)
    `getrawtransaction`       | `"txid"` (`verbose=0`)
    `getstakedifficulty`      |
    `getstakeversioninfo`     | (`count`)
    `getstakeversions`        | `"hash"` `count`
    `getticketpoolvalue`      |
    `gettxout`                | `"txid"` `vout` (`includemempool=true`)
    `gettxoutsetinfo`         |
    `getvoteinfo`             | `version`
    `getwork`                 | (`"data"`)
    `help`                    | (`"command"`)
    `livetickets`             |
    `missedtickets`           |
    `node`                    | `"connect|remove|disconnect"` `"target"` (`"perm|temp"`)
    `ping`                    |
    `rebroadcastmissed`       |
    `rebroadcastwinners`      |
    `searchrawtransactions`   | `"address"` (`verbose=1` `skip=0` `count=100` `vinextra=0` `reverse=false` `["filteraddr",...]`)
    `sendrawtransaction`      | `"hextx"` (`allowhighfees=false`)
    `setgenerate`             | `generate` (`genproclimit=-1`)
    `stop`                    |
    `submitblock`             | `"hexblock"` (`{"workid":"value"}`)
    `ticketfeeinfo`           | (`blocks` `windows`)
    `ticketsforaddress`       | `"address"`
    `ticketvwap`              | (`start` `end`)
    `txfeeinfo`               | (`blocks` `rangestart` `rangeend`)
    `validateaddress`         | `"address"`
    `verifychain`             | (`checklevel=3` `checkdepth=288`)
    `verifymessage`           | `"address"` `"signature"` `"message"`
    `version`                 |

---

## `dcrwallet` RPC Commands

??? info "Click to expand full list of `dcrwallet` RPC commands"
    RPC Method                |Params
    --------------------------|-------------
    `abandontransaction`      | `"hash"`
    `accountaddressindex`     | `"account"` `branch`
    `accountsyncaddressindex` | `"account"` `branch` `index`
    `addmultisigaddress`      | `nrequired` `["key",...]` (`"account"`)
    `addticket`               | `"tickethex"`
    `authenticate`            | `"username"` `"passphrase"`
    `consolidate`             | `inputs` (`"account"` `"address"`)
    `createmultisig`          | `nrequired` `["key",...]`
    `createnewaccount`        | `"account"`
    `createvotingaccount`     | `"name"` `"pubkey"` (`childindex=0`)
    `dropvotingaccount`       |
    `dumpprivkey`             | `"address"`
    `fundrawtransaction`      | `"hexstring"` `"fundaccount"` (`{"changeaddress":changeaddress,"feerate":feerate,"conftarget":conftarget}`)
    `generatevote`            | `"blockhash"` `height` `"tickethash"` `votebits` `"votebitsext"`
    `getaccount`              | `"address"`
    `getaccountaddress`       | `"account"`
    `getaddressesbyaccount`   | `"account"`
    `getbalance`              | (`"account"` `minconf=1`)
    `getbestblock`            |
    `getbestblockhash`        |
    `getblockcount`           |
    `getblockhash`            | `index`
    `getcontracthash`         | `["filepath",...]`
    `getinfo`                 |
    `getmasterpubkey`         | (`"account"`)
    `getmultisigoutinfo`      | `"hash"` `index`
    `getnewaddress`           | (`"account"` `"gappolicy"`)
    `getpaytocontractaddress` | `["filepath",...]`
    `getrawchangeaddress`     | (`"account"`)
    `getreceivedbyaccount`    | `"account"` (`minconf=1`)
    `getreceivedbyaddress`    | `"address"` (`minconf=1`)
    `getstakeinfo`            |
    `getticketfee`            |
    `gettickets`              | `includeimmature`
    `gettransaction`          | `"txid"` (`includewatchonly=false`)
    `getvotechoices`          |
    `getwalletfee`            |
    `importprivkey`           | `"privkey"` (`"label"` `rescan=true` `scanfrom`)
    `importscript`            | `"hex"` (`rescan=true` `scanfrom`)
    `importxpub`              | `"name"` `"xpub"`
    `listaccounts`            | (`minconf=1`)
    `listaddresstransactions` | `["address",...]` (`"account"`)
    `listalltransactions`     | (`"account"`)
    `listlockunspent`         |
    `listreceivedbyaccount`   | (`minconf=1` `includeempty=false` `includewatchonly=false`)
    `listreceivedbyaddress`   | (`minconf=1` `includeempty=false` `includewatchonly=false`)
    `listscripts`             |
    `listsinceblock`          | (`"blockhash"` `targetconfirmations=1` `includewatchonly=false`)
    `listtickets`             |
    `listtransactions`        | (`"account"` `count=10` `from=0` `includewatchonly=false`)
    `listunspent`             | (`minconf=1` `maxconf=9999999` `["address",...]`)
    `lockunspent`             | `unlock` `[{"amount":n.nnn,"txid":"value","vout":n,"tree":n},...]`
    `mixaccount`              |
    `mixoutput`               | `"outpoint"`
    `purchaseticket`          | `"fromaccount"` `spendlimit` (`minconf=1` `"ticketaddress"` `numtickets` `"pooladdress"` `poolfees` `expiry` `"comment"` `ticketfee`)
    `redeemmultisigout`       | `"hash"` `index` `tree` (`"address"`)
    `redeemmultisigouts`      | `"fromscraddress"` (`"toaddress"` `number`)
    `renameaccount`           | `"oldaccount"` `"newaccount"`
    `rescanwallet`            | (`beginheight=0`)
    `revoketickets`           |
    `sendfrom`                | `"fromaccount"` `"toaddress"` `amount` (`minconf=1` `"comment"` `"commentto"`)
    `sendmany`                | `"fromaccount"` `{"address":amount,...}` (`minconf=1` `"comment"`)
    `sendtoaddress`           | `"address"` `amount` (`"comment"` `"commentto"`)
    `sendtomultisig`          | `"fromaccount"` `amount` `["pubkey",...]` (`nrequired=1` `minconf=1` `"comment"`)
    `setticketfee`            | `fee`
    `settxfee`                | `amount`
    `setvotechoice`           | `"agendaid"` `"choiceid"`
    `signmessage`             | `"address"` `"message"`
    `signrawtransaction`      | `"rawtx"` (`[{"txid":"value", "vout":n, "tree":n, "scriptpubkey":"value", "redeemscript":"value"},...]` `["privkey",...]` `flags="ALL"`)
    `signrawtransactions`     | `["rawtx",...]` (`send=true`)
    `stakepooluserinfo`       | `"user"`
    `sweepaccount`            | `"sourceaccount"` `"destinationaddress"` (`requiredconfirmations` `feeperkb`)
    `ticketsforaddress`       | `"address"`
    `validateaddress`         | `"address"`
    `verifymessage`           | `"address"` `"signature"` `"message"`
    `verifyseed`              | `"seed"` (`account`)
    `version`                 |
    `walletinfo`              |
    `walletislocked`          |
    `walletlock`              |
    `walletpassphrase`        | `"passphrase"` `timeout`
    `walletpassphrasechange`  | `"oldpassphrase"` `"newpassphrase"`