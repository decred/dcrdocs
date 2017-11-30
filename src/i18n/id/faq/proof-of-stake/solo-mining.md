# <i class="fa fa-male"></i> Pertambangan Solo 

---

#### 1. Apakah saya memerlukan daya hash untuk tambang saham? 

Saham "pertambangan" tidak memerlukan kekuatan hash[^9304]. Anggap saja itu seperti bunga pada koin investasi. Anda mengunci koin Anda untuk jangka waktu tertentu untuk membeli tiket yang memberi Anda probabilitas tinggi (>99%) untuk mendapatkan hak suara dan menerima bunga sebagai imbalan untuk memberikan suara dan biaya kesempatan untuk tidak dapat menggunakan koin yang berpotensi sampai ~4,7 bulan.

Jika Anda telah membeli tiket saham, koin-koin itu terkunci sampai tiket bisa menang atau kadaluarsa. Anda penyaham solo dan oleh karena itu Anda HARUS menjaga dompet Anda online 24/7 sampai semua tiket Anda menang (atau kadaluarsa) atau Anda akan kehilangan keuntungan karena Anda tidak dapat memberikan suara jika dompet tidak online. Karena koin-koin itu sekarang terkunci tidak mungkin Anda mengubah koin yang sudah disahamkan sekarang.

Pool saham, di sisi lain, memungkinkan Anda mendelegasikan hak suara Anda ke pool sehingga Anda bertanggungjawab untuk online 24/7 dan memberikan hak suara Anda untuk Anda.

---

#### 2. Bukankah salah satu alasan utama penambangan saham adalah untuk memastikan selalu ada cukup jumlah peer yang online? 

Jelas tidak[^9311]. Penambangan saham tidak mungkin menerapkannya. Dompet gaya SPV dapat dengan mudah melakukan pertaruhan yang diperlukan dengan berkomunikasi dengan node penuh lainnya (`dcrd` instances) pada jaringan. Memang benar dompet saat ini mengharuskan `dcrd` untuk berjalan, tapi itu tidak akan selalu terjadi.

Sekalipun perangkat lunak itu berusaha menerapkannya, Anda tidak dapat menghentikan orang untuk menulis utilitas dan melakukannya melalui jaringan peer-to-peer tanpa perlu menjalankan instalan lokal mereka sendiri.

---

#### 3. Apa yang terjadi jika dompet saya tidak dapat dibuka atau terkunci saat tiket saya dipilih oleh para penambang? 

Jika dompet Anda sedang offline atau terkunci[^9806] saat tiket Anda dipilih, Anda kehilangan imbalan dan tiket Anda akan segera dikeluarkan dari pool. Tidak ada "pengulangan".

---

#### 4. Dapatkah saya menguji apakah mesin saya dapat dijangkau untuk pemungutan suara? Dengan kata lain, jalankan tindakan seorang penambang yang ingin mendapatkan suara saya. 

Anda tidak perlu dijangkau. Voting bersifat deterministik berdasarkan per blok[^9806]. Artinya, dompet Anda akan tahu apakah tiket Anda dipilih berdasarkan blok saat ini dan kemudian "transaksi suara" (ssgen transaction) disiarkan ke jaringan, seperti transaksi lainnya.

---

#### 5. Dapatkah saya menjalankan beberapa dompet hanya dengan voting yang sama dengan beberapa server? 

Anda bisa memiliki dompet dengan beberapa voting saja karena tidak menciptakan alamat baru[^12697]. Masalahnya muncul saat Anda memiliki dua dompet yang menciptakan transaksi yang melibatkan alamat baru karena mereka tidak tahu apa yang dilakukan orang lain.

Jika Anda melakukan pengaturan panas/dingin, Anda bisa membuat dompet panas hanya dengan voting tanpa masalah selama mereka tahu alamat yang Anda berikan hak suara.

Lanjutkan ke [FAQ Pool Saham](/faq/proof-of-stake/stake-pools.md)

---

## <i class="fa fa-book"></i> Sumber 

[^9304]: Decred Forum, [Post 9.304](https://forum.decred.org/threads/626/page-2#post-9304)
[^9311]: Decred Forum, [Posting 9.311](https://forum.decred.org/threads/582/page-2#post-9311)
[^9806]: Decred Forum, [Posting 9.806](https://forum.decred.org/threads/180/page-6#post-9806)
[^12697]: Decred Forum, [Posting 12.697](https://forum.decred.org/threads/1127/#post-12697)
