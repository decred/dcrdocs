# Верификация бинарных файлов 

---

Официальные релизы Decred
[Decred releases](https://github.com/decred/decred-release) имеют
подписанные хэши, которые Вы должны проверить, чтобы убедиться, что это те же бинарные файлы, которые разместили разработчики. На данной странице приведены инструкции для этого.

Чтобы проверить бинарные файлы или другие подписанные файлы Decred Project, требуется несколько программных продуктов:

* SHA256 -- После того, как Вы загрузили свои файлы, Вам необходимо                                   
  проверить их
  SHA256 hashes, поэтому Вам, возможно, потребуется загрузить нужный для                
* этого инструмент, в зависимости от вашей ОС.
  GnuPG или PGP -- необходим для импорта открытых ключей и проверки

The following instructions should work as is on Linux/UNIX/macOS.
Windows users will have to install sha256 and gnupg themselves and use
the windows cmd terminal to do this.  The steps to verify the binaries
are as follows:

Следующие инструкции должны работать как есть на Linux/UNIX/OSX.
Пользователям Windows придется устанавливать sha256 и gnupg самостоятельно и использовать Windows cmd terminal. Последовательность проверки двоичных файлов следующая:

> Шаг первый

Загрузите манифест файла , подпись для манифеста файла и
zip/tarball для вашей ОС отсюда [here](https://github.com/decred/decred-binaries). Получите значение SHA256 для
zip/tarball для вашей ОС и убедитесь, что оно соответствует значению в
манифесте файла, например, для 64-битного Linux:

```no-highlight
$ sha256sum linux-amd64-20160127-02.tar.gz
8ffaa268a329890ebf0f96b3cd1bc9f69359e431edbb95d89cec5a605108574b linux-amd64-20160127-02.tar.gz
```

> Шаг второй

Сравните значение, которое Вы получили на первом шаге, со значением для файла в манифесте файла.

> Шаг третий

Импортируйте ключ подписи Decred Release в GnuPG. Вам нужно будет сделать
это только один раз и можно будет не повторять при верификации последующих релизов на том же компьютере.

```no-highlight
$ gpg --keyserver pgp.mit.edu --recv-keys 0x518A031D
gpg: requesting key 518A031D from hkp server pgp.mit.edu
gpg: /home/user/.gnupg/trustdb.gpg: trustdb created
gpg: key 7608AF04: public key "Decred Release <release@decred.org>" imported
gpg: Total number processed: 1
gpg: imported: 1 (RSA: 1)
```

> Шаг четвертый

Убедитесь, что подпись для манифеста файла действительна и создана
ключом подписи Decred Release:

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
