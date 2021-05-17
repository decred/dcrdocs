# ![](../../img/dcr-icons/Solo.svg){ .dcr-icon } Solo Voting

---

#### 1. Do I need hash power to participate in Proof-of-Stake (PoS)?

No - neither purchasing PoS tickets nor voting require any hash power.

---

#### 2. What happens if my wallet is unreachable or locked when my tickets are selected by miners?

If your wallet is offline or locked when your tickets are selected, you lose out
on the rewards and your ticket is removed from the pool.
You can then revoke the ticket to reclaim the funds which were locked when it
was purchased.

---

#### 3. Can I somehow test if my machine is reachable for voting?

Your voting wallet and your machine do not need to be reachable for voting.
Voting is deterministic on a per-block basis.
Your wallet will know if your ticket is selected based on the current block, and
it will automatically broadcast a vote to the network just like it broadcasts
other transactions.

The ticket selection algorithm is explored in further detail on the
[Developer documentation site](https://devdocs.decred.org/developer-guides/ticket-selection).

---

#### 4. Can I run multiple voting-only wallets with the same seed on multiple servers?

Yes.

Using the same seed for multiple wallets on different servers can cause issues
if the wallets are creating new addresses, because each of the wallets are not
aware of addresses created by the others.
Voting-only wallets do not encounter this issue as the process of voting does
not require creating new addresses.
