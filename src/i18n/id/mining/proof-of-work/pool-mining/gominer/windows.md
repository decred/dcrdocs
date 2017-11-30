# <i class="fa fa-windows"></i> *gominer* Panduan Pengguna Windows Pool Mining 

Panduan ini ditujukan untuk penyiapan awal gominer awal pada kolam penambangan pilihan dengan menggunakan berkas konfigurasi, pilihan yang lebih maju tersedia.

Terakhir diperbarui untuk gominer v1.0.0.

---

### <i class="fa fa-download"></i> Download dan Ekstrak *gominer* Biner 


>Download .zip File

Kunjungi [https://github.com/decred/decred-binaries/releases/tag/v1.0.0](https://github.com/decred/decred-binaries/releases/tag/v1.0.0) untuk mendownload Gominer binari Windows Di bagian "Downloads" Anda harus melihat berkas berikut:

- `gominer-windows-amd64-cuda-v1.0.0.zip`,
- `gominer-windows-amd64-opencl-v1.0.0.zip`,
- `gominer-windows-amd64-opencladl-v1.0.0.zip`.

Untuk kartu grafis NVIDIA, download file `*-cuda-*.zip` . <br />
Untuk kartu grafis AMD dari garis Radeon dan FirePro, unduh berkas `*-opencladl-*.zip` . <br />
Untuk kartu grafis lainnya, unduh berkas `*-opencl-*.zip` .

Ekstrak atau Salin semua berkas ke folder baru. Entah ingat nama path ke folder ini, atau buka jendela File Explorer baru untuk melihat isi folder (Untuk sisa tutorial ini, kita akan menggunakan `C:\decred\gominer\` as an example). The contents of this folder should be `blake256.cl`, `gominer.exe`, `LICENSE`, `README.md`, dan `sample-gominer.conf`.

> Catatan Prompt Perintah

Bagi yang baru, biasakan membiasakan diri dengan beberapa metode untuk membuka command prompt di direktori tertentu (folder):

- Di File Explorer, navigasikan ke folder tertentu, ketik `cmd` ke dalam bilah alamat, dan tekan enter.
- Di File Explorer, navigasikan ke folder tertentu, klik dropdown "File", navigasikan ke opsi "Open command prompt", dan pilih "Open command prompt".
- Klik menu start atau tekan tombol Windows pada keyboard Anda, ketik `cmd`, dan buka Applikasi "Command Prompt" yang akan muncul di hasil pencarian. Ubah direktori saat ini ke folder tertentu dengan menggunakan perintah `cd` , `e.g. cd C:\decred\gominer\`. Perintah `dir` dengan sendirinya dapat digunakan untuk melihat isi direktori saat ini.

### Setup *gominer* Berkas Konfigurasi

> Langkah 1: Pilih pool Pertambangan

Sebelum memulai langkah ini, penting bahwa Anda telah mendaftar ke akun kolam pertambangan (jika diminta oleh pool pertambangan yang Anda pilih, Anda harus membuat pekerja di situs web pool). Catat login dan kata sandi pekerja Anda, dan alamat stratum+tcp pool: port untuk digunakan nanti.

Jika ini baru bagi Anda, berikut adalah beberapa panduan untuk membuat pekerja di beberapa pool pertambangan Decred (PERINGATAN: jangan lupa PIN Anda yang Anda tetapkan selama pembuatan akun - Anda tidak dapat menarik DCR yang telah ditambang tanpa itu):

- [https://dcr.maxminers.net/index.php?page=gettingstarted](https://dcr.maxminers.net/index.php?page=gettingstarted)
- [https://dcr.suprnova.cc/index.php?page=gettingstarted](https://dcr.suprnova.cc/index.php?page=gettingstarted)
- [https://www2.coinmine.pl/dcr/index.php?page=gettingstarted](https://www2.coinmine.pl/dcr/index.php?page=gettingstarted)
- [https://pool.mn/dcr/index.php?page=gettingstarted](https://pool.mn/dcr/index.php?page=gettingstarted)

> Langkah 2: Verifikasi Perangkat ID#

Sebelum memasang berkas konfigurasi, sangat penting untuk mengetahui perangkat mana, seperti yang diidentifikasi oleh gominer, yang ingin Anda gunakan untuk tambang (terutama jika Anda ingin menghindari penambangan dengan CPU atau IGP Anda). Untuk melakukan ini, buka Command Prompt di lokasi `gominer.exe` (`e.g. C:\decred\gominer\`), ketik `gominer.exe -l`, tekan Enter, dan daftar perangkat yang Anda inginkan Milikku akan ditampilkan. Catat ID perangkat yang ingin Anda gunakan. Petunjuk: Kartu video Anda mungkin terdaftar dengan nama kode mereka.

> Langkah 3: Edit berkas Konfigurasi

Buka berkas `sample-gominer.conf` . Untuk setiap setting yang akan kita ubah, hapus semi-colon sederhana sebelum variabel setting setelah tanda `=` . 

Di bagian "Setelan umum":

- set `devices=` ke ID# Perangkat yang dicatat dengan menggunakan perintah `gominer.exe -l` di Langkah 2. Beberapa perangkat harus dipisahkan dengan koma, mis. `devices=2,3`.

Di bagian "Pengaturan penambangan":

- set `pool=` ke stratum+alamat tcp: port dari kolam penambangan pilihan Anda, mis. decredpool.org menggunakan `stratum+tcp://stratum.decredpool.org:3333` (PERINGATAN: http://address:port tidak akan bekerja dengan gominer - stratum+tcp *harus* digunakan).
- set `pooluser=` ke login pekerja Anda.
- set `poolpass=` untuk kata sandi pekerja Anda.

Setelah perubahan ini dilakukan, Save As atau Save + Rename the file as gominer.conf.

> Langkah 4: Salin gominer.conf ke Folder AppData Lokal

Di dalam File Explorer baru, ketik `%localappdata%\Gominer\` ke dalam bilah alamat. Salin `gominer.conf` dari lokasi asalnya, `e.g. C:\decred\gominer\`, ke `%localappdata%\Gominer\`.

### Luncurkan gominer.exe 

Arahkan kembali ke direktori yang berisi `gominer.exe` dan `blake256.cl`, `e.g. C:\decred\gominer\`, dan jalankan `gominer.exe`. Jika semuanya selesai dengan benar, gominer harus membaca dari file konfigurasi, terhubung ke pool, dan mulai melakukan hashing dengan perangkat yang ditentukan. Anda akan mulai melihat pesan bergulir, termasuk statistik tentang hashrate Anda dari masing-masing perangkat dan diterima, ditolak, basi, dan total saham dikirim.

Jika terjadi kesalahan koneksi, kemungkinan `pool`, `pooluser` atau `poolpass` tidak dikonfigurasi dengan benar.

Jika gominer mulai melakukan hashing pada perangkat yang tidak ingin Anda gunakan, kemungkinan pengaturan `devices` tidak dikonfigurasi dengan benar.

Jika kedua masalah di atas ada, kemungkinan berkas konfigurasi salah dinamai (harus diberi nama`gominer.conf`) atau berada di direktori yang salah (harus berada di `%localappdata%\Gominer\`).

### Biasakan Diri Anda dengan Situs Web Pool Anda 

Sekarang gominer Anda hashing pergi untuk Anda, Anda punya waktu untuk memeriksa website pool Anda. Sebagian besar kolam memiliki dasbor di situs web mereka yang dapat Anda gunakan untuk menemukan statistik tentang pool, jaringan, dan putaran saat ini (waktu berlalu antara setiap blok yang ditemukan di pool). Selain itu, setelah Anda menerima pembayaran yang cukup besar, Anda dapat menarik koin Anda melalui halaman Edit Account dengan menetapkan Alamat Pembayaran DCR dan menetapkan ambang Pembayaran Otomatis, atau memilih Cash Out dari total saldo akun Anda.

### Petunjuk Bermanfaat

*Untuk versi OpenCL dan OpenCL ADL dari gominer*, gominer secara otomatis menghitung WorkSize yang menghasilkan algoritma kerja yang dieksekusi setiap 500ms. Mengubah pengaturan Intensitas/WorkSize dalam `gominer.conf` akan menghasilkan masalah yang diketahui - algoritma akan dijalankan dengan kecepatan yang jauh lebih cepat karena WorkSize yang diturunkan (ini tidak akan menghasilkan lebih banyak saham yang dihasilkan), sehingga menghasilkan peningkatan Memori terkadang setinggi 10MB/detik. Hal ini akhirnya menyebabkan sistem Anda kehabisan ruang RAM dan secara otomatis menghentikan gominer. Cara terbaik untuk meninggalkan pengaturan ini sendirian dan biarkan gominer menghitung sendiri WorkSize.
