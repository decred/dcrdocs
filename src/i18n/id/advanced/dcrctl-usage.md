# <i class="fa fa-hdd-o"></i> penggunaan dcrctl 

Dcrctl menyediakan cara untuk mengendalikan daemon `dcrd` dan dompet
`dcrwallet` menggunakan antarmuka json rpc tanpa benar-benar menulis
json

Untuk menyederhanakan contoh, kita akan mengasumsikan bahwa Anda memiliki semua kata sandi
 yangTersimpan di [config files](/advanced/storing-login-details.md).

## <i class="fa fa-power-off"></i> Menghentikan program

Untuk mematikan program dengan bersih:

```no-highlight
dcrctl --wallet stop
dcrctl stop
```

## <i class="fa fa-arrow-up"></i> Mencari tinggi blok saat ini

```no-highlight
dcrctl getblockcount
```

## <i class="fa fa-dollar"></i> Lihat saldo Anda

```no-highlight
dcrctl --wallet getbalance
```

## <i class="fa fa-inbox"></i> Dapatkan alamat baru

```no-highlight
dcrctl --wallet getnewaddress
```

## <i class="fa fa-rocket"></i> Kirim dana ke alamat

```
dcrctl --wallet sendtoaddress <address> <amount>
```

