# <i class="fa fa-money"></i> Dompet dan Seed

---

#### 1. Haruskah saya memberikan seed dompet saya kepada seseorang? 

Tidak, Anda tidak boleh berbagi[^8613] seed dompet Anda dengan siapa pun. Melakukannya sama dengan memberi mereka semua DCR Anda di dompet itu.

---

#### 2. Bagaimana saya bisa mengubah seed hex dompet saya menjadi seed kata? 

Anda dapat menggunakan utilitas [dcrseedhextowords](https://github.com/davecgh/dcrseedhextowords)[^8660] untuk mengubah seed yang terdegradasi dari hex ke seed kata yang dibutuhkan untuk memasukkan ke dalam dompet.

---

#### 3. Dapatkah saya menjalankan beberapa dompet dengan seed yang sama? 

Menjalankan beberapa dompet dengan seed yang sama bisa mengarah pada situasi di mana dompet tidak akan melihat keseimbangan yang sama. Anda seharusnya tidak menjalankan beberapa dompet dengan seed yang sama.[^9731]

Masalahnya adalah bahwa alamat dibuat secara deterministik dari seed. Jadi jika Anda memiliki dua dompet yang berjalan pada seed yang sama, pada dasarnya Anda berakhir dengan situasi seperti ini:

* Dompet A: Tahu semua alamat sampai alamat #15
* Dompet B: Tahu tentang semua alamat sampai alamat #12

Jadi, koin apa pun yang telah dikirim ke alamat #13, #14, dan #15 akan diketahui ke Dompet A, tapi bukan Dompet B.

Selanjutnya, jika Anda memberi tahu Dompet B untuk mendapatkan alamat berikutnya, dia juga tidak akan melihat koin karena, dari sudut pandangnya, alamat itu sekarang sudah ada dan tidak akan mencari transaksi sebelum titik saat ini. Ini adalah pengoptimalan karena, seperti yang dapat Anda bayangkan, rantaiblok akhirnya menjadi sangat besar seiring waktu dan akan sangat mahal (dalam hal penggunaan sumber daya) untuk memindai seluruh rantai setiap kali sebuah alamat baru dihasilkan.

Ada satu pengecualian untuk ini dan itu untuk voting dompet panas yang tidak memiliki dana sendiri. Jika dompet ** hanya ** melakukan pemungutan suara dan tidak membeli tiket atau membuat transaksi lainnya, itu aman.[^11319]

---

#### 4. Dapatkah seseorang mencuri koin saya jika mereka mengakses wallet.db? 

Tidak ada yang bisa mencuri koin Anda jika mereka bisa mengakses berkas wallet.db[^9803] kecuali mereka juga memiliki kata frasa pribadi Anda. Jika Anda memilih untuk menggunakan enkripsi publik, mereka juga tidak dapat mengakses kunci publik atau alamat publik Anda yang diperluas.

---

#### 5. Dapatkah seseorang menggunakan serangan brute-force pada dompet acak untuk meregenerasi kata seednya (kata-kata tidak diasinkan)? 

Semua kata seed adalah pemetaan langsung kata-kata bahasa Inggris ke digit hex. Seed tidak lebih dari bilangan acak kriptografi 256-bit (32-byte). Garam sama sekali tidak berlaku di sini. Ini tidak ada hubungannya dengan angka acak kasar[^10452] .

Dengan kata lain, karena setiap kata bisa jadi 256 kemungkinan dan ada 32 kata, yang menghasilkan 256^32 (atau 2^256 tergantung pada bagaimana Anda ingin melihatnya, tapi itu adalah jumlah yang sama) kemungkinan. Jumlah itu lebih besar dari keseluruhan jumlah atom hidrogen di alam semesta yang diketahui. Sebenarnya, ini hampir melebihi jumlah atom total di alam semesta yang diketahui.

Untuk menempatkan ini dalam perspektif, dengan asumsi ada 7 miliar orang di planet ini dan setiap orang memiliki 10 komputer dan masing-masing komputer tersebut dapat menguji satu miliar kemungkinan per detik dan bahwa Anda dapat menemukan solusi rata-rata setelah menguji hanya 50% dari Kemungkinan total, masih butuh 26x10^48 (itu 26 triliun triliun triliun triliun) tahun untuk memberi brute-force ke satu seed.

---

#### 6. Seed saya tidak bekerja Apa yang dapat saya lakukan? 

Pastikan semua kata berada pada satu garis yang dipisahkan oleh spasi[^10657].  Meskipun dicetak beberapa baris supaya bisa dibaca, mereka harus dimasukkan dalam satu baris saja. Juga periksa ulang kata-kata Anda supaya tidak memiliki kesalahan ketik dengan membandingkannya dengan kata-kata dalam daftar kata [PGP word list](https://en.wikipedia.org/wiki/PGP_word_list).

---

#### 7. Bagaimana cara mengimpor kunci dalam format impor dompet (WIF)? 

Ada kemungkinan untuk mengimpor kunci pribadi mandiri[^10724] ke `dcrwallet`. Perhatikan bahwa ini hanya untuk alamat `--noseed` dan Anda tidak boleh menjalankan ini kecuali Anda tahu apa yang Anda lakukan!

Buka dompet (abaikan tanda kurung sudut):

```no-highlight
dcrctl --wallet walletpassphrase <private encryption passphrase> 60
```

Impor kunci pribadi mandiri (`--noseed`) (abaikan tanda kurung sudut):

```no-highlight
dcrctl --wallet importprivkey <put WIF private key here>
```

Lihat saldo akun yang diimpor (berikan beberapa waktu untuk menelusuri ulang dan lihat catatan di dcrwallet untuk melihat kemajuan penelusuran):

```no-highlight
dcrctl --wallet getbalance "imported" 0 all
```

---

#### 8. Apa perbedaan antara alamat testnet dan mainnet? 

Alamat kunci umum testnet[^11507] dimulai dengan huruf `Tk`. Alamat mainnet dimulai dengan huruf `Dk`. `T` = Testnet, `D` = (Decred) Mainnet.

---

#### 9. Apa saja jenis-jenis alamat? 

Alamat Decred[^14995] sebenarnya hanyalah representasi kunci publik (yang bisa berupa naskah hash) beserta awalan 2-byte yang mengidentifikasi jaringan dan jenis dan akhiran checksum untuk mendeteksi alamat yang dimasukkan dengan tidak benar.

Akibatnya, Anda selalu bisa mengetahui jenis alamat yang didasarkan pada awalan 2-byte.

Byte pertama awalan mengidentifikasi jaringan. Inilah sebabnya mengapa semua alamat utama diawali dengan "D", alamat testnet diawali dengan "T", dan alamat simnet diawali dengan "S". Byte kedua dari awalan mengidentifikasi jenis alamat itu.

Alamat yang paling umum digunakan saat ini adalah hash pubkey secp256k1, yang diidentifikasi oleh huruf kecil "s". Ini mewakili satu kunci publik dan oleh karena itu hanya memiliki satu kunci pribadi yang terkait yang dapat digunakan untuk menebusnya.

Pool saham, bagaimanapun, menggunakan alamat pay-to-script-hash, yang diidentifikasi oleh byte kedua sebagai huruf kecil "c" (sekali lagi yang ditunjukkan pada param yang terhubung). Citarasa spesifik dari naskah yang dihasilkannya adalah multi-tanda tangan 1-dari-2, yaitu bagaimana memungkinkan pool, atau Anda, untuk memilih. Baik Anda dan pool memiliki kunci pribadi Anda sendiri dan karena naskah hanya memerlukan satu tanda tangan dari dua kemungkinan, yaitu bagaimana memungkinkan delegasi hak suara ke pool tanpa Anda melepaskan hak suara sepenuhnya.

---

## <i class="fa fa-book"></i> Sumber 

[^8613]: Decred Forum, [Pos 8.613](https://forum.decred.org/threads/576/#post-8613)
[^8660]: Decred Forum, [Posting 8.660](https://forum.decred.org/threads/534/page-3#post-8660)
[^9731]: Decred Forum, [Posting 9.731](https://forum.decred.org/threads/657/#post-9731)
[^11319]: Decred Forum, [Posting 11.319](https://forum.decred.org/threads/531/page-3#post-11319)
[^9803]: Decred Forum, [Pos 9.803](https://forum.decred.org/threads/686/#post-9803)
[^10452]: Decred Forum, [Posting 10.452](https://forum.decred.org/threads/734/#post-10452)
[^10657]: Decred Forum, [Posting 10.657](https://forum.decred.org/threads/483/#post-10657)
[^10724]: Decred Forum, [Pos 10.724](https://forum.decred.org/threads/643/page-3#post-10724)
[^11507]: Decred Forum, [Posting 11.507](https://forum.decred.org/threads/792/#post-11507)
[^14995]: Decred Forum, [Pos 14.995](https://forum.decred.org/threads/1321/page-2#post-14995)
