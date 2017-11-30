# Panduan Pemasangan dcrd 

Terakhir diperbarui untuk v1.0.0.

Panduan ini ditujukan untuk membantu Anda mengatur aplikasi `dcrd` dengan menggunakan [startup flags](/getting-started/startup-basics.md#startup-command-flags). 

**Prasyarat:**

- Gunakan [dcrinstall](/getting-started/user-guides/cli-installation.md) untuk memasang `dcrd`. Langkah tambahan akan diperlukan jika metode instalasi lain digunakan.
- Review how the launch commands for the Command Prompt (Windows) and Bash (macOS/Linux) shells differ [here](/getting-started/cli-differences.md).

---

`dcrd` adalah daemon node untuk Decred. Daemon adalah program yang bekerja di latar belakang yang Anda tidak berinteraksi secara langsung dengan program tersebut. `dcrd` mengelola keseluruhan buku besar transaksional (atau rantai blok) lama Decred dan memungkinkan pengiriman transaksi ke node lama lainnya di seluruh dunia. Anda bisa menganggapnya sebagai server rantai pribadi Anda. Rantai blok disimpan dalam folder `data` dalam direktori home `dcrd` .

**Pengguna Tingkat Lanjut: Jika Anda menjalankan mode tanpa kepala melalui SSH,** Anda
Perlu menggunakan terminal multiplexer seperti [layar](http://www.howtogeek.com/howto/ubuntu/keep-your-ssh-session-running-when-you-disconnect/)
Atau [tmux](https://tmux.github.io/). Jika Anda melihat instruksi untuk
Pindah ke shell lain, Anda harus membuka jendela baru di `screen`
Atau `tmux`.

---

## <i class="fa fa-cloud"></i> Menghubungkan ke Jaringan Decred

Pertama kali meluncurkan `dcrd`, ini akan terhubung ke jaringan Decred dan mulai mengunduh rantai blok. Untuk mengizinkan `dcrwallet` dan `dcrctl` untuk berkomunikasi dengan `dcrd`, pengaturan berkas konfigurasi `rpcuser` dan `rpcpass` harus telah diaktifkan. 

> Konfigurasikan Nama Pengguna dan Kata Sandi RPC

Jika Anda menggunakan [`dcrinstall`](/getting-started/user-guides/cli-installation.md), berkas konfigurasi Anda telah disiapkan dengan nama pengguna/kata sandi RPC untuk `dcrd`, `dcrwallet`, dan `dcrctl`.

Jika Anda tidak menggunakan `dcrinstall`, Anda harus mengaktifkan pengaturan minimum pada berkas konfigurasi Anda. Ikuti [panduan ini](/advanced/manual-cli-install.md#minimum-configuration) untuk melakukannya. 

> Mulai dcrd 

Dengan berkas konfigurasi yang ditetapkan dengan benar, buka jendela shell lain di direktori Decred Anda (atau gunakan jendela terakhir jika Anda baru saja membuat dompet Anda). Ketik perintah berikut (tinjau prasyarat panduan ini untuk menentukan perintah yang tepat untuk aplikasi OS/Shell Anda):

```no-highlight
dcrd
```

> Tunggu sampai Dcrd sinkron ke rantai blok Decred

Saat `dcrd` diluncurkan dengan sukses, Anda akan melihat jendela shell Anda mulai terisi dengan pesan saat daemon terhubung ke jaringan dan mulai memproses blok. Tunggu sampai selesai - seluruh rantai blok sedang diunduh ke direktori data `dcrd` . 

Anda akan melihat garis di awal seperti ini:

```no-highlight
22:58:04 2016-02-09 [INF] BMGR: Syncing to block height 617 from peer 104.236.167.133:9108
```

Kemudian, saat sedang mengunduh blok, Anda akan melihat baris seperti ini:

```no-highlight
22:58:16 2016-02-09 [INF] BMGR: Processed 321 blocks in the last 10.03s (544 transactions, height 322, 2016-02-09 09:50:34 +1000 EST)
```

Rantai blok akan disinkronkan sepenuhnya begitu blok yang terakhir diproses adalah tinggi blok saat ini. Anda dapat mengetahui dengan membandingkan tanggal dan waktu dalam pesan log atau dengan membandingkan tinggi blok terakhir yang diproses terhadap tinggi blok terakhir di [penjelajah blok resmi](https://mainnet.decred.org/).  

Perhatikan bahwa koneksi ini akan digunakan seterusnya. Anda harus membiarkan `dcrd` ini berjalan agar bisa menggunakan `dcrwallet`.

---

Sekarang Anda telah menyiapkan `dcrd`, kunjungi panduan [dcrwallet Setup](/getting-started/user-guides/dcrwallet-setup.md).
