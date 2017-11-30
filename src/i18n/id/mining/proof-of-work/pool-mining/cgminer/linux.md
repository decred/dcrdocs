# <i class="fa fa-linux"></i> Panduan Pengguna Linux 

---

## <i class="fa fa-download"></i> Unduh dan ekstrak cgminer

Kunjungi https://github.com/decred/cgminer/releases untuk menemukan rilis cgminer terbaru. Untuk mengunduh dan mengekstrak file melalui terminal, jalankan perintah berikut. Perhatikan bahwa contoh ini mengunduh cgminer v0.0.4.

```no-highlight
~/Decred/$ wget "https://github.com/decred/decred-release/releases/download/v0.0.4_cgminer/cgminer-decred-linux-x86_64-20160208.tar.gz"
~/Decred/$ tar -xvf cgminer*
```

Masuk ke direktori cgminer baru:

```
~/Decred/$ cd cgminer*
```

## <i class="fa fa-play-circle"></i> Inisialisasi dan jalankan cgminer

> Langkah Satu

Ketik berikut ini di jendela terminal Anda untuk mencantumkan perangkat keras yang berkemampuan pertambangan Anda:

```no-highlight
~/Decred/$ ./cgminer -n
```

Anda harus melihat kartu grafik Anda terdaftar baik dengan codename GPU atau nama drivernya. Baris terakhir dari output harus menunjukkan jumlah GPU yang kompatibel yang dapat Anda pakai.

> Langkah Dua (Opsional)

Untuk membandingkan sistem Anda dan mengetahui apakah Anda memiliki GPU yang dapat Anda gunakan, gunakan perintahnya:

```no-highlight
~/Decred/$ ./cgminer --blake256 --benchmark
```

> Langkah Tiga

Mendaftar di salah satu situs pool website dan siapkan penambang baru untuk masing-masing komputer pertambangan Anda. Lihat situs pool website pilihan Anda untuk mendapatkan petunjuk, jika diperlukan. Di jendela terminal Anda dari langkah pertama, ketik perintah berikut untuk memulai cgminer (mengabaikan tanda kurung siku):

```no-highlight
~/Decred/$ ./cgminer --blake256 -o <pool url>:<port number> -u <web login>.<worker name> -p <worker password>
```

Contoh:

```no-highlight
~/Decred/$ ./cgminer --blake256 -o http://dcr.maxminers.net:7727 -u DecredMiner.miner1 -p 7@!x5L1
```

> Langkah Empat

Sekarang cgminer harus dijalankan. Buat file konfigurasi cgminer dengan menekan tombol berikut: `S` (Settings), `W` (Write Config File), `Enter` (Simpan file konfigurasi sebagai `cgminer.conf`). Perhatikan bahwa `cgminer.conf` akan ditempatkan di direktori yang sama dengan `cgminer`. Untuk menambahkan pool lainnya ke file konfigurasi Anda, buka `cgminer.conf` dengan Gedit (GUI) / Pico (CLI) atau editor teks yang serupa. Beberapa kolam dapat ditambahkan dengan mengikuti sintaks ini di bagian "pool" pada file konfigurasi (perhatikan koma di antara masing-masing entri pada pool):

```no-highlight
"pools" : [
   {
      "url" : "http://dcr.maxminers.net:7727",
      "user" : "Login.Worker",
      "pass" : "password"
   },
   {
      "url" : "http://dcr.suprnova.cc:9110",
      "user" : "Login.Worker",
      "pass" : "password"
   }
]
```

> Langkah Lima

Simpan `cgminer.conf` dan tutup `cgminer`. Jalankan ulang cgminer dengan menggunakan perintah:

```no-highlight
~/Decred/$ ./cgminer
```

Ini menyimpulkan panduan penataan pool dasar cgminer. Untuk informasi lebih lanjut tentang penggunaan cgminer dan penjelasan terperinci tentang fungsi program, lihat README resmi [cgminer README](https://github.com/decred/cgminer/blob/3.7/README).
