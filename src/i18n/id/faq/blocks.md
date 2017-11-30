# <i class="fa fa-cubes"></i> Blok 

---

#### 1. Bisakah suatu blok menjadi yatim setelah dikonfirmasi beberapa kali? 

Hanya jika ada reorg yang cukup panjang[^8918]. Hal itu terjadi bila Anda memiliki lebih banyak daya hash yang bekerja di sisi lain fork daripada kekuatan hash yang bekerja pada rantai terbaik saat ini.

---

#### 2. Bisakah kita menghapus penjelajah blok testnet apabila yang untuk mainnet tersedia? 

Testnet akan terus menjadi tempat uji coba untuk fitur baru, jadi masuk akal untuk mempertahankan penjelajah blok testnet[^9621] .

---

#### 3. Apa arti pesan "[INF] CHAN: Adding orphan block"? 

Ini hanya berarti sebuah blok yang tidak Anda beri induk telah diterima[^14660]. Ini hampir selalu terjadi saat memulai ulang `dcrd` disebabkan oleh cara kerja sinkronisasi. Anda masih menyinkronkan hingga blok terakhir, tapi peer jarak jauh, yang ada di depan Anda, mengirim pemberitahuan bahwa sebuah blok baru muncul, yang belum Anda beri induk.

Alih-alih mengabaikannya, begitu Anda hampir disinkronkan, dia menyimpannya untuk nanti sehingga saat Anda memiliki blok induk blok yang baru secara otomatis terhubung.

---

#### 4. Haruskah saya mengunduh rantaiblock lagi dengan setiap rilis peranti lunak baru? 

Anda hampir tidak perlu mengunduh rantai lagi[^14788] dengan versi baru kecuali jika itu perubahan yang sangat besar di mana akan masuk akal untuk memulai dari awal lagi. Biasanya meskipun, dia akan memindahkan hal-hal sehingga akan baik-baik saja.

---

#### 5. Berapakah nomor blok genesis?

Blok genesis[^16987] adalah tinggi blok 0 (blok nomor 0). Setiap blok setelah itu bertambah 1.

---

#### 6. Apa arti dari pesan "[INF] CHAN: FORK: Block 000..."? 

Berikut adalah contoh pesan:

```no-highlight
[INF] CHAN: FORK: Block 0000000000001aedcf1b82b087a1d05ef787550174da1012e473e8ee8c178937 (height 17879) forks the chain at height 17878/block 000000000000150f863186cab6ef5c433bcc155d2f683394f8e65cb037f80b16, but does not cause a reorganize
```

Ini berarti dua penambang menemukan solusi untuk blok sekitar waktu yang sama dan keduanya menyerahkan blok mereka yang sudah terpecahkan ke jaringan[^17791]. Keduanya sama-sama valid, namun node Anda melihat solusi lain ([000000000000147d33cde5e9823122924fb43405418712720eb6457956d8edbb](https://mainnet.decred.org/block/000000000000147d33cde5e9823122924fb43405418712720eb6457956d8edbb)) pertama, jadi dari sudut pandang node Anda, blok baru ([0000000000001aedcf1b82b087a1d05ef787550174da1012e473e8ee8c178937](https://mainnet.decred.org/block/0000000000001aedcf1b82b087a1d05ef787550174da1012e473e8ee8c178937)) berada di rantai samping.

Karena ini membutuhkan waktu blok untuk menyampaikan, node lain mungkin telah melihat 0000000000001aedcf1b82b087a1d05ef787550174da1012e473e8ee8c178937 dulu yang berarti bagi mereka solusi lain yang node Anda lihat pertama ([000000000000147d33cde5e9823122924fb43405418712720eb6457956d8edbb](https://mainnet.decred.org/block/000000000000147d33cde5e9823122924fb43405418712720eb6457956d8edbb)) adalah yang ada di sisi rantai.

Ini benar-benar normal dan terselesaikan sendiri kapan pun blok berikutnya ditemukan karena sekarang akan menentukan rantai terpanjang dan solusi mana pun yang tidak dibangun akan menjadi yatim.

Dalam hal ini, block #17.880 ([000000000000154c6091747245e3c2620447c71b346aed09548e74b4543d0d66](https://mainnet.decred.org/block/000000000000154c6091747245e3c2620447c71b346aed09548e74b4543d0d66)) akhirnya membangun di atas 000000000000147d33cde5e9823122924fb43405418712720eb6457956d8edbb, sehingga solusi lainnya ([0000000000001aedcf1b82b087a1d05ef787550174da1012e473e8ee8c178937](https://mainnet.decred.org/block/0000000000001aedcf1b82b087a1d05ef787550174da1012e473e8ee8c178937)) menjadi yatim.

---

## <i class="fa fa-book"></i> Sumber 

[^8918]: Decred Forum, [Post 8.918] (https://forum.decred.org/threads/557/#post-8918)
[^9621]: Decred Forum, [Posting 9.621] (https://forum.decred.org/threads/651/#post-9621)
[^14660]: Decred Forum, [Posting 14,660] (https://forum.decred.org/threads/1333/#post-14660)
[^14788]: Decred Forum, [Kirim 14,788] (https://forum.decred.org/threads/1336/#post-14788)
[^16987]: Decred Forum, [Posting 16,987] (https://forum.decred.org/threads/1852/#post-16987)
[^17791]: Decred Forum, [Posting 17.791] (https://forum.decred.org/threads/2925/#post-17791)
