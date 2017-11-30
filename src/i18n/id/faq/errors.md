# Kesalahan dan Masalah Umum 

## Paymetheus 

#### 1. Saya baru saja mulai menggunakan Paymetheus, tapi sepertinya macet. 

Pertama kali Anda memulai Paymetheus, itu akan mengunduh rantaiblok. Ini bisa memakan waktu
Sampai satu jam dan Paymetheus akan nampak tidak melakukan apa-apa.

#### 2. Frasa sandi tidak valid untuk kunci master pribadi. 

Ini hanya cara panjang untuk mengatakan, "Kata sandi salah". Anda memasukkan kata sandi yang salah untuk akun dompet
Anda.

#### 3. "Tidak dapat membeli tiket: dana tidak mencukupi..." tapi dompet mengatakan bahwa uang saya cukup. 

Ada bug yang diketahui di Paymetheus di mana dana yang belum dihasilkan dihitung tersedia. Setelah ada voting, ada jendela 256 blok tempat dana masih terkunci. Dalam keadaan ini, mereka disebut belum dihasilkan. Bila periode habis
Mereka akan bisa digunakan kembali.

#### 4. Paymetheus menampilkan saldo yang salah. 

> Petunjuk ini berlaku seperti versi 0.8.x dan mungkin tidak bekerja dengan versi yang lebih baru.

Jika Paymetheus menampilkan saldo yang salah, Anda bisa memperbaikinya dengan menggunakan utilitas baris perintah untuk mengganti beberapa berkas.
Beberapa hal ini bisa membingungkan jika Anda tidak terbiasa dengan baris perintah, tapi cukup ikuti petunjuk baris demi baris
Dan kamu akan baik-baik saja Di mana Anda melihat perintah yang `look like this`, cukup salin dan tempelkan persis seperti pada baris perintah.
Jangan lupa tekan <ENTER> setelah setiap perintah. Jika Anda bingung, bergabunglah dengan [Slack channel](https://decred.slack.com) dan seseorang akan membantu,
Tapi pertama, periksa perintahnya dan pastikan Anda memasukkannya dengan benar. Anda akan membutuhkan seed dompet Anda. Proses ini memakan waktu sekitar 15 menit.

1. Kita akan membuka tiga jendela PowerShell. Tekan tombol Window. Ketik 'powershell' (jangan ketik kalimatnya di sini atau nanti) dan tekan ENTER.
2. Lakukan ini dua kali lagi.
3. Pindahkan jendela sehingga Anda bisa melihat semuanya.
4. Salin dan tempel perintah berikut: `cd $env:programfiles/decred/paymetheus` (Catatan, di PowerShell, tekan CTRL+V atau klik kanan untuk tempel). Tekan ENTER.
5. Jalankan perintah yang sama di dua jendela lainnya.
6. Buka Windows Explorer.
7. Tempel `%localappdata%/decred/paymetheus` ke bilah lokasi. Tekan ENTER.
8. Hapus folder 'mainnet'.
9. Pergi ke salah satu jendela PowerShell dan tempel `./dcrd -u <username> -P <password>`. Tekan ENTER.
10. Pergi ke salah satu jendela dan tempel Powershell lainnya `./dcrwallet --appdata=$env:localappdata/decred/paymetheus --create`
11. Ikuti petunjuknya dan masukkan seed Anda. Katakan tidak saat meminta tambahan lapisan enkripsi dan ya saat ditanya apakah Anda punya seed.
12. Pada teks, masukkan kata seed Anda dan tekan ENTER dua kali.
13. Tempel perintah berikut ke jendela yang sama: `./dcrwallet -u <username> -P <password> --appdata=$env:localappdata/decred/paymetheus`. Tekan ENTER.
14. Masukkan frasa sandi pribadi yang Anda gunakan saat membuat dompet.
15. Pergi ke jendela PowerShell ketiga dan tempel `./dcrctl -u <username> -P <password> --wallet -c $env:localappdata/decred/paymetheus/rpc.cert getbalance`. Tekan ENTER.
16. Tekan CTRL+C di dua jendela pertama untuk menutup program (dcrd dan dcrwallet).
17. Anda bisa menutup ketiga jendela PowerShell.
18. Kembali ke jendela Explorer. Hapus dua file, rpc.cert dan rpc.key.
19. Jalankan program Decred untuk mulai menggunakan Paymetheus lagi.

-----

## Bukti Saham

#### 1. Beberapa tiket saya yang terlewat/kadaluarsa masih terkunci setelah lebih dari satu hari. 

1. Jalankan proses dompet dengan bendera `--enablevoting` . Ini tidak akan mengeluarkan pembatalan tanpanya.
2. Buka dompet dengan `dcrctl --wallet walletpassphrase <yourpassphrase> 0`. Dompet harus dibuka agar bisa membuat pencabutan dan menandatanganinya.
3. Perintahkan dcrd untuk memberitahu dompet tentang tiket terlewat lagi sehingga dia akan mengeluarkan pembatalan dengan `dcrctl rebroadcastmissed`.


Pada saat itu, Anda harus melihat beberapa rincian tentang transaksi pencabutan di catatan dompet.
Setelah transaksi pencabutan tersebut ditambang ke blok (yang seharusnya menjadi blok berikutnya),
Anda akan melihat dana beralih ke kategori immaturestakegeneration di `dcrctl --wallet`
keluaran dapatkansaldo. Akhirnya, setelah 256 blok, mereka akan beralih ke kategori bisa dipakai dan dengan demikian tersedia untuk dibelanjakan.
