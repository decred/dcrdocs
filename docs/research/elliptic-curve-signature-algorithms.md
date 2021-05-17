# ![](../img/dcr-icons/Code.svg){ .dcr-icon } Elliptic Curve Signature Algorithms

---

Although secp256k1 is widely considered to have a secure choice of elliptic curve parameters, some questions about the origin of the curve remain. For example, the selection of the Koblitz curve,

(_y_^2^ + _xy_ = _x_^3^ + _ax_^2^ + _b_ and _a_ = _a_^2^, _b_ = _b_^2^; _a_ = 1 or 2, _b_ != 0)
{: .dcrm .dcrm_block }

is typically done by enumerating the binary extension Galois fields _GF(2^m^)_{: .dcrm } where _m_{: .dcrm } is a prime in the range _{0, ..., higher limit}_{: .dcrm } and _x,y ∈ GF(2^m^)_{: .dcrm }[^1].
For 128-bit security, _m_{: .dcrm } is required to be ⩾257 and typically the smallest prime possible in this range to facilitate fast calculation.
In this case, the obvious choice for _m_{: .dcrm } is _277, a = 0_{: .dcrm }; despite the existence of this appropriate _m_{: .dcrm } value being known by the curators of the curve parameters[^2] and the fact that it was the most computationally efficient solution, the parameters _m = 283_{: .dcrm } and _a = 0_{: .dcrm } were selected out of three possible options:

(_m_ = 277, _a_ = 0; _m_ = 283, _a_ = 0; _m_ = 283, _a_ = 1)
{: .dcrm .dcrm_block }

For all other Koblitz curve specifications, the most obvious _m_{: .dcrm } value is selected.
Although this is curious, there are no known attacks that can be applied by using a slightly larger _m_{: .dcrm } value for the Galois field.
Other objections to the parameters used by secp256k1 have also been raised[^3].

Another extremely popular digital signature algorithm (DSA) with 128-bits of security is Ed25519[^4].
This uses the EdDSA signing algorithm over a curve birationally equivalent to Curve25519 and is widely employed today.
Unlike secp256k1's ECDSA, Ed25519 uses simpler Schnorr signatures that are provably secure in a random oracle model (See: [Schnorr Signatures](schnorr-signatures.md)).

Schnorr signatures have also been proposed for Bitcoin[^5].
However, instead of using an OP code exclusive to Schnorr signatures utilizing the curve parameters for secp256k1, Decred instead uses a new OP code OP_CHECKSIGALT to verify an unlimited number of new signature schemes.
In the current implementation, both secp256k1 Schnorr signatures and Ed25519 signatures are available to supplement secp256k1 ECDSA signatures.
In the future, it is trivial to add new signature schemes in a soft fork, such as those that are quantum secure.
Having these two Schnorr suites available also allows for the generation of simple group signatures occupying the same space of a normal signature[^6], which for both is implemented.
In the future, threshold signatures using dealerless secret sharing will also enable t-of-n threshold signatures occupying the same amount of space[^7].

---

## ![](../img/dcr-icons/Sources.svg){ .dcr-icon } References

[^1]: Pornin T. 2013. [StackExchange Cryptography: Should we trust the NIST-recommended ECC parameters?](https://decred.org/research/pornin2013.pdf)
[^2]: Solinas J. 2000. [Efficient arithmetic on Koblitz curves](https://decred.org/research/solinas2000.pdf).
[^3]: Bernstein D. and Lange T. 2014. [SafeCurves: Choosing safe curves for elliptic-curve cryptography](https://safecurves.cr.yp.to).
[^4]: Bernstein D., Duif N., Lange T., Schwabe P., Yang B. 2012. [High-speed high-security signatures](https://decred.org/research/bernstein2012.pdf).
[^5]: Osuntokun O. 2015. [OP_SCHNORRCHECKSIG: Exploring Schnorr Signatures as an alternative to ECDSA for Bitcoin](https://decred.org/research/osuntokun2015.pdf).
[^6]: Petersen T. 1992. [Distributed provers and verifiable secret sharing based on the discrete logarithm problem](https://decred.org/research/petersen1992.pdf).
[^7]: Stinson D. and Strobl R. 2001. Provably secure distributed Schnorr signatures and a (t,n) threshold scheme for implicit certificates.
