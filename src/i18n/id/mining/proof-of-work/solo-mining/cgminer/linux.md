# <i class="fa fa-linux"></i> Panduan Pengguna Linux 

---

## <i class="fa fa-cloud"></i> Sambungkan dcrd ke jaringan yang terdegradasi

> Langkah Satu

Perhatikan bahwa semua perintah `dcrd`, `dcrwallet`, dan `dcrctl`  harus dijalankan di direktori tempat berkas Decred Anda berada! Mulai `dcrd`:

```no-highlight
~/Decred/$ ./dcrd -u <username> -P <password>
```

Mulai dcrwallet:

```no-highlight
~/Decred/$ ./dcrwallet -u <username> -P <password>
```

> Langkah Dua

Buat alamat dompet baru:

```no-highlight
~/Decred/$ ./dcrctl -u <username> -P <password> --wallet getnewaddress default
```

Salin alamat baru (output dari perintah terakhir). Tutup/hentikan `dcrd` dan `dcrwallet` dengan menekan `ctrl+c` di setiap jendela.

> Langkah Tiga

Restart `dcrd` dengan menggunakan perintah:

```no-highlight
~/Decred/$ ./dcrd -u <username> -P <password> --miningaddr <new address from step two or your web client wallet address>
```

> Langkah Empat

Setup keamanan TLS dengan menyalin rpc.cert to /usr/share/ca-certificates:

```no-highlight
sudo cp /home/<username>/.dcrd/rpc.cert /usr/share/ca-certificates/dcrd.crt
```

Gunakan editor teks untuk menambahkan baris "dcrd.crt" (no quotes) to /etc/ca-certificates.conf:

```no-highlight
sudo gedit /etc/ca-certificates.conf
```

Update the CA certificate list:

```no-highlight
sudo update-ca-certificates
```

---

## <i class="fa fa-download"></i>  Download dan ekstrak cgminer

Kunjungi https://github.com/decred/cgminer/releases untuk menemukan rilis cgminer terbaru. Untuk mendownload dan mengekstraknya melalui terminal Linux Anda, gunakan perintah berikut:

```no-highlight
wget https://github.com/decred/decred-release/releases/download/v0.0.4_cgminer/cgminer-decred-linux-x86_64-20160208.tar.gz
tar -xvf cgminer-decred-linux-x86_64-20160208.tar.gz
```

---

## <i class="fa fa-play-circle"></i> Inisialisasi dan jalankan cgminer

> Langkah Satu

Jika `dcrd` belum selesai disinkronkan ke rantai blok, tunggu sampai selesai, lalu lanjutkan ke langkah berikutnya. Setelah selesai, itu akan menunjukkan:

```no-highlight
[INF] BMGR: Processed 1 block in the last 5m34.49s
```

> Langkah Dua

Di direktori cgminer Anda, jalankan cgminer dengan perintah:

```no-highlight
~/Decred/$ ./cgminer --blake256 -o https://127.0.0.1:9109 -u <username> -p <password>
```

Buat berkas konfigurasi cgminer dengan menekan tombol berikut: `S` (Settings), `W` (Write Config File), `Enter` (Simpan berkas konfigurasi sebagai `cgminer.conf`). Perhatikan bahwa `cgminer.conf` akan ditempatkan di direktori yang sama dengan cgminer. Cgminer sekarang bisa diluncurkan dengan hanya menjalankan perintah:

```no-highlight
~/Decred/$ ./cgminer
```

Ini menyimpulkan panduan setup solo cgminer. Untuk informasi lebih lanjut tentang penggunaan cgminer dan penjelasan terperinci tentang fungsi program, lihat resmi [cgminer README](https://github.com/decred/cgminer/blob/3.7/README).
