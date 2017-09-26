# Pertambangan Proof-of-Stake (PoS) 

Terakhir diperbarui untuk v1.0.0

Dokumen ini dimaksudkan untuk menjadi sumber edukasi untuk penambangan Proof-of-Stake (staking) dengan Decred. Ini akan mencakup tujuan protokol Proof-of-Stake, pengantar singkat tentang proses pertaruhan, siklus pengiriman tiket, dan Anda mulai dengan pembelian tiket.

---

## Ikhtisar 

Protokol Proof-of-Stake yang unik mendasari beberapa tujuan:

Menyediakan metrik bagi stakeholder (pemangku kepentingan) / dukungan pengguna akhir untuk setiap pembaruan konsensus. Artinya, pemangku kepentingan dapat memilih proposal/agenda spesifik pada blockchain yang dideklarasikan. Agenda meliputi penentuan apakah tim dev menghabiskan waktu untuk menerapkan fitur tertentu, mengaktifkan kode fitur yang sudah diajukan untuk implementasi, atau membuat keputusan lain seperti bagaimana subsidi dev harus dikeluarkan. Informasi lebih lanjut tentang pemungutan suara dapat ditemukan di [Panduan Voting Mainnet](/getting-started/user-guides/agenda-voting.md).

Decred's PoS juga menyediakan sistem checks and balances untuk penambang yang tidak sesuai. Pemangku kepentingan dapat memilih blok yang tidak valid jika tidak sesuai dengan peraturan konsensus jaringan. 

---

## Mengintai 101 

Untuk berpartisipasi dalam penambangan bukti-saham, pemangku kepentingan mengunci beberapa DCR dengan imbalan tiket. Setiap tiket yang dimiliki memberi pemangku kepentingan kemampuan untuk memberikan suara tunggal. Setelah voting, setiap tiket mengembalikan hadiah kecil plus yang asli **Harga Tiket** dari tiket. Setiap tiket dipilih untuk memilih secara acak, memberikan waktu pemungutan suara rata-rata 28 hari, namun mungkin memerlukan waktu hingga 142 hari, dengan kemungkinan 5% kemungkinan akan berakhir sebelum dipilih untuk memilih (masa berlaku ini akan mengembalikan yang asli **Harga Tiket** Tanpa hadiah). Setiap blok yang ditambang harus mencakup 5 suara (Penambang diberi penalti dengan potongan hadiah jika kurang dari 5 suara disertakan). Setiap blok yang ditambang juga bisa mencakup hingga 20 pembelian tiket baru. Tiket baru membutuhkan 256 blok untuk matang sebelum dimasukkan ke dalam **Tiket Renang* dan dapat dipanggil untuk memilih.

Ada beberapa variabel penting yang harus Anda pelajari saat mengintai.

Setiap 144 blok (~12 jam), algoritma kesulitan pasak menghitung **harga Ticket** yang baru dalam upaya untuk menjaga ukuran **Tiket Pool** di dekat ukuran kolam target 40.960 tiket. Jendela blok 144 ini disebut sebagai `StakeDiffWindowSize`.

