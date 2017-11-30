# <i class="fa fa-hdd-o"></i> Menyimpan Detail Masuk

Semua parameter yang ditentukan pada baris perintah saat memulai dcrd,
Dcrwallet dan dcrctl juga dapat disimpan dalam berkas konfigurasi. Ini adalah
Cara yang baik untuk menyimpan pengenalan masuk Anda sehingga Anda tidak perlu
Untuk selalu memasukkannya ke dalam naskah atau mengetikkannya ke terminal.

---

## <i class="fa fa-laptop"></i> Dasar-dasar Berkas Konfigurasi

Jika tidak terbiasa dengan dasar-dasar berkas konfigurasi, tinjau informasi yang ada di halaman [Startup Options Intro](/getting-started/startup-basics.md#configuration-files) kami.

---

## <i class="fa fa-terminal"></i> dcrd.conf 

Pilih nama pengguna dan kata sandi yang Anda inginkan pada langkah-langkah berikut. Anda tidak perlu mendaftarkan ini
Di mana pun dan mereka hanya akan digunakan untuk mengizinkan `dcrwallet` dan `dcrctl` tuntuk berkomunikasi dengan `dcrd`.

> Menggunakan Contoh Berkas Konfigurasi

Ikuti langkah-langkah di bawah ini jika Anda telah menyalin contoh berkas konfigurasi ke dalam direktori yang sesuai.

1. Arahkan ke folder aplikasi `dcrd` Anda seperti yang dijelaskan di berkas konfigurasi [Startup Options Intro](/getting-started/startup-basics.md#configuration-files). 
2. Buka `dcrd.conf` di penyunting teks.
3. Temukan baris berikut:

    `;rpcuser=` <br />
    `;rpcpass=`

4. Hapus tanda komentar dengan menghapus tanda titik dua dan menambahkan nama pengguna dan kata sandi yang Anda pilih ke baris yang sesuai.

> Membuat Berkas Config Baru

Ikuti langkah-langkah di bawah ini jika Anda **belum** menyalin contoh berkas konfigurasi ke dalam direktori yang sesuai.

1. Arahkan ke folder aplikasi `dcrd` Anda seperti yang dijelaskan di atas di [Startup Options Intro](/getting-started/startup-basics.md#configuration-files).
2. Buat berkas teks baru.
3. Ulang pemberian nama `dcrd.conf`.
3. Buka `dcrd.conf` di penyunting teks.
4. Tambahkan baris berikut:

```no-highlight
[Application Options]

rpcuser=<username>
rpcpass=<password>
```

---

## <i class="fa fa-terminal"></i> dcrwallet.conf 

Prosedur untuk `dcrwallet.conf` sangat mirip dengan prosedur untuk `dcrd.conf`. 

PHarap dicatat bahwa jika nilai `username=` dan `password=` di `dcrwallet.conf` tidak sesuai dengan nilai `rpcuser=` dan `rpcpass=` di  `dcrd.conf`, Anda perlu mengatur `dcrdusername=` dan `dcrdpassword=`  di `dcrwallet.conf` ke nilai `rpcuser`/`rpcpass` yang ditemukan di `dcrd.conf` paling mudah menggunakan nama pengguna/kata sandi yang sama untuk semua).

> Menggunakan Contoh Berkas Konfig

Ikuti langkah-langkah di bawah ini jika Anda telah menyalin contoh berkas konfigurasi ke dalam direktori yang sesuai.

1. Arahkan ke folder aplikasi `dcrwallet` seperti yang dijelaskan di berkas konfigurasi [Startup Options Intro](/getting-started/startup-basics.md#configuration-files). 
2. Buka `dcrwallet.conf` di penyunting teks.
3. Temukan baris berikut:

    `;username=` <br />
    `;password=`

4. Hapus tanda komentar dengan menghapus tanda titik dua dan menambahkan nama pengguna dan kata sandi yang Anda pilih ke baris yang sesuai.

> Membuat Berkas Config Baru

Ikuti langkah-langkah di bawah ini jika Anda **belum** menyalin contoh berkas konfigurasi ke dalam direktori yang sesuai.

1. Arahkan ke folder aplikasi `dcrwallet` seperti yang dijelaskan di berkas konfigurasi [Startup Options Intro](/getting-started/startup-basics.md#configuration-files).
2. Buat berkas teks baru.
3. Ulang pemberian nama `dcrwallet.conf`.
3. Buka `dcrwallet.conf` di penyunting teks.
4. Tambahkan baris berikut:

```no-highlight
[Application Options]

username=<username>
password=<password>
```

Jika Anda menyetel kata sandi umum opsional untuk dompet (kata sandi kedua
Saat pembuatan dompet) Anda juga bisa menambahkannya ke `dcrwallet.conf`:

```no-highlight
walletpass=<yourwalletpassword>
```

Anda tidak dapat menentukan kata frase dompet pribadi Anda di berkas konfigurasi. Itu harus dimasukkan secara manual dengan `dcrctl`. 

---

## <i class="fa fa-terminal"></i> dcrctl.conf 

Sekali lagi, paling mudah untuk menggunakan nama pengguna/kata sandi yang sama untuk `dcrd.conf`, `dcrwallet.conf`, dan `dcrctl.conf`. Jika Anda menggunakan pengenalan yang berbeda untuk dcrwallet, Anda perlu menentukannya di sini dan yang lainnya di baris perintah saat mengeluarkan perintah.

> Menggunakan Contoh Berkas Konfig

Ikuti langkah-langkah di bawah ini jika Anda telah menyalin contoh berkas konfigurasi ke dalam direktori yang sesuai.

1. Arahkan ke folder aplikasi `dcrctl` Anda seperti yang dijelaskan di berkas konfigurasi [Startup Options Intro](/getting-started/startup-basics.md#configuration-files). 
2. Buka `dcrctl.conf` di penyunting teks.
3. Temukan baris berikut:

    `;rpcuser=` <br />
    `;rpcpass=`

4. Hapus tanda komentar dengan menghapus tanda titik dua dan menambahkan nama pengguna dan kata sandi yang Anda pilih ke baris yang sesuai.

> Membuat Berkas Config Baru

Ikuti langkah-langkah di bawah ini jika Anda **belum** menyalin contoh file konfigurasi ke dalam direktori yang sesuai.

1. Arahkan ke folder aplikasi `dcrctl` Anda seperti yang dijelaskan di berkas konfigurasi [Startup Options Intro](/getting-started/startup-basics.md#configuration-files).
2. Buat berkas teks baru.
3. Ulang pemberian nama `dcrctl.conf`.
3. Buka `dcrctl.conf` di penyunting teks.
4. Tambahkan baris berikut:

```no-highlight
[Application Options]

rpcuser=<username>
rpcpass=<password>
```

---

## <i class="fa fa-tasks"></i> Opsi Konfigurasi Tambahan 

Semua opsi baris perintah bisa dimasukkan ke dalam berkas konfigurasi.Contoh berkas konfigurasi dalam paket rilis memberi tambahanPilihan atau Anda dapat menjalankan salah satu program dengan bendera `-h` untuk menampilkan daftar dan deskripsi semua opsi untuk aplikasi yang ditentukan.

Ada juga daftar lengkap pilihan untuk setiap aplikasi yang dapat ditemukan di [sini](/advanced/program-options.md).
