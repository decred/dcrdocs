# ![](../../img/dcr-icons/Dcrtl.svg){ .dcr-icon } `dcrctl` RPC Commands

Last updated for CLI release v{{ cliversion }}.

The dcrd and dcrwallet daemons have APIs that can be used to access lower-level functionality not available in their respective [Command-line Interfaces (CLIs)](dcrd-and-dcrwallet-cli-arguments.md). These APIs are called using Remote Procedure Calls (RPCs). RPCs also allow for integrations with clients written in any language that supports RPCs.

Below are some common RPC commands for dcrd and dcrwallet. For a full list of supported RPC commands and more detailed documentation, see the [dcrd RPC API](https://github.com/decred/dcrd/blob/master/docs/json_rpc_api.mediawiki) and [dcrwallet RPC Documentation](https://github.com/decred/dcrwallet/tree/master/rpc/documentation).

---

## `dcrd` RPC Commands

??? info "Click to expand full list of `dcrd` RPC commands"
    RPC Method                |Params
    --------------------------|-------------
    `addnode`                 | `"addr"` `"add|remove|onetry"`
    `createrawssrtx`          | `[{"amount":n.nnn,"txid":"value","vout":n,"tree":n}]` (`fee`)
    `createrawsstx`           | `[{"txid":"value","vout":n,"tree":n,"amt":n},...] {"address":amount} [{"addr":"value","commitamt":n,"changeaddr":"value","changeamt":n},...]`
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
    `gettreasurybalance`      | (`"hash"` `verbose=false`)
    `gettreasuryspendvotes`   | (`"block"` `["tspend",...]`)
    `gettxout`                | `"txid"` `vout` `tree` (`includemempool=true`)
    `gettxoutsetinfo`         |
    `getvoteinfo`             | `version`
    `getwork`                 | (`"data"`)
    `help`                    | (`"command"`)
    `invalidateblock`         | `"blockhash"`
    `livetickets`             |
    `missedtickets`           |
    `node`                    | `"connect|remove|disconnect"` `"target"` (`"perm|temp"`)
    `ping`                    |
    `reconsiderblock`         | `"blockhash"`
    `regentemplate`           |
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
    `addtransaction`          | `"blockhash"` `"transaction"`
    `auditreuse`              | (`since`)
    `consolidate`             | `inputs` (`"account"` `"address"`)
    `createmultisig`          | `nrequired` `["key",...]`
    `createnewaccount`        | `"account"`
    `createrawtransaction`    | `[{"amount":n.nnn,"txid":"value","vout":n,"tree":n},...]` `{"address":amount,...}` (`locktime` `expiry`)
    `createsignature`         | `"address"` `inputindex` `hashtype` `"previouspkscript"` `"serializedtransaction"`
    `createvotingaccount`     | `"name"` `"pubkey"` (`childindex=0`)
    `disapprovepercent`       |
    `discoverusage`           | (`"startblock"` `discoveraccounts` `gaplimit`)
    `dumpprivkey`             | `"address"`
    `fundrawtransaction`      | `"hexstring"` `"fundaccount"` (`{"changeaddress":changeaddress,"feerate":feerate,"conftarget":conftarget}`)
    `generatevote`            | `"blockhash"` `height` `"tickethash"` `votebits` `"votebitsext"`
    `getaccount`              | `"address"`
    `getaccountaddress`       | `"account"`
    `getaddressesbyaccount`   | `"account"`
    `getbalance`              | (`"account"` `minconf=1`)
    `getbestblock`            |
    `getbestblockhash`        |
    `getblock`                | `"hash"` (`verbose=true` `verbosetx=false`)
    `getblockcount`           |
    `getblockhash`            | `index`
    `getblockheader`          | `"hash"` (`verbose=true`)
    `getcfilterv2`            | `"blockhash"`
    `getcoinjoinsbyacct`      |
    `getcurrentnet`           |
    `getinfo`                 |
    `getmasterpubkey`         | (`"account"`)
    `getmultisigoutinfo`      | `"hash"` `index`
    `getnewaddress`           | (`"account"` `"gappolicy"`)
    `getpeerinfo`             |
    `getrawchangeaddress`     | (`"account"`)
    `getreceivedbyaccount`    | `"account"` (`minconf=1`)
    `getreceivedbyaddress`    | `"address"` (`minconf=1`)
    `getstakeinfo`            |
    `gettickets`              | `includeimmature`
    `gettransaction`          | `"txid"` (`includewatchonly=false`)
    `gettxout`                | `"txid"` `vout` `tree` (`includemempool=true`)
    `getunconfirmedbalance`   | (`"account"`)
    `getvotechoices`          | `("tickethash")`
    `getwalletfee`            |
    `importcfiltersv2`        | `startheight` `["filter",...]`
    `importprivkey`           | `"privkey"` (`"label"` `rescan=true` `scanfrom`)
    `importscript`            | `"hex"` (`rescan=true` `scanfrom`)
    `importxpub`              | `"name"` `"xpub"`
    `listaccounts`            | (`minconf=1`)
    `listaddresstransactions` | `["address",...]` (`"account"`)
    `listalltransactions`     | (`"account"`)
    `listlockunspent`         | (`"account"`)
    `listreceivedbyaccount`   | (`minconf=1` `includeempty=false` `includewatchonly=false`)
    `listreceivedbyaddress`   | (`minconf=1` `includeempty=false` `includewatchonly=false`)
    `listsinceblock`          | (`"blockhash"` `targetconfirmations=1` `includewatchonly=false`)
    `listtransactions`        | (`"account"` `count=10` `from=0` `includewatchonly=false`)
    `listunspent`             | (`minconf=1` `maxconf=9999999` `["address",...]` `"account"`)
    `lockaccount`             | `"account"`
    `lockunspent`             | `unlock` `[{"amount":n.nnn,"txid":"value","vout":n,"tree":n},...]`
    `mixaccount`              |
    `mixoutput`               | `"outpoint"`
    `processunmanagedticket`  | (`"tickethash"`)
    `purchaseticket`          | `"fromaccount"` `spendlimit` (`minconf=1` `"ticketaddress"` `numtickets=1` `"pooladdress"` `poolfees` `expiry` `"comment"` `dontsigntx`)
    `redeemmultisigout`       | `"hash"` `index` `tree` (`"address"`)
    `redeemmultisigouts`      | `"fromscraddress"` (`"toaddress"` `number`)
    `renameaccount`           | `"oldaccount"` `"newaccount"`
    `rescanwallet`            | (`beginheight=0`)
    `revoketickets`           |
    `sendfrom`                | `"fromaccount"` `"toaddress"` `amount` (`minconf=1` `"comment"` `"commentto"`)
    `sendfromtreasury`        | `"key"` `amounts`
    `sendmany`                | `"fromaccount"` `{"address":amount,...}` (`minconf=1` `"comment"`)
    `sendrawtransaction`      | `"hextx"` (`allowhighfees=false`)
    `sendtoaddress`           | `"address"` `amount` (`"comment"` `"commentto"`)
    `sendtomultisig`          | `"fromaccount"` `amount` `["pubkey",...]` (`nrequired=1` `minconf=1` `"comment"`)
    `sendtotreasury`          | `amount`
    `setaccountpassphrase`    | `"account"` `"passphrase"`
    `setdisapprovepercent`    | `percent`
    `settreasurypolicy`       | `"key"` `"policy"` (`"ticket"`)
    `settspendpolicy`         | `"hash"` `"policy"` (`"ticket"`)
    `settxfee`                | `amount`
    `setvotechoice`           | `"agendaid"` `"choiceid"` (`"tickethash"`)
    `signmessage`             | `"address"` `"message"`
    `signrawtransaction`      | `"rawtx"` (`[{"txid":"value", "vout":n, "tree":n, "scriptpubkey":"value", "redeemscript":"value"},...]` `["privkey",...]` `flags="ALL"`)
    `signrawtransactions`     | `["rawtx",...]` (`send=true`)
    `stakepooluserinfo`       | `"user"`
    `sweepaccount`            | `"sourceaccount"` `"destinationaddress"` (`requiredconfirmations` `feeperkb`)
    `syncstatus`              |
    `ticketinfo`              | (`startheight=0`)
    `ticketsforaddress`       | `"address"`
    `treasurypolicy`          | (`"key"` `"ticket"`)
    `tspendpolicy`            | (`"hash"` `"ticket"`)
    `unlockaccount`           | `"account"` `"passphrase"`
    `validateaddress`         | `"address"`
    `validatepredcp0005cf`    |
    `verifymessage`           | `"address"` `"signature"` `"message"`
    `version`                 |
    `walletinfo`              |
    `walletislocked`          |
    `walletlock`              |
    `walletpassphrase`        | `"passphrase"` `timeout`
    `walletpassphrasechange`  | `"oldpassphrase"` `"newpassphrase"`
    `walletpubpassphrasechange` | `"oldpassphrase"` `"newpassphrase"`
