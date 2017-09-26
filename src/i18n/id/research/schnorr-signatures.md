# Tanda tangan Schnorr 

---

Tanda tangan Schnorr telah diusulkan untuk Bitcoin. Mereka juga telah digunakan secara luas dalam kripto yang lain, seperti koin Nxt dan CryptoNote. Dalam kasus yang paling sederhana, kriptosistem tanda tangan Schnorr ECDSA dapat digambarkan sebagai berikut:

1. \(y = xG\) dimana \(y\) adalah titik kunci publik pada kurva, \(x\) adalah skalar pribadi, \(G\) adalah generator kurva.
2. \(r = kG\) dimana \(r\) adalah titik pada kurva yang dihasilkan dari perkalian \(k\), skalar nonce, oleh generator.
3. \(h = H(M || r)\) dimana \(H\) adalah fungsi hash yang aman, \(M\) adalah pesan (biasanya hash 32 byte), dan \(r\) adalah Titik encoded yang telah dijelaskan sebelumnya. \(||\) menunjukkan Rangkaian.
4. \(s = k - hx\) dimana \(s\) adalah skalar yang dilambangkan dari \(k - hx\).
5. Tanda tangan adalah \((r,s)\), dan verifikasi hanya \(H(M || r) == hQ + sG\).

Di atas, perkalian dengan huruf kapital (misalnya, \(kG\)) adalah perkalian titik oleh skalar, dan karenanya selalu menghasilkan titik pada kurva. Penambahan titik-titik ini menghasilkan titik lain. Penambahan dan perbanyakan skalar di antara mereka sama dengan perkalian reguler yang akan Anda lakukan dengan bilangan bulat apapun. Penting untuk dicatat bahwa mengalikan satu titik dengan skalar dianggap sebagai langkah yang ireversibel, karena perhitungan skalar dari titik baru default ke masalah logaritma diskrit.

Dari sini jelas bahwa \(r\) adalah titik pada kurva, sedangkan \(s\) adalah skalar. Pertimbangkan kelompok penandatangan yang diwakili oleh \(x_{sum} = x_1 + ... + x_n\) dengan nonces \(k_{sum} = k_1 + ... + k_n\). Kunci publik untuk jumlah skalar pribadi adalah: \(y = x_{sum} G\). Tanda tangan untuk jumlah ini (dari semua peserta kelompok) adalah: \(r' = k_{sum} G s' = k_{sum} - h x_{sum}\). Untuk menghasilkan tanda tangan ini semua peserta harus membagikan kunci pribadi dan non-nota mereka sebelumnya. Kami ingin jelas menghindari hal ini, jadi biarlah mari kita masing-masing peserta membuat tanda tangan parsial. \(r_n = k_1 G + ... + k_n G = r'\) (jumlah poin nonce publik, dimana peserta dapat secara bebas mempublikasikannya sendiri) \(s_n = k_n - h x_n\). Dengan mensubstitusikan ini ke dalam formula umum untuk tanda tangan dan menggunakan penambahan titik atau skalar: \(r = r_n = r'\) (sama seperti di atas) \(s = s_1 + ... + s_n = s'\) (skalar sederhana Selain itu, harus benar bahwa \((k_1 - h x_1) + ... + (k_n - h x_n) = s_1 + ... + s_n = s')\). Melakukan tanda tangan m-of-n tidak sepele. Telah disarankan bahwa pohon merkle berisi semua jumlah kunci publik yang mungkin untuk \(m\) peserta digunakan untuk kasus ini, menghasilkan tanda tangan berukuran berukuran \(log(n)\) [28].

---

## <i class="fa fa-book"></i> Referensi 

[^1]: Wuille P. 2015. [Tanda tangan pohon: Multisig pada steroid menggunakan tanda tangan pohon](https://decred.org/research/wuille2015.pdf).
