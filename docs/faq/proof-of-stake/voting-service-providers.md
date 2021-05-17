# ![](../../img/dcr-icons/Servers.svg){ .dcr-icon } Voting Service Providers

---

#### 1. Are there any other benefits to a Voting Service Provider (VSP) other than not needing to run a full node and keeping your wallet unlocked? For example, will it have a better chance of voting, or vote quicker?

A VSP cannot increase a tickets chance of voting, or cause it to vote faster.
Ticket selection is a random process which cannot be influenced.

VSPs will usually implement multi-wallet redundancy by having many wallets
physically distributed around the globe. This means there's less chance of a
vote being missed because one wallet is down. It also reduces latency between
the wallet and network which can reduce the chance of a vote being missed.

---

#### 2. Does a Voting Service Provider (VSP) split the reward between all participants (% based on the amount of tickets you submitted to the VSP)?

While it is technically possible to create a VSP that supports this type of
proportional reward splitting, the current VSP reference implementation doesn’t
enable this.

---

#### 3. I have to run my wallet to buy tickets, but will they vote properly without me if I shut it down and the Voting Service Provider (VSP) votes for me instead?

Yes, that is correct. You only need to run your wallet in order to spend your coins to purchase the ticket which delegates your voting rights to the VSP which will then vote on your behalf. The reward address is a consensus-enforced commitment in the ticket purchase for one of your own addresses for which only you have the private key.

---

#### 4. Are there any issues that could arise from a Voting Service Provider (VSP) having too many people. For example, force voting a block in or out?

It is certainly possible, but one of the things that all VSPs should support is allowing each user to select their individual voting preferences. That way, whenever their ticket comes up and the VSP votes on their behalf, it will vote according to their preferences.

---

#### 5. What safeguards are in place to stop Voting Service Provider (VSP) owners disappearing with the funds in the tickets they vote for?

The current VSP design is such that the VSP can NOT steal the funds. You are only delegating voting rights (and in reality it is a 1-of-2 multisig which means either you OR the VSP can vote). The ticket purchase contains a consensus-enforced commitment for the final subsidy address, so there is simply no way for the VSP to steal the funds.

The worst that would happen if a VSP owner disappears is the votes will be missed which results in the ticket being revoked which in turn causes the original coins to go back to the original coin owner (minus the initial transaction fee of course). However, as mentioned previously, because the ticket is a 1-of-2 multisig, each user could run their own wallet in order to vote should the VSP owner disappear.

---

#### 6. Where can I see an example of a Voting Service Provider (VSP) ticket on the block explorer?

VSPs involve 'Dc' addresses since the VSP uses pay-to-script-hash addresses. For example, see txid: [c0abc0ec63a8de15550f067e2b6fde28f0432fb91b938574b282daa69f914103](https://dcrdata.decred.org/tx/c0abc0ec63a8de15550f067e2b6fde28f0432fb91b938574b282daa69f914103).

---

#### 7. What happens if my Voting Service Provider (VSP) goes down?

In the unlikely scenario your VSP goes down permanently, you can still vote your
own tickets, as well as revoke any missed or expired tickets.

Voting rights are assigned to a 1-of-2 multisig address, where one of the required keys belongs to your wallet. This allows you to configure a wallet with your VSP's pool script imported and set it up for solo voting, essentially becoming your own VSP. This will allow you to vote or revoke tickets. Note that the VSP's pool script is necessary to perform these actions. For this reason, it is important to always keep a backup of your VSP's pool script, which can be found on your VSPs webpage. For details on setting up a wallet for solo voting, see the [Solo Proof-of-Stake (PoS) Voting](../../advanced/solo-proof-of-stake-voting.md) page.

---

#### 8. My VSP went down and I lost the redeem script, is there a way to recover it?

When a ticket votes or is revoked, that redeem script is revealed as a part of the process. Redeem scripts that have been used at least once to vote or revoke a ticket can be [recovered using Decred's block explorer](../../proof-of-stake/redeem-script.md#recovery-methods).
