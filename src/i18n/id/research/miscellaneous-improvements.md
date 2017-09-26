# Perbaikan Miscellaneous 

---

Seperti pada Bitcoin, subsidi meluruh secara eksponensial dengan tinggi blok. Namun, algoritma Decred, meski juga sangat sederhana, lebih baik menginterpolasi kerusakan ini dari waktu ke waktu sehingga tidak menghasilkan kejutan pasar dengan subsidi turun tajam seperti pada CryptoNote[^1]. Seperti PeerCoin[^2], kesulitan PoW dihitung dari rata-rata tertimbang rata-rata perbedaan pada blok sebelumnya. Namun, perhitungan ini juga diinterpolasi ke dalam periode kesulitan seperti Bitcoin. Bug "timewarp" di Bitcoin dikoreksi[^3], dengan memastikan bahwa setiap perbedaan waktu blok dimasukkan ke dalam perhitungan kesulitan.

Perlu dicatat juga bahwa banyak serangan penambangan yang terkenal, seperti penambangan selfish[^4] dan penambangan stubborn[^5], tidak akan lagi berfungsi secara menguntungkan dalam sistem dimana ada desentralisasi penambangan tambang yang efektif dan tidak ada penambang PoW-PoS Kolusi. Ini hanya karena tidak mungkin menghasilkan ekstensi rahasia untuk memblokir tanpa bantuan penambang saham. Ketahanan terhadap serangan pertambangan yang telah dijelaskan sebelumnya, dan serangan pertambangan yang baru dipahami yang spesifik untuk sistem kami, akan menjadi area yang bermanfaat untuk penelitian selanjutnya.

---

## <i class="fa fa-book"></i> Referensi 

[^1]: Buterin V. 2014. [Kontrak cerdas dan platform aplikasi desentralisasi generasi berikutnya](https://decred.org/research/buterin2014.pdf).
[^2]: King S. and Nadal S. 2012. [PPCoin: Kripto mata uang peer-to-peer dengan bukti saham](https://decred.org/research/king2012.pdf).
[^3]: ArtForz. 2011. [Re: Cara yang mungkin untuk membuat 50 serangan plus-ish yang sangat menguntungkan untuk pool?](https://decred.org/research/artforz2011.pdf)
[^4]: Eyal I. 2015. [Dilema si penambang](https://decred.org/research/eyal2015.pdf).
[^5]: Nayak K., Kumar S., Miller A., Shi E. 2015. [Penambangan yang keras kepala: Generalizing pertambangan egois dan menggabungkan dengan serangan gerhana](https://decred.org/research/nayak2015.pdf).
