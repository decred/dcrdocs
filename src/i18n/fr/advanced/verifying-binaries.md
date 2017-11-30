# Vérifier les Binaries

---

L'officiel[Decred signature](https://github.com/decred/decred-release) a hash signés que vous devez vérifier pour confirmer qu'ils sont identiques aux binaires publiés par les développeurs. Cette page fournit des instructions pour ça.

Afin de vérifier les fichiers binaires ou d'autres fichiers signés depuis le Decred projet, il faut quelques logiciels:

* SHA256 -- Une fois que vous avez téléchargé votre(vos) fichier, vous devez vérifier leur
  SHA256 hashes, donc vous devrez peut-être télécharger un outil pour le faire, selon votre OS.
  dépendant de votre OS
* GnuPG ou PGP -- Ceci est nécessaire pour importer des clés publiques et vérifier
  les signatures. Exemples ci-dessous utilise GnuPG.

The following instructions should work as is on Linux/UNIX/macOS.
Windows users will have to install sha256 and gnupg themselves and use
the windows cmd terminal to do this.  The steps to verify the binaries
are as follows:

> Première étape

Download the file manifest, the signature for the file manifest, and
the zip/tarball for your OS from [here](https://github.com/decred/decred-binaries). Obtain the SHA256 value for the
zip/tarball for your OS and check that it matches the value in the
file manifest, e.g. for 64-bit Linux:

```no-highlight
$ sha256sum linux-amd64-20160127-02.tar.gz
8ffaa268a329890ebf0f96b3cd1bc9f69359e431edbb95d89cec5a605108574b linux-amd64-20160127-02.tar.gz
```

> Deuxième étape

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

> Step Four

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

Le zip ou le tarball avec les binaires pour votre plate-forme est maintenant vérifié etVous pouvez être sûr qu'ils ont été générés par le Projet Decred.
