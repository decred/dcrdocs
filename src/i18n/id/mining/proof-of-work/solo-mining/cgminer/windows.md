# <i class="fa fa-windows"></i> Panduan Pengguna Windows

---

## <i class="fa fa-cloud"></i> Sambungkan dcrd ke jaringan yang terdegradasi

> Langkah Satu

Perhatikan bahwa semua perintah `dcrd`, `dcrwallet`, dan `dcrctl` harus dijalankan di direktori tempat file Decred Anda berada! Mulai `dcrd`:

```no-highlight
C:\Decred> dcrd -u <username> -P <password>
```

Mulai dcrwallet:

```no-highlight
C:\Decred> dcrwallet -u <username> -P <password>
```

> Langkah Dua

Buat alamat dompet baru:

```no-highlight
C:\Decred> dcrctl -u <username> -P <password> --wallet getnewaddress
```

Salin alamat baru (output dari perintah terakhir). Tutup/hentikan `dcrd` dan `dcrwallet` dengan menekan `ctrl+c` di setiap jendela.

> Langkah Tiga

Restart `dcrd` dengan menggunakan perintah:

```no-highlight
C:\Decred> dcrd --miningaddr <new address from step two or your web client wallet address>
```

---

## <i class="fa fa-download"></i> Download dan ekstrak cgminer

Kunjungi https://github.com/decred/cgminer/releases untuk menemukan rilis cgminer terbaru. Untuk Windows 64-bit, unduh dan ekstrak `cgminer-decred-w64_*.zip`. Untuk Windows 32-bit, unduh dan ekstrak `cgminer-decred-w32_*.zip`. Ekstrak semua file ke folder baru dan buka folder baru untuk melihat file.

---

## <i class="fa fa-play-circle"></i> Inisialisasi dan jalankan cgminer

> Langkah Satu

Klik kanan pada `start_local.bat` dan klik `Edit`. Ubah nama pengguna dan kata sandi agar sesuai dengan kredensial yang digunakan pada langkah 1. Simpan dan tutup start_local.bat Untuk referensi, berikut adalah perintah di start_local.bat:

```no-highlight
C:\Decred> cgminer --blake256 -o https://127.0.0.1:9109 -u <username> -p <password> --cert "%LOCALAPPDATA%\Dcrd\rpc.cert"
```

> Langkah Dua

Jika dcrd belum selesai disinkronkan ke rantai blok, tunggu hingga selesai, lalu lanjutkan ke langkah berikutnya. Setelah selesai, itu akan menunjukkan:

```no-highlight
[INF] BMGR: Processed 1 block in the last 5m34.49s
```

> Langkah Tiga

Klik dua kali pada `start_local.bat`. `cgminer` harus terbuka Buat berkas konfigurasi `cgminer` dengan menekan tombol berikut: `S` (Settings), `W` (Write Config File), `Enter` (Simpan berkas konfigurasi sebagai `cgminer.conf`). Perhatikan bahwa `cgminer.conf` akan ditempatkan di direktori yang sama dengan cgminer. Cgminer sekarang bisa diluncurkan hanya dengan mengklik ganda `cgminer.exe`. Ini menyimpulkan panduan setup solo cgminer. Untuk informasi lebih lanjut tentang penggunaan cgminer dan penjelasan terperinci tentang fungsi program, lihat resmi [cgminer README](https://github.com/decred/cgminer/blob/3.7/README).
