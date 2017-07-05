# Panduan Pemasangan Decrediton 

Terakhir diperbarui untuk v1.0.0.

---

`Decrediton` iadalah antarmuka pengguna grafis untuk `dcrwallet`.  Saat peluncuran aplikasi ini, secara otomatis memulai contoh `dcrd` and `dcrwallet` di latar belakang - tidak akan terbuka jika sudah ada contoh `dcrd` yang sedang berjalan.

CATATAN: Jika suatu saat program menjadi tidak responsif atau terjebak pada layar pemuatan, ini biasanya dapat diperbaiki dengan restart aplikasi.

---

## Unduh dan pasang 

Decrediton is released with the Binary Releases and can be found here: [https://github.com/decred/decred-binaries/releases/tag/v1.1.0](https://github.com/decred/decred-binaries/releases/tag/v1.1.0). As of v1.1.0, Decrediton is only available for Linux and macOS.

> macOS

1. Download the `decrediton-1.1.0.dmg` file.

2. Double click the `decrediton-1.1.0.dmg` file once downloaded to mount the disk image.

3. Tarik decrediton.app ke dalam link ke folder Applications Anda di dalam gambar disk.

> Linux

1. Download the `decrediton-1.1.0.tar.gz` file.

2. Arahkan untuk mendownload lokasi dan ekstrak berkas .tar.gz :

    Browser File Ubuntu: cukup klik kanan pada file .tar.gz dan tekan "Extract Here". <br />
    Terminal: gunakan perintah `tar -xvzf filename.tar.gz` .

    Both of these should extract the tar.gz into a folder that shares the same name. (`e.g. tar -xvzf decrediton-v1.1.0.tar.gz` should extract to `decrediton-v1.1.0`). If successful, this new folder should include a `decrediton` executable.

---

## Informasi Kritis 

Selama proses pembuatan dompet Anda, Anda akan diberi urutan 33 kata yang dikenal sebagai frasa seed. Frasa seed ini pada dasarnya adalah kunci pribadi untuk dompet Anda. Anda dapat menggunakan frasa seed ini untuk mengembalikan kunci pribadi, riwayat transaksi, dan saldo Anda menggunakan Decred apapun pada komputer mana pun.

Hal ini berarti bahwa siapa saja yang mengetahui seed Anda dapat menggunakannya untuk mengembalikan kunci pribadi, riwayat transaksi, dan saldo ke dompet terdampar di komputer mereka tanpa sepengetahuan Anda. Untuk alasan ini, sangat penting untuk menjaga frasa seed Anda tetap aman. Perlakukan benih ini dengan cara yang sama seperti Anda akan memperlakukan kunci fisik ke brankas. Jika Anda kehilangan frasa seed, Anda akan kehilangan akses ke dompet dan semua dana di dalamnya. Tidak dapat dipulihkan oleh siapapun, termasuk pengembang yang terdesak. Dianjurkan Anda menuliskannya di atas kertas dan menyimpannya di tempat yang aman. Jika Anda memutuskan untuk menyimpannya di komputer Anda, akan lebih baik menyimpannya dalam dokumen yang dienkripsi (jangan lupa kata sandinya) jika file atau komputer Anda dicuri.

**PENGINGAT: JANGAN, DALAM KEADAAN APA PUN, MEMBERIKAN SEED ATAU KUNCI HEX TERKAIT KEPADA SIAPA PUN! BAHKAN KE PENGEMBANG SEKALIPUN!**

---

## Membuat Dompet Baru 

Setelah mengklik "OK, I Understand" ke disclaimer, Anda akan melihat dialog "Create a Wallet".

Dialog "Buat Dompet" default ke opsi "Seed Baru". Cukup klik "Seed yang Ada" jika Anda sudah memiliki benih yang ingin Anda gunakan, dan ikuti langkah-langkah yang disajikan di sana. Panduan ini mengasumsikan Anda tidak memiliki seed dan akan terus menggunakan opsi "New Seed". Harap tinjau [Critical Information](#critical-information) tentang seed di atas.

1. Catat benih yang ditampilkan di kotak teks (Anda perlu memasukkannya kembali di layar berikutnya).

2. Tekan "Continue"

3. Konfirmasikan seed Anda, dan buat passphrase wallet pribadi. Frasa sandi ini akan digunakan untuk membuka dompet Anda saat membuat transaksi.

4. Tekan "Buat Dompet"

5. Anda kemudian harus melihat lingkaran biru berputar. Ini akan berputar sampai `dcrd` telah menyinkronkan rantai blok sepenuhnya. Pada komputer yang tidak memiliki `dcrd` yang dimuat pada mereka, ini memerlukan waktu 1-2 jam dengan perangkat keras yang lebih baru (mungkin diperlukan waktu lebih lama dengan perangkat keras lama). Anda dapat memeriksa aplikasi pemantau proses Anda untuk menjalankan contoh `dcrd` - jika menggunakan sebagian besar CPU Anda, itu adalah sinkronisasi. Jika tidak, Decrediton mungkin memerlukan restart untuk bergerak di luar layar ini.

## Membuka Wallet 

Setelah rantai blok disinkronkan, Anda harus melihat halaman "Opening Wallet". Di sini, Anda harus memasukkan frasa sandi pribadi dan dompet akan menelusuri ulang blok baru-baru ini untuk transaksi yang termasuk dalam alamat Anda. Tunggu sampai progress bar terisi. Decrediton kemudian harus memuat halaman Ikhtisar dengan Saldo yang Tersedia dan Transaksi Terakhir Anda ditampilkan.

---
