# <i class="fa fa-hdd-o"></i> Menghapus Dompet Anda

Ada beberapa kemungkinan mengapa Anda perlu menghapus dompet Anda.

* Anda perlu mengembalikan dompet Anda dari seed.
* Anda tidak lagi memiliki seed dan ingin membuat dompet baru.
* Anda ingin mengeluarkan dompet dari komputer tertentu.

Pertama, Anda perlu menemukan direktori aplikasi dcrwallet yang berbeda mengikut platform.
Ini adalah direktori yang sama yang ditempati oleh [configuration files](/getting-started/startup-basics.md#configuration-files).

Di direktori tersebut, Anda perlu menghapus file `mainnet/wallet.db`.
Itu akan menghapus dompet Anda secara menyeluruh dari komputer tersebut. Untuk mengakses
nyaLagi Anda perlu mengembalikan dari seed aslinya.

Penting untuk dicatat bahwa ada kemungkinan (tapi tidak pasti) bahwa File yang telah dihapus dapat dipulihkan dengan menggunakan alat pemulihan file. Jika Anda
Menghapus ini untuk alasan keamanan Anda mungkin perlu menggunakan alat penghapusanYang aman
 seperti
[GNU shred](https://www.gnu.org/software/coreutils/manual/html_node/shred-invocation.html).


