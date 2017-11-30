# Simnet 

---

## Ikhtisar 

Saat mengembangkan aplikasi Decred atau menguji perubahan potensial, seringkali memiliki jaringan uji sangat berguna di mana tingkat kesulitannya cukup rendah untuk menghasilkan blok sesuai kebutuhan.

Untuk memfasilitasi skenario ini, dcrd menyediakan jaringan simulasi (`--simnet`).  Berikut ini adalah gambaran besar tentang sifat terpenting yang membedakannya dari jaringan utama:

* Kesulitan dimulai sangat rendah untuk memungkinkan penambangan blok CPU cepat
* Perubahan jaringan:
    * All code related to peer discovery and IP address dissemination is disabled to help ensure the network remains private
    * Port jaringan peer dan RPC berbeda
    * Kumpulan byte jaringan yang unik digunakan dalam protokol pesan peer-to-peer sehingga blok tidak dapat disilangkan secara tidak sengaja dengan jaringan utama.
* Semua rantai dan parameter alamat pembayaran unik untuk mencegah kebingungan dengan jaringan utama:
    * Blok genesis yang berbeda
    * Alamat pembayaran diawali dengan prefiks yang berbeda:
        * Standard pay-to-pubkeyhash (P2PKH) dimulai dengan huruf `S`
        * Standard pay-to-scripthash (P2SH) dimulai dengan huruf `s`
    * Kunci perluasan deterministik hierarkis yang diekspor (BIP32) dimulai dengan awalan yang berbeda:
        * Kunci umum diperpanjang dimulai dengan `spub`
        * Kunci extended pribadi dimulai dengan `sprv`
    * Jenis koin BIP44 yang digunakan pada jalur kunci HD adalah huruf kecil `s`

  ---

## Mulai 

Menjalankan satu node `dcrd` di simnet hanya dengan memulai `dcrd` with the `--simnet` .  Namun, agar benar-benar berguna, Anda biasanya ingin mengirim koin di antara alamat yang menyiratkan bahwa blok perlu ditambang dan dihubungkan dengan dompet akan dibutuhkan.

Selain itu, karena secara efektif tidak ada koin pada jaringan pribadi yang baru, serangkaian blok awal perlu ditambang yang membayar ke alamat yang Anda miliki sehingga ada koin yang bisa digunakan untuk dibelanjakan.

Seperti yang telah disebutkan sebelumnya, simnet menggunakan alamat unik untuk mencegah kebingungan dengan jaringan utama. Jadi, itu berarti dompet yang mendukung format alamat yang harus digunakan. Untuk ini, `dcrwallet` dengan bendera `--simnet` dapat digunakan.

Berikut ini adalah rujukan perintah untuk melanjutkan:

**CATATAN: Semua perintah ini dapat disederhanakan dengan membuat berkas konfigurasi dan memanfaatkannya, namun perintah di sini menggunakan semua tombol pada baris perintah untuk menunjukkan dengan tepat apa yang dibutuhkan untuk masing-masing.**

* Mulai dcrd pada simnet:

    `$ dcrd --simnet --rpcuser=<username> --rpcpass=<password>`

* Buat dompet simnet baru:

    `$ dcrwallet --simnet --create`

* Mulai dcrwallet di simnet:

    `$ dcrwallet --simnet --username=<username> --password=<password>`

* Buat Alamat Decred simnet baru:

    `$ dcrctl --simnet --wallet --rpcuser=<username> --rpcpass=<password> getnewaddress`

* Hentikan proses dcrd awal dan mulai ulang dengan alamat pertambangan yang disetel ke keluaran dari perintah sebelumnya:

    `$ dcrd --simnet --rpcuser=<username> --rpcpass=<password> --miningaddr=<S....>`

* Instruksikan dcrd untuk menghasilkan cukup blok awal untuk basis koin pertama yang akan jatuh tempo:

    `$ dcrctl --simnet --rpcuser=<username> --rpcpass=<password> generate 100`

* Periksa saldo dompet untuk memastikan koin tersedia:

    `$ dcrctl --simnet --wallet --rpcuser=<username> --rpcpass=<password> getbalance`
  
Pada titik ini, ada simnet pribadi yang berfungsi penuh dengan koin yang tersedia untuk dikirim ke alamat simnet lainnya. Setiap kali satu atau lebih transaksi dikirim, sebuah `generate 1` RPC harus dikeluarkan untuk menambang blok baru dengan transaksi yang disertakan..
