# **Verifier les Binaries**

---

L'officiel
[Decred signature](https://github.com/decred/decred-release) a hash signés que vous devez vérifier pour confirmer qu'ils sont identiques aux binaires publiés par les développeurs. Cette page fournit des instructions pour ça.

Afin de vérifier les fichiers binaires ou d'autres fichiers signés depuis le Decred projet, il faut quelques logiciels:
* SHA256 -- Une fois que vous avez téléchargé votre (vos) fichier (s), vous devez vérifier leur
  SHA256 hashes, donc vous devrez peut-être télécharger un outil pour le faire, selon votre OS.
* GnuPG ou PGP -- Ceci est nécessaire pour importer des clés publiques et vérifier
  Les signatures. Exemples ci-dessous utilise GnuPG.

TLes instructions suivantes devraient fonctionner comme sur Linux/UNIX/OSX. Les utilisateurs de windows devront installer sha256 et gnupg eux-mêmes et utiliser le terminal windows cmd pour ce faire. Les étapes pour vérifier les fichiers binaires
sont les suivants:

> Première étape

Téléchargez le manifeste du fichier, la signature du manifeste du dossier et
Le zip/tarball pour votre système d'exploitation à partir d'ici. Obtenez la valeur SHA256 pour
Zip/tarball pour votre système d'exploitation et vérifiez qu'il correspond à la valeur dans le fichier  manifeste 64-bit Linux:

```no-highlight
$ sha256sum linux-amd64-20160127-02.tar.gz
8ffaa268a329890ebf0f96b3cd1bc9f69359e431edbb95d89cec5a605108574b linux-amd64-20160127-02.tar.gz
```

> Seconde étape

Comparez la valeur que vous avez obtenue à la première étape de la valeur du fichier dans la fichier manifeste.

> Troisième étape

Importez la clé de signature Decred dans GnuPG. Vous n'aurez qu'à faire ceci une seule fois et sautez ceci lors de la vérification des versions ultérieures sur le même ordinateur.

```no-highlight
$ gpg --keyserver pgp.mit.edu --recv-keys 0x518A031D
gpg: requesting key 518A031D from hkp server pgp.mit.edu
gpg: /home/user/.gnupg/trustdb.gpg: trustdb created
gpg: key 7608AF04: public key "Decred Release <release@decred.org>" imported
gpg: Total number processed: 1
gpg: imported: 1 (RSA: 1)
```

> Quatrième étape

Vérifiez que la signature pour le manifeste du fichier est valide et créée par la clé de signature de publication Decred:

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

Le zip ou le tarball avec les binaires pour votre plate-forme est maintenant vérifié et
Vous pouvez être sûr qu'ils ont été générés par le Projet Decred.
