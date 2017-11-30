# Fungsi BLAKE-256 Hash

---

SHA256, yang digunakan di Bitcoin, memiliki sejumlah kekurangan teknis karena konstruksi Merkle-Damgård-nya. Kerentanan ini menyebabkan kompetisi SHA3 untuk fungsi hash baru berdasarkan konstruksi fundamental yang berbeda. Decred telah memilih BLAKE256 sebagai fungsi hash, finalis untuk kompetisi[^1] [^2]. Fungsi hash didasarkan pada konstruksi HAIFA yang menggabungkan variasi aliran ChaCha stream oleh Bernstein. Fungsi hash terkenal karena kinerjanya yang tinggi pada mikroarsitektur x86-64, lebih cepat untuk pesan singkat daripada SHA256[^3] meskipun dianggap memiliki margin keamanan jauh lebih tinggi pada putaran 14.

---

## <i class="fa fa-book"></i> Referensi 

[^1]: Aumasson J., Henzen L., Meier W., Phan R. 2010. [SHA-3 proposal BLAKE](https://decred.org/research/aumasson2010.pdf).
[^2]: Aumasson J., Henzen L., Meier W., Phan R. 2014. The hash function BLAKE.
[^3]: Bernstein D. and Lange T. 2013. [eBACS: ECRYPT pembandingan sistem kriptografi](http://bench.cr.yp.to).
