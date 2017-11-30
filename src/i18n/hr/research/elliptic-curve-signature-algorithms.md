# Algoritmi potpisa eliptičkih krivulja 

---

Iako se secp256k1 široko smatra sigurnim izborom parametara eliptičnih krivulja, neka su pitanja o porijeklu krivulje i dalje. Na primjer, odabir Koblitzove krivulje,

\((y^2 + xy = x^3 + ax^2 + b \text{ and } a = a^2 \text{, } b = b^2 \text{; } a = 1 \text{ or } 2 \text{, } b != 0)\)

Obično se vrši nabrajanjem binarnog ekstenzija Galois polja \(GF(2^m)\) gdje je \(m\) premijera u rasponu {\(0\), \(...\), višu granicu} and \(x,y \in GF(2^m)\)[^1]. Za 128-bitnu sigurnost, \(m\) mora biti \(\geqslant 257\) i obično najmanji premijer moguć u ovom rasponu kako bi se olakšao brz izračun. U ovom slučaju, očiti izbor za \(m\) is \(277\text{, } a = 0\); Unatoč postojanju ove odgovarajuće $m$ vrijednosti poznati su od kuratora parametara krivulje[^2] i činjenice da je to bilo najviše računalno učinkovito rješenje, parametri \(m = 283\) and \(a = 0\) Odabrani su od tri moguće opcije:

 \((m = 277\text{, } a = 0\text{; } m = 283\text{, } a = 0\text{; } m = 283\text{, } a = 1)\).

Za sve druge specifikacije Koblitzove krivulje odabrana je najočitijih vrijednosti \(m\). Iako je zanimljivo, nema poznatih napada koji se mogu primijeniti pomoću nešto veće vrijednosti od $ m $ za polje Galois. Također su podignute i druge primjedbe prema parametrima secp256k1[^3].

Još jedan iznimno popularan algoritam digitalnog potpisa (DSA) sa 128 bitova sigurnosti je Ed25519[^4].  Ovo koristi Algoritam za potpisivanje EdDSA preko krivulje koja je jednaka Curve 25519 i danas se široko koristi. Za razliku od SECp256k1 ECDSA, Ed25519 koristi jednostavnije potpise Schnorr-a koji su dokazivo sigurni u slučajnom modelu orakula (Vidi: [Schnorr Potpis](schnorr-signatures.md)).

Schnorrove potpise također su predložene za Bitcoin[^5]. Međutim, umjesto korištenja OP koda isključivo za potpise Schnorr koristeći parametre krivulje za secp256k1, Decred umjesto toga koristi novi OP kod OP_CHECKSIGALT kako bi provjerio neograničen broj novih shema potpisa. U trenutnoj implementaciji, secp256k1 Schnorr potpisi i potpisi Ed25519 dostupni su za dopunu secp256k1 ECDSA potpisa. U budućnosti je trivijalno dodati nove sheme potpisa u lagano grananje, poput onih koji su kvantno sigurni. Dostupnost ovih dviju Schnorrovih sučelja omogućava i stvaranje jednostavnih grupa potpisa koji zauzimaju isti prostor normalnog potpisa[^6], koji je za obje implementiran. U budućnosti, potpisi praga koji upotrebljavaju dijeljenje tajne bez posrednika omogućit će i potpune potpise t-n-a za istu količinu prostora[^7].

---

## <i class="fa fa-book"></i> Preporuke 

[^1]: Pornin T. 2013. [Burza Kriptografija: Treba li vjerovati NIST-preporučeni ECC parametri?](https://decred.org/research/pornin2013.pdf)
[^2]: Solinas J. 2000. [Učinkovita aritmetika na Koblitzovim krivuljama](https://decred.org/research/solinas2000.pdf).
[^3]: Bernstein D. and Lange T. 2014. [SigurneKrivulje: Odabir sigurnih krivulja za kriptografiju eliptične krivulje](http://safecurves.cr.yp.to).
[^4]: Bernstein D., Duif N., Lange T., Schwabe P., Yang B. 2012. [Visoka-brzina visoka-sigurnost potpisa](https://decred.org/research/bernstein2012.pdf).
[^5]: Osuntokun O. 2015. [OP_SCHNORRCHECKSIG: Istraživanje potpisa Schnorr kao alternativu ECDSA za Bitcoin](https://decred.org/research/osuntokun2015.pdf).
[^6]: Petersen T. 1992. [Distribuirani projekti i provjerljiva podjela tajne na temelju diskretnog logaritamskog problema](https://decred.org/research/petersen1992.pdf).
[^7]: Stinson D. and Strobl R. 2001. Potrebno osigurati distribuirane Schnorrove potpise i shemu pragova (t,n) tza implicitne potvrde.
