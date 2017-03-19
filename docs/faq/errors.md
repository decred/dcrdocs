# Errors and Common Problems #

## **Paymetheus** ##

#### **1. I've just started using Paymetheus, but it seems to be stuck.** ####

The first time you start Paymetheus, it will download the blockchain. this can take up
to an hour and Paymetheus will appear to be doing nothing. This will only happen once.

#### **2. Invalid passphrase for master private key.** ####

This is just a long way of saying, "Incorrect password". You entered the wrong password for your
wallet.

#### **3. "Unable to purchase tickets: insufficient funds available..." but the wallet says I have enough.** ####

There is a known bug in Paymetheus where immature funds as counted as available. After a ticket votes, there is a 
256 block window where the funds are still locked. In this state, they are known as immature. When the period expires
they will be usable again.