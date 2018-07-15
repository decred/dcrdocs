# <img class="dcr-icon" src="/img/dcr-icons/Dcrtl.svg" /> `dcrctl` RPC Commands

Last updated for v1.2.0.

## `dcrd` RPC Commands

??? info "Click to expand full list of `dcrd` RPC commands"
    RPC Method                |Params
    --------------------------|-------------
    `addnode`                 | `"addr"` `"add|remove|onetry"`
    `createrawtransaction`    | `[{"txid":"value", "vout":n, "tree":n},...]` `{"address":amount,...}` (`locktime`)
    `debuglevel`              | `"levelspec"`
    `decoderawtransaction`    | `"hextx"`
    `decodescript`            | `"hexscript"`
    `estimatefee`             | `numblocks`
    `estimatestakediff`       | (`tickets`)
    `existsaddress`           | `"address"`
    `existsaddresses`         | `["address",...]`
    `existsexpiredtickets`    | `"txhashblob"`
    `existsliveticket`        | `"txhash"`
    `existslivetickets`       | `"txhashblob"`
    `existsmempooltxs`        | `"txhashblob"`
    `existsmissedtickets`     | `"txhashblob"`
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
    `getblocktemplate`        | (`{"mode":"value", "capabilities":["capability",...], "longpollid":"value", "sigoplimit":sigoplimit, "sizelimit":sizelimit, "maxversion":n, "target":"value", "data":"value", "workid":"value"}`)
    `getcfilter`              | `"hash"` `"filtertype"`
    `getcfilterheader`        | `"hash"` `"filtertype"`
    `getchaintips`            | 
    `getcoinsupply`           | 
    `getconnectioncount`      | 
    `getcurrentnet`           | 
    `getdifficulty`           | 
    `getgenerate`             | 
    `gethashespersec`         | 
    `getheaders`              | `"blocklocators"` `"hashstop"`
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
    `accountaddressindex`     | `"account"` `branch`
    `accountsyncaddressindex` | `"account"` `branch` `index`
    `addmultisigaddress`      | `nrequired` `["key",...]` (`"account"`)
    `addticket`               | `"tickethex"`
    `consolidate`             | `inputs` (`"account"` `"address"`)
    `createmultisig`          | `nrequired` `["key",...]`
    `createnewaccount`        | `"account"`
    `createrawssgentx`        | `[{"txid":"value", "vout":n, "tree":n},...]` `votebits`
    `createrawssrtx`          | `[{"txid":"value", "vout":n, "tree":n},...]` (`fee`)
    `createrawsstx`           | `[{"txid":"value", "vout":n, "tree":n, "amt":n},...]` `amount` `[{"addr":"value", "commitamt":n, "changeaddr":"value", "changeamt":n},...]`
    `dumpprivkey`             | `"address"`
    `estimatepriority`        | `numblocks`
    `generatevote`            | `"blockhash"` `height` `"tickethash"` `votebits` `"votebitsext"`
    `getaccount`              | `"address"`
    `getaccountaddress`       | `"account"`
    `getaddressesbyaccount`   | `"account"`
    `getbalance`              | (`"account"` `minconf=1`)
    `getmasterpubkey`         | (`"account"`)
    `getmultisigoutinfo`      | `"hash"` `index`
    `getnewaddress`           | (`"account"` `"gappolicy"`)
    `getrawchangeaddress`     | (`"account"`)
    `getreceivedbyaccount`    | `"account"` (`minconf=1`)
    `getreceivedbyaddress`    | `"address"` (`minconf=1`)
    `getstakeinfo`            | 
    `getticketfee`            | 
    `gettickets`              | `includeimmature`
    `gettransaction`          | `"txid"` (`includewatchonly=false`)
    `getvotechoices`          | 
    `getwalletfee`            | 
    `importaddress`           | `"address"` (`rescan=true`)
    `importprivkey`           | `"privkey"` (`"label"` `rescan=true` `scanfrom`)
    `importpubkey`            | `"pubkey"` (`rescan=true`)
    `importscript`            | `"hex"` (`rescan=true` `scanfrom`)
    `keypoolrefill`           | (`newsize=100`)
    `listaccounts`            | (`minconf=1`)
    `listlockunspent`         | 
    `listreceivedbyaccount`   | (`minconf=1` `includeempty=false` `includewatchonly=false`)
    `listreceivedbyaddress`   | (`minconf=1` `includeempty=false` `includewatchonly=false`)
    `listscripts`             | 
    `listsinceblock`          | (`"blockhash"` `targetconfirmations=1` `includewatchonly=false`)
    `listtransactions`        | (`"account"` `count=10` `from=0` `includewatchonly=false`)
    `listunspent`             | (`minconf=1` `maxconf=9999999` `["address",...]`)
    `lockunspent`             | `unlock` `[{"txid":"value", "vout":n, "tree":n},...]`
    `purchaseticket`          | `"fromaccount"` `spendlimit` (`minconf=1` `"ticketaddress"` `numtickets` `"pooladdress"` `poolfees` `expiry` `"comment"` `nosplittransaction` `ticketfee`)
    `redeemmultisigout`       | `"hash"` `index` `tree` (`"address"`)
    `redeemmultisigouts`      | `"fromscraddress"` (`"toaddress"` `number`)
    `renameaccount`           | `"oldaccount"` `"newaccount"`
    `rescanwallet`            | (`beginheight=0`)
    `revoketickets`           | 
    `sendfrom`                | `"fromaccount"` `"toaddress"` `amount` (`minconf=1` `"comment"` `"commentto"`)
    `sendmany`                | `"fromaccount"` `{"address":amount,...}` (`minconf=1` `"comment"`)
    `sendtoaddress`           | `"address"` `amount` (`"comment"` `"commentto"`)
    `sendtomultisig`          | `"fromaccount"` `amount` `["pubkey",...]` (`nrequired=1` `minconf=1` `"comment"`)
    `sendtossgen`             | `"fromaccount"` `"tickethash"` `"blockhash"` `height` `votebits` (`"comment"`)
    `sendtossrtx`             | `"fromaccount"` `"tickethash"` (`"comment"`)
    `sendtosstx`              | `"fromaccount"` `amounts` `[{"txid":"value", "vout":n, "tree":n, "amt":n},...]` `[{"addr":"value", "commitamt":n, "changeaddr":"value", "changeamt":n},...]` (`minconf=1` `"comment"`)
    `setbalancetomaintain`    | `balance`
    `setticketfee`            | `fee`
    `setticketmaxprice`       | `max`
    `settxfee`                | `amount`
    `setvotechoice`           | `"agendaid"` `"choiceid"`
    `signmessage`             | `"address"` `"message"`
    `signrawtransaction`      | `"rawtx"` (`[{"txid":"value", "vout":n, "tree":n, "scriptpubkey":"value", "redeemscript":"value"},...]` `["privkey",...]` `flags="ALL"`)
    `signrawtransactions`     | `["rawtx",...]` (`send=true`)
    `stakepooluserinfo`       | `"user"`
    `startautobuyer`          | `"account"` `"passphrase"` (`balancetomaintain` `maxfeeperkb` `maxpricerelative` `maxpriceabsolute` `"votingaddress"` `"pooladdress"` `poolfees` `maxperblock`)
    `stopautobuyer`           | 
    `sweepaccount`            | `"sourceaccount"` `"destinationaddress"` (`requiredconfirmations` `feeperkb`)
    `verifyseed`              | `"seed"` (`account`)
    `walletinfo`              | 
    `walletlock`              | 
    `walletpassphrase`        | `"passphrase"` `timeout`
    `walletpassphrasechange`  | `"oldpassphrase"` `"newpassphrase"`