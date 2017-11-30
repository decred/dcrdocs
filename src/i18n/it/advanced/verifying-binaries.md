# Verifica dei binari 

---

Gli ufficiali
[Decred releases](https://github.com/decred/decred-release) hanno
 firmato Hash che dovresti controllare per confermare che sono 
binari ufficiali che gli sviluppatori hanno pubblicato. Questa pagina fornisce istruzioni
per ciò.

Per verificare i file binari o altri file firmati dal Decred
Progetto, ci sono un paio di pezzi di software richiesti:

* SHA256 -- Una volta scaricato il tuo file, devi controllarli
  SHA256hash, quindi potrebbe essere necessario scaricare uno strumento per farlo,
  A seconda del tuo sistema operativo.
* GnuPG or PGP -- È necessario importare chiavi pubbliche e verificare
  firme. Gli esempi di seguito utilizzano GnuPG.

The following instructions should work as is on Linux/UNIX/macOS.
Windows users will have to install sha256 and gnupg themselves and use
the windows cmd terminal to do this.  The steps to verify the binaries
are as follows:

> Passo uno

Scaricare il file, la firma per il file e il file
La zip/tarball per il tuo sistema operativo da [qui](https://github.com/decred/decred-binaries). Ottenere il valore SHA256 per il
Zip/tarball per il tuo sistema operativo e verificare che corrisponda al valore in
File manifesto, ad es. Per Linux a 64 bit:

```no-highlight
$ sha256sum linux-amd64-20160127-02.tar.gz
8ffaa268a329890ebf0f96b3cd1bc9f69359e431edbb95d89cec5a605108574b linux-amd64-20160127-02.tar.gz
```

> Secondo passo

Confronta il valore che hai ottenuto nel passaggio 1 al valore del file nel file
File manifesto.

> Fase tre

Importa la chiave di firma di rilascio decrescente in GnuPG. Avrai solo bisogno
Farlo una sola volta e può saltare questo quando verifica le versioni successive
sullo stesso computer.

```no-highlight
$ gpg --keyserver pgp.mit.edu --recv-keys 0x518A031D
gpg: requesting key 518A031D from hkp server pgp.mit.edu
gpg: /home/user/.gnupg/trustdb.gpg: trustdb created
gpg: key 7608AF04: public key "Decred Release <release@decred.org>" imported
gpg: Total number processed: 1
gpg: imported: 1 (RSA: 1)
```

> Fase quattro

Verificare che la firma per il file manifesto sia valida e creata da
chiave di firma decrescente di rilascio:

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

La zip o il tarball con binari per la tua piattaforma è ora verificata e
si può essere sicuri che siano stati generati dal progetto Decred.
