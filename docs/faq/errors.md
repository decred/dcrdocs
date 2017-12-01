# Errors and Common Problems 

## Paymetheus 

Decrediton has now replaced Paymetheus as the recommended wallet for Windows. You can use Decrediton with the same seed and API key that you used for Paymetheus.
The below information will be kept until we stop supporting Paymetheus.

#### 1. I've just started using Paymetheus, but it seems to be stuck. 

The first time you start Paymetheus, it will download the blockchain. This can take up
to an hour and Paymetheus will appear to be doing nothing.

#### 2. Invalid passphrase for master private key. 

This is just a long way of saying, "Incorrect password". You entered the wrong password for your
wallet.

#### 3. "Unable to purchase tickets: insufficient funds available..." but the wallet says I have enough. 

There is a known bug in Paymetheus where immature funds are counted as available. After a ticket votes, there is a 
256 block window where the funds are still locked. In this state, they are known as immature. When the period expires
they will be usable again.

-----

## Proof-of-Stake 

#### 1. Some of my missed/expired tickets are still locked after more than a day. 

*Decrediton*
1. Delete the wallet and restore from seed
2. Open Tickets view, click import script button, paste the stakepool script into the textbox, enter the private passphrase and click Save.
3. Wait until the rescan completes.

*Command Line*
1. Start the wallet process with the `--enablevoting` flag. It will not issue revocations without it.
2. Unlock the wallet with `dcrctl --wallet walletpassphrase <yourpassphrase> 0`. The wallet must be unlocked for it to be able to create the revocations and sign them.
3. Instruct dcrd to notify the wallet about missed tickets again so it will issue the revocations with `dcrctl rebroadcastmissed`.

At that point, you should see some details about the revocation transactions in the wallet log.
Once those revocation transactions are mined into a block (which should be the next block),
you will see the funds move to the immaturestakegeneration category in the `dcrctl --wallet`
getbalance output. Finally, after 256 blocks, they will move to the spendable category and thus be available to spend.
