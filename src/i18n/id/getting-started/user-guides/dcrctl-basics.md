# Dcrctl Dasar-dasar 

Terakhir diperbarui untuk v1.0.0.

Panduan ini ditujukan untuk membantu Anda mempelajari perintah dasar aplikasi `dcrctl` dengan menggunakan [berkas konfigurasi minimal](/advanced/manual-cli-install.md#minimum-configuration). 

**Prasyarat:**

- Gunakan [dcrinstall](/getting-started/user-guides/cli-installation.md) untuk memasang `dcrctl`. Langkah tambahan akan diperlukan jika metode instalasi lain digunakan.
- Review how the launch commands for the Command Prompt (Windows) and Bash (macOS/Linux) shells differ [here](/getting-started/cli-differences.md).
- [Setup dcrd](/getting-started/user-guides/dcrd-setup.md) dan jalankan di latar belakang.
- [Setup dcrwallet](/getting-started/user-guides/dcrwallet-setup.md) dan jalankan di latar belakang.

---

`dcrctl` adalah klien yang mengendalikan `dcrd` dan `dcrwallet` melalui remote procedure call (RPC). Anda dapat menggunakan `dcrctl` untuk banyak hal seperti memeriksa saldo Anda, membeli tiket, membuat transaksi, dan melihat informasi jaringan.

**PENGINGAT:** Panduan ini menggunakan contoh OS-agnostik untuk perintah. Tinjau prasyarat untuk menentukan apakah Anda harus menggunakan `./dcrctl` atau `dcrctl.exe` dan bukan `dcrctl`.

---

> Konfigurasikan Nama pengguna dan Kata sandi RPC

Perintah yang dikirim ke `dcrd` atau `dcrwallet` akan meminta nama pengguna/kata sandi RPC untuk dipasang pada berkas konfigurasi.

Jika Anda menggunakan [`dcrinstall`](/getting-started/user-guides/cli-installation.md), berkas konfigurasi Anda sudah disiapkan dengan nama pengguna/kata sandi RPC untuk `dcrd`, `dcrwallet`, dan `dcrctl`.

Jika Anda tidak menggunakan `dcrinstall`,Anda harus mengaktifkan pengaturan minimum pada berkas konfigurasi Anda. Ikuti [panduan ini](/advanced/manual-cli-install.md#minimum-configuration) untuk melakukannya.

---

## Perintah dcrctl

Anda perlu menjalankan perintah dcrctl di jendela shell yang terpisah (Teks Perintah/Bash).

Untuk mengeluarkan perintah ke `dcrwallet`, nda perlu menggunakan `dcrctl --wallet <command>`.

Untuk mengeluarkan perintah ke `dcrd`, Anda perlu menggunakan `dcrctl <command>`.

Untuk melihat daftar lengkap perintah yang `dcrctl` dapat dikirim ke `dcrd` dan `dcrwallet`, jalankan perintah berikut di shell Anda:

```no-highlight
dcrctl -l
```

Ini akan mengembalikan daftar perintah yang sangat panjang, dipisahkan oleh aplikasi. Perintah pada bagian atas adalah untuk `dcrd` dan perintah di bagian bawah adalah untuk `dcrwallet`. Anda dapat mengetahui lebih lanjut tentang perintah individu dengan mengetikkan perintah `dcrwallet` berikut ini:

```no-highlight
dcrctl help --wallet <command>
```

or the following for `dcrd` commands:

```no-highlight
dcrctl help <command>
```

---

## Membuka kunci Dompet Anda

Beberapa fungsi `dcrwallet` mengharuskan dompet dibuka.

Perintah untuk membuka dompet Anda berikut ini: 

```no-highlight
dcrctl --wallet walletpassphrase <private passphrase set during wallet creation> 0
```

Di sini, kami menentukan `dcrctl` untuk mengirim perintah ke `dcrwallet` dengan menggunakan bendera `--wallet` . Perintah sebenarnya adalah `walletpassphrase` yang menerima dua parameter, frasa sandi pribadi Anda dan batas waktu. Menentukan `0` untuk batas waktu membuka `dcrwallet` tanpa batas waktu. Namun perlu dicatat bahwa ini hanya untuk membuka dompet untuk sesi saat ini. Jika Anda menutup jendela yang sedang membuka dompet, atau menghentikan/memulai ulang `dcrwallet`,  Anda perlu membukanya lagi saat Anda memulainya lagi.

Jika perintah berhasil, Anda tidak akan mendapat konfirmasi dari `dcrctl`, tapi jika Anda melihat sesi `dcrwallet` Anda, itu akan berkata:

```no-highlight
[INF] RPCS: The wallet has been unlocked without a time limit.
```

CATATAN: Karena membuka diperlukan untuk banyak fungsi `dcrwallet`, `dcrwallet` dapat dimulai dengan bendera `--promptpass` atau pengaturan `promptpass=true` di `dcrwallet.conf` (dibahas [di sini](/advanced/storing-login-details.md#dcrwalletconf)).

---

## Memeriksa Saldo Anda

Untuk mengirim perintah `getbalance` ke `dcrwallet` menggunakan `dcrctl`, masukkan kode berikut ini di shell Anda:

```no-highlight
dcrctl --wallet getbalance
```

Ini akan mengembalikan semua saldo untuk semua akun Anda.

---

## Mendapatkan Alamat Penerima Baru

Untuk mengirim perintah `getnewaddress` ke `dcrwallet` menggunakan `dcrctl`, masukkan kode berikut ini di shell Anda:

```no-highlight
dcrctl --wallet getnewaddress
```

Ini akan menghasilkan dan mengembalikan alamat pembayaran baru. Untuk meminimalkan penggunaan ulang alamat, gunakan perintah ini untuk mendapatkan alamat baru untuk setiap transaksi yang ingin Anda terima.

---

## Mengirimkan DCR

Untuk mengirim DCR ke sebuah alamat, jalankan perintah `sendtoaddress` ke `dcrwallet` dengan menggunakan `dcrctl`. Masukkan kode berikut di shell Anda, isi alamat penerima dan jumlah yang akan dikirim:

```no-highlight
dcrctl --wallet sendtoaddress <address> <amount>
```

Jika berhasil, `dcrctl` akan mengembalikan hash transaksi yang dapat digunakan untuk melihat transaksi di [Decred Block Explorer](/getting-started/using-the-block-explorer.md).

---

## Periksa Statistik Jaringan

Ada banyak perintah yang berbeda untuk memeriksa statistik jaringan yang berbeda. Di sini kita akan membahas pengiriman `getinfo` ke `dcrd` dan `getstakeinfo` ke `dcrwallet`.

Untuk mendapatkan informasi tentang node `dcrd` lokal Anda, tuliskan perintah `getinfo` ke `dcrd` dengan menggunakan `dcrctl`. Masukkan kode berikut ini di shell Anda:

```no-highlight
dcrctl getinfo
```

Untuk mendapatkan informasi tentang jaringan Proof-of-Stake, nyalakan perintah `getstakeinfo` ke `dcrwallet` dengan menggunakan `dcrctl`. Masukkan kode berikut ini di shell Anda:

```no-highlight
dcrctl --wallet getstakeinfo
```

---

## Perintah Tambahan

Perintah lainnya juga dapat ditemukan di halaman [Program Options](/advanced/program-options.md) .

---
