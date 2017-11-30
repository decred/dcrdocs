# <i class="fa fa-firefox"></i> Web Client 

---

#### 1. How secure is the web client? 

The web client is a fork of [Copay](https://copay.io), so it is as secure as that[^7981]. The seed (and hence private keys) are kept and computed locally in your browser's local storage and everything is run client-side. The server never has access to any of the private data needed to spend coins.

---

#### 2. Can you solo stake mine with the web client? 

No, recall that the browser wallet runs locally on your machine. That would not lend itself well to running 24/7. As a result, the browser wallet will never be able to solo stake[^9093]. It would however be possible to support stake pooling with it. Stake pools provide you with the ability to not have a wallet running 24/7 since it will be the pool's responsibility to be online and cast a vote on your behalf at that point.

---

#### 3. Is it safe to delete the wallet and start over? 

It is safe[^10652]. The only difference is you will need to go to `Import Wallet` this time instead of creating a new one.

---

## <i class="fa fa-book"></i> Sources 

[^7981]: Decred Forum, [Post 7,981](https://forum.decred.org/threads/518/#post-7981)
[^9093]: Decred Forum, [Post 9,093](https://forum.decred.org/threads/617/#post-9093)
[^10652]: Decred Forum, [Post 10,652](https://forum.decred.org/threads/643/page-2#post-10652)
