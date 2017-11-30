# <i class="fa fa-windows"></i> Panduan Pengguna Windows

---

## <i class="fa fa-download"></i> Download dan ekstrak cgminer

Kunjungi https://github.com/decred/cgminer/releases untuk menemukan rilis cgminer terbaru. Untuk Windows 64-bit, unduh dan ekstrak `cgminer-decred-w64_*.zip`. Untuk Windows 32-bit, unduh dan ekstrak `cgminer-decred-w32_*.zip`. Ekstrak semua file ke folder baru dan buka folder baru untuk melihat file.

## <i class="fa fa-play-circle"></i> Inisialisasi dan jalankan cgminer

> Langkah Satu

Buka jendela command prompt dengan mengetikkan `cmd` ke address bar di bagian atas file explorer yang memiliki file cgminer baru dan menekan `Enter`. Ketik berikut ini di jendela command prompt Anda untuk daftar perangkat keras yang berkemampuan pertambangan Anda:

```no-highlight
C:\Decred> cgminer -n
```

Anda harus melihat kartu grafik Anda terdaftar baik dengan codename GPU atau nama drivernya. Baris terakhir dari output harus menunjukkan jumlah GPU yang kompatibel yang dapat Anda pakai.

> Langkah Dua (Opsional)

Untuk benchmark sistem Anda dan mengetahui hashrate itu dapat melakukan di, gunakan perintah:

```no-highlight
C:\Decred> cgminer --blake256 --benchmark
```

> Step Three

Mendaftar di salah satu situs pool website dan siapkan penambang baru untuk masing-masing komputer pertambangan Anda. Lihat situs pool website pilihan Anda untuk mendapatkan petunjuk, jika diperlukan. Di jendela command line Anda dari langkah pertama, ketik perintah berikut untuk memulai cgminer (mengabaikan tanda kurung siku):

```no-highlight
C:\Decred> cgminer --blake256 -o <pool url>:<port number> -u <web login>.<worker name> -p <worker password>
```

Contoh:

```no-highlight
C:\Decred> cgminer --blake256 -o http://dcr.maxminers.net:7727 -u DecredMiner.miner1 -p 7@!x5L1
```

> Langkah Empat

Sekarang cgminer harus dijalankan. Buat file konfigurasi cgminer dengan menekan tombol berikut: `S` (Settings), `W` (Write Config File), `Enter` (Simpan file konfigurasi sebagai `cgminer.conf`). Perhatikan bahwa `cgminer.conf` akan ditempatkan di direktori yang sama dengan `cgminer.exe` Untuk menambahkan pool lainnya ke file konfigurasi Anda, buka `cgminer.conf` dengan Notepad atau editor teks yang serupa. Gunakan sintaks berikut untuk membuat perubahan di bagian "pool" dari file konfigurasi (perhatikan koma di antara masing-masing entri pada pool):

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

Simpan `cgminer.conf` dan tutup `cgminer.exe`. Klik dua kali pada program cgminer yang akan menjalankan dan memuat file konfigurasi baru. Ini menyimpulkan panduan penataan kolam dasar cgminer. Untuk informasi lebih lanjut tentang penggunaan cgminer dan penjelasan terperinci tentang fungsi program, lihat [cgminer README](https://github.com/decred/cgminer/blob/3.7/README).
