# Dasar-dasar Pengaturan

Panduan ini terakhir diperbarui untuk v1.0.0

---

Panduan ini berlaku untuk pengguna aplikasi baris perintah. Pengguna Paymetheus dan Decrediton dapat dengan aman mengabaikan penggunaan berkas konfigurasi - Paymetheus dan Decrediton keduanya menangani konfigurasi dasar secara otomatis. Perlu dicatat juga bahwa beberapa panduan kami menunjukkan pengaturan berkas konfigurasi dan panduan lainnya menunjukkan bendera perintah pengaturan.

---

## Lokasi Berkas Konfigurasi

Semua perangkat lunak Decred, saat dimulai, membaca dari berkas konfigurasi untuk menentukan pengaturan mana yang harus diaktifkan / dinonaktifkan / ditetapkan selama pemuatan awal tersebut. Semua bendera pengaturan baris perintah `(e.g. dcrwallet --testnet)` dapat diganti dengan pengaturan dalam berkas konfigurasi yang sesuai `(e.g. dcrwallet --testnet could be replaced by testnet=1 in dcrwallet.conf)`.

These configuration files are located within the application home directory of the application. The location of these default home directories for Windows, macOS, and Linux are listed below:

Windows:

    C:\Users\<username>\AppData\Local\Dcrwallet\
    C:\Users\<username>\AppData\Local\Dcrd\
    C:\Users\<username>\AppData\Local\Dcrctl\ 
    C:\Users\<username>\AppData\Local\Decred\Paymetheus

macOS: 

    ~/Library/Application Support/Dcrwallet/
    ~/Library/Application Support/Dcrd/
    ~/Library/Application Support/Dcrctl/
    ~/Library/Application Support/decrediton/
    
Linux: 
    
    ~/.dcrwallet/
    ~/.dcrd/
    ~/.dcrctl/
    ~/.config/decrediton

Masing-masing folder ini diperbolehkan dengan berkas `.conf` sendiri, dinamai sesuai aplikasi individual (`e.g. dcrd uses dcrd.conf`). Harap perhatikan juga bahwa direktori home `Dcrd` dan `Dcrwallet` dibuat secara otomatis saat setiap aplikasi diluncurkan. Anda harus membuat direktori home `Dcrctl` secara manual untuk memanfaatkan berkas konfigurasi.

Metode instalasi [dcrinstall](/getting-started/user-guides/cli-installation.md) secara otomatis membuat berkas konfigurasi, dengan [minimum configuration settings](/advanced/manual-cli-install.md#minimum-configuration) Sudah diaktifkan 

Metode [Manual Installation](/advanced/manual-cli-install.md#installation) mencakup contoh berkas konfigurasi dalam .zip/.tar.gz. Dianjurkan untuk menyalin berkas konfigurasi ini ke direktori yang sesuai dengan yang dijelaskan di atas, dan ganti nama untuk menghapus 'sample-'. Berkas-berkas ini memiliki banyak pengaturan berkomentar (komentar tidak dibaca oleh program selama waktuaktif) sehingga semua pengaturan ini dinonaktifkan secara efektif. Anda dapat mengaktifkan setelan pra-tulisan ini dengan hanya menghapus titik dua titik awal sebelum baris.

---

## Bendera Perintah Pengaturan

Sebagian besar pengaturan yang dapat Anda atur melalui berkas konfigurasi juga dapat diberikan kepada aplikasi sebagai parameter saat peluncuran. Misalnya, perintah khusus OS berikut akan membuka `dcrd` untuk penggunaan Testnet, sebuah alternatif untuk menggunakan `testnet=1` di berkas konfigurasi Anda:

    Windows: dcrd.exe --testnet
    macOS: ./dcrd --testnet
    Linux: ./dcrd --testnet

Contoh di atas awalnya akan melihat berkas konfigurasi `dcrd` untuk pengaturan dan kemudian melihat ke perintah eksekusi untuk mengaktifkan pengaturan testnet. 

---

## Penggunaan Lanjutan

[Menyimpan Rincian Masuk di Berkas Config](/advanced/storing-login-details.md) <!-- Ini memiliki informasi yang sama dengan yang ditemukan di bagian Konfigurasi Minimum di atas. Bisa hapus. -->

[Daftar Lengkap Pilihan untuk Setiap Aplikasi](/advanced/program-options.md)
