# Decred Permintaan Tarik dan Kontribusi 

---

Semua kode untuk Decred disimpan di GitHub. Dokumen ini memberikan beberapa info dasar tentang cara kami menangani kontribusi kode dan beberapa info dasar tentang cara berkontribusi. Sebagian dari ini berdasarkan dokumen serupa dari [btcsuite](https://github.com/btcsuite).

---

## Setelan Awal 

Langkah pertama yang baik adalah membaca dokumentasi [Code Contribution Guidelines documentation](https://github.com/decred/dcrd/blob/master/docs/code_contribution_guidelines.md) untuk mendapatkan pemahaman yang baik tentang kebijakan yang digunakan oleh 
proyek ini. Dokumen tersebut terutama difokuskan pada basis kode Go tapi tetap merupakan awal yang baik.

Contoh berikut akan dibagi menjadi dua bagian, satu untuk proyek Go (dcrd, dcrwallet, gominer, dll), dan satu untuk proyek yang tidak menggunakan Go (decrediton, Paymetheus, dcrdocs, dll.). Dalam semua kasus, pastikan untuk memeriksa README.md di setiap proyek jika Anda memerlukan bantuan untuk menyelesaikan proyek tertentu.

---

## Model Umum 

Dengan proses ini kami mengusahakan agar berkontribusi menjadi mudah sekaligus menjaga tingginya kualitas kode dan riwayat bersih. Anggota tim Decred harus mengikuti prosedur yang sama dengan kontributor eksternal.

Model kami untuk mode retas secara garis besar adalah sebagai berikut. Jika semua ini tidak masuk akal, jangan khawatir, akan dijelaskan secara lebih rinci pada bagian selanjutnya.

1. Temukan masalah yang ingin Anda kerjakan. Jika tidak ada yang menjelaskan masalah Anda, buka satu dengan apa yang akan Anda lakukan.
1. Buat perubahan kode pada cabang.
1. Dorong perubahan ini ke repo GitHub bercabang Anda sendiri.
1. Bila kode Anda siap untuk ditinjau atau bila Anda hanya ingin masukan dari devs lain, buka Request Request (PR) pada repo utama dari halaman web GitHub.
1. Tambahkan komentar di PR yang menyebutkan masalah apa yang sedang Anda perbaiki. Letakkan teks Closes # atau Fixes # diikuti oleh jumlah masalah pada satu baris. Ini akan memungkinkan GitHub untuk secara otomatis menghubungkan PR dengan masalah ini dan menutup masalahnya saat PR ditutup.
1. Anda dapat meminta peninjau tertentu dari halaman web GitHub atau Anda dapat meminta seseorang di irc/slack untuk meninjau.
1. SEMUA kode harus ditinjau dan menerima setidaknya satu persetujuan sebelum dapat masuk. Hanya anggota tim yang dapat memberikan persetujuan resmi, namun komentar dari pengguna lain dianjurkan.
1. Jika ada perubahan yang diminta, buat perubahan tersebut dan lakukan komit pada cabang lokal Anda.
1. Dorong perubahan tersebut ke cabang yang sama yang sedang Anda retas. Mereka akan muncul di PR seperti itu dan kemudian peninjau bisa membandingkan dengan versi sebelumnya.
1. Once your code is approved, it can be merged into master.  To keep history clean, we only allow non-fast-forward merges (that means we want a linear history).  Most PRs also must be squashed to a single commit (although if there is reason to have it as multiple commits that can be considered on a case by case basis).
1. Jika PR Anda adalah komit tunggal (atau dapat ditekan oleh GitHub secara otomatis) dan terjebak dengan master, peninjau akan menggabungkan PR Anda. Jika cabang Anda terlalu jauh tertinggal, Anda mungkin diminta untuk memperbaiki komit Anda. Setelah itu dilakukan dan didorong, peninjau akan menggabungkan komit Anda.

---

## Go 

Untuk proyek yang menggunakan Go, Anda dapat mengikuti prosedur ini. Dcrd akan digunakan sebagai contoh. Ini mengasumsikan Anda sudah memiliki versi go1.6 atau yang lebih baru dan `$GOPATH` yang hidup.

### Setelan satu masa
- Fork dcrd di GitHub
- Jalankan perintah berikut untuk mendapatkan dcrd, semua dependensi, dan memasangnya:

```bash
$ mkdir -p $GOPATH/src/github.com/decred/
$ git clone https://github.com/decred/dcrd $GOPATH/src/github.com/decred/dcrd
$ cd $GOPATH/src/github.com/decred/dcrd
$ go dep ensure
$ go install . ./cmd/...
```

- Tambahkan git remote untuk fork Anda:

```bash
$ git remote add <yourname> https://github.com/<yourname>/dcrd.git
```

## Proyek lainnya 

Untuk proyek yang tidak ditulis di Go, setelan awal akan tergantung pada proyek. Saya akan menggunakan dcrdocs sebagai contoh di sini, tapi langkah dasarnya sama untuk proyek mana pun. Setelan tertentu dapat dilihat di proyek README.md (misalnya cara memasang mkdocs untuk mengerjakan dcrdocs atau electron untuk decrediton).

### Setelan satu masa 
- Fork dcrdocs di GitHub
- Jalankan perintah berikut untuk mendapatkan dcrd, semua dependensi, dan memasangnya:

```bash
$ mkdir -p code/decred
$ cd code/decred
$ git clone https://github.com/decred/dcrdocs
$ cd dcrdocs
```

- Tambahkan git remote untuk fork Anda:

```bash
$ git remote add <yourname> https://github.com/<yourname>/dcrdocs.git
```

## Membuat permintaan fitur tarik baru 
- Temukan atau buat masalah pada repo GitHub (asli, bukan fork) untuk fitur yang ingin Anda kerjakan.
- Periksa cabang fitur baru untuk menempatkan perubahan yang akan Anda buat:

```bash
$ git checkout -b <feature_branch>
```
- Buat perubahan apa pun yang diperlukan untuk fitur dan lakukan komit
- Dorong cabang fitur Anda ke fork Anda:

```bash
$ git push <yourname> <feature_branch>
```
- Dengan mesin pencari Anda, navigasikan ke https://github.com/decred/dcrd
- Buat permintaan tarik dengan UI GitHub. Anda dapat meminta peninjau di laman web GitHub atau Anda dapat meminta seseorang di irc/slack.

## Rebasing salah satu permintaan tarik yang ada 

Terkadang Anda akan diminta untuk membuat basis baru dan menekan permintaan tarik ke cabang master terbaru.

- Pastikan cabang utama adalah versi terbaru:

```bash
$ git checkout master
$ git pull
```
- Periksa cabang fitur yang ada dan buat basis baru dengan bendera interaktifnya:

```bash
$ git checkout <feature_branch>
$ git rebase -i master
```
- Follow the directions presented to specify 's' meaning squash for the additional commits (the first commit must remain 'p' or 'pick').
- Tuliskan pesan komit tunggal pada penyunting yang telah Anda setel untuk mencakup semua komit yang disertakan.
- Simpan dan tutup penyunting dan git harus menghasilkan komit tunggal dengan pesan yang Anda tentukan dan semua komit yang Anda tambahkan. Anda bisa mengecek komit dengan perintah ```git show```.
- Paksa dorong cabang ke fork Anda:

```bash
$ git push -f <yourname> <feature_branch>
```

## Pertimbangan Lain 

Ada beberapa hal lain yang perlu dipertimbangkan saat melakukan permintaan tarik. Dalam kasus kode Go, sudah ada cakupan uji yang signifikan. Jika Anda menambahkan kode, Anda harus menambahkan tes juga. Jika Anda memperbaiki sesuatu, Anda perlu memastikan bahwa Anda tidak memecahkan tes yang ada. Untuk kode Go, ada naskah ```goclean.sh``` di setiap repo untuk menjalankan tes dan setiap pengontrol statis yang kita miliki. Kode NO akan diterima tanpa melewati semua tes. Dalam kasus kode node.js (decrediton) semua kode harus melewati eslint. Anda dapat memeriksa ini dengan perintah ```npm run lint```.

Terakhir, setiap repo memiliki LISENSI. Kode baru Anda harus berada di bawah LISENSI yang sama dengan kode yang ada dan hak cipta yang ditetapkan untuk 'Pengembang Decred'. Dalam kebanyakan kasus, ini adalah lisensi ISC yang sangat luas tapi beberapa repo berbeda. Periksa repo untuk memastikannya.

Jika Anda memiliki pertanyaan untuk berkontribusi, silakan bertanya di irc/slack atau GitHub. Anggota tim Decred (dan mungkin anggota komunitas juga) akan dengan senang hati membantu.
