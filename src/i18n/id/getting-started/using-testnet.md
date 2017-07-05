# Menggunakan Testnet Guide

Terakhir diperbarui untuk testnet2

---

## Mengapa Menggunakan Testnet?

Testnet adalah tempat yang indah dimana anda bisa bereksperimen dengan aplikasi yang terdesak tanpa khawatir bahwa ada kesalahan yang akan merugikan anda dengan uang sungguhan. Sebaiknya orang menggunakan testnet untuk mempelajari dasar-dasar perangkat lunak yang dirusak dan fitur baru apa pun.

Decred saat ini berada di Testnet kedua mereka, juga dikenal sebagai testnet2. Testnets diatur ulang secara berkala untuk membantu menjaga ukuran file blockchain yang dapat dikelola. 

---

## Bagaimana Menjalankan Testnet Node

Menjalankan simpul testnet2 sangatlah mudah. Aplikasi pilihan anda perlu mengunduh blockchain testnet2, dan Anda perlu membuat file dompet baru untuk penggunaan testnet2. File blockchain dan wallet utama Anda tetap tidak tersentuh. Beralih di antara keduanya sangat mudah.

---

## Paymetheus

Untuk meluncurkan `Paymetheus` di testnet2, cukup jalankan aplikasi `Decred Testnet` bukan aplikasi `Decred` biasa. Anda kemudian akan melalui proses pembuatan dompet (langkah yang sama di [panduan panduan Paymetheus](/getting-started/user-guides/paymetheus.md)). Setelah `dcrd` selesai disinkronkan di latar belakang, anda kemudian dapat mengisi dompet `Paymetheus` anda dengan testnet DCR dan membiasakan diri dengan perangkat lunak.

---

## Decrediton 

Untuk meluncurkan `Decrediton` di testnet2, anda harus meluncurkan `Decrediton` dari baris perintah dengan flag `--testnet` . Ingatlah bahwa menggunakan bendera sekali akan membuatnya selalu dimulai dalam mode itu sampai anda menggunakan bendera `--mainnet` untuk beralih kembali ke mainnet blockchain.

Untuk Linux, 

1. Buka terminal anda dan arahkan ke direktori dengan decrediton executable.
2. Terbitkan perintah `./decrediton --testnet`.
3. Decrediton akan memulai dan mencoba terhubung ke testnet2.

For macOS,

1. Buka terminal anda dan jalankan perintah berikut: `/Applications/decrediton.app/Contents/MacOS/decrediton --testnet`
2. Decrediton akan memulai dan mencoba terhubung ke testnet2.

Ingat, jika anda ingin mengganti Decrediton kembali ke mainnet, anda harus mengeluarkan perintah tersebut dengan bendera `--mainnet` .

___ 

## Command-Line Suite

Untuk meluncurkan `dcrd` dan `dcrwallet` di testnet, cukup tambahkan bendera `--testnet` ke perintah peluncuran anda. Sebagai alternatif, anda bisa meletakkan `testnet=1` di semua file konfigurasi anda, tapi biasanya lebih cepat menggunakan flag startup.

Pada peluncuran pertama `dcrd --testnet`, `dcrd` akan mulai mendownload blockchain testnet2 ke folder `data/testnet2` pada direktori home `dcrd` .

Sebelum anda dapat meluncurkan `dcrwallet` dengan flag `--testnet` , anda harus membuat dompet testnet terpisah menggunakan perintah `dcrwallet --testnet --create` . Langkahnya sama seperti yang ditemukan di [Panduan Pemasangan dcrwallet](/getting-started/user-guides/dcrwallet-setup.md). 

Untuk mengeluarkan perintah ke `dcrwallet` dan `dcrd`, anda juga harus menambahkan flag `--testnet` ke salah satu perintah `dcrctl` yang Anda gunakan. Misalnya, anda akan mengeluarkan perintah `dcrctl --testnet --wallet getbalance` untuk memeriksa saldo testnet anda. 

---

## Mendapatkan Koin Testnet

Anda bisa mendapatkan koin melalui [Decred Testnet Faucet](https://faucet.decred.org).  Mohon kembalikan koin ke alamat yang tercantum di bagian bawah halaman tersebut saat anda selesai bermain dengan testnet.

---

