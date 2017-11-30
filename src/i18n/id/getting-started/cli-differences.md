# Perbedaan Baris Perintah di Seluruh Sistem Operasi 

Halaman ini terakhir diperbarui untuk v1.0.0.

---

The purpose of this page is to explain the key differences for running the cross-platform command-line applications on Windows, Linux, and macOS.

---

> Luncurkan Perintah

Perbedaan utama pertama pada aplikasi baris perintah (`dcrd`,`dcrwallet`,`dcrctl`) adalah bagaimana Anda meluncurkannya dari baris perintah. Ini bukan sistem operasi karena perbedaan kulitnya. Windows dilengkapi dengan Teks Perintah dan PowerShell yang terpasang. Macos menggunakan Bash dalam aplikasi Terminal, dan banyak distribusi Linux menggunakan Bash juga. Berikut adalah contoh perintah dasar untuk Bash dan Teks Perintah.

**Command Prompt:** `dcrd.exe`, `dcrwallet.exe`, `dcrctl.exe` <br />
**Bash:** `./dcrd`, `./dcrwallet`, `./dcrctl`

Beberapa pemandu kami mungkin OS-agnostik dengan perintah peluncuran. Jika panduan mengatakan untuk menjalankan `dcrctl --wallet getbalance`, ini mengacu pada penggunaan `dcrctl.exe --wallet getbalance` untuk Teks Perintah dan `./dcrctl --wallet getbalance` untuk Bash.

> Lokasi Direktori Aplikasi

Perbedaan lain yang dimiliki oleh klien baris perintah adalah lokasi setiap direktori aplikasi (blok, dompet, file konfigurasi semuanya tersimpan dalam direktori data). Berikut adalah tabel direktori aplikasi standar untuk setiap aplikasi. 

| OS      | dcrd, dcrwallet, dcrctl App Directories      | 
| -------:|:--------------------------------------------- |
| Windows | `C:\Users\<your-username>\AppData\Local\dcrd\`      |
|         | `C:\Users\<your-username>\AppData\Local\dcrwallet\` | 
|         | `C:\Users\<your-username>\AppData\Local\dcrctl\`    |
| macOS   | `~/Library/Application Support/dcrd/`         |
|         | `~/Library/Application Support/dcrwallet/`    |
|         | `~/Library/Application Support/dcrctl/`       |
| Linux   | `~/.dcrd/`                                    |
|         | `~/.dcrwallet/`                               |
|         | `~/.dcrctl/`                                  |

