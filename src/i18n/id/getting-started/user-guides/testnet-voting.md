# Panduan Pemilihan Suara Hardfork Testnet

Panduan ini terakhir diperbarui untuk v1.0.1 

Pada rilis v0.8.0 13 Februari 2017, mekanisme pemungutan suara hard-fork diterapkan untuk pengujian pada Testnet Decred. Pemilihan suara uji coba diperkirakan dimulai pada tanggal 25 Februari 2017 sekitar 1PM CST dan berlangsung selama 7 hari. Jika Anda ingin berpartisipasi, panduan untuk aplikasi Paymetheus dan Baris Perintah dapat ditemukan di sini. 

---

## Pengantar

Ada dua tahap proses pemungutan suara untuk menerapkan perubahan konsensus yang akan menciptakan hard fork. Catatan: interval blok berikut adalah untuk testnet, interval blok akan berbeda untuk mainnet.

Langkah pertama adalah memenuhi ambang peningkatan pada jaringan. Setelah kode hardfork dilepaskan, sebagian besar node pada jaringan yang berpartisipasi dalam PoW/PoS perlu ditingkatkan terlebih dahulu sebelum pemungutan suara dimulai. Untuk Proof-of-work, setidaknya 75% dari 100 blok terbaru harus memiliki versi blok terbaru. Untuk Proof-of-Stake, 75% suara yang diputar dalam interval blok 2016 statis harus memiliki versi suara terbaru.

Langkah kedua dari proses ini adalah pemilihan yang sebenarnya. Rentang blok 2016 sebelumnya jatuh di suatu tempat dalam interval blok 5040 yang lebih besar dan jaringan harus menunggu interval blok 5040 yang lebih besar itu berakhir. Karena panjang interval yang berbeda, mungkin * mengambil hingga tambahan 5040 blok sebelum jendela pemungutan suara dimulai. Setelah itu, interval blok 5040 statis terentang saat suara diberikan dan jika 75% suara yang ditambang dalam interval tersebut memberikan suara 'ya' pada perubahan yang diajukan, perubahan tersebut diterapkan sepenuhnya setelah satu interval blok tambahan (untuk memberikan sisa Simpul waktu yang dibutuhkan untuk memperbarui agar tidak dicabik dari rantaiblok). Berikut adalah tabel yang disederhanakan untuk menjelaskan setiap interval blok sesuai urutannya secara kronologis.

Deskripsi Interval | Tipe interval | Number of Blocks
---------------------|-------------|---------------
Minimal 75% dari blok harus versi terbaru | Rolling | 100
Minimal 75% Votes harus versi terbaru | Statis | 2016
Interval setelah persyaratan upgrade terpenuhi | Statis | Sampai 5040
Interval pemungutan suara yang sebenarnya - 75% Suara harus memberi isyarat "ya" untuk lulus | Statis | 5040
Interval pra-implementasi jika pemungutan suara lewat | Statis | 5040

Jika proposal gagal mencapai batas 10% dari suara 'tidak' atau 'ya', pemegang saham akan dapat memberikan suara lagi pada saat pemungutan suara berikutnya, sampai ambang batas ini terpenuhi atau proposal berakhir. 

Berikut adalah petunjuk untuk berpartisipasi dalam demo pemungutan suara di Testnet menggunakan stakepool dengan aplikasi Paymetheus dan/atau perintah baris `dcrd`, `dcrwallet`, dan `dcrctl`. Panduan baris perintah menggunakan file konfigurasi untuk melewatkan parameter ke aplikasi saat peluncuran. Sebagai alternatif, bendera dapat digunakan saat memulai aplikasi, namun tidak termasuk dalam draf ini.

## Paymetheus

> Langkah 1: Download dan Install Paymetheus

If you haven't already updated your Decred binaries to v1.1.0, visit the [Installation Guide](/getting-started/user-guides/paymetheus.md) and follow the directions for the Windows Installer.

> Langkah 2: Run Decred Testnet

Dari Start Menu, buka `Decred Testnet`. Ini akan meluncurkan `Paymetheus`, dan jendela Command Prompt yang baru akan membuka dan menjalankan `dcrd.exe`. Jika ini adalah pertama kalinya menjalankan daemon testnet, perlu beberapa saat untuk melakukan sinkronisasi ke blokir testnet. 

Di jendela `Paymetheus` , Anda akan menemukan dialog" Connect to dcrd ". Simpan defaultnya dan tekan tombol continue. Tampilan berikutnya akan memiliki dua tombol, "Buat dompet baru" dan "Kembalikan dompet dari biji." Untuk panduan ini, akan diasumsikan Anda belum memiliki seed yang ingin Anda pulihkan.

