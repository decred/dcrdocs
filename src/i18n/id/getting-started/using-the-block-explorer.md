# <i class="fa fa-cubes"></i> Menggunakan Block Explorer

---

## <i class="fa fa-info-circle"></i> Ikhtisar 

Block Explorer/Penjelajah blok berdasarkan
[Wawasan](https://github.com/bitpay/insight-ui) disediakan untuk
jaringan yang ditolak semua blok dan transaksi di Blockchain yang dideklarasikan terlihat melalui penggunaan penjelajah blok ini, bertempat di Jl
[`https://mainnet.decred.org`](https://mainnet.decred.org) dan
[`https://testnet.decred.org`](https://testnet.decred.org) untuk
Dompet testnet. Berikut adalah ulasan singkat beberapa informasi mengenainya.

Pilihan         | Penjelasan
---            | ---
`Height`       | Nomor blok
`Age`          | Berapa lama lalu blok itu ditambahkan ke Blockchain.
`Transactions` | Jumlah transaksi termasuk dalam blok.
`Votes`        | Jumlah bukti bukti suara yang masuk dalam blok.
`Fresh Stake`  | Jumlah tiket pasak baru yang dibeli di blok ini.
`Size`         | Ukuran (dalam bytes) dari blok.

Di bawah `Latest Transactions`, anda dapat melihat ID transaksi (txid) dan Nilai (dalam DCR) dikirim melalui jaringan.

---

## <i class="fa fa-cube"></i> Blok 

Blok dapat ditemukan dengan mencari nomor tinggi blok mereka,
Mengklik `Height` nilai dari halaman rumah, atau dari mereka
`BlockHash` nilai. Blok yang lebih tua akan memiliki jumlah blok yang lebih rendah. Setengah dari ikhtisar blok menunjukkan informasi yang relevan mengenai hal ini Blok tertentu Informasi ini meliputi: tinggi blok, blok Hash, dan beberapa parameter jaringan utama yang dijelaskan sebagai berikut:

Pilihan                   | Penjelasan
---                      | ---
`Number of Transactions` | Jumlah transaksi standar (DCR dikirim dari satu pengguna ke pengguna lainnya).
`Height`                 | Tinggi blockchain dimana blok ini berada.
`Block Reward`           | Jumlah DCR baru dicetak di blok ini.
`Timestamp`              | Waktu blok ini diciptakan oleh seorang penambang dan termasuk dalam blockchain.
`Merkle Root`            | Nilai semua transaksi hash termasuk dalam blok ini.
`Stake Root`             | Nilai semua transaksi hash yang terkait dengan transaksi di blok ini. Ini termasuk pembelian tiket, suara, dan pembatalan tiket.
`VoteBits`               | (1) Blok disetujui oleh pemilih bukti saham. (2) Blokir diveto oleh pemilih bukti saham dan semua transaksi non-saham di blok tersebut tidak berlaku lagi, bersama dengan calon penambang dan subsidi pembangunan.
`Final State`            | Keadaan terakhir dari generator bilangan acak pseudo digunakan untuk pemilihan tiket.
`Voters`                 | Jumlah suara bukti suara yang berhasil di blok ini. Nilai maksimumnya adalah 5.
`Fresh Stake`            | Jumlah pembelian tiket pasak dikonfirmasi di blok ini.
`Revocations`            | Jumlah tiket yang gagal di pilih dan dicabut.
`PoolSize`               | Jumlah tiket bukti bukti aktif.
`Difficulty`             | Kesulitan jaringanproof-of-work.
`SBits`                  | Harga satu tiket bukti saham.
`Bits`                   | Versi kompak dari kesulitan jaringan pada saat blok itu ditambang.
`Size`                   | Ukuran blok (dalam bytes).
`Version`                | Versi blok.
`Nonce`                  | Nilai yang digunakan oleh penambang untuk menemukan solusi yang tepat untuk blok ini.

## <i class="fa fa-exchange"></i> Transaksi 

Bagian ini mencantumkan semua transaksi yang ditambang ke dalam ini
blok. Transaksi yang dipilih dari jaringan mempool sesuai urutan
Biaya tertinggi dulu Semua transaksi dalam ikhtisar blok mengikuti ini
Order: Transaksi standar (peer-to-peer transfer), bukti taruhan, bukti pembelian tiket undian. Bagian berikut akan meninjau setiap jenis transaksi.

---

### Transaksi standar

Inilah informasi yang termasuk dalam transaksi standar yang ditolak.

Pilihan              | Penjelasan
---                 | ---
`Size`              | Ukuran transaksi dalam bytes.
`Fee rate`          | Tingkat biaya yang dikumpulkan oleh jaringan (per kB).
`Received Time`     | Waktu jaringan mengkonfirmasi transaksi.
`Mined Time`        | Waktu penambang termasuk transaksi di blok.
`Included in Block` | Nomor blok yang menjadi bagian transaksi itu.

Catatan `Received Time`, `Mined Time`, dan `Included in Block` tidak akan memiliki nilai sampai seorang penambang memvalidasi transaksi dan memasukkannya ke dalam blok yang dideklarasikan. Setelah dikonfirmasi di blok, transaksi dianggap selesai.


---

### Pembelian tiket

Untuk pembelian tiket (stake submission) ada beberapa perbedaan
Dari transaksi standar yang ditunjukkan.

Perhatikan perbedaan di bawah rincian: Kata `Ticket` muncul di atas
Alamat dompet pengirim di sebelah kiri, dan kata `Subsidi
Komitmen` muncul di sebelah kanan. Pengguna khusus ini membeli a
Saham tiket untuk 8.75411638 DCR dan menerima perubahan dalam jumlah
Dari 7.15994209 DCR Alamat yang tercantum di sebelah kiri bawah `Ticket` adalah Alamat yang berisi dana yang digunakan untuk membeli ini
tiket. Output pertama di sebelah kanan adalah alamat yang dipertahankan
Hak suara untuk tiket khusus ini. Hasil kedua, `Subsidi
Komitmen`, adalah alamat dimana hadiah akan pergi. Ini belum
Ditunjukkan oleh block explorer saat ini. Output ketiga dan terakhir
Adalah alamat dimana perubahan untuk transaksi ini akan dikirim.

---

### Bukti suara palsu

Perhatikan persyaratan pengenal di bagian rincian: `Vote`, `Stake
Base`, `Block Commitment`, dan `Vote Bits`:

Kata kunci ini menunjukkan bahwa transaksi ini adalah pemungutan suara yang dilontarkan Dari pemegang tiket bukti mengundi. Dalam contoh khusus ini, Pengguna sebelumnya telah membeli tiket untuk 8.99472311 DCR dan berada Mengirim 10.82959184 DCR setelah pemungutan suara dilemparkan dalam transaksi ini.
