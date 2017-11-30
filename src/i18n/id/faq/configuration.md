# <i class="fa fa-desktop"></i> Konfigurasi 

---

#### 1. Bagaimana saya bisa melihat informasi tentang guna nomor port `dcrd`? 

Anda bisa mendapatkan nomor port[^8929] dari parameter `-h` atau `--help` yang diberikan ke `dcrd`:

```no-highlight
dcrd -h
```

Cari baris berikut ini:

```no-highlight
--rpclisten=  Add an interface/port to listen for RPC connections (default port: 9109, testnet: 19109)
```

Ini juga dicatat saat Anda memulai `dcrd`:

```no-highlight
12:01:46 2016-02-08 [INF] RPCS: RPC server listening on [::1]:9109
12:01:46 2016-02-08 [INF] RPCS: RPC server listening on 127.0.0.1:9109
```

---

#### 2. Apa yang Anda maksud dengan berkas konfigurasi untuk `dcrd`, `dcrwallet`, dan `dcrctl`? 

Setiap aplikasi (`dcrd`, `dcrwallet`, `dcrctl`) dapat memiliki berkas konfigurasinya sendiri[^9055]. Gunakan `-h` dan lihat jalan di tanda kurung pada opsi berkas konfigurasi (`-C`, `--configfile`) untuk melihat jalur standar. Buat berkas teks pada jalur dan beri nama sesuai dengan jalur yang baru Anda cari.

Kemudian Anda bisa menggunakan `dcrd` [contoh berkas konfigurasi](https://github.com/decred/dcrd/blob/master/sample-dcrd.conf) dan `dcrwallet` [contoh berkas konfigurasi](https://github.com/decred/dcrwallet/blob/master/sample-dcrwallet.conf) untuk mengatur opsi apa pun yang Anda inginkan. Anda juga bisa melakukan hal yang sama untuk `dcrctl` . Formatnya sama. Setiap opsi baris perintah yang terdaftar oleh `-h` dapat ditentukan dalam berkas konfigurasi (cukup gunakan nama opsi yang panjang).

Begitu sudah dibuat dan ditempatkan, Anda tidak perlu menambahkan semua opsi ke baris perintah setiap saat. Misalnya, Anda dapat menjalankan `dcrctl` tanpa melewatkan parameter pada baris perintah:

```no-highlight
dcrctl getnetworkhashps
2547036949350
```

---

#### 3. Dapatkah saya menjalankan daemon mainnet dan testnet dan dompet pada saat bersamaan dan pada mesin yang sama? 

Ya[^9264], cukup tambahkan `--testnet` ke tempat yang sesuai (`dcrd`, `dcrwallet`, `dcrctl`) dan semuanya akan bekerja. Inilah sebabnya mengapa mereka menggunakan port dan data/direktori log yang berbeda!

---

#### 4. Berapakah implikasi keamanan dari menggunakan kata sandi otentikasi server RPC yang sama dengan `dcrd` dan `dcrwallet`? 

Ada lebih sedikit hal yang dapat Anda lakukan dengan akses ke `dcrd` daripada yang Anda bisa dengan akses ke `dcrwallet`. Yang penting, akses RPC[^11480] ke `dcrwallet`, saat dompet tidak terkunci, bisa digunakan untuk mengeluarkan koin.

Bila `dcrd` dan `dcrwallet` keduanya ada pada mesin yang sama, mungkin tidak masalah sama sekali, tapi saat Anda menjalankan pengaturan yang lebih aman di mana dompet berada pada mesin terpisah dari `dcrd`, Anda jelas tidak akanIngin menggunakan pengenalan yang sama untuk keduanya. Ingat bahwa `dcrd` harus berada pada mesin yang berhadapan dengan Internet agar tetap disinkronkan ke jaringan (unduh data rantai blok, transaksi penyiaran, dan sebagainya).

Di sisi lain, `dcrwallet` yang berisi dana Anda, untuk keamanan terbaik, seharusnya tidak berada pada sistem yang memiliki akses Internet karena secara signifikan lebih sulit bagi seseorang untuk mencuri koin Anda jika dompet yang berisi uang tidak Pada mesin yang bisa diakses melalui internet. Jelas, jika Anda mengumpulkan koin Anda, Anda memerlukan setidaknya satu `dcrwallet` yang berhadapan dengan Internet. Dengan demikian, pengaturan yang paling aman melibatkan satu "cold" `dcrwallet` yang ada di mesin yang tidak dapat diakses oleh Internet, dan "panas" `dcrwallet` kedua (tentu saja menggunakan seed yang berbeda) ke tempat Dcrwallet dingin memberikan hak suara melalui parameter `--ticketaddress` keduanya menggunakan pengenalan yang berbeda.

---

#### 5. Mengapa saya menghubungkan hanya ke 8 peer outbound? 

Ada batas yang tidak dapat dikonfigurasi dengan sengaja sengaja dari 8 peer outbound[^15399]. Lebih banyak peer outbound tidak membantu Anda dengan cara apapun dan sebenarnya lebih buruk bagi Anda dan jaringan. Ini telah diuji secara menyeluruh di Bitcoin, termasuk btcsuite (proyek hulu untuk Decred). Semua yang akan Anda lakukan dengan meningkatkan koneksi outbound Anda adalah sisa slot berharga dari jumlah peer publik yang relatif sedikit yang ada (selalu ada jumlah "leecher" yang jauh lebih tinggi daripada "seeder").

Di sisi lain, meningkatkan koneksi maksimum Anda, yang benar-benar meningkatkan jumlah koneksi inbound yang diizinkan, membantu jaringan dengan memastikan ada lebih banyak slot yang tersedia untuk node baru dan klien SPV.

---

## <i class="fa fa-book"></i> Sumber 

[^8929]: Decred Forum, [Post 8.929] (https://forum.decred.org/threads/600/#post-8929)
[^9055]: Decred Forum, [Posting 9,062] (https://forum.decred.org/threads/472/page-12#post-9062)
[^9264]: Decred Forum, [Post 9.264] (https://forum.decred.org/threads/626/#post-9264)
[^11480]: Decred Forum, [Posting 11,480] (https://forum.decred.org/threads/428/#post-11480)
[^15399]: Decred Forum, [Posting 15.399] (https://forum.decred.org/threads/1371/page-2#post-15399)
