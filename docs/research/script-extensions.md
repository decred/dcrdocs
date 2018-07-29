# <img class="dcr-icon" src="/img/dcr-icons/Code.svg" /> Script Extensions 

---

Aside from the previously mentioned OP_CHECKSIGALT and OP_CHECKSIGALTVERIFY, other modifications to Bitcoin scripting have been made. A version byte has been added to output scripts to enable simple soft forking to new scripting languages, as first suggested by Wuille[^1]. All math and logic related OP codes have been re-enabled and now operate on int32 registers. Various byte string manipulation OP codes have also been implemented and re-enabled. The remaining unused Bitcoin OP codes have been repurposed for future soft forks. Some longstanding bugs in the Bitcoin scripting language have been also been fixed[^2] [^3].

---

## :fa-book: References

[^1]: Wuille P. 2015. [Segregated witness for Bitcoin](https://prezi.com/lyghixkrguao/segregated-witness-and-deploying-it-for-bitcoin/).
[^2]: Todd P. [The difficulty of writing consensus critical code: The SIGHASH_SINGLE bug](https://decred.org/research/todd2014.pdf).
[^3]: Franco P. Understanding Bitcoin, 6.3: Multisignature (M-of-N) Transactions.