Setelah mengklik "Buat dompet baru," Anda akan disambut dengan informasi mengenai seed dompet baru Anda. Catat seedmu, taruh di tempat yang aman, dan jangan sekali-kali berbagi dengan siapa pun. Anda juga perlu memasukkannya kembali setelah menekan tombol LANJUTKAN. 

Setelah mengetik Seed Anda, tampilan Encrypt Wallet akan menjadi yang berikutnya. Masukkan frasa sandi pribadi sebagai petunjuknya. Tekan ENCRYPT. Paymetheus kemudian akan mulai membuat dompet Anda. Setelah dibuat, itu akan terbuka ke halaman ikhtisar dompet Anda.

> Langkah 3: Mendaftar di Website Stakepool

Sambil menunggu simpul/dompet Anda disinkronkan, kunjungi [https://teststakepool.decred.org](https://teststakepool.decred.org) dan daftarkan akun baru.

> Langkah 4: Akuisisi Testnet Coins

Selanjutnya, Anda harus membeli koin Testnet untuk membeli tiket Testnet. Ada faucet Testnet resmi yang terletak di [https://faucet.decred.org](https://faucet.decred.org). Untuk mendapatkan alamat baru dari Paymetheus, klik tab "Request payment" pada menu navigasi. Mengklik tombol "GENERATE ADDRESS" akan menghasilkan alamat yang harus dimulai dengan "Ts". Copy dan paste alamat itu ke dalam faucet dan Anda akan menerima koin Anda.

> Step 5: Langkah 5: Beli Tiket Testnet

Klik tab "Pembelian tiket" di dalam menu navigasi Paymetheus. Anda akan melihat 7 bidang formulir di dalam halaman. Semua default dapat digunakan untuk membeli tiket **kecuali** "Preferensi kolam saham". Klik tombol "Kelola pool". Anda harus memasukkan kunci API untuk akun Anda di stapepool testnet. Untuk melakukan ini, cukup kunjungi [https://teststakepool.decred.org/settings](https://teststakepool.decred.org/settings) - Token API Anda akan menjadi item pertama di laman. Masukkan ke kolom API Key di dalam Paymetheus dan tekan Save. Skrip multi-sig 1-of-2 Anda akan dibuat secara otomatis dan Anda dapat menekan Close. 

Selanjutnya, pilih teststakepool.decred.org dari pilihan Preferensi pool saham dan tekan tombol Beli untuk mulai membeli tiket! Catatan: Kesulitan tiket sama dengan biaya per tiket, jadi pastikan Anda memiliki cukup koin uji untuk membeli setidaknya satu tiket.

> Langkah 6: Tetapkan Votebits Tiket Anda melalui poolsaham 

Bila menggunakan poolsaham, tiket yang Anda beli memiliki hak suara decred ke poolsaham tersebut. Secara default, pool akan memilih cara apapun yang menyenangkan dengan tiket Anda. Tentu saja, Anda mungkin ingin mengubah bagaimana suara vote Anda.

Anda bisa mengatur bitsuara tiket Anda melalui loket tiket stakepool. Berikut adalah tangkapan layar dari laman [https://teststakepool.decred.org/tickets](https://teststakepool.decred.org/tickets) . Di bagian bawah bagian "Live/Immature" di halaman ini, Anda akan melihat setting bitsuara. Anda hanya bisa mengedit votebits dari *semua* tiket Anda sekaligus melalui antarmuka pool. Tiket yang ditampilkan di bawah ini disetel ke "Ya" untuk "Previous Block Valid?" Dan "Ya" untuk "Meningkatkan Ukuran Blok dari 1.0 MiB menjadi 1.25MB" yang menghasilkan nilai bitsuara 5.

<img src="/img/testnet-voting_votebit-setting.jpg">

Untuk beberapa informasi dasar tentang bitsuara, kunjungi [An Explanation of Votebits](#an-explanation-of-votebits).

## Instruksi Baris Perintah

> Langkah 1: Download dan Install Decred

If you haven't already updated your Decred binaries to v1.1.0, visit the [Installation Guide](/getting-started/user-guides/cli-installation.md) and follow the directions for your operating system.

> Langkah 2: Buat File Config

Jika Anda sudah terbiasa dengan file `.conf` , lanjutkan ke langkah 3.

Silakan lihat [Configuration Files Introduction](/getting-started/startup-basics.md#configuration-files) dan buatlah berkas konfigurasi baru atau salin contoh berkas konfigurasi ke dalam direktori yang ditentukan untuk sistem operasi Anda.

> Langkah 3: Edit File Config untuk Meluncurkan Testnet

Untuk menjalankan `dcrd`, `dcrwallet`, dan `dcrctl` di testnet, cukup tambahkan `testnet=true` atau `testnet=1` ke ketiga berkas konfigurasi. Jika Anda menggunakan salah satu contoh file konfigurasi, Anda bisa menemukan baris yang bertuliskan `;testnet=1` (pengaturan pertama di bagian Network Settings) dan hapus tanda titik dua. 

Ini harus dilakukan untuk ketiga file konfigurasi tersebut. 

> Langkah 4: Buat Dompet Testnet Baru

Jika Anda belum pernah menjalankan dompet Testnet sebelumnya, Anda perlu membuat yang baru. Dengan setup `dcrwallet.conf`  Anda untuk testnet **(lihat Langkah 3)**, jalankan `dcrwallet` dengan bendera `--create` . 

Bagi yang tidak terbiasa dengan cara melakukannya, ikuti panduan spesifik sistem operasi di bawah ini:

**Windows**: <br />
    1. Menggunakan Command Prompt atau File Explorer, arahkan ke direktori yang bisa dieksekusi `dcrwallet` Anda <br />
    2. Jika menggunakan File Explorer, pilih opsi "Open command prompt" dari menu dropdown "File" <br />
    3. Masukkan perintah `dcrwallet.exe --create` 

**macOS**: <br />
    1. Menggunakan Terminal atau Finder, navigasikan ke direktori yang bisa di eksekusi `dcrwallet` Anda <br />
    2. Jika menggunakan Finder, Anda bisa membuka Terminal baru di lokasi folder dengan mengklik kanan folder dan memilih Services > New Terminal at Window dari menu dropdown<br />
    3. Masukkan perintah `./dcrwallet --create` 

**Linux**: <br />
    1.  Menggunakan apapun yang Anda suka, navigasikan ke direktori yang bisa di eksekusi `dcrwallet` Anda <br />
    2. Masukkan perintah `./dcrwallet --create` 

Ini akan membuat Anda melalui perintah biasa untuk menciptakan dompet baru. Ikuti petunjuk di layar. Anda akan diminta membuat frasa sandi pribadi (Anda akan menggunakannya nanti untuk membuka kunci dompet sambil membuat transaksi). Lapisan enkripsi tambahan sepenuhnya opsional. Seed Anda bisa digunakan untuk mengembalikan dompet Anda di komputer manapun menggunakan dcrwallet. Catat Seedmu, taruh di tempat yang aman, dan jangan sekali-kali berbagi dengan siapa pun. Dompet akan ditutup begitu semuanya selesai.

> Langkah 5: Mulai dcrd di Testnet

Jalankan `dcrd` Anda dieksekusi dengan opsi `testnet=1` atau `testnet=true` dalam berkas konfigurasi untuk memulai node Anda di testnet. Simpul Anda akan mulai disinkronkan dengan jaringan lainnya. Sinkronisasi akan memakan waktu cukup lama.

> Langkah 6: Mulai dcrwallet di Testnet

Jalankan `dcrwallet` Anda yang dapat dieksekusi dengan `testnet=1` atau `testnet=true`option dalam berkas konfigurasi untuk memulai dompet Anda di testnet. Dompet Anda akan terhubung ke node Anda dan mulai menyinkronkan alamat Anda. Sinkronisasi mungkin memakan waktu cukup lama.

> Langkah 7: Mendaftar di Website Stakepool

Sambil menunggu node/dompet Anda disinkronkan, kunjungi [https://teststakepool.decred.org](https://teststakepool.decred.org) dan daftarkan akun baru. Lanjutkan ke langkah 8.

> Langkah 8: Tunggu Testnet Node/Wallet ke Sync

Istirahat sejenak, ini mungkin memakan waktu cukup lama. 

> Langkah 9: Buat Alamat Kunci Publik untuk Menggunakan Poolsaham

Langkah pertama untuk menggunakan poolsaham adalah menghasilkan alamat kunci publik baru yang akan digunakan untuk menghasilkan skrip multisignature 1-dari-2. Ikuti petunjuk di [https://teststakepool.decred.org/address](https://teststakepool.decred.org/address) untuk membuat dan menyimpan alamat ini. Jika Anda telah membuat akun di poolsaham mainnet, ini sama.

> Langkah 10: Impor Skrip Multi-Sig P2SH Anda Dari poolsaham

Selanjutnya, Anda memerlukan naskah impor yang memungkinkan Anda mendelegasikan hak suara ke pool. Setelah menyelesaikan langkah sebelumnya, skrip ini akan tersedia di [https://teststakepool.decred.org/tickets](https://teststakepool.decred.org/tickets). Sekali lagi ikuti petunjuk disana untuk mengimpor script. Jika Anda telah membuat akun di poolsaham mainnet, ini sama.

> Langkah 11: Akuisisi Testnet Coins

Selanjutnya, Anda harus membeli koin Testnet untuk membeli tiket Testnet. Ada keran Testnet resmi yang terletak di [https://faucet.decred.org](https://faucet.decred.org). Masukkan alamat Testnet (satu dapat diambil dengan menjalankan perintah `getnewaddress`  - contoh untuk setiap OS di bawah ini)

    Windows: dcrctl.exe --wallet getnewaddress
    macOS/Linux: ./dcrctl --wallet getnewaddress

> Langkah 12: Beli Tiket Testnet

[https://teststakepool.decred.org/tickets](https://teststakepool.decred.org/tickets) menjelaskan tiga opsi untuk membeli tiket. Taruhan terbaik Anda adalah dengan menggunakan pembelian manual, sehingga Anda dapat membeli tiket kapan pun Anda membutuhkannya.

Buat perintah `dcrctl --wallet getstakeinfo` untuk melihat kesulitan saat ini. Ini adalah harga tiket saat ini. Sesuaikan perintah purchaseticket yang ditampilkan di halaman tiket poolsaham untuk mengakomodasi harga tiket saat ini.

> Langkah 13: Tunggu Voting Untuk Dimulai

Pertama, minimal 75% dari SEMUA suara yang diputar di 2016 balok terakhir harus berasal dari sebuah node yang menjalankan perangkat lunak Decred terbaru. Kemudian, interval blok 5040 blok harus berlalu sebelum pemungutan suara dimulai. Periksa [https://hardforkdemo.decred.org](https://hardforkdemo.decred.org) untuk status terakhir pada keseluruhan proses pemungutan suara.

> Langkah 14: Setel Votebits Tiket Anda melalui Stakepool 

Bila menggunakan poolsaham, tiket yang Anda beli memiliki hak suara yang didelegasikan ke poolsaham tersebut. Secara default, kolam akan memilih cara apapun yang menyenangkan dengan tiket Anda. Tentu saja, Anda mungkin ingin mengubah bagaimana suara tiket Anda.

Anda bisa mengatur bitsuara tiket Anda melalui loket tiket poolsaham. Berikut adalah tangkapan layar dari laman [https://teststakepool.decred.org/tickets](https://teststakepool.decred.org/tickets) .  Di bagian bawah bagian "Live/Immature" di halaman ini, Anda akan melihat setting bitsuara. Anda hanya bisa mengedit bitsuara dari *semua* tiket Anda sekaligus melalui antarmuka pool. Tiket yang ditampilkan di bawah ini disetel ke "Ya" untuk "Previous Block Valid?" Dan "Ya" untuk "Meningkatkan Ukuran Blok dari 1.0 MiB menjadi 1.25MB" yang menghasilkan nilai Bitsuara 5.

<img src="/img/testnet-voting_votebit-setting.jpg">

## Penjelasan tentang Bitsuara

Berikut adalah tangkapan layar dari semua nilai Bitsuara yang bermakna untuk suara versi 4:

<img alt="Grafik yang menjelaskan nilai bitsuara dari versi vote 4." src="/img/testnet-voting_vote-version-4.jpg">

Screenshot ini cukup jelas. Di dalam antarmuka kolam renang, jika pengguna memilih "Ya" untuk peningkatan ukuran blok dan "Ya" untuk blok sebelumnya yang valid, tiket suara tiket mereka akan ditetapkan ke "5". 

Berikut adalah tangkapan layar yang menampilkan di mana Bitsuara dan versi hak suara dapat ditemukan dalam transaksi pemilihan suara aktual melalui penjelajah blok di [https://testnet.decred.org](https://testnet.decred.org). Voting ini dilemparkan dengan nilai Votebit 5, seperti yang dicatat oleh output transaksi ke-2. 

<img src="/img/testnet-voting_vote-version-and-votebits.jpg">

Anda dapat dengan mudah memeriksa pemungutan suara Anda dengan mengklik Hash Transaksi Tiket dari salah satu tiket Anda di bagian "Tiket Terpilih" di [https://teststakepool.decred.org/tickets](https://teststakepool.decred.org/tickets) halaman. (CATATAN: Anda memilih *mungkin* ditampilkan sebagai V0 [Versi 0] karena bug dalam kode Poolsaham - ini sedang diselidiki dan mungkin akan dipecahkan pada saat panduan ini diterbitkan.)

## Hard Fork Demo Website

Untuk tujuan menampilkan status pelaksanaan pemungutan suara yang baru, [https://hardforkdemo.decred.org](https://hardforkdemo.decred.org) telah dibuat. Setiap langkah divisualisasikan dengan grafik dan penjelasan yang cukup sederhana.
