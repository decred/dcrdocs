# Signature Script Isolation and Fraud Proofs 

---

Untuk mencegah kelenturan transaksi, kemampuan untuk menghasilkan transaksi dengan referensi dan keluaran masukan yang sama namun ID transaksi yang berbeda, skrip masukan telah dihapus dari penghitungan hash transaksi. Asal mula modifikasi ini telah kontroversial, meskipun tampaknya telah diimplementasikan di koin dan rantai sisi CryptoNote di masa lalu[^1] [^2]. Sekarang diusulkan untuk Bitcoin sebagai soft fork yang disebut sebagai "Saksi Terpisah"[^3]. Seperti dalam implementasi rantaisisi Elemen, komitmen terhadap data saksi termasuk dalam pohon merkle dari blok[^2]. Sebagai tambahan, bukti kecurangan, seperti yang disarankan untuk soft fork Bitcoin[^3], ditetapkan oleh para penambang dan juga berkomitmen untuk menjadi bagian dari data di pohon merkle.

---

## <i class="fa fa-book"></i> Referensi 

[^1]: von Saberhagen N. 2013. [CryptoNote v2.0](https://decred.org/research/saberhagen2013.pdf).
[^2]: Maxwell G. 2015. [Membawa elemen baru ke Bitcoin dengan sisi rantai](https://decred.org/research/maxwell2015.pdf).
[^3]: Wuille P. 2015. [Saksi terpisahkan untuk Bitcoin](https://prezi.com/lyghixkrguao/segregated-witness-and-deploying-it-for-bitcoin/).
