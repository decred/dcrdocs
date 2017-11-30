# <i class="fa fa-life-ring"></i> Συγκεντρώσεις Κλειδώματος Νομισμάτων

---

#### 1. Are there any other benefits to a stake pool other than not needing to run a full node and keeping your wallet unlocked? For example, will it have a better chance of winning or anything like that? 

Stake pools will usually implement multi-wallet redundancy by having many wallets physically distributed around the globe. This means there's less chance of a vote
being missed because one wallet is down. It also reduces latency between the wallet and network which can reduce the chance of a vote being missed.

---

#### 2. Does a stakepool split the reward between all participants (% based on the amount of tickets you submitted to the pool)? 

It is technically possible to create a pool that supports proportional reward splitting[^9262], but the current stakepool reference implementation `dcrstakepool` doesn’t enable this. It simply votes on your behalf. It does this by making the ticket voting rights a 1-of-2 multi-signature P2SH script. The pool signs the vote with its private key at the time the ticket is selected. Since it is a 1-of-2 multi-signature script though, it means if the pool failed to vote for you for whatever reason (extremely unlikely as the mainnet pool will have multiple redundancy and automatic failover), it would still be possible to vote on your own behalf because you have the second private key and could therefore provide a valid signature and satisfy the 1-of-2 requirement.

Also, it is important to note that the original ticket purchase contains a commitment to go to a reward address for which only you have the private key. The proof-of-stake voting consensus rules enforce the commitment, so it is impossible for the pool to steal your funds.

In order to split rewards the pool would have to be the recipient of all rewards and then be trusted to properly split the rewards amongst all of the participants according to their proportionality. It is expected that such a scheme will be developed with the understanding it is less secure than the approach the current pool design uses.

---

#### 3. I have to run my wallet to buy tickets, but will they vote properly without me if I shut it down and the pool votes for me instead? 

Yes[^9274], that is correct. You only need to run your wallet in order to spend your coins to purchase the ticket which delegates your voting rights to the pool which will then vote on your behalf. The reward address is a consensus-enforced commitment in the ticket purchase for one of your own addresses for which only you have the private key.

---

#### 4. Are there any issues that could arise from a stake pool having too many people. For example, force voting a block in or out? 

It is certainly possible[^9311], but one of the things that all pools should support is allowing each user to select their individual voting preferences. That way, whenever their ticket comes up and the pool votes on their behalf, it will vote according to their preferences.

---

#### 5. Are the vote bits set when you purchase a ticket or when your ticket is called to vote? Does this change when in a stakepool? 

The vote bits are set when you actually vote[^13607] (which really only makes sense because you might have bought the ticket weeks or months before a specific voting agenda even exists).

A stakepool can operate however it wants since there is a lot of room for flexibility due to the way the ticket purchase commitment scheme is designed. That said, in general, people should avoid using stake pools that do not allow them control over how they want to vote on non-pool specific issues.

---

#### 6. Ποιες διασφαλίσεις υπάρχουν για να εμποδίσουν τους ιδιοκτήτες συγκέντρωσης να εξαφανιστούν με τα χρήματα που βρίσκονται στην συγκέντρωση;

The current pool design is such that the pool can NOT steal the funds[^14593]. You are only delegating voting rights (and in reality it is a 1-of-2 multisig which means either you OR the pool can vote). The ticket purchase contains a consensus-enforced commitment for the final subsidy address, so there is simply no way for the pool to steal the funds.

The worst that would happen if a pool owner disappears is the votes will be missed which results in the ticket being revoked which in turn causes the original coins to go back to the original coin owner (minus the initial transaction fee of course). However, as mentioned previously, because the ticket is a 1-of-2 multisig, each user could run their own wallet in order to vote should the pool owner disappear.

---

#### 7. Πού θα μπορούσα να δω ένα παράδειγμα εισιτηρίου συγκέντρωσης κλειδώματος νομισμάτων στον εξερευνητή μπλοκ;

Οι συγκεντρώσεις κλειδώματος νομισμάτων περιλαμβάνουν διευθύνσεις 'Dc', καθώς η συγκέντρωση κλειδώματος νομισμάτων χρησιμοποιεί διευθύνσεις[^17515] hash-πληρωμής-σεναρίου. Για παράδειγμα, ανατρέξτε στην ταυτότητα συναλλαγής: [c0abc0ec63a8de15550f067e2b6fde28f0432fb91b938574b282daa69f914103](https://mainnet.decred.org/tx/c0abc0ec63a8de15550f067e2b6fde28f0432fb91b938574b282daa69f914103).

Συνεχίστε στις [Συχνές Ερωτήσεις Εισιτηρίων Ψηφοφορίας ΑΚΝ](/faq/proof-of-stake/voting-tickets.md)

---

## <i class="fa fa-book"></i> Πηγές

[^9262]: Decred Forum, [Δημοσίευση 9.262](https://forum.decred.org/threads/626/#post-9262)
[^9274]: Decred Forum, [Δημοσίευση 9.274](https://forum.decred.org/threads/626/#post-9274)
[^9311]: Decred Forum, [Δημοσίευση 9.311](https://forum.decred.org/threads/582/page-2#post-9311)
[^13607]: Decred Forum, [Δημοσίευση 13.607](https://forum.decred.org/threads/1236/#post-13607)
[^14593]: Decred Forum, [Δημοσίευση 14.593](https://forum.decred.org/threads/1321/#post-14593)
[^17515]: Decred Forum, [Δημοσίευση 17.515](https://forum.decred.org/threads/1289/#post-17515)
