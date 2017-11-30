# Detail transaksi 

---

Transaksi Decred adalah transfer DCR yang ada di dalam blok. Transaksi terutama terdiri dari pemasukan dan pengeluaran, meskipun ada beberapa bidang data lainnya juga. 


## Format Transaksi 

Lapangan        | Deskripsi                                                                                    | Ukuran
---          | ---                                                                                            | ---
Versi      | Versi transaksi Angka ini digunakan untuk menandakan bagaimana transaksi harus diinterpretasikan  | 4 byte
Jumlah masukan  | Jumlah pemasukan dalam transaksi dikodekan sebagai bilangan bulat panjang variabel                   | 1-9 byte
Masukan       | Daftar serial dari semua transaksi masuk                                                | Variabel
Jumlah keluaran | Jumlah pengeluaran dalam transaksi dikodekan sebagai bilangan bulat panjang variabel                  | 1-9 byte
Keluaran      | Daftar serial semua hasil transaksi                                               | Variabel
Waktu penguncian    | Saat transaksi bisa dihabiskan. (Biasanya nol, dalam hal ini tidak berpengaruh)       | 4 byte
Kadaluarsa       | Tinggi blok tempat transaksi berakhir dan tidak berlaku lagi                       | 4 byte


### Masukan
Masukan menghabiskan keluaran yang telah dibuat sebelumnya. Ada dua jenis transaksi masukan: Saksi dan bukan saksi.


#### Masukan Non-Saksi
Masukan transaksi non-saksi adalah referensi ke keluaran yang tidak terpakai dan nomor urut. Sebuah referensi untuk keluaran yang tidak terpakai disebut "outpoint." Outpoint memiliki tiga bidang:

Lapangan            | Deskripsi                                                                                                                           | Ukuran
---              | ---                                                                                                                                   | ---
Hash transaksi | Hash dari transaksi yang berisi pengeluaran yang digunakan                                                                     | 32 byte
Indeks keluaran     | Indeks keluaran yang dikeluarkan                                                                                                   | 4 byte
Pohon             | Pohon tempat pengeluaran yang dihabiskan masuk Hal ini diperlukan karena ada lebih dari satu pohon yang digunakan untuk menemukan transaksi dalam satu blok. | 1 byte

Selain outpoint, masukan non-saksi mengandung nomor urut. Jumlah ini memiliki nilai riwayat lebih tinggi daripada penggunaan yang relevan; Namun, tujuan yang paling relevan adalah dengan mengaktifkan "penguncian" pembayaran sehingga tidak dapat ditebus sampai waktu tertentu.


#### Masukan Saksi
Masukan transaksi saksi berisi data yang diperlukan untuk membuktikan bahwa sebuah keluaran dapat digunakan. Masukan saksi berisi empat bidang data:

Lapangan            | Deskripsi
---              | ---
Nilai            | Jumlah koin yang dikeluarkan untuk transfer keluaran.
Tinggi blok     | Ketinggian blok yang berisi transaksi di mana keluaran yang digunakan berada.
Indeks blok      | Indeks transaksi di mana keluaran yang digunakan berada.
Naskah tanda tangan | Naskah yang memenuhi persyaratan naskah dalam keluaran yang digunakan.


### Keluaran
Keluaran adalah transfer DCR yang bisa digunakan oleh masukan. Keluaran selalu memiliki tiga bidang data:

Lapangan             | Deskripsi                                                                                     | Ukuran
---               | ---                                                                                             | ---
Nilai             | Jumlah DCR yang dikirim oleh keluaran.                                                     | 8 byte
Versi           | Versi dari keluaran. Angka ini digunakan untuk menandakan bagaimana keluaran harus diinterpretasikan. | 2 byte
Naskah kunci publik | Naskah yang harus dipenuhi untuk menggunakan keluaran                                           | Variabel

---

## serialisasi 
Format yang ditampilkan di atas bukanlah format di mana transaksi dikirim dan diterima. Saat mengirim atau menerima transaksi, format tersebut dapat dibuat dalam beberapa cara. Cara agar transaksi layak dilakukan ditentukan dari versinya. Versi transaksi menempati empat byte, namun keempat byte tersebut sebenarnya digunakan untuk menyimpan dua nilai yang terpisah. Dua byte pertama dari versi transaksi menunjukkan nomor versinya yang sebenarnya. Dua byte kedua menunjukkan format serialnya.


### Format Serialisasi
Saat serialisasi, ada dua bagian utama dari sebuah transaksi: "Prefiksnya" dan data saksinya.
Prefiks transaksi terdiri dari:

* Masukan (tanpa data saksi)
* Keluaran
* Kunci waktu
* Kadaluwarsa

Data saksi dari transaksi hanya melibatkan masukannya. Bidang data yang disertakan dari masukannya bergantung pada format serialisasi tertentu. Format ini bisa berupa salah satu dari berikut ini:

* **0 (serialisasi penuh)** - Prefiks transaksi terletak tepat sebelum data saksinya.
* **1 (Tidak ada saksi)** - Prefiks transaksi adalah satu-satunya data yang ada.
* **2 (Saksi saja)** - Data saksi transaksi adalah satu-satunya data yang ada. Untuk setiap masukan, ini termasuk nilai, tinggi blok, indeks blok, dan skrip tanda tangan.
* **3 (penandatanganan Saksi)** - Data saksi transaksi adalah satu-satunya data yang ada, dan dibuat untuk keperluan penandatanganan. Untuk setiap masukan, ini hanya termasuk naskah tanda tangannya.
* **4 (Saksi penandatanganan dengan nilai)** - Data saksi transaksi adalah satu-satunya data yang ada, dan dibuat untuk tujuan penandatanganan. Berbeda dengan format penandatanganan Saksi, format ini mencakup nilai setiap masukan sebelum naskah tanda tangannya.
