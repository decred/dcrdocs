# Pertambangan Proof-of-Work (PoW)

---

## Ikhtisar  

Tambang penambangan bekas, yang lebih sering disebut sebagai pertambangan PoW, adalah aktivitas perangkat keras dan sumber daya komputer Anda untuk memproses jaringan
transaksi dan membangun blok yang membentuk blockchain di Decred
jaringan. Setiap kali satu blok dibuat (oleh penambang), sekitar 30 koin Decred baru
dibuat. Koin ini kemudian dibagi sebagai berikut:

Subsidi | Pesta
---     | ---
60%   | Penambang PoW
30%   | Pemilih PoS
10%   | Mendesak subsidi pembangunan

Rata-rata, anda akan menerima hadiah yang kira-kira sebanding dengan
Memiliki penambang dan keseluruhan jaringan saat Anda melakukan komit
Komputer Anda ke pertambangan PoW. Untuk memulai, Anda harus memiliki komputer dengan
Kartu grafik. Sebagian besar kartu grafik dapat digunakan untuk pertambangan (termasuk jenis "mobile"
yang ditemukan di beberapa laptop). Secara umum, kartu grafik akhir yang lebih tinggi tampil di
Hash yang lebih tinggi dan karenanya menerima penghargaan yang lebih tinggi.
---

## Pertambangan Pertambangan atau Kolam Tambang 

> <i class="fa fa-male"></i> Pertambangan Solo

<i class="fa fa-exclamation-triangle"></i> **Pertambangan Solo tidak disarankan dan tidak tercakup dalam dokumentasi ini!** Jaringan yang terdegradasi secara teratur melihat tingkat hash jaringan hingga 10.000Gh/s. Pertambangan Solo umumnya hanya dilakukan oleh individu maju atau kelompok terorganisir dengan cluster GPU yang besar sehingga tidak akan dibahas disini.

> <i class="fa fa-users"></i> Kolam Pertambangan

Ketika Anda menambang di kolam, hashrate Anda digabungkan dengan semua penggalian kolam renang lainnya untuk mencari solusi yang benar untuk satu blok. Anda akan menerima hadiah berdasarkan jumlah pekerjaan yang dilakukan penambang Anda di pool.
Penambangan pool mendistribusikan saham berdasarkan blok yang ditemukan sehingga Anda bisa memperoleh jumlah yang stabil dari pada Penggelapan daripada "semua atau tidak" dari pertambangan tunggal.

---

## Mendapatkan Alamat Decreed untuk Menerima Dana  

Ikuti panduan [dcrctl Basics](/getting-started/user-guides/dcrctl-basics.md) untuk membuat sebuah alamat sehingga Anda dapat menarik penambangan untuk itu.

---

## <i class="fa fa-life-ring"></i> Mendaftar ke Kolam Pertambangan

Kolam pertambangan ini diketahui mendukung Decred:

* [<i class="fa fa-external-link-square"></i> http://decredpool.org](http://decredpool.org)
* [<i class="fa fa-external-link-square"></i> http://yiimp.ccminer.org](http://yiimp.ccminer.org)
* [<i class="fa fa-external-link-square"></i> http://coinmine.pl/dcr](http://coinmine.pl/dcr)
* [<i class="fa fa-external-link-square"></i> https://dcr.maxminers.net](https://dcr.maxminers.net)
* [<i class="fa fa-external-link-square"></i> https://dcr.suprnova.cc](https://dcr.suprnova.cc)
* [<i class="fa fa-external-link-square"></i> https://pool.mn/dcr](https://pool.mn/dcr)
* [<i class="fa fa-external-link-square"></i> https://zpool.ca](https://zpool.ca)

Pool penambangan semua bekerja kurang lebih sama tetapi Anda mungkin ingin mendaftar di beberapa pool dan melihat mana yang paling sesuai untuk Anda.

Silakan memilih untuk menambang di pool yang lebih kecil sehingga hashrate jaringan dapat menyebar untuk desentralisasi kekuatan pertambangan yang lebih baik!

---

## Driver GPU/Perangkat Lunak 

Driver GPU biasanya berisi perpustakaan yang dibutuhkan untuk pertambangan. Jika Anda mengalami kesulitan dalam menjalankan perangkat lunak yang mungkin ingin Anda instal ulang dan secara khusus memeriksa apakah perpustakaan OpenCL (AMD) atau CUDA (NVIDIA) dipilih.

---

## <i class="fa fa-download"></i> Pilih dan Download Perangkat Lunak Pertambangan  

### Official Decred Miner (gominer)

Gominer adalah penambang Decred resmi yang dikembangkan dan didukung oleh tim terdegradasi. Ini adalah penambang termudah untuk menyiapkan dan memulai penambangan sehingga disarankan bagi sebagian besar pengguna. Saat ini, versi terbaru dari gominer adalah **<i class="fa fa-github"></i> [v1.0.0](https://github.com/decred/gominer/releases/)** dan Binari resmi dapat diunduh dari **[https://github.com/decred/decred-binaries/releases/tag/v1.0.0](https://github.com/decred/decred-binaries/releases/tag/v1.0.0)**

Pastikan untuk memilih sistem operasi yang benar (Windows/Linux) dan versi yang benar untuk tipe GPU Anda (CUDA untuk kartu NVIDIA, OpenCL/OpenCLADL untuk kartu AMD). Gominer hanya tersedia untuk sistem operasi 64-bit. Panduan pengguna untuk memulai penambangan dengan gominer dapat ditemukan di sini:

- [Windows Pool-Mining](/mining/proof-of-work/pool-mining/gominer/windows.md)

### Penambang tidak resmi

* <i class="fa fa-github"></i> [cgminer](https://github.com/kR105-zz/cgminer) - cgminer adalah penambang yang populer untuk **AMD** GPU yang memiliki Sejarah panjang penggunaan di banyak kripto yang berbeda. Ini lebih sulit untuk digunakan daripada gominer yang didekorasi..

* <i class="fa fa-github"></i> [ccminer](https://github.com/tpruvot/ccminer) - ccminer adalah penambang yang populer untuk **NVIDIA** GPU yang memiliki sejarah panjang Penggunaan dalam banyak kripto yang berbeda. Ini lebih sulit untuk digunakan daripada gominer yang didekorasi.

* <i class="fa fa-github"></i> [sgminer](https://github.com/tpruvot/sgminer) - Mereka yang memiliki kartu grafis **AMD** yang menjalankan Windows mungkin ingin mendownload sgminer.

---

## Menjalankan Perangkat Lunak 

* Dekompresi dan instal perangkat lunak ke tempat yang Anda pilih.
* Buka command prompt ke jalan itu.
* Ikuti petunjuk penambangan untuk setup.
* Jalankan penambang.

Lanjutkan ke [PoW Mining FAQ](/faq/proof-of-work-mining.md)
