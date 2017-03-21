# **<i class="fa fa-male"></i> Solo Mining**

---

## **<i class="fa fa-ticket"></i> Buying tickets**
It is quite simple to buy tickets to participate in PoS mining. First, you will need DCR <LINK>David and Scott guide</LINK>. Second you will need to have the Decred daemon running and your wallet created (but not loaded).

> Linux Note

The following guide is for Windows, but the same commands work in Linux (do not forget to prefix them with `./` (that is a dot and forward slash). See the <LINK>Linux Setup Guide to get your wallet set up. Where you see "open a command window" open a new terminal or screen. You will need two (in addition to the daemon terminal) to complete this guide.

> Step One

Open a command prompt in your Decred folder (type `cmd` in the location bar in Explorer when in the folder). Enter the following command (ignore square brackets):

```no-highlight
dcrwallet -u [wallet username] -P [wallet password] --dcrdusername [daemon username] --dcrdpassword [daemon password] --enablestakemining --ticketmaxprice=10 --balancetomaintain=200
```

Okay, there is a lot here so let us unpack it:

Option                                | Explanation
---                                   | ---
`-u [wallet username]`                | This is the username you gave when you created your wallet.
`-P [wallet password]`                | This is the password you gave when you created your wallet. Note the capital P.
`--dcrdusername [daemon username]`    | This is the username you used to start the daemon.
`--dcrdpassword [daemon password]`    | This is the password you used to start the daemon.
`--enablestakemining`                 | This tells the wallet that you want to participate in proof-of-stake mining. It will enable automatic ticket buying.
`--ticketmaxprice=10`                 | This sets the maximum price you will pay per ticket (it can be a decimal). If the ticket price is above this the wallet will not buy tickets. See <LINK>PoS Commands for information on viewing ticket price.
`--balancetomaintain=200`             | The minimum number of DCR to keep in your wallet. You will not buy tickets if your balance is less than this.

Note that you can also put these arguments in a configuration file so you do not need to type them when starting your wallet. See <LINK>this guide.

> Step Two

Once you hit `Enter` you will see a lot of text start coming up as the wallet connects to the daemon. It will rescan addresses which can take a few minutes if you are using a slow CPU. Eventually you will see this:

```no-highlight
23:34:18 2016-03-01 [INF] WLLT: PLEASE ENSURE YOUR WALLET IS UNLOCKED SO IT MAY VOTE ON BLOCKS AND RECEIVE STAKE REWARDS
```

By default, your wallet is locked. It can receive DCR but cannot send them. You need to unlock the wallet so it can purchase tickets. Open a new command window in your Decred folder. Type in this command (ignore square brackets):

```no-highlight
dcrctl -u [daemon username] -P [daemon password] --wallet walletpassphrase [wallet password] 0
```

What we are doing here is authenticating with the daemon and using the `--wallet` command to send the wallet password to unlock the wallet. The `0` means unlock with no time limit. Do note, however, that this only unlocks the wallet for the current session. If you close the window the wallet is running in, you will need to unlock it again the next time you start it. That is it! Your wallet will now automatically buy tickets.

> Step Three

It may take some time but eventually you will see:

```no-highlight
00:23:21 2016-03-02 [INF] WLLT: Successfully sent SStx purchase transaction 71c1ffe55bd36aea49b46050692438912494a60436c96b63e1625ba9665a5583
```

This means a ticket was purchased. A couple of important notes:

* The ticket price is not spent, although it is removed from your balance as it is not spendable. It is just a deposit. You will get it back when your ticket votes or expires.
* 20 tickets are accepted into the voting pool each block. Tickets that are waiting stay in the mempool. Tickets are moved from the mempool to the voting pool in order of txfee.
* The txfee is a user-settable fee (0.05 DCR by default) that is not refunded. Higher fees may entice proof-of-work miners to include your ticket in the ticket pool, but at this point it is not recommended setting it above the average since your ticket will be included fairly quickly anyway.
* Tickets take 256 blocks (about a day) to mature. During this time the stake price you paid will not be visible in your total balance.
* See the <LINK>FAQ for more info.

Finally, what you are looking for is:

```no-highlight
00:21:05 2016-03-02 [INF] WLLT: Voted on block 000000000000278b4465fde3b14668eb0b67aa11bfa8ccc95196f86d87215bee (height 6575) using ticket ed6085bfa76d3875bbf2c3f877797338639344d83c1de7c17fa32eefc9017111 (vote hash: 6cd642e7e88917c78dcaa01b77db572a4564116955b41fb183c9eefb340fd536)
```

This means your ticket has successfully voted! Your stake and reward will be returned to you, minus the purchase fee. That is all you need to get started with proof-of-stake mining, but there is a lot more to it that you might want to know. See the <LINK>PoS FAQ and <LINK> Network Parameters#PoS for more information.

---

## **Advanced mining**

<Placeholder> Rest of text on https://wiki.decred.org/Solo_Stake_Mining below the simple node section
PoS Commands

<LINK> to Network Parameters#PoS

---

## **Proof-of-stake pools**

In order to successfully participate in PoS, you need to ensure that your wallet is online 24/7. This is because your ticket may be called on to vote at any time and if your wallet is unable to respond you will lose the vote reward, however, you will still be charged the stake fee (the stake itself is returned to you though). PoS pools allow you to submit tickets to a central pool that will vote on your behalf so you do not always need to be online. There are two different types of pools:

* Those that simply act as a pass through. They vote on your behalf and you receive all the income from a successful vote. There is no interaction with other members of the pool at all and the pool does not have access to your reward or stake. It is the same as solo mining except that you do not need to keep your wallet online 24/7. The stake pool will do that for you. This is also the most secure method of PoS pool mining.
* Those that pool all of the tickets from pool members together then every time a ticket is selected members get a share of the reward proportional to the number of tickets they have in the pool. This method can be less secure because you are trusting the pool with your stake and reward.

---

## **Which one pays better?**
Over time both types of pools should pay out about the same. Pass through pools will provide a larger reward less frequently while share pools will pay smaller rewards more often. Pools will charge a small fee per ticket to help cover server and administration expense.

---

## **Available pools**
At this time there is only one PoS pool available at https://stakepool.decred.org which is pass through.