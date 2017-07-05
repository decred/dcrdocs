# Провера бинарних датотека 

---

Званичне
[Decred releases](https://github.com/decred/decred-release) су
отписале хеш који бисте требали проверити да потврдите да је исти као
Бинарне датотеке које су програмери објавили. На овој страници се налазе упутства
за то.

Да бисте потврдили бинарне датотеке или друге потписане датотеке из декодираног
пројекта, потребно је неколико врста софтвера:

* SHA256 -- Када преузмете датотеке (датотеке), морате их проверити
  SHA256 хеш, па ћете можда морати да преузмете алат за то,
  У зависности од вашег оперативног система.
* GnuPG or PGP -- Ово је потребно за увоз јавних кључева и верификацију
  потписа. Следећи примери користе ГнуПГ.

The following instructions should work as is on Linux/UNIX/macOS.
Windows users will have to install sha256 and gnupg themselves and use
the windows cmd terminal to do this.  The steps to verify the binaries
are as follows:

> Први корак

Преузмите датотеку манифест, потпис за манифест манифеста и
the zip/тарбалл за ваш ОС од [here](https://github.com/decred/decred-binaries). Добијте вредност СХА256 за
zip/тарбалл за ваш оперативни систем и проверите да ли одговара вриједности у
Фајл манифесту, нпр. За 64-bit Linux:

```no-highlight
$ sha256sum linux-amd64-20160127-02.tar.gz
8ffaa268a329890ebf0f96b3cd1bc9f69359e431edbb95d89cec5a605108574b linux-amd64-20160127-02.tar.gz
```

> Други корак

Упоредите вредност коју сте добили у Кораку 1 са вредностима за датотеку у
Манифест фајл.

> Корак три

Увезите кључ за уписивање издвојеног издања у ГнуПГ. Само ће требати да
урадите ово једном и можете то прескочити приликом провере каснијих издања
на истом рачунару.

```no-highlight
$ gpg --keyserver pgp.mit.edu --recv-keys 0x518A031D
gpg: requesting key 518A031D from hkp server pgp.mit.edu
gpg: /home/user/.gnupg/trustdb.gpg: trustdb created
gpg: key 7608AF04: public key "Decred Release <release@decred.org>" imported
gpg: Total number processed: 1
gpg: imported: 1 (RSA: 1)
```

> Четврти корак

Проверите да ли је потпис за манифест валидан и креиран од стране
кључа за уписивање издвојеног издања:

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

Зип или тарбал са бинарним датотекама за вашу платформу сада су верификовани и
можете бити сигурни да су генерисани пројектом Децред.
