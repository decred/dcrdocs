# Elliptic Curve Signature Algorithms 

---

Meskipun secp256k1 secara luas dianggap memiliki pilihan kurva elips yang aman, beberapa pertanyaan tentang asal mula kurva tetap ada. Misalnya, pemilihan kurva Koblitz,

\((y^2 + xy = x^3 + ax^2 + b \text{ and } a = a^2 \text{, } b = b^2 \text{; } a = 1 \text{ or } 2 \text{, } b != 0)\)

Biasanya dilakukan dengan menghitung bidang biner perpanjangan Galois \(GF(2^m)\) di mana \(m\) adalah bilangan prima pada kisaran {\(0\), \(...\), batas yang lebih tinggi} Dan \(x,y \in GF(2^m)\)[^1]. Untuk keamanan 128-bit, \(m\) diperlukan untuk \(\geqslant 257\) dan biasanya yang terkecil mungkin dalam kisaran ini untuk memudahkan perhitungan cepat. Dalam kasus ini, pilihan yang jelas untuk \(m\) adalah \(277\text{, } a = 0\); Meskipun ada nilai $m$ yang sesuai yang diketahui oleh kurator parameter kurva[^2] dan fakta bahwa itu adalah solusi yang paling efisien secara komputasi, parameter \(m = 283\) and \(a = 0\) Dipilih dari tiga opsi yang mungkin:

 \((m = 277\text{, } a = 0\text{; } m = 283\text{, } a = 0\text{; } m = 283\text{, } a = 1)\).

Untuk semua spesifikasi kurva Koblitz lainnya, nilai \(m\) yang paling jelas dipilih. Meskipun ini penasaran, tidak ada serangan yang diketahui yang bisa diterapkan dengan menggunakan nilai $m$ sedikit lebih sedikit untuk bidang Galois. Keberatan lain terhadap parameter yang digunakan oleh secp256k1 juga telah dinaikkan[^3].

Algoritma tanda tangan digital lainnya yang sangat populer (DSA) dengan keamanan 128-bit adalah Ed25519[^4]. Ini menggunakan algoritma penandatanganan EdDSA di atas kurva yang secara birokratis setara dengan Curve25519 dan dipekerjakan secara luas hari ini. Tidak seperti ECDSA dari secp256k1, Ed25519 menggunakan tanda tangan Schnorr yang lebih sederhana yang terbukti aman dalam model oracle acak (Lihat: [Schnorr Signatures](schnorr-signatures.md)).

Tanda tangan Schnorr juga telah diusulkan untuk Bitcoin[^5]. Namun, alih-alih menggunakan kode OP yang eksklusif untuk tanda tangan Schnorr yang memanfaatkan parameter kurva untuk secp256k1, Sebaliknya, ganti menggunakan kode OP OP_CHECKSIGALT yang baru untuk memverifikasi jumlah skema tanda tangan baru yang tidak terbatas. Dalam implementasi saat ini, kedua tanda tangan Schnorr dan tanda tangan Ed25519 secp256k1 tersedia untuk melengkapi tanda tangan ECDSA secp256k1. Di masa depan, sepele menambahkan skema tanda tangan baru di garpu yang lembut, seperti yang kuantum aman. Setelah dua suite Schnorr ini tersedia, memungkinkan pembandingan tanda tangan kelompok sederhana yang menempati ruang yang sama dengan tanda tangan normal[^6], yang untuk keduanya diimplementasikan. Di masa depan, tanda tangan ambang batas dengan menggunakan berbagi rahasia tanpa dealer juga akan mengaktifkan tanda tangan t-of-n yang menempati jumlah ruang yang sama[^7].

---

## <i class="fa fa-book"></i> Referensi 

[^1]: Pornin T. 2013. [StackExchange Cryptography: Haruskah kita mempercayai parameter ECC yang direkomendasikan oleh NIST?](https://decred.org/research/pornin2013.pdf)
[^2]: Solinas J. 2000. [Aritmatika yang efisien pada kurva Koblitz](https://decred.org/research/solinas2000.pdf).
[^3]: Bernstein D. and Lange T. 2014. [SafeCurves: Memilih kurva yang aman untuk kriptografi kurva eliptik](http://safecurves.cr.yp.to).
[^4]: Bernstein D., Duif N., Lange T., Schwabe P., Yang B. 2012. [Tanda tangan dengan keamanan tinggi berkecepatan tinggi](https://decred.org/research/bernstein2012.pdf).
[^5]: Osuntokun O. 2015. [OP_SCHNORRCHECKSIG: Menjelajahi Tanda Tangan Schnorr sebagai alternatif untuk ECDSA untuk Bitcoin](https://decred.org/research/osuntokun2015.pdf).
[^6]: Petersen T. 1992. [Pembagi dan pembagi terdistribusi yang terdistribusi berdasarkan masalah logaritma diskrit](https://decred.org/research/petersen1992.pdf).
[^7]: Stinson D. and Strobl R. 2001. Dapat memberikan tanda tangan Schnorr dengan aman dan skema ambang batas (t, n) untuk sertifikat implisit.
