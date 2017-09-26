# Petunjuk Instalasi CLI 

---

The newest Binary Releases can be found here: [https://github.com/decred/decred-binaries/releases](https://github.com/decred/decred-binaries/releases). With the exception of the `.msi` and `.dmg` files, they are archives of the latest executable binaries for each release. Although most of this will be unzip and go, instructions are provided for macOS, Linux, and Windows below (assumed proficiency for *BSD users).

> macOS

1. Unduh berkas yang benar:

    For 32-bit computers, download the `decred-darwin-386-v1.1.0.tar.gz` file. <br />
    For 64-bit computers, download the `decred-darwin-amd64-v1.1.0.tar.gz` file.

2. Arahkan untuk mengunduh lokasi dan mengekstrak berkas .tar.gz :

    Finder: cukup klik dua kali pada berkas .tar.gz. <br />
    Terminal: gunakan perintah `tar -xvzf filename.tar.gz` . 

    **CATATAN**: Jika Anda menggunakan Safari pada macOS Sierra dan menyimpan berkas di 'Open "safe" setelah mengunduh berkas' preferensi diaktifkan, .gz dan .zip secara otomatis tidak terkompresi setelah mengunduh. Perintah `tar -xvzf filename.tar.gz` command results in this error: `tar: Error opening archive: Failed to open 'filename.tar.gz'`. Gunakan `tar -xvzf filename.tar` sebagai gantinya (hapus .gz dari perintah sebelumnya).
    
    Both of these should extract the tar into a folder that shares the same name. (`e.g. tar -xvzf decred-darwin-amd64-v1.1.0.tar.gz` should extract to `decred-darwin-amd64-v1.1.0`). It should include `dcrctl`, `dcrd`, `dcrwallet`, `sample-dcrctl.conf`, `sample-dcrd.conf`, and `sample-dcrwallet.conf`.


> Linux

1. Unduh berkas yang benar:

    For 32-bit computers, download the `decred-linux-386-v1.1.0.tar.gz` file. <br />
    For 64-bit computers, download the `decred-darwin-amd64-v1.1.0.tar.gz` file. <br />
    For 32-bit ARM computers, download the `decred-linux-arm-v1.1.0.tar.gz` file. <br />
    For 64-bit ARM computers, download the `decred-linux-arm64-v1.1.0.tar.gz` file.

2. Arahkan untuk mengunduh lokasi dan mengekstrak berkas .tar.gz:

    Mesin pencari Berkas Ubuntu: cukup klik kanan pada .tar.gz dan pilih "Extract Here". <br />
    Terminal: gunakan perintah `tar -xvzf filename.tar.gz` . 
    
    Both of these should extract the tar.gz into a folder that shares the same name. (`e.g. tar -xvzf decred-darwin-amd64-v1.1.0.tar.gz` should extract to `decred-darwin-amd64-v1.1.0`). It should include `dcrctl`, `dcrd`, `dcrwallet`, `sample-dcrctl.conf`, `sample-dcrd.conf`, and `sample-dcrwallet.conf`.

> Windows

Catatan: Windows 7/8/10 memberikan dukungan bawaan untuk berkas `.zip` , oleh karena itu lebih baik menggunakan berkas `.zip` sehingga aplikasi pihak ketiga tidak diperlukan untuk berkas `.tar.gz` . Instruksi disediakan untuk berkas `.zip` .

1. Unduh berkas yang benar:

    For 32-bit computers, download the `decred-windows-386-v1.1.0.zip` file. <br />
    For 64-bit computers, download the `decred-windows-amd64-v1.1.0.zip` file.

2. Arahkan untuk mengunduh lokasi dan buka berkas `.zip` :

    Berkas Explorer: Klik kanan pada berkas .zip, pilih "Extract All .." dan sebuah teks harus terbuka untuk meminta direktori tersebut digunakan. Berkas `.zip` akan diekstrak dengan sendirinya ke folder dengan nama yang sama. Ini harus mencakup `dcrctl`, `dcrd`, `dcrwallet`, `sample-dcrctl.conf`, `sample-dcrd.conf`, dan `sample-dcrwallet.conf`.

Jika Anda memutuskan untuk mengunduh berkas `.tar.gz` , Anda akan memerlukan dua ekstraksi terpisah pada beberapa aplikasi pihak ketiga (7-zip, winRAR, dll.) Untuk mendapatkan biner yang sebenarnya.

---

## Konfigurasi Minimum

Setidaknya, untuk `dcrd`, `dcrwallet`, dan `dcrctl` untuk dapat berkomunikasi satu sama lain, mereka perlu diluncurkan dengan kombinasi rpcuser/rpcpass yang sama. Untuk konfigurasi manual ikuti langkah-langkah berikut:

1. Jika direktori home yang bergantung pada sistem operasi yang terdaftar di bagian [configuration files](#configuration-file-locations) di atas tidak ada, buatlah untuk `dcrd`, `dcrwallet`, dan `dcrctl`.
2. Using your favourite text editor, create a new file enter the text, `[Application Options]` as the first line. Save it as `dcrd.conf` in `dcrd`'s home directory.
3. Create another new file and add the text `[Application Options]` to the first line as before. Save it as `dcrwallet.conf` in `dcrwallet`'s home directory.
4. Create a third text file and save it as `dcrctl.conf` in `dcrctl`'s home directory. You don't need to add anything to this one right now.
5. Pilih nama pengguna dan kata sandi secara acak, ini hanya akan digunakan oleh setiap aplikasi untuk berkomunikasi melalui panggilan prosedur jarak jauh. Konfigurasi yang paling mudah adalah menggunakan sandi yang sama untuk semua.
6. Di dalam `dcrd.conf`, di bawah `[Application Options]`, tambahkan baris berikut:<br /><br />
        `rpcuser=<chosen-username>`<br />
        `rpcpass=<chosen-password>`<br /><br />
7. Di dalam `dcrwallet.conf`, di bawah `[Application Options]`, tambahkan baris berikut:<br /><br />
        `username=<chosen-username>`<br />
        `password=<chosen-password>`<br /><br />
8. Di dalam `dcrctl.conf`, tambahkan baris berikut:<br /><br />
        `rpcuser=<chosen-username>`<br />
        `rpcpass=<chosen-password>`<br /><br />
9. Simpan ketiga berkas konfigurasi tersebut.

Please see the [sample config](https://github.com/decred/dcrd/blob/master/sampleconfig/sampleconfig.go#L8-L352) for more customisation options.