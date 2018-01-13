# <i class="fa fa-ticket"></i> Tanya Jawab Umum PoS

---

#### 1. Apa itu sistem Proof-of-Stake? 

Sistem Proof-of-Stake (PoS) memungkinkan pemegang Decred untuk memiliki suara dalam pengaturan mata uang. Ini bertujuan untuk memberi pengguna suara di samping para penambang.
Agar bisa berpartisipasi, pengguna bisa membeli "tiket", yang masuk ke lotere pool. Setiap blok 5 tiket dipilih dari pool tiket PoS. Jika setidaknya 3 dari mereka memvalidasi blok yang sebelumnya ditambang,
Blok yang baru ditambang ditambahkan ke rantai, dan penambang PoW dan penyaham PoS dibayar. Jika blok tersebut tidak divalidasi oleh penyaham PoS, para penambang PoW tidak dibayar, tapi penyaham PoS dibayar. Ini adalah
 Untuk memberi insentif kepada penambang PoW untuk menambang sesuai dengan keinginan para penyaham PoS.

Sistem PoS ini memiliki beberapa keunggulan yang bisa memecahkan masalah yang mungkin dihadapi sistem PoW saja. Misalnya, karena penyaham PoS harus memvalidasi blok yang ditambang penambang PoW, penambang PoW tidak bisa
Memutuskan sendiri untuk mengubah aturan jaringan (serangan 51%). Atau, ketika rantai Decred menjadi fork rantai lama, yang lebih kecil, akan mati dengan cepat karena tidak divalidasi oleh komponen PoS
rantai.

Sistem PoS memberi penghargaan kepada peserta untuk saham mereka. Setiap blok Decred memiliki komponen hadiah PoS yang akan didistribusikan ke setiap tiket yang dipilih untuk memilih di blok tersebut. Sistem ini dirancang sedemikian rupa
supayaWaktu rata-rata tiket yang akan dipilih adalah 28 hari. Jika tiket belum dipilih setelah 40960 blok (kurang dari 5 bulan) maka akan dicabut oleh sistem. DCR yang digunakan untuk membeli Tiket dikembalikan terlepas dari apakah dia memberi suara atau tidak.

Fitur lain yang menarik yang dimiliki oleh sistem PoS ini adalah kemampuan untuk memilih pada sebuah agenda. Karena validasi blok dapat dianggap sebagai hak suara, dengan menambahkan komponen votebit tambahan ke tiket, sistem dapat melacak dan menghitung suara dari serangkaian blok. Suara ini bisa berupa apa saja.

Dalam sistem Proof-of-Stake Decred siapa pun yang memegang DCR dapat berpartisipasi dengan membeli tiket.

---

#### 2. Apa itu tiket?

Tiket adalah token yang Anda beli untuk berpartisipasi dalam sistem PoS. Anda bisa membeli tiket melalui baris antarmuka perintah dcrctl, atau melalui GUI seperti Paymetheus[^1] atau Decrediton. Kapan pun Anda membeli 
Tiket, Anda membayar harga tiket saat ini dan biaya tiket menggunakan DCR Anda. Ketika sebuah tiket dibeli, ia pergi ke 'mempool sementara'. 20 tiket bisa ditambang di setiap blok dan tiket dipilih
Ditambang berdasarkan biaya per kilobyte. Karena jumlah tiket yang bisa ditambang ke blok dengan harga tertentu (2880) terbatas, mungkin ada persaingan untuk menbuat tiket ditambang. Pada kasus ini,
Anda dapat meningkatkan biaya yang siapAnda bayar untuk mebuat tiket Anda ditambang. Setelah tiket Anda ditambang itu akan berpindah dari 'allmempool' saat ini ke pool tiket 'belum menghasilkan'. Setelah 256 blok
(Sekitar 20 jam) kemudian akan bisa dihasilkan dan masuk ke dalam pool tiket langsung di mana tiket layak untuk memilih.

---

#### 3. Apakah saya perlu terus terhubung ke jaringan untuk berpartisipasi dalam PoS? 

