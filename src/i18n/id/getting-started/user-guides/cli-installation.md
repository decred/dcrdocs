# Panduan Instalasi CLI  

Halaman ini terakhir diperbarui untuk v1.0.1.

---

## dcrinstall 

`dcrinstall` adalah metode yang disarankan untuk memasang alat antarmuka baris perintah Decred `dcrd`, `dcrwallet`, dan `dcrctl`.

`dcrinstall` is an automatic installer and upgrader for the Decred software. The newest release can be found here: [https://github.com/decred/decred-release/releases/tag/v1.1.0](https://github.com/decred/decred-release/releases/tag/v1.1.0). Binaries are provided for Windows, macOS, Linux, OpenBSD, and FreeBSD. Executing installer will install `dcrd`, `dcrwallet`, and `dcrctl`. Instructions are provided for macOS, Linux, and Windows below (assumed proficiency for *BSD users).

`dcrinstall` secara otomatis akan mengunduh paket biner yang telah dikompilasi yang ada di GitHub, memverifikasi tanda tangan dari paket ini, menyalin biner dalam paket ke folder tertentu yang bergantung pada OS, membuat berkas konfigurasi dengan pengaturan agar 3 aplikasi dapat berkomunikasi dengan satu sama lain, dan menjalankan Anda melalui proses penciptaan dompet. Setelah menjalankan `dcrinstall`, Anda akan dapat meluncurkan perangkat lunak tanpa konfigurasi tambahan.

> macOS:

1. Unduh berkas yang benar:

    For 32-bit computers, download the `dcrinstall-darwin-386-v1.1.0` file. <br />
    For 64-bit computers, download the `dcrinstall-darwin-amd64-v1.1.0` file.

2. Buat dcrinstall-darwin-xxxx-vx.x.x sehingga bisa digunakan di dalam terminal Anda, dan jalankan:

    Arahkan ke direktori tempat berkas dcrinstall diunduh menggunakan perintah `cd` jalankan chmod dengan mode u+x pada berkas dcrinstall, dan jalankan berkas yang bisa digunakan yang tadi dibuat. Berikut adalah contoh perintah (ubah direktori atau nama berkas sesuai kebutuhan):
    
    `cd ~/Downloads/` <br />
    `chmod u+x dcrinstall-darwin-amd64-v1.1.0` <br />
    `./dcrinstall-darwin-amd64-v1.1.0`
    
3. Biner yang dapat digunakan untuk `dcrd`, `dcrwallet`, dan `dcrctl` sekarang dapat ditemukan di direktori `~/decred/` Sebelum proses `dcrinstall` selesai, Anda akan dibawa ke teks pembuatan dompet. Ikuti langkah-langkah di dalam [Pembuatan Dompet Pembuatan](/getting-started/user-guides/dcrwallet-setup.md#wallet-creation-walkthrough) of the dcrwallet Setup guide to finish.

> Linux:

1. Unduh berkas yang benar:

    For 32-bit computers, download the `dcrinstall-linux-386-v1.1.0` file. <br />
    For 64-bit computers, download the `dcrinstall-linux-amd64-v1.1.0` file. <br />
    For 32-bit ARM computers, download the `dcrinstall-linux-arm-v1.1.0` file. <br />
    For 64-bit ARM computers, download the `dcrinstall-linux-arm64-v1.1.0` file.

2. Buat dcrinstall-linux-xxxx-vx.x.x sebuah berkas yang bisa dieksekusi di dalam terminal Anda, dan jalankan:

    Arahkan ke direktori tempat berkas dcrinstall diunduh menggunakan perintah `cd` , jalankan chmod dengan mode u+x pada file dcrinstall, dan jalankan berkas yang bisa dieksekusi yang tadi dibuat. Berikut adalah contoh perintah (ubah direktori atau nama berkas sesuai kebutuhan):
    
    `cd ~/Downloads/` <br />
    `chmod u+x dcrinstall-linux-amd64-v1.1.0` <br />
    `./dcrinstall-linux-amd64-v1.1.0`
    
3. Biner untuk `dcrd`, `dcrwallet`, dan `dcrctl` sekarang dapat ditemukan di direktori `~/decred/` . Sebelum proses `dcrinstall` selesai, Anda akan dibawa ke teks pembuatan dompet. Ikuti langkah-langkah di dalam [Pembuatan Dompet Pembuatan](/getting-started/user-guides/dcrwallet-setup.md#wallet-creation-walkthrough) panduan penyiapan dcrwallet untuk menyelesaikannya.

> Windows:

1. Unduh berkas yang benar:

    For 32-bit computers, download the `dcrinstall-windows-386-v1.1.0.exe` file. <br />
    For 64-bit computers, download the `dcrinstall-windows-amd64-v1.1.0.exe` file. <br />

2.  Jalankan file executable dcrinstall.

    Anda dapat mengklik dua kali atau menjalankannya dari Command Prompt. 
    
3. Binari untuk `dcrd`, `dcrwallet`, dan `dcrctl` sekarang dapat ditemukan di `%HOMEPATH%\decred\` directory (usually %HOMEPATH% is `C:\Users\<username>`). Sebelum proses `dcrinstall` selesai, Anda akan dibawa ke prompt pembuatan dompet. Ikuti langkah-langkah di dalam [Pembuatan Dompet Pembuatan](/getting-started/user-guides/dcrwallet-setup.md#wallet-creation-walkthrough) panduan penyiapan dcrwallet untuk menyelesaikannya.
