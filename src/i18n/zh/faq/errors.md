# Errors and Common Problems 

## Paymetheus 

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

#### 4. Paymetheus is displaying the wrong balance. 

> These instructions are valid as of version 0.8.x and may not work with later versions.

If Paymetheus displays the wrong balance, you can fix it by using the command line utility to overwrite some files.
Some of this can be confusing if you are not familiar with the command line, but just follow the instructions line by line
and you'll be fine. Where you see commands that `look like this`, just copy them and paste them exactly as they are into the command line.
Don't forget to press <ENTER> after each command. If you get stuck, join our [Slack channel](https://decred.slack.com) and someone will help,
but first, check the command and make sure you entered it correctly. You will need your wallet seed. This process should take about 15 minutes.

1. We're going to open three PowerShell windows. Press the Window key. Type 'powershell' (don't type the quotes here or in the future) and press ENTER.
2. Do this two more times.
3. Move the windows so you can see all of them.
4. Copy and paste the following command: `cd $env:programfiles/decred/paymetheus` (Note, in powershell, press CTRL+V or right click to paste). Press ENTER.
5. Run the same command in the other two windows.
6. Open Windows Explorer.
7. Paste `%localappdata%/decred/paymetheus` into the location bar. Press ENTER.
8. Delete the 'mainnet' folder.
9. Go to one of the PowerShell windows and paste `./dcrd -u <username> -P <password>`. Press ENTER.
10. Go to one of the other Powershell windows and paste `./dcrwallet --appdata=$env:localappdata/decred/paymetheus --create`
11. Follow the prompts and import your seed. Say no when asked for an additional layer of encryption and yes when asked if you have a seed.
12. At the prompt, enter your seed words and press ENTER twice.
13. Paste the following command into the same window: `./dcrwallet -u <username> -P <password> --appdata=$env:localappdata/decred/paymetheus`. Press ENTER.
14. Enter the private passphrase you used when creating the wallet.
15. Go to the third PowerShell window and paste `./dcrctl -u <username> -P <password> --wallet -c $env:localappdata/decred/paymetheus/rpc.cert getbalance`. Press ENTER.
16. Press CTRL+C in the first two windows to close the programs (dcrd and dcrwallet).
17. You can close all three PowerShell windows.
18. Go back to the Explorer window. Delete the two files, rpc.cert and rpc.key.
19. Start the Decred program to begin using Paymetheus again.

-----

## Proof-of-Stake 

#### 1. Some of my missed/expired tickets are still locked after more than a day. 

1. Start the wallet process with the `--enablevoting` flag. It will not issue revocations without it.
2. Unlock the wallet with `dcrctl --wallet walletpassphrase <yourpassphrase> 0`. The wallet must be unlocked for it to be able to create the revocations and sign them.
3. Instruct dcrd to notify the wallet about missed tickets again so it will issue the revocations with `dcrctl rebroadcastmissed`.


At that point, you should see some details about the revocation transactions in the wallet log.
Once those revocation transactions are mined into a block (which should be the next block),
you will see the funds move to the immaturestakegeneration category in the `dcrctl --wallet`
getbalance output. Finally, after 256 blocks, they will move to the spendable category and thus be available to spend.