Dompet perlu online 24/7 untuk menanggapi pemungutan suara jika salah satu tiket Anda terpilih. Ada dua cara utama untuk melakukan ini; Dompet bertaruh solo yang Anda siapkan dan biarkan terhubung sepanjang waktu, atau AndanBisa menggunakan [pool saham](/mining/proof-of-stake.md#solo-mining-or-pool-mining). Pool saham pada dasarnya adalah sebuah komunitas yang menjalankan dompet di mana Anda dapat menetapkan hak suara tiket Anda dan pool akan
Beri suara atas nama Anda untuk sebagian kecil dari hadiah PoS.

Penting untuk dicatat bahwa Anda hanya menugaskan hak suara ke pool, bukan dana Anda sebenarnya. Pool saham tidak memiliki akses ke dana Anda setiap saat.

---

#### 4. Berapa harga tiketnya? 

Harga tiket ditentukan oleh algoritma yang bertujuan untuk menjaga ukuran pool tiket, yang merupakan jumlah total tiket di pool tiket sistem PoS sekitar ukuran target 40960 tiket.
Harga tiket akan naik atau turun sesuai permintaan tiket, dan jumlah tiket yang saat ini ada di pool.

Setiap 144 blok algoritma menyesuaikan harga tiket. Ini disebut jendela beli. Setiap blok bisa berisi 20 tiket yang baru dibeli. Artinya di setiap jendela pembelian maksimal 2880 tiket
 yangBisa ditambahkan ke pool tiket sistem PoS.

Biaya tiket selalu bisa diuangkan walaupun jika suara tiket Anda, terlewat atau kadaluarsa.

---

#### 5. Apa itu biaya?

Sistem PoS menggunakan dua jenis biaya, sebuah txfee (juga dikenal sebagai 'split' fee) dan ticketfee.
	
Txfee adalah biaya yang Anda bayar untuk menangani transaksi untuk membeli tiket Anda. Biaya ini secara standar diatur ke jumlah yang rendah (0,01 DCR/kB) dan tidak boleh diubah.
Tiket adalah biaya yang harus Anda bayar jika tiket Anda ditambang. Biaya ini merupakan insentif bagi penambang PoW untuk menambang tiket Anda dan menambahkannya ke pool tiket.

Jika jendela pembelian penuh, berarti ada lebih banyak tiket yang dibeli daripada ada yang tersedia untuk ditambang di jendela itu, tiket akan digunakan untuk menentukan tiket mana yang bisa dimasukkan ke dalam
Pool tiket Tiket dengan tiket tertinggi akan dipilih oleh para penambang PoW.

Biaya dihitung dalam DCR per kilobyte. Karena tiketnya hanya sekitar 300 (solo) atau ukuran 540 (pool) byte, biaya sebenarnya yang Anda bayar akan lebih rendah dari jumlah yang Anda tetapkan sebagai jumlah biaya tertentu.

Baik txfees maupun ticketfees tidak akan dikembalikan saat tiket memakai hak suara, kadaluwarsa, atau melewatkan pemungutan suara.

Mengembalikan dana kembali ke dompet Anda setelah memberikan hak suara atau dicabut tidak menghasilkan biaya.

---

#### 6. Apa itu pool saham? 

Pool saham setara dengan pool pertambangan, tapi untuk sistem PoS. Melalui pilihan di dompet Decred Anda, Anda dapat memberikan hak suara Anda ke pool saham. Jika tiket Anda dipilih untuk memilih,
pool saham akan memberikan suara untuk Anda dan Anda diberi imbalan PoS dikurangi biaya pool saham (biasanya 4-5%). Berbeda dengan pool pertambangan, imbalan PoS tidak terbagi antara pengguna pool saham. Hadiah penuh diberikan kepada pemilik tiket.

Pool saham akan memungkinkan Anda membeli tiket namun tidak memiliki dompet sendiri yang dibuka dan selalu online. Penting untuk dicatat bahwa dana Anda tidak pernah meninggalkan dompet Anda. Anda tidak mengirim apapun ke pool,
Hanya memberi wewenang untuk memberikan suara atas nama Anda. Pool saham tidak dapat mengakses dana Anda.

Pool saham biasanya akan menerapkan kelebihan multi-dompet dengan memiliki banyak dompet yang didistribusikan secara fisik di seluruh dunia. Ini berarti ada sedikit kemungkinan pemungutan suara dilewatkan karena satu dompet rusak.
Ini juga mengurangi latensi antara dompet dan jaringan yang dapat mengurangi kemungkinan pemungutan suara tidak terjawab.

---

#### 7. Apa yang terjadi dengan dana saya saat saya membeli tiket? 

Dana yang digunakan untuk membeli tiket terkunci sampai tiket dipilih untuk memilih atau kadaluarsa. Mereka tidak dapat meninggalkan dompet Anda dan akan muncul di bagian "lockedbytickets" di dompet Anda.
Jika tiket Anda dipilih untuk memilih, Anda akan dikembalikan jumlah total yang dibayarkan untuk tiket dan diberi hadiah PoS.

Satu-satunya biaya untuk menggunakan sistem ini adalah biaya yang Anda tetapkan. Txfee akan dikenakan biaya untuk transaksi tiket Anda pada jaringan. Tiket akan dikenakan biaya untuk dimasukkan ke dalam
Tiket, dan dibayarkan ke penambang PoW. Jika tiket Anda tidak ditambang, tidak ada biaya karena transaksi tidak pernah berhasil masuk ke jaringan.

Jika tiket Anda tidak dipilih untuk memilih setelah 40960 blok (sekitar 4 bulan), sistem akan mencabut tiket Anda dan uang yang Anda bayar untuk itu (dikurangi biaya) akan ditransfer kembali ke dompet Anda. 

---

#### 8. Berapakah peluang pemungutan suara tiket saya? 

Sistem PoS dalam Decred menggunakan distribusi Poisson untuk menentukan kemungkinan pemungutan suara pada suatu waktu. Dengan ukuran pool target 40960 tiket, setiap satu tiket memiliki kesempatan 50% untuk memilih
Dalam 28 hari dan kesempatan 99,5% untuk memilih sebelum kadaluwarsa. Perhatikan bahwa nilai ini akan berubah dengan ukuran pool.


---

#### 9. Apa itu voting Proof-of-Stake? 

Karena validasi blok yang dilakukan oleh sistem PoS berperilaku seperti sistem pemungutan suara, maka dapat digunakan untuk memberikan suara pada isu lainnya juga.

Saat dipilih untuk memvalidasi blok, suara tiket menentukan apakah menyetujui blok yang sebelumnya ditambang atau tidak. Ini membutuhkan 3 dari 5 tiket terpilih untuk memilih ya.

Dengan menambahkan parameter lain ke tiket yang tidak mengganggu persetujuan blok yang ditambang, sistem dapat melacak jumlah tiket yang menggunakan parameter tersebut di atas sejumlah blok. Anda dapat mengatur parameter ini di dompet Anda setiap saat sebelum tiket memberi suara.

Misalnya, Anda bisa memilih warna tiket Anda menjadi merah atau biru, tetapkan opsi itu, dan sistem akan menghitung 1000 blok berikutnya berapa banyak tiket merah dan berapa banyak tiket biru yang ada. Mungkin ada 3000 tiket merah, 1500 tiket biru, dan 500 yang tidak memilih warna.

Jika Anda mengganti opsi merah atau biru dengan pilihan ya atau tidak, Anda memiliki sistem pemungutan suara yang dapat menghitung suara dari waktu ke waktu. Dengan menggunakan sistem suara PoS siapa pun yang memegang DCR dapat memberikan suara pada isu-isu yang ditetapkan dalam sebuah agenda.

Sistem pemungutan suara ini dapat digunakan untuk masalah pemerintahan manapun. Untuk Decred, penggunaan yang paling menonjol adalah memilih pada hardfork, yang merupakan perubahan teknis terhadap cara mata uang bekerja. Beberapa contoh:

- Meningkatkan ukuran blok maksimal.
- Mengubah algoritma yang digunakan PoS untuk menentukan harga tiket.
- Vote on major new features for the currency (e.g. lightning network, enhanced privacy).
- Ubah algoritma PoW.
- Pretty much anything the community decides would be in the best interest of the currency.

Saat ini, sebuah platform bagi masyarakat untuk mengajukan dan mengadvokasi agenda pemungutan suara sedang dalam pembangunan.

---

#### 10. Apa itu voting hardfork? 

Seperti criptocurrency Decred lainnya, Decred mungkin perlu melakukan hardfork di beberapa titik.

Salah satu masalah agenda yang ditetapkan untuk sistem voting PoS bisa jadi hardfork. Jika masalah seperti itu ditetapkan, versi baru dari kode sumber Decred akan mencakup hardfork di dalamnya, namun hardfork tidak akan aktif sampai sistem PoS memilihnya.

Untuk pemungutan suara hardfork untuk memulai dua syarat penting harus dipenuhi:

- Pertama, 75% penambang PoW harus meningkatkan ke versi terbaru dari versi blok jaringan saat ini. Pengecekan ini berjalan selama 1000 blok terakhir.
- Kedua, 75% penambang PoS harus meningkatkan ke versi terbaru. Pengecekan ini berjalan selama 2016 balok terakhir.

Begitu pemeriksaan ini terpenuhi, proses pemungutan suara dimulai. Tiket bisa diatur dengan parameter tambahan ya / tidak / abstain. Anda melakukan ini di dompet Anda sebelum tiket memilih. Tiket yang ditandai sebagai abstain tidak akan dihitung dalam jumlah total suara.

Sistem PoS kemudian mulai menghitung tiket dengan parameter ini yang ditetapkan di atas jumlah blok yang telah ditentukan. Jika selama kurun waktu ini jumlah suara 'ya' adalah 75% atau lebih, pemilihan suara telah selesai. Kunci dalam periode sejumlah blok akan dimulai sebelum hardfork ditayangkan, jadi setiap orang memiliki kesempatan untuk melakukan peningkatan versi dan tidak akan terbelah dari jaringan.

Karena kode untuk hardfork sudah ada dalam versi Decred saat ini, pengembang tidak perlu ikut campur atau mayoritas penambang PoW dan penambang PoS juga tidak perlu melakukan peningkatan versi setelah keputusan tercapai. Jika pemungutan suara pada hardfork lolos maka akan diterapkan secara otomatis setelah kunci pada periode.

Pemungutan suara hardfork bisa gagal di banyak titik. Pemungutan suara mungkin tidak dimulai sama sekali jika penambang PoW atau penambang PoS tidak melakukan peningkatan versi. Setelah itu, ambang suara 75% mungkin tidak tercapai.

Jika sebuah keputusan gagal, babak baru akan dimulai pada awal proses. Ini berarti memeriksa apakah penambang PoW telah ditingkatkan, jika para penambang PoS telah ditingkatkan, dan kemudian periode penghitungan suara lainnya. Ini akan berlanjut dalam jumlah putaran tertentu, setelah itu, jika pemungutan suara belum lewat, masalah agenda akan diajukan.

---

#### 11. Apakah PoS rentan terhadap pertukaran besar dengan menggunakan Decred pelanggan mereka? 

Jumlah Decred seseorang (atau pertukaran) tidak berarti apa-apa bagi PoS. Ini adalah jumlah tiket yang Anda miliki. Dana yang digunakan untuk membeli tiket terkunci sampai tiket mereka beli suara. Ini berartiDecred yang terlibat dalam PoS secara efektif tidak dapat ditransfer. Agar sebuah pertukaran menggunakan decred pelanggan mereka untuk memilih, mereka harus mengirimnya dari dompet dan menguncinya hingga 5 bulan. Orang-orang
Akan melihat perubahan saldo mereka (decred terkunci dalam PoS tidak akan menunjukkan sebagai bisa menghasilkan) dan mereka tidak akan dapat menarik dana sehingga pertukaran akan menderita kerugian cairan besar.

Selanjutnya ada batas berat 20 tiket yang ditambahkan per blok sehingga tidak ada pertukaran yang bisa membanjiri pool lebih cepat dari ini.

Akhirnya, ada tutup lembut pada jumlah tiket di pool. Setiap 144 blok (2880 tiket) harga tiket disesuaikan berdasarkan jumlah tiket di pool dan tarif tiket baru itu
ditambahkan di jendela terakhir. Akhirnya harga tiketnya akan sangat tinggi bahkan bursa pun tidak akan bisa membeli banyak tiket. Dan ingat bahwa bahkan jika mereka melakukan itu DCR mereka terkunci sehingga mereka
Tidak bisa membeli lagi saat harga turun lagi.

---

#### 12. Apakah PoS rentan terhadap pengaruh dari pemegang saldo besar seperti pengembang aslinya? 

Batas ukuran pool di atas berlaku di sini. Ini menghentikan satu orang/kelompok membanjiri pool PoS dengan sejumlah besar tiket mereka sendiri. Bahkan jika mereka membeli seluruh pool (dengan biaya besar), mereka akan mendapatkanpaling banyak sekitar 4.000 tiket (berdasarkan jendela tiket sebelumnya di mana yang sekitar 30DCR biasanya naik ke 100 untuk jendela berikutnya, dan maksimal untuk yang setelah itu seringkali lebih dari 300). Jadi
Pemegang saldo besar mungkin bisa membeli 2 jendela. Sebuah jendela seharga 30 akan menjadi 86.400DCR maka yang berikutnya seharga 100 adalah 288.000DCR. Jadi biaya 374.400DCR untuk membeli 5760 tiket. Dengan ukuran target pool 40960 tiket, 374400 DCR akan memberi Anda sekitar 14% dari semua tiket.

Now the holder could wait a couple of days for the price to drop then start buying back up again. Except that most of their funds will be locked in the ones they bought earlier (although some will have voted) so their buying power for the new window is greatly reduced. But let's say they have super capital and bought all the decred on all exchanges. So they are able to buy another two windows and replace those tickets that voted and were successful in buying all the tickets (at very high fees and/or prices). Let's say that takes them to about 25% of the tickets.

Tiket untuk blok dipilih dengan distribusi acak. Untuk memaksa pemungutan suara mengarah ke arah tertentu Anda memerlukan 3 dari 5 suara untuk blok yang diberikan yaitu 60%. Bahkan dengan belanja modal yang besar itu,
Mereka kurang dari setengah jalan ke arah sana. Dan pemungutan suara tidak diputuskan dalam satu blok sehingga Anda memerlukan 60% dari 75% blok dalam periode pemilihan.

Dan KEMUDIAN Anda masih membutuhkan penambang PoW untuk mengkonfirmasi suara. Jika mereka berpikir seseorang sedang mencoba mempermainkan sistem, mereka dapat memilih untuk tidak memvalidasi blok.

Jadi pada dasarnya ini hampir tidak mungkin, bahkan jika satu orang memiliki persentase DCR yang BESAR.

But then we come to the stake pools. Stake pools, while not having access to any of their users' funds, do have the ability to change votes on tickets assigned to them. This is why it is suggested that when joining a stake pool, people don't just go for the largest one. Decred is short for 'decentralised credit' so part of the spirit of PoS is ensuring that the PoS stake pools don't get too large in relation to the others. However, even the largest at almost 20% would still only get on average one vote per block.

Jadi Decred dirancang khusus untuk meminimalkan dampak dari pool PoW dan PoS besar maupun individu (termasuk pengembang) dengan kepemilikan besar.

## <i class="fa fa-book"></i> Tautan 

[^1]: [Paymetheus Ticket Purchasing Guide](/getting-started/user-guides/using-paymetheus.md#-purchase-tickets-tab)
