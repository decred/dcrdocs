# How to use CoinShuffle++

---

To use CSPP, several new options must be set in `dcrwallet`.

Regardless of the intended setup, users must create two new accounts, `mixed` and `unmixed`, and point their wallets to Decred's CSPP servers:

Mainnet

- Download the CSPP server [TLS certificate](https://cspp.decred.org/cspp.decred.org.pem)
- Reference the certificate file using `--csppserver.ca=cspp.decred.org.pem`
- Point `dcrwallet`to the CSPP mainnet server by setting  `--csppserver=cspp.decred.org:5760`

Testnet

- Testnet does **not** use the TLS certificate
- Point `dcrwallet` to the CSPP testnet server by setting `--csppserver=cspp.decred.org:15760`

---

## Setting up a mixed Ticket Buyer

Mixed ticket buying uses CoinShuffle++ to anonymize outputs of split transactions, which are spent to create ticket purchases.  Voting rights and commitment outputs must be assigned to unused and unique addresses of accounts and not single addresses to prevent address reusage.

Solo stakers are recommended to use two wallets to separate ticket buying and voting, due to requirements of the voting wallet being always unlocked and highly available.  An extended public key must be exported from the voting wallet (using `getmasterpubkey`) and imported by the ticket buying wallet (using `importxpub`).

Use the following options for a mainnet mixed solo ticket buyer which continues to buy more tickets from the mixed account as outputs mature:

```no-highlight
$ dcrwallet --csppserver=cspp.decred.org:5760 \
  --csppserver.ca=cspp.decred.org.pem \
  --enableticketbuyer --purchaseaccount=mixed --mixedaccount=mixed/1 \
  --changeaccount=unmixed --ticketbuyer.votingaccount=voting --mixchange
```

---

## Transitioning from an unmixed Ticket Buyer

Solo stakers wishing to convert from an unmixed solo ticket buying setup to a mixed buyer can use two ticket buying wallets simultaneously, with a setup to slowly mix funds from the existing buyer (buyer1) to the new mixed buyer (buyer2). Each ticket buyer must be provisioned with a unique voting xpub:

```no-highlight
voter$ dcrctl --wallet createnewaccount voting1
voter$ dcrctl --wallet createnewaccount voting2
voter$ dcrctl --wallet getmasterpubkey voting1
voting1-xpub
voter$ dcrctl --wallet getmasterpubkey voting2
voting2-xpub
buyer1$ dcrctl --wallet importxpub voting voting1-xpub
buyer2$ dcrctl --wallet importxpub voting voting2-xpub
```

In addition, the mixed account xpub of the mixed ticket buyer must be imported by buyer1:

```no-highlight
buyer2$ dcrctl --wallet getmasterpubkey mixed
mixed-xpub
buyer1$ dcrctl --wallet importxpub mixed mixed-xpub
```

The mixed ticket buying wallet may use the setup from the previous section. The old wallet must be configured slightly differently:

```no-highlight
buyer1$ dcrwallet --csppserver=cspp.decred.org:5760 \
  --csppserver.ca=cspp.decred.org.pem \
  --enableticketbuyer --purchaseaccount=default --mixedaccount=mixed/0 \
  --ticketsplitaccount=default --changeaccount=unmixed \
  --ticketbuyer.votingaccount=voting --mixchange
```

Note these differences:

+ `--mixedaccount=mixed/0` - The unmixed wallet must use the external (not internal) branch of the mixed account to avoid address reuseage problems arising from two wallets simultaneously deriving from the same branch.
+ `--ticketsplitaccount=default` - Unless this is set, the mixed account and branch will be used derive a fresh address for the mix. However, this would create issues when publishing a ticket, because the unmixed wallet does not have the required private key (mixed account is an imported xpub). This option must be set to a derived account with private keys, such as the purchasing source account.

It may take large stakeholders up to the full ticket expiration of roughly 4.7 months to completely migrate to the new mixed wallet. Non-stakeholders can set these options, leaving out `purchaseaccount`, and participate in the mixing without buying tickets. To receive payments, generate new addresses from the unmixed account, then those payments will be mixed into the mixed account.

Note that the mixing process requires the wallet being **unlocked** for longer periods of time, so that it can participate in a mix, which occurs every 20 minutes. Ticketbuyer wallets run unlocked already, but non-staking wallets will need to be left unlocked long enough to complete their mixes.

---

## Non-staking and change mixing

Change outputs in the CoinJoin are not anonymous, and can easily be traced back to the set of inputs used during the mix. A dedicated unmixed account for CoinShuffle++ change is required, and it is not safe to spend change with other outputs in any transaction, including other mixes. To remedy this, dcrwallet provides a change mixing feature to create smaller mixed outputs of standard values and never submitting more than a single change output to the mixer in a request.

These features are enabled with the following config:

```no-highlight
$ dcrwallet --csppserver=cspp.decred.org:5760 \
  --csppserver.ca=cspp.decred.org.pem \
  --mixedaccount=mixed/1 --changeaccount=unmixed --mixchange
```

Alternatively, the `mixaccount` JSON-RPC may be used instead of the `--mixchange` option to mix single outputs from the account without leaving the wallet persistently unlocked.

Non-stakers are able to use this mechanism to mix received funds by using the unmixed account to provide receiving addresses and mix them as if it was CoinShuffle++ change. The wallet will participate in CoinShuffle++ sessions by submitting only one UXTO per epoch until all unmixed funds have been mixed. Depending on the current epoch, users may have to wait for a while before seeing any mixing activity.

---

## Tor Hidden Service

The CSPP server is accessible as a Tor hidden service, which provides two-way anonymity. The server doesn't know the IP of the client and the client also doesn't know the IP of the server. The latest onion address can be found at [CSPP server site](https://cspp.decred.org/) and can be configured by using the `--csppserver` flag.

In case `dcrwallet` connects to `dcrd` directly, the `--nodcrdproxy=1` option may be specified in addition to the above.

---

## Further Information

For more technical information about CoinShuffle++, visit Decred’s [cspp](https://github.com/decred/cspp) Github repository. You can also read about CoinShuffle++ on [Decred’s blog](https://blog.decred.org/2019/08/28/Iterating-Privacy/).
