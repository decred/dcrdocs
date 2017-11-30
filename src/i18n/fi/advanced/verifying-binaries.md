# Binaryjen Verifiointi

---

Virallisilla
[Decred julkaisuilla](https://github.com/decred/decred-release) on
allekirjoitettu hash joka sinun tulisi tarkistaa varmistaaksesi että kyseessä ovat samat
binaryt jotka developerit ovat julkaisseet. Tältä sivulta löydän ohjeet
siihen.

Verifioidaksesi binaryt tai muita allekirjoitettuja Decred projektin tiedostoja,
tarvitset muutaman sovelluksen:

* SHA256 -- Kun lataat tiedostoja, on tarpeen tarkistaa niiden
  SHA256 hashit, joten joudut ehkä lataamaan työkalun tätä varten,
  riippuen käyttöjärjestelmästäsi.
* GnuPG tai PGP -- Tätä tarvitaan julkisten avainten tuomiseen ja allekirjoitusten verifiointiin.
  Alla olevat esimerkit käyttävät GnuPG:tä.

The following instructions should work as is on Linux/UNIX/macOS.
Windows users will have to install sha256 and gnupg themselves and use
the windows cmd terminal to do this.  The steps to verify the binaries
are as follows:

> Vaihe Yksi

Lataa tiedosto manifest, allekirjoitus manifestille, ja
zip/tarball käyttöjärjestelmällesi [täältä](https://github.com/decred/decred-binaries). Löydä SHA256 arvo
zip/tarball:lle ja varmista että se on sama kuin arvo
file manifestissä, esim. 64-bittiselle Linuxille:

```no-highlight
$ sha256sum linux-amd64-20160127-02.tar.gz
8ffaa268a329890ebf0f96b3cd1bc9f69359e431edbb95d89cec5a605108574b linux-amd64-20160127-02.tar.gz
```

> Vaihe Kaksi

Vertaa arvoa jonka sait vaiheessa yksi arvoon
manifest filessa.

> Vaihe Kolme

Tuo Decred Release Signing Key GnuPG:hin. Sinun tarvitsee
tehdä tämä vain kerran ja voit hypätä tämän yli myöhempien julkaisujen
kanssa samalla tietokoneella.

```no-highlight
$ gpg --keyserver pgp.mit.edu --recv-keys 0x518A031D
gpg: requesting key 518A031D from hkp server pgp.mit.edu
gpg: /home/user/.gnupg/trustdb.gpg: trustdb created
gpg: key 7608AF04: public key "Decred Release <release@decred.org>" imported
gpg: Total number processed: 1
gpg: imported: 1 (RSA: 1)
```

> Vaihe Neljä

Vahvista että allekirjoitus file manifestille on validi ja 
Decred Release Signing Keyn tekemä:

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

Zip- tai tarball-binaryt alustallesi on nyt verifioitu ja
voit olla varma että niiden alkuperä on Decred Project.
