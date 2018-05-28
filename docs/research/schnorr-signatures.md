# <img class="dcr-icon" src="/img/dcr-icons/Code.svg" /> Schnorr Signatures 

---

Schnorr signatures have been proposed for Bitcoin. They have also been used extensively in other cryptocurrencies, such as Nxt and CryptoNote coins. In the simplest case, a Schnorr signature ECDSA cryptosystem can be described as follows:

1. \(y = xG\) where \(y\) is the public key point on the curve, \(x\) is the private scalar, \(G\) is the curve generator.
2. \(r = kG\) where \(r\) is the point on the curve resulting from the multiplication of \(k\), the nonce scalar, by the generator.
3. \(h = H(M || r)\) where \(H\) is a secure hash function, \(M\) is the message (usually a 32 byte hash), and \(r\) is the encoded point previously described. \(||\) denotes concatenation.
4. \(s = k - hx\) where \(s\) is the scalar denoted from \(k - hx\).
5. The signature is \((r,s)\), and verification is simply \(H(M || r) == hQ + sG\).

In the above, multiplications by a capital letter (e.g., \(kG\)) are point multiplications by a scalar, and so always result in a point on the curve. Addition of these points results in another point. Additions and multiplications of scalars amongst themselves is the same as regular multiplication you would do with any integer. It's important to note that multiplying a point by a scalar is considered an irreversible step, because the calculation of the scalar from the new point defaults to the discrete logarithm problem.

From the above it is clear that \(r\) is a point on the curve, while \(s\) is a scalar. Consider the group of signers represented by \(x_{sum} = x_1 + ... + x_n\) with nonces \(k_{sum} = k_1 + ... + k_n\). The public key for the private scalar sum would be: \(y = x_{sum} G\). The signature for these sums (from all group participants) would be: \(r' = k_{sum} G s' = k_{sum} - h x_{sum}\). To generate this signature all participants would have to share their private key and nonces beforehand. We want to obviously avoid this, so instead let us have each participant create a partial signature. \(r_n = k_1 G + ... + k_n G = r'\) (the sum of the public nonce points, which the participants may freely individually publish) \(s_n = k_n - h x_n\). Substituting this into the general formulas for signatures and using point or scalar addition: \(r = r_n = r'\) (the same as above) \(s = s_1 + ... + s_n = s'\) (simple scalar addition; it must be true that \((k_1 - h x_1) + ... + (k_n - h x_n) = s_1 + ... + s_n = s')\). Doing an m-of-n signature is non-trivial. It has been suggested that a merkle tree containing all possible public key sums for \(m\) participants be used for these cases, generating a \(log(n)\) sized signature [28].

---

## :fa-book: References

[^1]: Wuille P. 2015. [Tree signatures: Multisig on steroids using tree signatures](https://decred.org/research/wuille2015.pdf).
