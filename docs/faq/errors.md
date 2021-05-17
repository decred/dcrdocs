# ![](../img/dcr-icons/Question.svg){ .dcr-icon } Common Errors and Solutions

## Proof-of-Stake (PoS)

#### 1. Some of my missed/expired tickets are still locked after more than a day. 

##### Decrediton

1. Delete the wallet and restore from seed

1. Open Tickets view, click import script button, paste the VSP script into the textbox, enter the private passphrase and click Save.

1. Wait until the rescan completes.

##### Command Line

1. Start the wallet process with the `--enablevoting` flag. It will not issue revocations without it.

1. Unlock the wallet with `promptsecret | dcrctl --wallet walletpassphrase - 0`. The wallet must be unlocked for it to be able to create the revocations and sign them.

1. Instruct dcrd to notify the wallet about missed tickets again so it will issue the revocations with `dcrctl rebroadcastmissed`.

At that point, you should see some details about the revocation transactions in the wallet log.
Once those revocation transactions are mined into a block (which should be the next block),
you will see the funds move to the immaturestakegeneration category in the `dcrctl --wallet`
getbalance output. Finally, after 256 blocks, they will move to the spendable category and thus be available to spend.
