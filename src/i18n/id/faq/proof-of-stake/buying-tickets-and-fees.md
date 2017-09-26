# <i class="fa fa-ticket"></i> Membeli Tiket dan Biaya

---

#### 1. Apakah ada cara untuk melihat tiket yang dibeli dengan dompet lokal? 

Gunakan perintah berikut untuk menunjukkan semua tiket Anda[^9987]:

```no-highlight
dcrctl --wallet gettickets true
```

---

#### 2. Apa saya harus membayar biaya transaksi untuk transaksi ssgen? 

Tidak, transaksi ssgen tidak mengenakan biaya[^10219] (tidak seperti transaksi pembelian tiket asli yang bersaing untuk mendapatkan ruang terbatas di setiap blok). Mereka seperti transaksi basis koin bukti kerja dalam hal ini.

---

#### 3. Bagaimana cara mengubah biaya tiket?

```no-highlight
dcrctl --wallet setticketfee <fee>
```

---

#### 4. Bagaimana cara membeli tiket secara manual? 

```no-highlight
dcrctl --wallet purchaseticket <fromaccount> <spendlimit> <minconf>
```

Dimana:

Pilihan        | Penjelasan
---           | ---
`fromaccount` | Biasanya "default" (kecuali jika Anda telah membuat yang lain).
`spendlimit`  | Jumlah maksimum DCR yang ingin Anda belanjakan untuk tiket.
`minconf`     | Ini bisa diatur ke 0.

---

#### 5. Bagaimana cara mengatur ticketfee? 

`ticketfee` (atau biaya tiket) menentukan urutan di mana tiket mempool masuk ke pool pemungutan suara. Biaya yang lebih tinggi mendorong penambang proof-of-work untuk meletakkan tiket Anda di depan antrian. Jika Anda menetapkan biaya lebih tinggi dari rata-rata tiket Anda kemungkinan besar disertakan di blok berikutnya. Standar Txfee adalah 0,01 DCR. Nampaknya ide terbaik adalah memberi harga tinggi txfee Anda sehingga Anda berada di garis depan. Tapi itu tidak selalu merupakan ide bagus. Nyatanya, ide tersebut seringnya kurang bagus karena antrian mempool selalu sangat pendek atau nol. Jangan lupa bahwa txfee akan makan keuntungan DCR Anda karena dikenakan biaya pada setiap tiket dan uang tidak dapat dikembalikan walaupun dia memberikan hak suara atau tidak.

Umpamakan harga tiket konstan 10 DCR. Setiap blok 20 tiket bisa masuk ke pool pemungutan suara dari mempool. Itu adalah nilai 200 DCR. Setiap blok menghasilkan sekitar 30 DCR dan mengembalikan 50DCR kepada para pemilih. 3 DCR dikirim ke pengembang untuk membantu mendanai pengembangan Decred sehingga hanya 27 yang berakhir di tangan para penambang. Ini berarti bahwa 77 DCR dibebaskan setiap blok untuk kembali ke tiket, dengan asumsi bahwa semua pengembalian diinvestasikan kembali. Itu kurang dari setengah dari apa yang bisa ditangani blok itu. Satu-satunya cara agar lebih banyak DCR bisa masuk ke mempool adalah dengan investasi eksternal (yaitu membeli dari bursa) atau dari para penambang yang telah menyimpan DCR mereka menunggu harga tiket turun.

Dalam kasus penurunan harga tiket, seorang penambang ingin masuk ke pool sebelum harga berubah lagi. Hal ini terjadi setiap 144 blok (sekitar 12 jam). Tidak masalah apakah itu di blok pertama atau ke-100. Di 144 blok 2.880 tiket akan diterima dengan nilai 28.800 DCR. Tidak ada semacam volume di jaringan proof-of-stake pada saat ini. Ada satu skenario di mana Anda mungkin ingin menetapkan biaya lebih tinggi. Jika biaya saham akan berubah dalam beberapa blok, mempool tidak kosong dan Anda ingin memastikan bahwa Anda mendapatkan harga saat ini, ini dapat membantu menetapkan biaya Anda sedikit lebih tinggi daripada rata-rata untuk memastikan Anda masuk, terutama jika Perubahan selanjutnya berarti Anda melewatkan tiket.

Lanjutkan ke [PoS Solo Mining FAQ](/faq/proof-of-stake/solo-mining.md)

---

## <i class="fa fa-book"></i> Sumber 

[^9987]: Decred Forum, [Post 9,987](https://forum.decred.org/threads/582/page-2#post-9987)
[^10219]: Decred Forum, [Post 10,219](https://forum.decred.org/threads/180/page-6#post-10219)
