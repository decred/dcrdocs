# BLAKE-256 Hash Function 

---

SHA256, used in Bitcoin, has a number of technical shortcomings due to its Merkle-Damgård construction. These vulnerabilities led to the SHA3 competition for a new hash function based on a different fundamental construction. Decred has chosen BLAKE256 as its hash function, a finalist for the competition[^1] [^2]. The hash function is based around a HAIFA construction that incorporates a variation of the ChaCha stream cipher by Bernstein. The hash function is notable for its high performance on x86-64 microarchitecture, being faster for short messages than SHA256[^3] despite being considered to have a much higher security margin at 14-rounds.

---

## <i class="fa fa-book"></i> References 

[^1]: Aumasson J., Henzen L., Meier W., Phan R. 2010. [SHA-3 proposal BLAKE](https://decred.org/research/aumasson2010.pdf).
[^2]: Aumasson J., Henzen L., Meier W., Phan R. 2014. The hash function BLAKE.
[^3]: Bernstein D. and Lange T. 2013. [eBACS: ECRYPT benchmarking of cryptographic systems](http://bench.cr.yp.to).
