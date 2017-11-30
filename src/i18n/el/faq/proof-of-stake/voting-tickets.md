# Εισιτήρια Ψηφοφορίας

---

#### 1. Πότε ξεκίνησε η ψηφοφορία proof-of-stake;

Η ψηφοφορία για το proof-of-stake ξεκίνησε[^7969] στο block 4.096.

---

#### 2. Στον πηγαίο κώδικα, το TicketPoolSize έχει οριστεί σε 8.192, αλλά το τρέχον μέγεθος του pool εισιτηρίου είναι μεγαλύτερο από αυτό. Γιατί?

Είναι σκόπιμα και αποτελεί αναπόσπαστο μέρος της δυναμικής προσαρμογής των τιμών των εισιτηρίων[^8965]. Το `TicketPoolSize` είναι ο στόχος του μέγεθος του pool εισιτηρίων και λειτουργεί παρόμοια με τη δυσκολία στόχευσης για το proof-of-work (PoW). Το γεγονός ότι το τρέχον μέγεθος του pool εισιτηρίου είναι μεγαλύτερο από το στόχο είναι αυτό που προκαλεί την άνοδο της τιμής του εισιτηρίου που με τη σειρά του θα προκαλέσει λιγότερη αγορά εισιτηρίων και θα έχει ως αποτέλεσμα την μείωση του αριθμό των εισιτηρίων στο pool προς το στόχο. Αν πέσει κάτω, η τιμή θα μειωθεί για να ενθαρρυνθούν περισσότερες πωλήσεις εισιτηρίων προκειμένου να αυξηθεί ο αριθμός των εισιτηρίων στο pool προς τον στόχο.

---

#### 3. Εάν είμαι άτυχος και το εισιτήριό μου λήξει χωρίς να ψηφίσει, χάνω τα τέλη συναλλαγής;

Ναι[^9806].

---

#### 4. Η ψηφοφορία στο mainnet ήταν σε 'hold' μέχρι και το block 4.096, με το κοινό να αγοράζει εισιτήρια. Αυτό σημαίνει ότι θα υπάρξει σημαντικά υψηλότερος κίνδυνος να λήξουν αυτά τα εισιτήρια;

No[^9806], the expiration time does not start until a ticket is actually mined into a block. The tickets were just sitting in the memory pool until they could be included in blocks starting with block 4,096.

---

#### 5. Τι συμβαίνει εάν κανένας (ή λιγότεροι από 3) από τους επιλεγμένους ψηφοφόρους δεν εκδώσει τις συναλλαγές ssgen;

Votes are always determined by the current tip. Miners do not start mining for a new block until at least 3+ of the selected voters issue their ssgen transactions. So, if a found block does not manage to get the selected votes[^10219], the block is simply orphaned by the next block another miner finds.

For a more concrete example, assume the current chain tip is at block 5,000. The voters determined by block 5,000 have already submitted their votes, so miners are chugging away looking for block 5,001. Now, a miner finds a solution for block 5,001 and submits it to the network. All of the daemons (and hence wallets) will see that 5,001 just showed up. However, the miners do not immediately start mining off of 5,001. Instead they continue mining off of 5,000 until 3+ votes for block 5,001 show up. At that point they all switch and start mining off of 5,001. If those 3+ votes never show up, another candidate block 5,001 will be found by the other miners still working on block 5,000 who will submit their (different) solution for block 5,001 to the network. Since each of these new candidate blocks for 5,001 have a different hash, different tickets are selected.

---

#### 6. Τι θα συμβεί εάν κάποιο από τα εισιτήρια μου δεν ψηφίσει;

Your wallet will automatically revoke the ticket in the block after it is missed[^13912], so you get them back just after they were missed as immature funds (that means they will not be spendable for 256 blocks when they mature).

Για παράδειγμα:

```no-highlight
dcrctl --wallet getstakeinfo
```

Εκροή          | Περιγραφή
---             |---
`allmempooltix` | Όλα τα stake εισιτήρια στο memory pool (που περιμένουν να γίνουν mine σε κάποιο block).
`ownmempooltix` | Τα stake σας, στο memory pool (που περιμένουν να γίνουν mine σε κάποιο block).

---

#### 7. Ποια είναι η διαφορά ανάμεσα σε ένα εισιτήριο που δεν ψήφισε και ενα ανακληθέν εισιτήριο;

Missed tickets are tickets that were called to vote, but did not. After a ticket has been missed, it can be revoked[^14763]. The wallet automatically revokes missed tickets it controls (assuming it is unlocked so it can sign the revocation transaction).

All `rebroadcastmissed` does is tell the wallet to ask the network daemon (`dcrd`) to give it the list of missed tickets again to double check if any need to be revoked. Typically this is not needed unless, for example, an attempt to revoke a ticket was made but failed because the wallet was locked. In other words, if you notice that revoked does not equal missed, you might need to `rebroadcastmissed`. As said though, there is rarely a need for this since the wallet automatically does it on startup and looks for missed tickets on every block.

Συνεχίστε με το [Proof-of-Work Mining](/mining/proof-of-work.md)

---

## <i class="fa fa-book"></i> Πηγές 

[^7969]: Decred Forum, [Δημοσίευση 7.969](https://forum.decred.org/threads/531/#post-7969)
[^8965]: Decred Forum, [Δημοσίευση 8.965](https://forum.decred.org/threads/531/page-2#post-8965)
[^9806]: Decred Forum, [Δημοσίευση 9.806](https://forum.decred.org/threads/180/page-6#post-9806)
[^10219]: Decred Forum, [Δημοσίευση 10.219](https://forum.decred.org/threads/180/page-6#post-10219)
[^13912]: Decred Forum, [Δημοσίευση 13.912](https://forum.decred.org/threads/1271/#post-13912)
[^14763]: Decred Forum, [Δημοσίευση 14.763](https://forum.decred.org/threads/1335/#post-14763)
