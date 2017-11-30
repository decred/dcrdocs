# Memverifikasi Biner 

---

Resmi
[Decred releases](https://github.com/decred/decred-release)     
telahMenandatangani hash yang harus Anda periksa untuk memastikan bahwa keduanya binerYang sama yang diposkan oleh pengembang. Halaman ini memberikan instruksi 
untuk itu.

Untuk memverifikasi biner atau berkas lain yang ditandatangani dari Proyek Decred, ada beberapa perangkat lunak yang dibutuhkan:

* SHA256 -- Setelah Anda mengunduh berkas Anda, Anda perlu memeriksa hash
  SHA256 mereka, sehingga Anda mungkin perlu mengunduh alat untuk
  melakukanini, tergantung Sistem Operasi Anda
* GnuPG or PGP -- Diperlukan untuk mengmasukkan kunci publik dan
  memverifikasi tanda tangan Contoh di bawah ini menggunakan GnuPG.

The following instructions should work as is on Linux/UNIX/macOS.
Windows users will have to install sha256 and gnupg themselves and use
the windows cmd terminal to do this.  The steps to verify the binaries
are as follows:

> Langkah Satu

Unduh berkas manifestasi, tanda tangan untuk berkas manifestasi, dan
Zip/tarball untuk OS Anda dari [here](https://github.com/decred/decred-binaries). Dapatkan nilai SHA256 untuk
Zip/tarball untuk OS Anda dan periksa apakah itu sesuai dengan nilai di
Berkas bermanifestasi, mis. Untuk Linux 64-bit:

```no-highlight
$ sha256sum linux-amd64-20160127-02.tar.gz
8ffaa268a329890ebf0f96b3cd1bc9f69359e431edbb95d89cec5a605108574b linux-amd64-20160127-02.tar.gz
```

> angkah Dua

Bandingkan nilai yang Anda dapatkan di Langkah Satu dengan nilai untuk berkas di Berkas manifestasi

> Langkah Tiga

Masukkan Kunci Penandatanganan Rilis Decred di GnuPG. Anda hanya perlu Lakukan ini satu kali dan bisa melewati ini saat memverifikasi rilis selanjutnyaDi komputer yang sama.

```no-highlight
$ gpg --keyserver pgp.mit.edu --recv-keys 0x518A031D
gpg: requesting key 518A031D from hkp server pgp.mit.edu
gpg: /home/user/.gnupg/trustdb.gpg: trustdb created
gpg: key 7608AF04: public key "Decred Release <release@decred.org>" imported
gpg: Total number processed: 1
gpg: imported: 1 (RSA: 1)
```

> Langkah Empat

Verifikasi tanda tangan untuk berkas manifestasi yang valid dan dibuat oleh Kunci Penandatanganan Rilis Decred:

```no-highlight
$ gpg --verify manifest-20160127-02.txt.asc
gpg: assuming signed data in `manifest-20160127-02.txt'
gpg: Signature made Wed 27 Jan 2016 08:56:59 PM UTC using RSA key ID 518A031D
gpg: Good signature from "Decred Release <release@decred.org>"
gpg: WARNING: This key is not certified with a trusted signature!
gpg: There is no indication that the signature belongs to the owner.
Primary key fingerprint: FD13 B683 5E24 8FAF 4BD1 838D 6DF6 34AA 7608 AF04
Subkey fingerprint: F516 ADB7 A069 852C 7C28 A02D 6D89 7EDF 518A 031D
```

Zip atau tarball dengan biner untuk platform Anda sekarang telah diverifikasi dan Anda bisa yakin mereka dihasilkan oleh Proyek Decred.
