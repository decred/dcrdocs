# <img class="dcr-icon" src="/img/dcr-icons/Code.svg" /> Miscellaneous Improvements 

---

As in Bitcoin, subsidy decays exponentially with block height. However, Decred's algorithm, though also extremely simple, better interpolates this decay over time so as not to produce market shock with steep subsidy drops similar to CryptoNote[^1]. Like PeerCoin[^2], the PoW difficulty is calculated from the exponentially weighted average of differences in previous block times. However, this calculation is also interpolated into Bitcoin-like difficulty window periods. The "timewarp" bug in Bitcoin is corrected[^3], by ensuring that every difference in block time in incorporated into the difficulty calculation.

It should also be noted that many well known mining attacks, such as selfish mining[^4] and stubborn mining[^5], will no longer function advantageously in a system where there is effective decentralization of stake mining and no PoW-PoS miner collusion. This is simply because it is impossible to generate secret extensions to blockchains without the assistance of stake miners. Resilience to previously described mining attacks, and newly conceived mining attacks specific to our system, will be a fruitful area for future research.

---

## :fa-book: References

[^1]: Buterin V. 2014. [A next-generation smart contract and decentralized application platform](https://decred.org/research/buterin2014.pdf).
[^2]: King S. and Nadal S. 2012. [PPCoin: Peer-to-peer crypto-currency with proof-of-stake](https://decred.org/research/king2012.pdf).
[^3]: ArtForz. 2011. [Re: Possible way to make a very profitable 50 plus-ish attack for pools?](https://decred.org/research/artforz2011.pdf)
[^4]: Eyal I. 2015. [The miner's dilemma](https://decred.org/research/eyal2015.pdf).
[^5]: Nayak K., Kumar S., Miller A., Shi E. 2015. [Stubborn mining: Generalizing selfish mining and combining with an eclipse attack](https://decred.org/research/nayak2015.pdf).
