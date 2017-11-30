# Верифікація бінарних файлів 

---

Офіційні релізи Decred
[Decred releases](https://github.com/decred/decred-release) мають
підписані хеші, які Ви повинні перевірити, щоб впевнитися, що це ті ж
бінарні файли, які опублікували розробники. Ця сторінка містить інструкції
для цього.

Для перевірки бінарних файлів або інших підписаних файлів Decred Project,
потрібно кілька програмних продуктів:

* SHA256 - Після завантаження Ваших файлів потрібно перевірити їх
  SHA256 хеші, тому Вам може знадобитися завантажити потрібний для цього інструмент, 
  в залежності від Вашої операційної системи.
* GnuPG або PGP - необхідні для імпорту відкрити ключів та перевірки
  підписів. Нижче наведені приклади використовують GnuPG.

The following instructions should work as is on Linux/UNIX/macOS.
Windows users will have to install sha256 and gnupg themselves and use
the windows cmd terminal to do this.  The steps to verify the binaries
are as follows:

> Крок перший

Завантажте маніфест файлу (file manifest), підпис для маніфесту файлу та
zip/tarball для вашої ОС звідси [here](https://github.com/decred/decred-binaries). Отримайте значення SHA256 для
zip/tarball для вашої ОС та впевніться, що воно відповідає значенню в
маніфесті файла, наприклад, для 64-бітового Linux:

```no-highlight
$ sha256sum linux-amd64-20160127-02.tar.gz
8ffaa268a329890ebf0f96b3cd1bc9f69359e431edbb95d89cec5a605108574b linux-amd64-20160127-02.tar.gz
```

> Крок другий

Порівняйте значення, яке Ви отримали у першому кроці, із значенням для файла в
маніфесті файла.

> Крок третій

Імпортуйте ключ підпису Decred Release до GnuPG. Вам потрібно буде зробити 
це один раз і можна буде не повторювати під час верифікації пізніших релізів
на тому ж комп'ютері.

```no-highlight
$ gpg --keyserver pgp.mit.edu --recv-keys 0x518A031D
gpg: requesting key 518A031D from hkp server pgp.mit.edu
gpg: /home/user/.gnupg/trustdb.gpg: trustdb created
gpg: key 7608AF04: public key "Decred Release <release@decred.org>" imported
gpg: Total number processed: 1
gpg: imported: 1 (RSA: 1)
```

> Крок четверти

Упевніться, що підпис для маніфеста файла дійсна і створена
ключом підпису Decred Release:

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

Тепер zip чи tarball з бінарними файлам для Вашої платформи підтверджено і
Ви можете бути впевнені, що вони були створені Decred Project.
