# <i class="fa fa-info-circle"></i> Ikhtisar 

---

Protokol timestamping terdistribusi pertama kali diterapkan untuk mendesentralisasi jaringan keuangan di kertas yang memecahkan kertas di Bitcoin oleh Nakamoto[^1]. Lapangan ini telah melihat tindak lanjut penelitian yang eksplosif dari para amatir dan profesional, yang bersaing untuk menawarkan perpanjangan, penyesuaian, perbaikan, dan penyempurnaan protokol yang ada. Implementasi penting dari ide baru termasuk Ethereum[^2], yang memperluas scripting, CryptoNote[^3], privasi yang disempurnakan, dan rantaisisi[^4], yang menyelidiki saham dua arah dengan token 1: 1 Bitcoin. Protokol ini semua menggunakan proof-of-work (PoW) seperti yang aslinya dijelaskan dalam buku Bitcoin whitepaper.

Perpanjangan yang sama dengan protokol Bitcoin memodifikasi mekanisme konsensus baik secara keseluruhan atau sebagian menggunakan bukti-of-stake (PoS), atau penggunaan saham (token) daripada kekuatan komputasi seseorang untuk berpartisipasi dalam proses timestamping. rantai blok proof-of-stake pertama berdasarkan protokol Bitcoin diimplementasikan pada tahun 2012 oleh King dan Nadal[^5], dan mencakup PoW dan PoS yang secara bertahap condong ke arah PoS lengkap dari waktu ke waktu. Kritik terhadap sistem konsensus PoS murni telah melimpah[^6] [^7], dengan oposisi yang paling keras berasal dari mereka yang bekerja dengan rantai blok PoW murni. Argumen yang paling umum menentang PoS untuk timestamping terdistribusi adalah "tidak ada apa-apa-pada-saham" atau "simulasi tanpa biaya", yang menggambarkan ketidakstabilan sistematis akibat pemangku kepentingan yang dapat menghasilkan sejarah timestamped alternatif tanpa biaya untuk dirinya sendiri.

Terlepas dari kontroversi tersebut, jelas bahwa sistem dengan overlay PoS bergantung pada sistem timestamping PoW mungkin dapat mencapai konsensus secara independen. Ini secara matematis dieksplorasi oleh Bentov dan rekan-rekannya[^8] dalam sebuah makalah tentang skema mereka, proof-of-activity (PoA), dan tampaknya merupakan perpanjangan yang layak untuk protokol PoW yang memungkinkan beberapa properti baru yang menarik. Desain serupa yang disebut MC2 sebelumnya diajukan oleh Mackenzie pada tahun 2013[^9]. Disini kami menggambarkan konstruksi dan implementasi sistem konsensus serupa yang telah kami namakan "Decred".

Pekerjaan penelitian di Decred saat ini disusun di seputar subbagian berikut:

* [Desain Hibrid](hybrid-design.md)
* [Desentralisasi Stake Pooling](decentralized-stake-pooling.md)
* [Elliptic Curve Signature Algorithms](elliptic-curve-signature-algorithms.md)
* [Fungsi BLAKE-256 Hash](blake-256-hash-function.md)
* [Ekstensi Skrip](script-extensions.md)
* [Isolasi Skrip Tanda Tangan dan Bukti Penipuan](signature-script-isolation-and-fraud-proofs.md)
* [Ekstensi Transaksi](transaction-extensions.md)
* [Tanda tangan Schnorr](schnorr-signatures.md)
* [Perbaikan Miscellaneous](miscellaneous-improvements.md)

## <i class="fa fa-book"></i> Referensi 

[^1]: Nakamoto S. 2008. [Bitcoin: Sistem uang elektronik peer-to-peer](https://decred.org/research/nakamoto2008.pdf).
[^2]: Buterin V. 2014. [Kontrak cerdas generasi terdepan dan platform aplikasi terdesentralisasi](https://decred.org/research/buterin2014.pdf).
[^3]: von Saberhagen N. 2013. [CryptoNote v2.0](https://decred.org/research/saberhagen2013.pdf).
[^4]: Back A., Corallo M., Dashjr L., Friedenbach M., Maxwell G., Miller A., Poelstra A., Timon A., Wuille P. 2014. [Mengaktifkan inovasi Bitcoin dengan rantai sisi yang dipatok](https://decred.org/research/back2014.pdf).
[^5]: King S. and Nadal S. 2012. [PPCoin: Kripto mata uang peer-to-peer dengan bukti saham](https://decred.org/research/king2012.pdf).
[^6]: Bentov I., Gabizon A., Mizrahi A. 2015. [Kriptokokus tanpa bukti kerja](https://decred.org/research/bentov2015.pdf).
[^7]: Poelstra A. 2015. [Di bidang saham dan konsensus](https://decred.org/research/poelstra2015.pdf).
[^8]: Bentov I., Lee C., Mizrahi A., Rosenfeld M. 2014. [Bukti aktivitas: Memperluas bukti kerja Bitcoin melalui bukti saham](https://decred.org/research/bentov2014.pdf).
[^9]: Mackenzie A. 2013. [MEMCOIN2: Mata uang kripto bukti bukti bukti kerja palsu, proof-of-stake](https://decred.org/research/mackenzie2013.pdf).
