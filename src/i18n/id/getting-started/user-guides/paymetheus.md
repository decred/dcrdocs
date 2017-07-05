# Panduan Pemasangan Paymetheus 

Paymetheus adalah dompet grafis yang mudah digunakan untuk Decred. Dengan itu, Anda dapat mengirim dan menerima DCR,
Membeli tiket untuk [suara PoS](/mining/proof-of-stake.md), dapatkan riwayat semua transaksi Anda dan banyak lagi.
Tentang satu-satunya yang tidak dilakukan Paymetheus adalah voting PoS.

---

## Unduh dan pasang 

The Windows Installer (`.msi` file) is located here: [https://github.com/decred/decred-binaries/releases/tag/v1.1.0](https://github.com/decred/decred-binaries/releases/tag/v1.1.0). It will install Paymetheus to your computer's Program Files folder. Installation is pretty straightforward, but instructions are provided below:

1. 1.Download file yang benar:

    For 32-bit computers, download the `decred_1.1.0-release_x86.msi` file. <br />
    For 64-bit computers, download the `decred_1.1.0-release_x64.msi` file.

2. Arahkan ke lokasi download dan klik dua kali file `.msi` .

3. Ikuti langkah-langkah instalasi. Dalam proses ini Anda akan diminta untuk menerima Perjanjian Lisensi Pengguna Akhir.

4. Setelah penyiapan, fitur harus diinstal ke folder `..\Program Files\Decred\` folder and accessible through the Start Menu (look for `Decred` dalam daftar Program)

---

## Mulai Paymetheus 
Anda sekarang siap untuk mulai menggunakan Decred! Mulai program 'Decred'. Anda sekarang akan melihat layar koneksi:  

![Paymetheus connection screen](../../img/Paymetheus-dcrd-login.png)  

> Dua program sebenarnya berjalan saat Anda memulai Decred. Ada 'Paymetheus' yang merupakan dompet grafis yang akan kita bicarakan lebih jauh
> Dan 'dcrd' yang merupakan daemon komunikasi (diucapkan DAY-mon, sebuah program yang berjalan di latar belakang dan itu tidak berinteraksi secara langsung
> Dengan pengguna) yang benar-benar berbicara dengan jaringan Decred. Ini berarti Anda bisa menjalankan dcrd
> Di komputer lain (seperti selalu di server) dan kemudian gunakan Paymetheus untuk menghubungkannya dari jarak jauh.

Kita akan menggunakan yang lokal yang Paymetheus sudah mulai jadi tekan saja Continue.

> Pertama kali Paymetheus dimulai, ia akan mendownload blockchain di background. Ini bisa memakan waktu hingga satu jam.

---

## Buat atau Pulihkan Dompet 
Anda sekarang akan memiliki pilihan untuk membuat dompet baru atau mengembalikan dompet dari benih. Jika Anda membaca ini, Anda mungkin baru dan tidak
Sudah punya dompet jadi mari kita buat yang baru. Jika Anda mengklik restore, Anda akan diminta memasukkan kata-kata benih Anda alih-alih diberi benih baru.
Sisa prosesnya sama. Klik "Buat dompet baru". Anda akan melihat layar berikut:  

![Layar pembuatan dompet Paymetheus](/img/Paymetheus-seed-window.png)  

<i class="fa fa-exclamation-triangle"></i> **BERHENTI DI SINI!!! JANGAN KLIK LANJUTKAN! **

**Ini adalah bagian terpenting dalam menggunakan Decred. Di kotak putih kata benih Anda akan ditampilkan. Kata-kata ini adalah kunci dompet Anda.  **
 **TANPA KATA-KATA INI ATAU PERWAKILAN HEX ANDA AKAN PERMANEN DAN SELAMANYA AKSES AKSES TERHADAP DANA ANDA!**  

**TIDAK MEMBERIKAN MEREKA KEPADA SIAPA PUN, TIDAK BAHKAN MEMUTUSKAN PEMBANGUNAN!**

Dengan kata-kata ini, orang lain dapat menciptakan dompet Anda di komputer lain dan mentransfer semua dana ke dompet lain. Tidak mungkin membalikkan transaksi dalam Decred, jadi jika seseorang mencuri Keputusan Anda, tidak ada cara untuk mengembalikannya.  

<i class="fa fa-exclamation-triangle"></i> **JANGAN GUNAKAN SEPEDA SAMA DI WALLET YANG MULTIPLE! Kunjungi [Wallets and Seeds FAQ](/faq/wallets-and-seeds.md#3-can-i-run-multiple-wallets) untuk melihat mengapa hal ini penting. Disarankan agar sedapat mungkin dompet baru berarti menghasilkan benih baru.** 

Rusak dan mata uang digital lainnya sering digambarkan seperti rekening bank. Namun, tidak seperti perbankan online, dalam sistem Decred tidak ada pihak ketiga terpercaya yang memegang uang Anda atas nama Anda. Anda dan Anda sendiri mengendalikan DCR Anda, sama seperti dengan uang fisik. Ketika uang tunai atau DCR hilang, salah tempat, atau dicuri, kemungkinan besar akan hilang secara permanen.

Jika kehilangan dompet Anda, Anda kehilangan akses terhadap apa pun yang Anda miliki di dalamnya dan tidak ada orang, bahkan pengembang yang terdesak pun bisa mendapatkannya kembali. Jadi sangat penting bahwa Anda meluangkan waktu untuk membaca halaman ini dan MENULIS BAWAH kata benih di tempat yang aman. Ide bagus adalah menuliskannya di selembar kertas dan menyimpannya di tempat yang aman dan juga menyimpannya dalam file ENCRYPTED di komputer Anda. Penyimpanan awan seperti Dropbox atau OneDrive baik-baik saja saat tindakan pencegahan dilakukan. Karena akun online dapat diretas, Anda harus benar-benar mengenkripsi file dompet Anda (MS Word atau Libre/OpenOffice dapat melakukan ini) sebelum mengunggahnya ke layanan penyimpanan awan.

Baiklah, jadi Anda telah mengamankan kata-kata benih Anda di setidaknya dua tempat yang berbeda. Klik Lanjutkan. Anda sekarang diminta untuk mengetikkannya kembali untuk memastikan Anda telah menuliskan semuanya dengan benar jika Anda perlu mengembalikan dompet Anda nanti. Perhatikan Anda tidak bisa menempelkannya; Anda perlu mengetikkannya. Ini untuk memastikan Anda menyimpan kata-kata yang tersimpan di tempat lain selain clipboard. Lakukan dan klik Confirm.

---

## ilihlah Passphrase Private Wallet 
Masukkan frasa sandi untuk digunakan setiap kali Anda membuat transaksi di jaringan. Selama dompet Anda terkunci dengan frasa sandi ini, dana dompet Anda tidak dapat diakses siapa pun yang mendapat kontrol atas file dompet. Ada juga pilihan di sini untuk frasa sandi publik. Ini digunakan untuk mengenkripsi semua data publik (transaksi dan alamat) di dalam file dompet Anda sehingga jika dicuri, musuh tidak dapat menghubungkan Anda dengan transaksi Anda. Bagi kebanyakan orang, frasa sandi publik biasanya berlebihan, jadi Anda bisa membiarkannya tidak dicabut. Setelah Anda memasukkan frasa sandi pribadi (dan opsional publik) baru Anda, klik Enkripsikan.

Dompet Anda sekarang akan membuat dan menyinkronkan ke blockchain. Ini bisa memakan waktu beberapa menit di komputer yang lebih lambat. Perhatikan bahwa kata benih yang Anda tulis akan turun
Bekerja dengan aplikasi dagu terdegradasi, bukan hanya Paymetheus.

Lanjutkan ke [Using Paymetheus](using-paymetheus.md)
