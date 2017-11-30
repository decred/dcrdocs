# <i class="fa fa-firefox"></i> Panduan Pengguna Klien Web

---

Dompet web ini di ambil dari  Software tambahan di komputer mereka. Hal ini didasarkan pada
[Copay](https://github.com/bitpay/copay) with Decred specific changes
added and can be found at
[https://wallet.decred.org](https://wallet.decred.org)

Sebelum menggunakannya, ada beberapa hal yang perlu anda ketahui tentang klien web:

* Anda tidak bisa
  [Tambang pasak](/mining/proof-of-stake.md)
  Dengannya.
* Dompet Anda disimpan sepenuhnya di penyimpanan lokal peremban web anda.                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                 
  Artinya jika anda menghapus penyimpanan lokal Anda, dompet web akan
  terhapus dan harus membuat dari awal.
* Keamanan dompet anda sepenuhnya bergantung pada keamanan web peremban
  anda.
* Anda bisa menaruh pin di dompet Anda untuk mencegah pengiriman dana.
  Akses lainnya bergantung sepenuhnya pada kontrol akses dalam komputer,
  bukan di server atau rincian login.

---

## <i class="fa fa-plus-circle"></i> Membuat dompet klien web Anda

> Pertama

Buka [https://wallet.decred.org](https://wallet.decred.org). Anda akan
menjumpai `Terms and Conditions` . Perhatikan hal berikut:

Sama seperti dompet command-line, jika anda kehilangan biji kata atau
kata sandi untuk mengirim dana anda akan kehilangan akses ke dompet anda. TIdak ada menu reset kata sandi. Perhatikan juga bahwa semua transaksi pada decred adalah irreversible (tidak bisa dibalik) dengan desain jika anda tidak sengaja mengirim dana ke alamat yang salah, anda perlu meminta penerima untuk mengirimkannya kembali. Pengembang tidak dapat mengulang atau membalikkan transaksi.

Klik `I Agree` setelah anda membaca 'Persyaratan dan Ketentuan `Terms and Conditions`. Tulisan selamat datang akan muncul. Jika ini pertama kalinya anda menggunakan Decred, klik `Get Started`. Jika Anda ingin mengembalikan dompet yang pernah dibuat sebelumnya, klik `Import Backup`. Panduan ini akan berasumsi bahwa Anda baru memulai jadi klik `Get Started`.

> Kedua

Click the dropdown in the top left, then click `Add wallet`. Click
`Create New Wallet`. Give your wallet a name then click `Create New Wallet`.

A wallet will be generated for you.


> Ketiga

Dompet anda sekarang sudah siap untuk digunakan. Namun, sebelum anda harus menambahkan kata sandi untuk mengirim dana dan backup
biji kata yang digunakan untuk membuat dompet. Ini sangat penting untuk klien web yang tidak menyimpan catatan dompet anda secara permanen. Data dompet anda disimpan dalam singgahan peremban dan dapat dihapus dengan mudah. Jika anda menjalankan mode penyamaran,data dihapus segera setelah Anda menutup peremban. **TANPA BIJI KATA ANDA AKAN KEHILANGAN AKSES KE SEMUA DANA DALAM DOMPET ANDA** Walaupun data dompet tersebut masih tersimpan di dalam Blockchain, anda tidak bisa mengaksesnya tanpa biji kata.Blockchain, tanpa biji kata anda tidak dapat mengaksesnya.

<i class="fa fa-exclamation-triangle"></i> **JANGAN GUNAKAN BIJI KATA SAMA UNTUK BANYAK DOMPET! Kunjungi [Wallets and Seeds FAQ](/faq/wallets-and-seeds.md#3-can-i-run-multiple-wallets) untuk mengetahui pentingnya ini. Disarankan agar sedapat mungkin dompet baru berarti memiliki biji baru.** 

Klik tombol `Preferences` di sebelah kanan berseberangan dengan nama dompet anda. Hanya ada tiga hal yang anda perlukan di sini:

Pilihan                                | Deskripsi
---                                   | ---
`Wallet Alias`                        | Jika mau, anda bisa mengganti nama dompet.
`Request Password for Spending Funds` | Karena dompet Anda tersimpan di cache browser, tidak ada kata sandi tambahan yang diperlukan untuk mengaksesnya. Dengan menetapkan kata sandi di sini, Anda memastikan bahwa hanya Anda yang bisa mengirim dana jika orang lain mengakses browser Anda. Ketik kata sandi dan klik `Set`. Perhatikan peringatan yang mengatakan kata sandi tidak dapat dipulihkan. Tidak ada fitur reset password pada dompet. Jika Anda kehilangan kata sandinya, Anda tidak akan pernah bisa memindahkan koin Anda keluar dari dompet atau menggunakannya sebagai bukti pemungutan suara.
`Backup`                              | Di sinilah Anda akan menemukan biji kata Anda.

> Langkah Empat

Klik `Backup`. Anda akan melihat layar ini:

Pertama-tama, baca catatannya. Gunakan hanya satu dompet sekaligus dengan a Diberi benih (lihat: [FAQ](#)). Anda dapat memasang beberapa dompet
Mesin yang berbeda, tapi hanya satu dari mereka yang harus berlari sama sekali Diberi waktu Klik `Show Wallet Seed`. Tuliskan ini di tempat yang aman,Atau memasukkannya ke dalam dokumen terenkripsi yang tidak akan Anda lupakan kata sandi. Daftar kata ini digunakan untuk menghasilkan otentikasi Kunci untuk dompetmu Siapa saja yang memiliki daftar ini dapat mengakses Dana di dompetmu

> **SANGAT PENTING**

**DALAM KEADAAN APAPUN, JANGAN BERIKAN BIJI KATA ANDA KEPADA SIAPA PUN! SEKALIPUN ITU ADALAH DEVELOPER!**

Setelah Anda menuliskan kata-kata di bawah (dan periksa tiga kali bahwa itu benar; kapitalisasi itu penting), lanjutkan ke langkah berikutnya.

> Langkah Lima

Sekarang Anda telah menuliskan biji kata Anda dan memeriksanya. Periksa kembali biji kata tersebut. Ini Serius. Langkah ini sangat penting. Tanpa daftar ini dompet Anda Tidak bisa direkonstruksi dan tidak ada yang bisa mengembalikan. Sekarang setelah Anda yakin daftarnya tersimpan dengan benar, klik `Delete Words`. Klik `Back` dua kali untuk membuka layar dompet utama.

---

## <i class="fa fa-long-arrow-right"></i> Kirimkan dana dengan klien web

> Langkah Satu

Pada halaman dompet web utama, klik tombol `Send` pada tombol
bawah. Anda akan dibawa ke halaman ini. Perhatikan `Advanced Options`
Bagian telah diperluas.Di kolom `To` , masukkan ke dalam Alamat. Alamat penerima ditolak.

> Langkah Dua

Di `Amount`, masukkan nilai di DCR untuk dikirim ke penerima. Jika
anda bisa mengetikkan pesan opsional di kolom `Note` . Tekan
`Send`. Opsi `Use Unconfirmed Funds` memungkinkan anda untuk menggunakan dana yang dikirim kepada Anda dengan sepengetahuan jaringan namun belum dikonfirmasi olehnya [Penambang bukti pekerjaan](/mining/proof-of-work.md). Jika
Ini dihidupkan dan jumlah yang ditentukan hanya dapat ditutupi oleh
Dengan menggunakan dana yang belum dikonfirmasi, transaksi tidak akan berlanjut sampai tersedia konfirmasi.

---

## <i class="fa fa-long-arrow-left"></i> Menerima dana melalui klien web

> Langkah Satu

Klik tombol `Receive` di bagian bawah jendela. Anda akan melihat
layar ini:

Berikan orang yang mengirimkan DCR alamat yang ditampilkan (ini akan dimulai Dengan `Ds`) atau mereka dapat menggunakan kode QR jika dompet atau layanan mereka menerimanya. Anda bisa menggunakan alamat yang sama sesering yang anda mau, tapi demi keamanan anda disarankan untuk membuat alamat baru untuk setiap dompet. Jangan khawatir diberi alamat duplikat. Terdapat sekitar `2.08x10^93` kemungkinan alamat yang berbeda, jadi anda tidak akan kehabisan alamat.

