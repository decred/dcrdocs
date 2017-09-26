# Desain Hybrid

---

Kontras utama dengan skema follow-the-satoshi yang sebelumnya dijelaskan[^1] adalah sistem undian baru di mana tiket harus dibeli dan kemudian menunggu pada periode jatuh tempo sebelum mereka dapat dipilih dan dibelanjakan. Pemilihan tiket untuk blok dilakukan secara leksikografis dari pool tiket matang berdasarkan pseudorandomness yang terdapat di header blokir. Karena manipulasi kekeruhan ini sulit dilakukan dalam sistem PoW, manipulasi pemilihan tiket dikaitkan dengan biaya mendasar bagi penambang PoW. Pemilihan tiket selama periode waktu dapat digambarkan dengan fungsi kepadatan probabilitas yang sama dengan probabilitas mendapatkan blok di PoW pada tingkat hash konstan dari waktu ke waktu pada kesulitan konstan[^2], menghasilkan distribusi probabilitas dengan mode kira-kira Sama dengan setengah ukuran tiket pesawat. Harga untuk membeli tiket diatur oleh masalah saham baru yang ditentukan oleh jumlah rata-rata tertimbang eksponensial tiket yang dibeli dan ukuran pool tiket matang di blok sebelumnya.

Validasi blok PoW dijelaskan dengan langkah-langkah berikut:

1. Sebuah blok ditambang oleh penambang PoW, yang memilih transaksi untuk dimasukkan ke dalamnya. Transaksi terkait sistem pas dimasukkan ke dalam set UTXO.
2. Penambang PoS memilih di blok dengan menghasilkan sebuah transaksi pemungutan suara dari tiket mereka. Pemungutan suara memungkinkan blok yang dibangun di atas blok sebelumnya dan memilih apakah pohon transaksi reguler sebelumnya (yang berisi transaksi gabungan dan transaksi yang tidak terkait dengan saham) valid.
3. Pembuat PoW lainnya mulai membangun satu blok, memasukkan suara penambang PoS. Mayoritas pemungutan suara harus disertakan dalam blok berikut agar blok tersebut diterima oleh jaringan. Dari transaksi pemungutan suara di blok baru ini, penambang PoW memeriksa sebuah bendera untuk melihat apakah penambang PoS mengindikasikan jika pohon transaksi reguler blok tersebut valid. Bendera pemungutan suara ini dihitung dan, berdasarkan suara mayoritas, sedikit bendera diatur di blok ini untuk menunjukkan apakah pohon transaksi reguler blok sebelumnya benar.
4. Nonce ditemukan yang memenuhi kesulitan jaringan, dan blok tersebut dimasukkan ke dalam rantai blok. Jika pohon transaksi reguler blok sebelumnya telah divalidasi, masukkan transaksi ini ke dalam set UTXO. Pergi ke 1.

Untuk mencegah manipulasi suara yang disertakan, penalti subsidi linier diterapkan pada blok saat ini jika gagal memasukkan semua transaksi pemungutan suara ke dalam blok mereka. Hukuman "lunak" untuk membatalkan pohon transaksi sebelumnya membantu mencegah pembongkaran pekerjaan, yang diperlukan untuk mengamankan sistem, dan membuat asumsi bahwa blok berikutnya akan diperoleh oleh seorang penambang yang tidak tertarik untuk melestarikan subsidi pihak sebelumnya. Blok demi kepentingan mereka sendiri. Bahkan dalam kasus ini tidak benar, penambang berbahaya dengan tingkat hash tinggi masih memerlukan paling sedikit \((\text{number for majority}/2)+1\) yang mendukung pohon transaksi blok sebelumnya  Untuk menghasilkan blok yang memberi mereka subsidi dari blok sebelumnya.

Bendera bit ditambahkan secara eksplisit ke kedua header blok dan suara sehingga penambang dapat dengan mudah memilih di fork hard atau soft yang baru.

---

## <i class="fa fa-book"></i> Referensi 

[^1]: Bentov I., Lee C., Mizrahi A., Rosenfeld M. 2014. [Bukti aktivitas: Memperluas bukti kerja Bitcoin melalui bukti-bukti](https://decred.org/research/bentov2014.pdf).
[^2]: Nakamoto S. 2008. [Bitcoin: Sistem uang elektronik peer-to-peer](https://decred.org/research/nakamoto2008.pdf).
