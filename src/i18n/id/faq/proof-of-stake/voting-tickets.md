# Tiket Voting 

---

#### 1. Kapan pemungutan suara bukti-of-stake dimulai? 

Voting Proof-of-stake[^7969] dimulai pada blok 4.096.

---

#### 2. Dalam kode sumber TicketPoolSize diatur ke 8.192, namun ukuran pool tiket saat ini lebih besar dari itu. Mengapa?

Hal ini disengaja dan merupakan bagian integral dari penyesuaian harga tiket dinamis[^8965]. `TicketPoolSize` adalah target ukuran tiket pool dan bekerja sangat mirip dengan target kesulitan untuk proof-of-work (PoW). Kenyataannya ukuran pool ticket saat ini lebih besar dari target inilah yang menyebabkan harga tiket naik yang pada akhirnya akan menyebabkan kurangnya tiket untuk dibeli dan mengakibatkan jumlah tiket di pool kembali berkurang ke arah target. Jika jatuh, harga akan turun untuk mendorong lebih banyak penjualan tiket guna meningkatkan jumlah tiket di pool menuju target.

---

#### 3. Jika saya tidak beruntung dan tiket saya kadaluwarsa tanpa pemungutan suara, apakah saya kehilangan biaya transaksi?

Ya[^9806].

---

#### 4. Voting pada mainnet di 'hold' sampai blok 4.096, dengan orang-orang tetap membeli tiket. Apakah ini berarti akan ada risiko yang jauh lebih tinggi untuk tiket ini akan kadaluarsa? 

Tidak ada[^9806], waktu kadaluwarsa tidak dimulai sampai sebuah tiket benar-benar ditambang ke dalam blok. Tiket tersebut hanya duduk di pool memori sampai mereka bisa dimasukkan ke dalam blok yang dimulai dengan blok 4.096.

---

#### 5. Apa yang terjadi jika tidak ada (atau kurang dari 3) pemilih terpilih yang menerbitkan transaksi ssgen mereka? 

Suara selalu ditentukan oleh tip saat ini. Penambang tidak memulai penambangan untuk blok baru sampai setidaknya 3+ pemilih terpilih menerbitkan transaksi ssgen mereka. Jadi, jika blok yang ditemukan tidak berhasil mendapatkan suara terpilih[^10219], blok tersebut hanya akan diyatimkan oleh blok berikutnya yang ditemukan penambang lain.

Untuk contoh yang lebih nyata, asumsikan tip rantai saat ini berada di blok 5.000. Pemilih yang ditentukan oleh blok 5.000 telah menyerahkan suara mereka, sehingga para penambang sedang menenggak mencari blok 5.1001. Sekarang, seorang penambang menemukan solusi untuk blok 5.1001 dan mengirimkannya ke jaringan. Semua daemon (dan juga dompet) akan melihat bahwa 5,001 baru saja muncul. Namun, para penambang tidak segera memulai penambangan di atas 5.000. Sebagai gantinya mereka terus menambang dari 5.000 sampai 3+ suara untuk blok 5.100 muncul. Pada saat itu mereka semua beralih dan mulai menambang sebesar 5,001. Jika suara 3+ tidak pernah muncul, kandidat lain akan membukukan 5.000 akan ditemukan oleh penambang lainnya yang masih mengerjakan blok 5.000 yang akan mengirimkan solusi berbeda untuk blok 5.100 ke jaringan. Karena masing-masing blok kandidat baru untuk 5,001 ini memiliki hash yang berbeda, tiket yang berbeda dipilih.

---

#### 6. Apa yang terjadi jika ada tiket yang saya lewatkan? 

Dompet Anda secara otomatis akan mencabut tiket di blok setelah terlewatkan[^13912], jadi Anda mengembalikannya setelah mereka kehilangan dana yang belum menghasilkan (artinya mereka tidak dapat dipinjamkan selama 256 blok saat mereka dapat menghasilkan).

Sebagai contoh:

```no-highlight
dcrctl --wallet getstakeinfo
```

Keluaran          | Deskripsi
---             |---
`allmempooltix` | Semua tiket saham di pool memori (menunggu ditambang ke sebuah blok).
`ownmempooltix` | Tiket saham Anda di kolam memori (menunggu ditambang ke sebuah blok).

---

#### 7. Apa perbedaan antara tiket yang terlewatkan dan dicabut? 

Tiket yang terlewat adalah tiket yang dipanggil untuk memilih, tapi tidak memilih. Setelah sebuah tiket terlewat, tiket bisa dicabut[^14763]. Dompet secara otomatis mencabut tiket yang terlewat yang dikontrolnya (dengan asumsi tiket tidak terkunci sehingga bisa menandatangani transaksi pencabutan).

Yang dilakukan `rebroadcastmissed` adalah memberitahu dompet untuk meminta daemon pada jaringan (`dcrd`) untuk memberikannya daftar tiket yang terlewat lagi untuk memeriksa ulang apakah ada yang perlu dicabut. Biasanya ini tidak diperlukan kecuali, misalnya, usaha untuk mencabut tiket dibuat tapi gagal karena dompetnya terkunci. Dengan kata lain, jika Anda melihat bahwa pencabutan tidak sama dengan terlewat, Anda mungkin perlu `rebroadcastmissed`. Seperti yang dikatakan, jarang ada kebutuhan untuk ini karena dompet secara otomatis melakukannya saat memulai dan mencari tiket yang terlewat di setiap blok.

Lanjutkan ke [Proof-of-Work Mining](/mining/proof-of-work.md)

---

## <i class="fa fa-book"></i> Sumber 

[^7969]: Decred Forum, [Posting 7.969](https://forum.decred.org/threads/531/#post-7969)
[^8965]: Decred Forum, [Pos 8.965](https://forum.decred.org/threads/531/page-2#post-8965)
[^9806]: Decred Forum, [Posting 9.806](https://forum.decred.org/threads/180/page-6#post-9806)
[^10219]: Decred Forum, [Pos 10.219](https://forum.decred.org/threads/180/page-6#post-10219)
[^13912]: Decred Forum, [Posting 13.912](https://forum.decred.org/threads/1271/#post-13912)
[^14763]: Decred Forum, [Pos 14.763](https://forum.decred.org/threads/1335/#post-14763)
