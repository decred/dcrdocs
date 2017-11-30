# Ekstensi Script 

---

Selain OP_CHECKSIGALT dan OP_CHECKSIGALTVERIFY yang telah disebutkan sebelumnya, modifikasi lain untuk script Bitcoin telah dibuat. Versi byte telah ditambahkan ke skrip output untuk mengaktifkan soft forking sederhana ke bahasa scripting baru, seperti yang disarankan oleh Wuille[^1]. Semua kode OP matematik dan logika telah diaktifkan kembali dan sekarang beroperasi pada register int32. Berbagai kode manipulasi byte string OP juga telah diimplementasikan dan diaktifkan kembali. Kode OP Bitcoin yang tidak terpakai telah diganti untuk soft fork masa depan. Beberapa bug lama dalam bahasa script Bitcoin juga telah diperbaiki[^2] [^3].

---

## <i class="fa fa-book"></i> References

[^1]: Wuille P. 2015. [Saksi terpisahkan untuk Bitcoin](https://prezi.com/lyghixkrguao/segregated-witness-and-deploying-it-for-bitcoin/).
[^2]: Todd P. [Kesulitan menulis konsensus kode kritis: Bug SIGHASH_SINGLE](https://decred.org/research/todd2014.pdf).
[^3]: Franco P. Understanding Bitcoin, 6.3: Multisignature (M-of-N) Transactions.
