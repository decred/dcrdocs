# Panduan Pemula 

Terakhir diperbarui untuk v1.0.1

---

## Selamat Datang Untuk Decred 

Selamat Datang di Decred! Kami sangat senang anda bergabung bersama kami. Seperti yang mungkin sudah atau belum Anda ketahui, Decred berbeda. Ada banyak hal baru yang bisa dipelajari untuk memahami sepenuhnya bagaimana segala sesuatu bekerja. Dokumentasi ini akan berusaha membuat sesuatu menjadi sedikit lebih mudah dipahami.

Panduan pemula ini adalah jalan untuk menyiapkan dan menjalankan perangkat lunak. Anda dapat memilih dari beberapa klien untuk mendapatkan node pada jaringan dan Decred di dompet Anda. Secara khusus, Anda akan belajar cara memasang, mengatur, dan menggunakan aplikasi Decred; Bagaimana cara mendapatkan DCR; Bagaimana cara memberi suara menggunakan Proof-of-Stake; Dan bagaimana cara menggunakan blok penjelajah.

Anda harus mengikuti [Panduan Pemasangan](#ipanduan-pemasangan), kemudian ikuti jalan untuk aplikasi pilihan Anda di bawah ini. Setelah aplikasi Anda disiapkan, kunjungi [General Guides](#general-guides) di bagian bawah halaman ini. Jika Anda memiliki pertanyaan di sepanjang jalan, bergabunglah dengan kami di [Slack](/support-directory.md#join-us-on-slack).

**CATATAN: Penggunaan Testnet sangat dianjurkan untuk mempelajari cara menggunakan perangkat lunak Decred tanpa takut melakukan kesalahan dan kehilangan uang sungguhan. Setelah mengikuti panduan untuk menyiapkan pilihan perangkat lunak Anda, kunjungi [Menggunakan panduan TestNet](/getting-started/using-testnet.md) untuk mempelajari cara meluncurkan aplikasi Anda ke testnet Decred.**

---

## Aplikasi 

Di bawah ini Anda akan menemukan daftar aplikasi yang tersedia saat ini, dengan grafik yang menunjukkan kesesuaiannya dengan sistem operasi yang berbeda.

**Paymetheus**: The only Windows GUI client as of v1.1.0. <br />
**dcrd**: The node daemon, this command-line application handles block management and consensus. <br />
**dcrwallet**: The wallet daemon, this command-line application handles address and transaction management. <br />
**dcrctl**: The remote procedure call (RPC) client, this command-line application is used to control dcrd and dcrwallet via RPC commands. <br />
**Decrediton**: Cross-platform GUI client as of v1.1.0.

|           | Paymetheus | dcrd | dcrwallet | dcrctl | Decrediton |
| ---------:|:----------:|:----:|:---------:|:------:|:-----------:|
| Windows   | X          | X    | X         | X      |             |
| macOS     |            | X    | X         | X      | X           |
| Linux     |            | X    | X         | X      | X           |
| Other UNIX|            | X    | X         | X      |             |

"UNIX lainnya" saat ini mencakup berbagai *BSD dan Solaris/illumos.

Catatan: Anda mungkin akan segera melihat salah satu dari banyak perbedaan antara Decred dan Kripto lain yang populer: dompet daemon dan node daemon terpisah.
Banyak koin lain menjalankan fungsi ini bersama dalam satu daemon tunggal.
Bagi yang memilih menggunakan antarmuka baris perintah, ini berarti Anda harus
Jalankan `dcrd` untuk fungsi node penuh, dan `dcrwallet` untuk menyimpan DCR Anda,
Membuat transaksi dan berpartisipasi dalam penambangan/voting Proof-of-Stake.

---

## Panduan Pemasangan 

Untuk memulai, pilih opsi untuk pemasangan yang tersedia untuk sistem operasi Anda di bawah ini:

* [Paymetheus](/getting-started/user-guides/paymetheus.md)
* [Command Line Suite **via dcrinstall**](/getting-started/user-guides/cli-installation.md) - CATATAN: Metode `dcrinstall` adalah cara tercepat dan termudah untuk mendapatkan node baris perintah dan Dompet aktif. Ini disarankan dan panduan pengaturan jalur baris perintah di bawah akan menganggap Anda telah menggunakan metode ini.
* [Decrediton (ALPHA)](/getting-started/user-guides/decrediton-setup.md)

---

**CATATAN:** Semua panduan berikut dapat ditemukan di menu navigasi dengan nama yang sama.

## Jalur Paymetheus 

Panduan berikut, secara berurutan, akan membantu Anda memulai Paymetheus:

* [Paymetheus Setup](/getting-started/user-guides/paymetheus.md)
* [Using Paymetheus](/getting-started/user-guides/using-paymetheus.md)

## Jalur Decrediton

Panduan berikut akan membantu Anda memuat Decrediton:

* [Decrediton Setup](/getting-started/user-guides/decrediton-setup.md)

## Jalur baris Perintahh 

Panduan berikut, secara berurutan, akan membantu Anda memulai Aplikasi baris perintah (`dcrd`, `dcrwallet`, `dcrctl`):

* [Command-Line Differences](/getting-started/cli-differences.md)
* [Startup Option Basics](/getting-started/startup-basics.md)
* [dcrd Setup](/getting-started/user-guides/dcrd-setup.md)
* [dcrwallet Setup](/getting-started/user-guides/dcrwallet-setup.md)
* [dcrctl Basic Usage](/getting-started/user-guides/dcrctl-basics.md)

## Panduan Umum 

Panduan berikut secara independen ada pada aplikasi yang berbeda:

* [Using Testnet](/getting-started/using-testnet.md)
* [Obtaining DCR](/getting-started/obtaining-dcr.md)
* [Using the Block Explorer](/getting-started/using-the-block-explorer.md)
* [Proof-of-Stake Guide](/mining/proof-of-stake.md)
* [Mainnet Voting Guide](/getting-started/user-guides/agenda-voting.md)
