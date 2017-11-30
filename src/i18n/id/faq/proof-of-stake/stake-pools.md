# <i class="fa fa-life-ring"></i> Pool Saham

---

#### 1. Apakah ada manfaat lain untuk pool saham selain tidak perlu menjalankan node penuh dan menjaga dompet Anda tidak terkunci? Misalnya, apakah akan memiliki kesempatan menang yang lebih baik atau semacamnya? 

Pool saham biasanya akan menerapkan kelebihan multi-dompet dengan memiliki banyak dompet yang didistribusikan secara fisik di seluruh dunia. Ini berarti ada sedikit kemungkinan pemungutan suara
Dilewatkan karena satu dompet sedang down. Ini juga mengurangi latensi antara dompet dan jaringan yang dapat mengurangi kemungkinan pemungutan suara yang terlewat

---

#### 2. Apakah pool saham membagi hadiah di antara semua peserta (% berdasarkan jumlah tiket yang Anda kirimkan ke pool)? 

Secara teknis dimungkinkan untuk membuat pool yang mendukung pemecahan penghargaan secara proporsional[^9262], namun penerapan referensi pool saham saat ini `dcrstakepool` tidak memungkinkan hal ini dilakukan. Ini hanya memberikan suara atas nama Anda. Hal ini dilakukan dengan membuat tiket hak voting menjadi naskah P2Sh multi-tanda tangan 1-dari-2. Pool menandai pemungutan suara dengan kunci pribadinya pada saat tiket dipilih. Karena ini adalah naskah multi-tanda tangan 1-dari-2, artinya jika pool gagal memberi suara untuk Anda atas alasan apa pun (sangat tidak mungkin pool karena mainnet memiliki banyak kelebihan dan failover otomatis), tetap memungkinkan untuk Memberi suara atas nama Anda sendiri karena Anda memiliki kunci pribadi kedua dan karena itu bisa memberikan tanda tangan yang sah dan memenuhi persyaratan 1-dari-2.

Juga, penting untuk dicatat bahwa pembelian tiket asli berisi komitmen untuk pergi ke alamat hadiah yang hanya memiliki kunci pribadi. Aturan konsensus pemungutan suara prrof-of-skate mendukung komitmen, jadi tidak mungkin pool mencuri dana Anda.

Untuk membagi penghargaan, pool harus menjadi penerima semua penghargaan dan kemudian dipercaya untuk membagi dengan benar antara semua peserta sesuai proporsionalitasnya. Dapat diduga bahwa skema seperti ini akan memunculkan pemahaman bahwa ini kurang aman dibanding pendekatan yang digunakan perancang pool saat ini.

---

#### 3. Saya harus menjalankan dompet saya untuk membeli tiket, tapi apakah mereka akan memilih dengan benar tanpa saya jika saya mematikannya dan pool memberi suara untuk saya? 

Ya[^9274], itu benar Anda hanya perlu menjalankan dompet Anda untuk menghabiskan uang Anda untuk membeli tiket yang mendelegasikan hak suara Anda ke pool yang kemudian akan memberikan suara atas nama Anda. Alamat hadiah adalah komitmen yang dipaksakan konsensus dalam pembelian tiket untuk salah satu alamat Anda yang memiliki kunci pribadi Anda.

---

#### 4. Apakah ada masalah yang bisa timbul dari pool saham yang memiliki terlalu banyak orang. Misalnya, memaksakan suara blok masuk atau keluar? 

Tentunya mungkin[^9311], namun salah satu hal yang harus didukung oleh semua pool adalah memungkinkan setiap pengguna memilih preferensi pemungutan suara masing-masing. Dengan begitu, kapan pun tiket mereka muncul dan pool memilih atas nama mereka, dia akan memilih sesuai dengan preferensi mereka.

---

#### 5. Apakah bit suara ditentukan saat Anda membeli tiket atau saat tiket Anda dipanggil untuk memilih? Apakah ini berubah saat berada di pool saham? 

Bit suara ditetapkan saat Anda benar-benar memilih[^13607] (yang benar-benar masuk akal karena Anda mungkin telah membeli tiket tersebut beberapa minggu atau beberapa bulan sebelum ada agenda pemungutan suara tersebut).

Sebuah pool saham dapat beroperasi bagaimanapun dia mau karena ada banyak ruang untuk fleksibilitas disebabkan oleh bagaimana skema komitmen pembelian tiket ini dirancang. Dikatakan bahwa, secara umum, orang harus menghindari penggunaan pool yang tidak memungkinkan mereka mengendalikan bagaimana mereka ingin memberikan suara pada isu-isu khusus yang tidak ada pada kolam.

---

#### 6. Pengamanan apa yang ada untuk menghentikan pemilik pool menghilang dengan dana dari pool? 

Desain pool saat ini sedemikian rupa sehingga pool TIDAK dapat mencuri dana[^14593]. Anda hanya mendelegasikan hak suara (dan kenyataannya ini adalah multisig 1-dari-2 yang berarti baik Anda ATAU pool boleh memberi suara). Pembelian tiket berisi komitmen yang dipaksakan konsensus untuk alamat akhir, jadi sama sekali tidak ada cara untuk mencuri dana.

Yang terburuk yang akan terjadi jika pemilik pool lenyap adalah suara yang akan dilewatkan sehingga mengakibatkan tiket dicabut yang pada gilirannya menyebabkan koin asli kembali ke pemilik koin asli (dikurangi biaya transaksi awal tentunya). Namun, seperti yang disebutkan sebelumnya, karena tiketnya adalah 1-of-2 multisig, setiap pengguna bisa menjalankan dompet mereka sendiri agar bisa memilih jika pemilik pool hilang.

---

#### 7. Di mana saya bisa melihat contoh tiket pool di blok penjelajah? 

Pool melibatkan alamat 'Dc' karena pool saham menggunakan alamat pay-to-script-hash[^17515]. Misalnya, lihat txid: [c0abc0ec63a8de15550f067e2b6fde28f0432fb91b938574b282daa69f914103](https://mainnet.decred.org/tx/c0abc0ec63a8de15550f067e2b6fde28f0432fb91b938574b282daa69f914103).

Lanjutkan ke [FAQ Tiket Voting PoS](/faq/proof-of-stake/voting-tickets.md)

---

## <i class="fa fa-book"></i> Sumber 

[^9262]: Decred Forum, [Pos 9.262](https://forum.decred.org/threads/626/#post-9262)
[^9274]: Decred Forum, [Posting 9.274](https://forum.decred.org/threads/626/#post-9274)
[^9311]: Decred Forum, [Posting 9.311](https://forum.decred.org/threads/582/page-2#post-9311)
[^13607]: Decred Forum, [Pos 13.607](https://forum.decred.org/threads/1236/#post-13607)
[^14593]: Decred Forum, [Pos 14.593](https://forum.decred.org/threads/1321/#post-14593)
[^17515]: Decred Forum, [Posting 17.515](https://forum.decred.org/threads/1289/#post-17515)
