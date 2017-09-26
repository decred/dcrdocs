# **<i class="fa fa-linux"></i> *gominer* Panduan Pengguna Pertambangan pool Linux**

Panduan ini ditujukan untuk penyiapan awal gominer awal dengan pool penambangan pilihan menggunakan berkas konfigurasi; Pilihan yang lebih maju tersedia.

Terakhir diperbarui pada tanggal 28 April 2017.

---

### **<i class="fa fa-download"></i> Unduh dan Ekstrak *gominer* Binary**


>Unduh .tar.gz File

Kunjungi [https://github.com/decred/decred-binaries/releases](https://github.com/decred/decred-binaries/releases) untuk mengunduh biner Linux gominer terbaru. Hanya tersedia versi gominer 64 bit. Rilis terbaru saat ini adalah:

- `gominer-linux-amd64-cuda-v1.0.0.tar.gz`,
- `gominer-linux-amd64-opencl-v1.0.0.tar.gz`,
- `gominer-linux-amd64-opencladl-v1.0.0.tar.gz`.

Untuk kartu grafis NVIDIA, unduh berkas `*-cuda-*.tar.gz` file. <br />
Untuk kartu grafis AMD dari jalur Radeon dan FirePro, unduh berkas `*-opencladl-*.tar.gz` file. <br />
Untuk kartu grafis lainnya, unduh berkas `*-opencl-*.tar.gz` file.

Bagi Anda pecinta baris perintah, berikut adalah link langsung untuk v1.0.0:

```no-highlight
$ wget https://github.com/decred/decred-binaries/releases/download/v1.0.0_gominer/gominer-linux-amd64-cuda-v1.0.0.tar.gz
$ wget https://github.com/decred/decred-binaries/releases/download/v1.0.0_gominer/gominer-linux-amd64-opencl-v1.0.0.tar.gz
$ wget https://github.com/decred/decred-binaries/releases/download/v1.0.0_gominer/gominer-linux-amd64-opencladl-v1.0.0.tar.gz
```

>Extract the .tar.gz File

Ekstrak atau copy semua berkas ke direktori baru. Untuk tutorial ini kita akan menggunakan `~/decred/` sebagai direktori kerja kita. Dari baris perintah:

```no-highlight
$ tar -xzf gominer-linux-amd64-cuda-v1.0.0.tar.gz -C ~/decred/
```

Saat Anda membongkar tar, itu akan membuat sebuah direktori bernama `gominer-linux-amd64-opencladl-v1.0.0`. Isi dari direktori ini harus `blake256.cl`, `blake256-old.cl`, `gominer`, `LICENSE`, `README.md`, dan `sample-gominer.conf`.

Untuk versi CUDA, perpustakaan runtime CUDA sekarang disertakan. Berkas dalam versi ini juga akan menyertakan `libcudart.so.8.0` dan `rungominer.sh`. Script ini digunakan untuk memulai gominer dengan library runtime yang disertakan untuk kenyamanan anda. Anda harus memasang driver untuk kartu grafis yang mendukung CUDA 8. Driver yang lebih lama akan menyebabkan gominer mogok saat diluncurkan.

### **Mengatur Berkas *gominer* Konfigurasi**

> Langkah 1: Pilih Pool Pertambangan

Sebelum memulai langkah ini, penting bahwa Anda telah mendaftar ke akun pool pertambangan (jika diminta oleh pool pertambangan yang Anda pilih, Anda harus membuat pekerja di situs web pool). Catat login dan kata sandi pekerja Anda, dan alamat stratum+tcp pool: port untuk digunakan nanti.

Jika ini baru bagi Anda, berikut adalah beberapa panduan untuk membuat pekerja di beberapa pool pertambangan Decred (PERINGATAN: jangan lupa PIN Anda yang Anda tetapkan selama pembuatan akun - Anda tidak dapat menarik DCR yang telah ditambang tanpa itu):

- [https://dcr.maxminers.net/index.php?page=gettingstarted](https://dcr.maxminers.net/index.php?page=gettingstarted)
- [https://dcr.suprnova.cc/index.php?page=gettingstarted](https://dcr.suprnova.cc/index.php?page=gettingstarted)
- [https://www2.coinmine.pl/dcr/index.php?page=gettingstarted](https://www2.coinmine.pl/dcr/index.php?page=gettingstarted)
- [https://pool.mn/dcr/index.php?page=gettingstarted](https://pool.mn/dcr/index.php?page=gettingstarted)

> Langkah 2: Verifikasi Perangkat ID#

Sebelum menyiapkan berkas konfigurasi, sangat penting untuk mengetahui perangkat mana, seperti yang diidentifikasi oleh gominer, yang ingin Anda gunakan untuk saya. Untuk melakukan ini, buka jendela terminal, arahkan ke lokasi yang Anda pasang di atas gominer (misalnya `~/decred/gominer-linux-amd64-cuda-v1.0.0`), ketik `./gominer -l` or `./rungominer.sh -l` jika Anda menggunakan versi CUDA, tekan Enter, dan daftar perangkat yang dapat Anda tempelkan akan ditampilkan. Catat ID perangkat yang ingin Anda gunakan. Petunjuk: Kartu video Anda mungkin terdaftar dengan nama kode mereka.

> Langkah 3: Edit Berkas Konfigurasi

Buka berkas `sample-gominer.conf` dengan editor teks pilihan Anda. Untuk setiap setting yang akan kita ubah, hapus semi-colon sederhana sebelum variabel setting setelah tanda `=` . 

Di bagian "Setelan umum":

- set `devices=` ke Device ID#(s) yang dicatat dengan menggunakan perintah `./gominer -l` or `./rungominer.sh -l` pada Langkah 2. Beberapa perangkat harus dipisahkan dengan koma, mis. `devices=2,3`.

Di bagian "Pengaturan penambangan":

- set `pool=` ke stratum+alamat tcp: port dari pool penambangan pilihan Anda, mis. decredpool.org menggunakan `stratum+tcp://stratum.decredpool.org:3333` (PERINGATAN: http://address:port tidak akan bekerja dengan gominer - stratum+tcp *harus* digunakan).
- set `pooluser=` ke login pekerja Anda.
- set `poolpass=` untuk kata sandi pekerja Anda.

Setelah perubahan ini dilakukan, simpan file tersebut. Buatlah salinannya dan sebut saja gominer.conf di direktori config gominer:

```no-highlight
$ mkdir -p ~/.gominer
$ cp sample-gominer.conf ~/.gominer/gominer.conf
```

### **Peluncuran gominer**

Arahkan kembali ke direktori yang berisi `gominer` dan `blake256.cl`, `e.g. ~/decred/gominer-linux-amd64-cuda-v1.0.0/`, dan jalankan - `./gominer` atau `./rungominer.sh`. Jika semuanya selesai dengan benar, gominer harus membaca dari berkas konfigurasi, terhubung ke pool, dan mulai melakukan hashing dengan perangkat yang ditentukan. Anda akan mulai melihat pesan bergulir, termasuk statistik tentang hashrate Anda dari masing-masing perangkat dan diterima, ditolak, basi, dan total saham dikirim.

Jika terjadi kesalahan koneksi, kemungkinan `pool`, `pooluser` atau `poolpass` tidak dikonfigurasi dengan benar.

Jika gominer mulai melakukan hashing pada perangkat yang tidak ingin Anda gunakan, kemungkinan pengaturan `devices` tidak dikonfigurasi dengan benar.

Jika kedua masalah di atas ada, kemungkinan berkas konfigurasi salah dinamai (harus diberi nama`gominer.conf`)  atau berada di direktori yang salah (harus berada di `~/.gominer/`).

### **Biasakan Diri Anda dengan Situs Pool Anda**

Sekarang gominer Anda hashing pergi untuk Anda, Anda punya waktu untuk memeriksa website pool Anda. Sebagian besar pool memiliki dasbor di situs web mereka yang dapat Anda gunakan untuk menemukan statistik tentang pool, jaringan, dan putaran saat ini (waktu berlalu antara setiap blok yang ditemukan di pool). Selain itu, setelah Anda menerima pembayaran yang cukup besar, Anda dapat menarik koin Anda melalui halaman Edit Account dengan menetapkan Alamat Pembayaran DCR dan menetapkan ambang Pembayaran Otomatis, atau memilih Cash Out dari total saldo akun Anda.

### **Petunjuk Bermanfaat**

*Untuk versi OpenCL dan OpenCL ADL dari gominer*, gominer secara otomatis menghitung WorkSize yang menghasilkan algoritma kerja yang dieksekusi setiap 500ms. Mengubah pengaturan Intensitas/WorkSize dalam `gominer.conf` akan menghasilkan masalah yang diketahui - algoritma akan dijalankan dengan kecepatan yang jauh lebih cepat karena WorkSize yang diturunkan (ini tidak akan menghasilkan lebih banyak saham yang dihasilkan), sehingga menghasilkan peningkatan Memori terkadang setinggi 10MB/detik. Hal ini akhirnya menyebabkan sistem Anda kehabisan ruang RAM dan secara otomatis menghentikan gominer. Cara terbaik untuk meninggalkan pengaturan ini sendirian dan biarkan gominer menghitung sendiri WorkSize.
