# Provjera binarnih datoteka 

---

Službenik
[Decredova izdanja](https://github.com/decred/decred-release) imaju potpisane ključeve koje biste trebali provjeriti da biste potvrdili da su 
iste binarne datoteke koje su programeri objavili. Ova stranica sadrži upute za to.

Da biste provjerili datoteke ili druge potpisane datoteke iz Decredovog projekta, potrebno je nekoliko vrsta softvera:

* SHA256 -- Nakon što preuzmete datoteku (e), morate provjeriti njihove
  SHA256 ključeve, pa ćete možda morati preuzeti alat da to                
  učinite, ovisno o vašem OS-u.
* GnuPG ili PGP --  To je potrebno za uvoz javnih ključeva i potvrdu
  potpisa. Primjeri u nastavku upotrebljavaju GnuPG.

The following instructions should work as is on Linux/UNIX/macOS.
Windows users will have to install sha256 and gnupg themselves and use
the windows cmd terminal to do this.  The steps to verify the binaries
are as follows:

> Prvi korak

Preuzmite iskaz, potpis za datoteka iskaza i
zip  tarball za vaš operativni sustav od [ovdje](https://github.com/decred/decred-binaries). Odaberite SHA256 vrijednost za zip/tarball za svoj OS i provjerite odgovara li vrijednosti u datoteci iskaza, npr. Za 64-bitni Linux:

```no-highlight
$ sha256sum linux-amd64-20160127-02.tar.gz
8ffaa268a329890ebf0f96b3cd1bc9f69359e431edbb95d89cec5a605108574b linux-amd64-20160127-02.tar.gz
```

> Korak dva

Usporedite vrijednost koju ste dobili u Koraku 1 na vrijednost za datoteku u datoteci iskaza.

> Korak tri

Uvezite Decredove Izdanje Potpisnog Ključa u GnuPG.  Trebat ćete to učiniti samo jednom i možete ga preskočiti prilikom potvrđivanja kasnijih verzija na istom računalu.

```no-highlight
$ gpg --keyserver pgp.mit.edu --recv-keys 0x518A031D
gpg: requesting key 518A031D from hkp server pgp.mit.edu
gpg: /home/user/.gnupg/trustdb.gpg: trustdb created
gpg: key 7608AF04: public key "Decred Release <release@decred.org>" imported
gpg: Total number processed: 1
gpg: imported: 1 (RSA: 1)
```

> Četvrti korak

Provjerite je li potpis za datoteke iskaza valjan i izrađen od strane ključ potpisivanja Decretovog izdavanja:

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

Zip ili tarball s binarnim datokama za vašu platformu sada je potvrđen i možete biti sigurni da su stvoreni od strane Decredovog projekta.
