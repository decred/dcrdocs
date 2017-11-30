# Panduan Pemasangan dcrwallet 

Terakhir diperbarui untuk v1.0.0.

Panduan ini ditujukan untuk membantu Anda menyiapkan aplikasi `dcrwallet` menggunakan [flag startup](/getting-started/startup-basics.md#startup-command-flags). 

**Prasyarat:**

- Gunakan [dcrinstall](/getting-started/user-guides/cli-installation.md) untuk memasang `dcrwallet`. Langkah tambahan akan diperlukan jika metode instalasi lain digunakan.
- Review how the launch commands differ for the Command Prompt (Windows) and Bash (macOS/Linux) shells, and how the home directories differ [here](/getting-started/cli-differences.md).
- [Setup dcrd](/getting-started/user-guides/dcrd-setup.md) dan jalankan di latar belakang.

---

`dcrwallet` adalah daemon yang menangani fungsi dompet Decred untuk satu pengguna. Daemon ini mengelola semua akun, alamat, dan transaksi Anda; Melacak saldo di semua alamat; Dan memungkinkan pemangku kepentingan untuk berpartisipasi dalam pemungutan suara Proof-of-Stake.

Untuk menjalankan `dcrwallet`, `wallet.db` harus ada dalam direktori home `dcrwallet` . In order for that file to exist, you must create a new wallet. `dcrinstall` automatically starts the creation process. If you delete your wallet.db or used another installation process, you'll have to run the [manual wallet creation command](#manual-wallet-creation-command).

---

## Informasi Penting 

Selama proses pembuatan dompet Anda, Anda akan diberi 33 urutan kata yang dikenal sebagai frasa seed. Frasa seed ini pada dasarnya adalah kunci pribadi untuk dompet Anda. Anda dapat menggunakan frasa seed ini untuk mengembalikan kunci pribadi, riwayat transaksi, dan saldo Anda menggunakan dompet Decred apapun pada komputer mana pun. 

Hal ini pada akhirnya berarti bahwa siapa saja yang mengetahui seed Anda dapat menggunakannya untuk mengembalikan kunci pribadi, riwayat transaksi, dan saldo ke dompet Decred di komputer mereka tanpa sepengetahuan Anda. Untuk alasan ini, sangat penting untuk menjaga frasa seed Anda tetap aman. Perlakukan benih ini dengan cara yang sama seperti Anda akan memperlakukan kunci fisik ke brankas. Jika Anda kehilangan frasa seed, Anda secara permanen akan kehilangan akses ke dompet anda dan semua dana di dalamnya. Dompet Anda tidak dapat dipulihkan oleh siapapun, termasuk pengembang Decred sendiri. Dianjurkan bagi Anda untuk menuliskannya di atas kertas dan menyimpannya di tempat yang aman. Jika Anda memutuskan untuk menyimpannya di komputer Anda, akan lebih baik menyimpannya dalam dokumen yang dienkripsi (jangan lupa kata sandinya) jika misal berkas atau komputer Anda dicuri.

Setiap frasa seed juga dikaitkan dengan heks seed 64 karakter. Fungsi seed hex sama seperti frasa seed - `dcrwallet` akan menerimanya saat mencoba mengembalikan dompet Anda. Hal ini juga penting untuk menjaga seed heks Anda tetap aman.

**PENGINGAT: DILARANG, DALAM KEADAAN APAPUN, MEMBERIKAN SEED ATAU HEKS TERKAIT KEPADA SIAPA PUN! TIDAK SEKALIPUN KEPADA PIHAK PENGEMBANG!**

---

## Perintah Manual Pembuatan Dompet

Jika Anda belum memiliki berkas `wallet.db` yang tersimpan dalam direktori home `dcrwallet` , Anda harus menjalankan perintah `dcrwallet --create` . Langkah-langkah untuk ini dapat ditemukan di bawah ini. 

1. Buka jendela shell baru (Bash/teks perintah/etc, ..).
2. Arahkan ke direktori `dcrwallet` yang dapat dieksekusi.
3. Masukkan perintah `dcrwallet --create` (tinjau Prasyarat di atas jika Anda tidak yakin apa yang harus Anda gunakan `./dcrwallet` or `dcrwallet.exe` untuk perintah sebelumnya).

---

## Wallet Creation Walkthrough 

Selama proses ini, Anda akan menetapkan frasa sandi pribadi, secara opsional menetapkan frasa sandi publik, dan mencatat seed Anda. Untuk melakukannya, ikuti langkah-langkah berikut:

> Tetapkan frasa sandi untuk Dompet Anda

Jika perintah `dcrwallet --create` berhasil dijalankan, Anda akan disambut dengan teks berikut ini:

```no-highlight
Enter the private passphrase for your new wallet:
```

Frasa sandi pertama, frasa sandi pribadi, akan Anda gunakan untuk membuka dompet Anda saat membuat transaksi atau memungut suara dengan Proof-of-Stake. Mohon gunakan kata sandi yang unik dan kuat. Kata sandi ini juga melindungi kunci pribadi dalam berkas dompet Anda, mengamankannya dari pencurian.

Setelah Anda memverifikasi frasa sandi pribadi, Anda akan melihat teks berikut ini:

```no-highlight
Do you want to add an additional layer of encryption for public data? (n/no/y/yes) [no]:
```

Frasa sandi publik bersifat opsional. Ini digunakan untuk mengenkripsi semua data publik (transaksi dan alamat) di dalam berkas dompet Anda sehingga jika berkas dicuri, pencuri tidak dapat menghubungkan Anda dengan transaksi Anda. 

> Rekam seed Anda

Sebelum membuat seed baru untuk dompet Anda, mohon tinjau bagian [Bagian Informasi Penting](/getting-started/user-guides/dcrwallet-setup.md#critical-information).

Setelah Anda menetapkan frasa sandi pribadi dan frasa sandi publik, Anda akan melihat teks berikut:

```no-highlight
Do you have an existing wallet seed you want to use? (n/no/y/yes) [no]:
```

Panduan ini mengasumsikan Anda tidak memiliki seed yang ada, maka lanjutkan dengan menekan `Enter` yang akan menjawab teks dengan standar `[no]`. CATATAN: Jika Anda ingin mengembalikan dompet Anda dengan menggunakan seed Anda, Anda cukup memasukkan `[yes]` di sini dan ikuti petunjuk di layar.

<i class="fa fa-exclamation-triangle"></i> **JANGAN GUNAKAN SEED YANG SAMA DI BANYAK DOMPET! Kunjungi [Wallets and Seeds FAQ](/faq/wallets-and-seeds.md#3-can-i-run-multiple-wallets) untuk melihat mengapa hal ini penting. Disarankan bagi Anda agar sedapat mungkin dompet baru berarti menghasilkan seed baru.** 

Setelah menjawab `[no]`, frasa seed Anda (wallet generation seed) dan hex-nya akan ditampilkan di jendela. Silahkan baca bagian PENTING yang ditampilkan segera setelah Hex.

Tidak dapat ditekankan seberapa penting untuk menyelamatkan frasa seed Anda di lokasi yang aman, jadi jika Anda tidak melakukan hal ini terhadap memori, silakan tinjau [Bagian Informasi Penting](/getting-started/user-guides/dcrwallet-setup.md#critical-information) lagi.

Setelah Anda menuliskan frasa seed dan hex, ketik `OK` dan tekan `Enter`. CATATAN: Jika Anda tidak menuliskan frasa sebelum melanjutkan, Anda harus [memulai proses ini](/getting-started/user-guides/dcrwallet-setup.md#create-a-new-wallet) setelah [deleting your wallet file](/advanced/deleting-your-wallet.md)

Setelah menekan `Enter`, Anda akan melihat pesan berikut:

```no-highlight
Creating the wallet...
The wallet has been created successfully.
```

Dompet kemudian akan dibuat. Ini mungkin memakan waktu beberapa menit jika Anda memiliki komputer yang lambat.

---

## Meluncurkan dcrwallet 

Untuk meluncurkan `dcrwallet`, Anda harus terlebih dahulu [membuat dompet Anda](#wallet-creation-walkthrough) dan
[connected dcrd to the Decred network](/getting-started/user-guides/dcrd-setup.md#connect-to-the-decred-network).

> Konfigurasikan Nama pengguna dan Kata sandi RPC

Jika Anda menggunakan [`dcrinstall`](/getting-started/user-guides/cli-installation.md), berkas konfigurasi Anda sudah disiapkan dengan nama pengguna/kata sandi RPC untuk `dcrd`, `dcrwallet`, dan `dcrctl`.

Jika Anda tidak menggunakan `dcrinstall`, Anda harus mengaktifkan pengaturan minimum pada berkas konfigurasi Anda. Ikuti [panduan ini](/advanced/manual-cli-install.md#minimum-configuration) untuk melakukannya.

> Mulai dcrwallet

Dengan berkas konfigurasi yang ditetapkan dengan benar, buka jendela shell lain di direktori Decred Anda (atau gunakan jendela terakhir jika Anda baru saja membuat dompet Anda). Ketik perintah berikut (tinjau prasyarat panduan ini untuk menentukan perintah yang tepat untuk aplikasi OS/Shell Anda):

```no-highlight
dcrwallet
```

`dcrwallet` Anda sekarang akan terhubung ke jaringan melalui `dcrd`. Ini akan mulai memindai jaringan untuk alamat aktif Anda yang dapat memakan waktu beberapa menit di komputer yang lambat. Akhirnya akan mulai menunjukkan garis seperti:

```no-highlight
[INF] WLLT: Connecting block 0000000000002004ea8fa74af334cb291a22832642b5be603995683534bbb97b, height 9990
```

Ini berarti dompet Anda berhasil terhubung ke jaringan
Melalui daemon

---

Untuk mempelajari cara menggunakan `dcrd` dan  `dcrwallet`, kunjungi panduan [dcrctl Basics](/getting-started/user-guides/dcrctl-basics.md) Anda akan belajar cara membuka dompet Anda, mengirim dan menerima DCR menggunakan `dcrctl`, memeriksa saldo Anda, dan memeriksa berbagai statistik jaringan.
