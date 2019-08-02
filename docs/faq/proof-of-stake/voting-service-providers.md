# <img class="dcr-icon" src="/img/dcr-icons/Servers.svg" /> Voting Service Providers

---

#### 1. Are there any other benefits to a Voting Service Provider (VSP) other than not needing to run a full node and keeping your wallet unlocked? For example, will it have a better chance of winning or anything like that? 

VSPs will usually implement multi-wallet redundancy by having many wallets physically distributed around the globe. This means there's less chance of a vote
being missed because one wallet is down. It also reduces latency between the wallet and network which can reduce the chance of a vote being missed.

---

#### 2. Does a Voting Service Provider (VSP) split the reward between all participants (% based on the amount of tickets you submitted to the VSP)? 

It is technically possible to create a VSP that supports proportional reward splitting[^9262], but the current VSP reference implementation `dcrstakepool` doesn’t enable this. It simply votes on your behalf. It does this by making the ticket voting rights a 1-of-2 multi-signature P2SH script. The VSP signs the vote with its private key at the time the ticket is selected. Since it is a 1-of-2 multi-signature script though, it means if the VSP failed to vote for you for whatever reason (extremely unlikely as the mainnet VSP will have multiple redundancy and automatic failover), it would still be possible to vote on your own behalf because you have the second private key and could therefore provide a valid signature and satisfy the 1-of-2 requirement.

Also, it is important to note that the original ticket purchase contains a commitment to go to a reward address for which only you have the private key. The proof-of-stake voting consensus rules enforce the commitment, so it is impossible for the VSP to steal your funds.

In order to split rewards the VSP would have to be the recipient of all rewards and then be trusted to properly split the rewards amongst all of the participants according to their proportionality. It is expected that such a scheme will be developed with the understanding it is less secure than the approach the current VSP design uses.

---

#### 3. I have to run my wallet to buy tickets, but will they vote properly without me if I shut it down and the Voting Service Provider (VSP) votes for me instead? 

Yes[^9274], that is correct. You only need to run your wallet in order to spend your coins to purchase the ticket which delegates your voting rights to the VSP which will then vote on your behalf. The reward address is a consensus-enforced commitment in the ticket purchase for one of your own addresses for which only you have the private key.

---

#### 4. Are there any issues that could arise from a Voting Service Provider (VSP) having too many people. For example, force voting a block in or out? 

It is certainly possible[^9311], but one of the things that all VSPs should support is allowing each user to select their individual voting preferences. That way, whenever their ticket comes up and the VSP votes on their behalf, it will vote according to their preferences.

---

#### 5. Are the vote bits set when you purchase a ticket or when your ticket is called to vote? Does this change when in a Voting Service Provider (VSP)? 

The vote bits are set when you actually vote[^13607] (which really only makes sense because you might have bought the ticket weeks or months before a specific voting agenda even exists).

A VSP can operate however it wants since there is a lot of room for flexibility due to the way the ticket purchase commitment scheme is designed. That said, in general, people should avoid using VSPs that do not allow them control over how they want to vote on non-VSP specific issues.

---

#### 6. What safeguards are in place to stop Voting Service Provider (VSP) owners disappearing with the funds in the tickets they vote for? 

The current VSP design is such that the VSP can NOT steal the funds[^14593]. You are only delegating voting rights (and in reality it is a 1-of-2 multisig which means either you OR the VSP can vote). The ticket purchase contains a consensus-enforced commitment for the final subsidy address, so there is simply no way for the VSP to steal the funds.

The worst that would happen if a VSP owner disappears is the votes will be missed which results in the ticket being revoked which in turn causes the original coins to go back to the original coin owner (minus the initial transaction fee of course). However, as mentioned previously, because the ticket is a 1-of-2 multisig, each user could run their own wallet in order to vote should the VSP owner disappear.

---

#### 7. Where can I see an example of a Voting Service Provider (VSP) ticket on the block explorer? 

VSPs involve 'Dc' addresses since the VSP uses pay-to-script-hash addresses[^17515]. For example, see txid: [c0abc0ec63a8de15550f067e2b6fde28f0432fb91b938574b282daa69f914103](https://dcrdata.decred.org/tx/c0abc0ec63a8de15550f067e2b6fde28f0432fb91b938574b282daa69f914103).

Continue to [PoS Voting Tickets FAQ](voting-tickets.md)

---

#### 8. What happens if my Voting Service Provider (VSP) goes down?

In the unlikely scenario your VSP goes down permanently, you can still vote your tickets, as well as revoke a missed or expired ticket. Voting rights are assigned to a 1-of-2 multisig address, where one of the required keys belongs to your wallet. This allows you to configure a wallet with your VSP's pool script imported and set it up for solo voting, essentially becoming your own VSP. This will allow you to vote or revoke tickets. Note that the VSP's pool script is necessary to perform these actions. For this reason, it is important to always keep a backup of your VSP's pool script, which can be found on your VSPs webpage. For details on setting up a wallet for solo voting, see the [Solo Proof-of-Stake (PoS) Voting](../../advanced/solo-proof-of-stake-voting.md) page.

---

## <img class="dcr-icon" src="/img/dcr-icons/Sources.svg" /> Sources 

[^9262]: Decred Forum, [Post 9,262](https://forum.decred.org/threads/626/#post-9262)
[^9274]: Decred Forum, [Post 9,274](https://forum.decred.org/threads/626/#post-9274)
[^9311]: Decred Forum, [Post 9,311](https://forum.decred.org/threads/582/page-2#post-9311)
[^13607]: Decred Forum, [Post 13,607](https://forum.decred.org/threads/1236/#post-13607)
[^14593]: Decred Forum, [Post 14,593](https://forum.decred.org/threads/1321/#post-14593)
[^17515]: Decred Forum, [Post 17,515](https://forum.decred.org/threads/1289/#post-17515)