**Harga Tiket**/**Kesulitan Pasak** adalah harga yang harus Anda bayar untuk tiket saat ada 144 jendela blok.

The **Ticket Pool** adalah jumlah tiket di jaringan Decred.

**Biaya Tiket** (`ticketfee`) adalah tarif biaya yang harus disertakan dalam pembelian tiket untuk memberi insentif kepada para penambang Proof-of-Work untuk memasukkan tiket tersebut di blok baru. **Biaya Tiket** biasanya mengacu pada tarif biaya DCR / kB untuk transaksi pembelian tiket. Karena itu, dengan ukuran transaksi yang lebih tinggi, Anda akan membayar biaya absolut yang lebih tinggi. Misalnya, pembelian tiket berjejer adalah sekitar 300 Bytes, yang berarti **Biaya Tiket** dari 0,3 DCR/kB akan menghasilkan pengeluaran sebesar .1 DCR jika, dan hanya jika, tiket masuk di blok .

Ketika **Harga Tiket** menjadi relatif rendah untuk satu **Jendela Tiket**, Anda biasanya dapat mengharapkan pasar biaya terbentuk, dengan banyak pemangku kepentingan mencoba membeli tiket sebelum jendela berakhir. Bila **Harga Tiket** tidak pada harga yang sangat rendah dan menguntungkan, defaultnya **Biaya Tiket** sebesar 0,01 tingkat DCR/kB biasanya cukup tinggi untuk disertakan dalam satu blok.

Ketika sebuah tiket dipanggil untuk memilih, dompet yang memiliki hak suara untuk tiket tersebut harus online. Jika dompet tidak online untuk memberikan suara, tiket akan ditandai sebagai `missed` dan Anda tidak akan menerima hadiah untuk tiket tersebut. Stakepools ditawarkan sebagai solusi bagi mereka yang tidak dapat memiliki dompet pemungutan suara secara online 24/7.

Stakepools memungkinkan pemangku kepentingan untuk menghasilkan transaksi pembelian tiket yang memberi hak suara stakepool untuk tiket Anda. Mereka memilih atas nama Anda, biasanya memerlukan sedikit biaya untuk partisipasi (di bawah 7%) yang mencakup biaya minimal 3 server yang dibutuhkan untuk menjalankan stakepool. Biaya ini dikenal sebagai **Pool Fee** dan hanya diambil dari hadiah PoS kecil. Daftar stakepools dapat ditemukan [di bawah](#list-of-stakepools).

---

## Siklus Hidup Tiket 

Membeli tiket untuk PoS cukup sederhana (lihat di bawah) tapi apa yang terjadi setelah Anda membelinya?
Tiket di jaring utama (uji jaring menggunakan parameter yang berbeda) akan melalui beberapa tahap dalam masa hidupnya:

1. Anda membeli tiket menggunakan dompet Paymetheus <!--, Decrediton,--> atau dcrwallet. Total biaya setiap transaksi tiket tunggal harus **Harga Tiket** + **Biaya Tiket**(`ticketfee`).
2. Tiket masuk ke `mempool`. Di sinilah tiket Anda menunggu ditambang oleh penambang PoW. Hanya 20 tiket segar yang ditambang di setiap blok.
3. Tiket ditambang ke blok dengan harga lebih tinggi **Biaya Tiket** transaksi memiliki prioritas lebih tinggi. Perhatikan bahwa **Biaya Tiket** adalah DCR per KB dari transaksi. Beberapa ukuran transaksi umum adalah 298 Bytes (pembelian tiket solo) dan 539 Bytes (pembelian tiket kolam renang).
4. **A -** Jika tiket Anda ditambang ke dalam blok, tiket tersebut menjadi tiket yang belum menghasilkan. Keadaan ini berlangsung selama 256 blok (sekitar 20 jam). Selama ini tiket tidak bisa memilih. Pada titik ini, biaya tiket tidak dapat dikembalikan. <br /> 
**B -** Jika tiket Anda tidak ditambang, maka **Harga Tiket** dan **Biaya Tiket** dikembalikan ke rekening pembelian.
5. Setelah tiket Anda jatuh tempo (256 blok), tiket masuk ke **dalam Tiket** dan memenuhi syarat untuk memberikan suara.
6. Kesempatan voting tiket didasarkan pada distribusi Poisson dengan rata-rata 28 hari. Setelah 28 hari tiket memiliki kesempatan 50% untuk memilih.
7. Dengan ukuran kolam target 40.960 tiket, tiket yang diberikan memiliki kesempatan pemungutan suara 99,5% dalam ~142 hari (sekitar 4,7 bulan). Jika, setelah waktu ini, tiket belum memberikan suara, akan berakhir. Anda menerima pengembalian dana asli **Harga Tiket**.
8. Tiket mungkin akan kehilangan panggilan untuk memilih apakah dompet pemungutan suara tidak merespons atau dua blok yang valid ditemukan dalam jarak dekat satu sama lain. Jika ini terjadi, Anda akan menerima pengembalian dana yang asli **Harga Tiket**.
9. Setelah tiket telah memilih, tidak terjawab, atau kadaluarsa, dana (harga tiket dan subsidi jika berlaku, dikurangi biaya) akan memasuki status tidak dewasa untuk 256 blok lainnya, setelah dilepaskan. Jika tiket tidak terjawab atau kadaluarsa, transaksi pencabutan tiket diajukan oleh dompet yang kemudian membebaskan tiket yang terkunci. **CATATAN:** Revokasi hanya dapat diajukan untuk tiket yang tidak sesuai. Anda tidak bisa mencabut tiket sampai tidak terjawab.

---

## Bagaimana Cara Bertaruh 

Dompet yang dibuka dan dibuka 24/7 adalah *sangat dianjurkan* untuk diintai. Setiap kehilangan uptime dapat mengakibatkan hilangnya suara dan penghargaan. Stakepools tersedia bagi mereka yang tidak dapat menyimpan dompet voting pribadi secara online selamanya.

Satu-satunya persyaratan lain untuk mengintai adalah dengan membeli tiket. Di bawah ini Anda dapat menemukan panduan untuk membeli tiket menggunakan [Paymetheus](#paymetheus) dan [dcrwallet](#dcrwallet).

Jika anda berniat menggunakan stakepool, anda harus mendaftar dulu terlebih dahulu. Tautan ke stakepool yang diakui secara resmi disediakan [disini](#list-of-stakepools).

---

## Paymetheus 

Aplikasi Paymetheus tidak dapat memilih dirinya sendiri, yang berarti bahwa hak suara harus diberikan pada stakepool.

Lihat [panduan tab Pembelian Tiket](/getting-started/user-guides/using-paymetheus.md#purchase-tickets-tab) untuk Paymetheus untuk mempelajari cara membeli tiket menggunakan Paymetheus dan stakepool.

---

## dcrwallet 

Panduan [Membeli Tiket dengan dcrwallet](/getting-started/user-guides/dcrwallet-tickets.md) akan menunjukkan kepada Anda bagaimana cara membeli tiket secara manual dan otomatis untuk bergabung dengan pool atau bermain solo.

---

## <i class="fa fa-life-ring"></i> Daftar Stakepools

Stakepool ini dikenali secara resmi:

* [<i class="fa fa-external-link-square"></i> https://dcr.stakepool.net](https://dcr.stakepool.net)
* [<i class="fa fa-external-link-square"></i> https://dcr.stakeminer.com](https://dcr.stakeminer.com)
* [<i class="fa fa-external-link-square"></i> https://pool.d3c.red](https://pool.d3c.red)
* [<i class="fa fa-external-link-square"></i> https://stakepool.dcrstats.com](https://stakepool.dcrstats.com)
* [<i class="fa fa-external-link-square"></i> https://stake.decredbrasil.com](https://stake.decredbrasil.com)
* [<i class="fa fa-external-link-square"></i> https://stakepool.eu](https://stakepool.eu)
* [<i class="fa fa-external-link-square"></i> https://dcr.ubiqsmart.com](https://dcr.ubiqsmart.com)
* [<i class="fa fa-external-link-square"></i> https://ultrapool.eu](https://ultrapool.eu)

Anda dapat menemukan perbandingan biaya dan statistik masing-masing pool dengan mengunjungi
[<i class="fa fa-external-link-square"></i> Decred website](https://decred.org)
Dan mengklik link 'Stakepools' di dalam footer di bagian bawah halaman.

---

<!-- TODO: **Membeli Tiket dengan Decrediton** -->

## Informasi tambahan 

[Panduan Voting Mainnet](/getting-started/user-guides/agenda-voting.md)

[Perintah Proof-of-Stake](/advanced/program-options.md#pos-commands)

[FAQ Proof-of-Stake - Umum](/faq/proof-of-stake/general.md)

[FAQ Proof-of-Stake - Membeli Tiket dan Biaya](/faq/proof-of-stake/buying-tickets-and-fees.md)

[FAQ Proof-of-Stake - Pertambangan Solo](/faq/proof-of-stake/solo-mining.md)

[Bukti-of-Stake FAQ - Stake Pools](/faq/proof-of-stake/stake-pools.md)

[FAQ Proof-of-Stake - Tiket Voting](/faq/proof-of-stake/voting-tickets.md)

[Parameter Pertambangan Proof-of-Stake](/advanced/program-options.md#pos-network-parameters)
