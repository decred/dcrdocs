# Funzione BLAKE-256 Hash 

---

SHA256, utilizzato in Bitcoin, presenta numerosi difetti tecnici dovuti alla sua costruzione Merkle-Damgård. Queste vulnerabilità hanno portato alla concorrenza SHA3 per una nuova funzione hash basata su una diversa costruzione fondamentale. Decred ha scelto BLAKE256 come funzione hash, finalista per il concorso[^1] [^2]. La funzione hash si basa su una costruzione HAIFA che incorpora una variante della cifra di flusso ChaCha di Bernstein. La funzione hash è notevole per le sue elevate prestazioni sulla microarchitettura x86-64, essendo più veloce per i messaggi corti di SHA256[^3] nonostante sia considerato un margine di sicurezza molto più elevato a 14 round.

---

## <i class="fa fa-book"></i> Riferimenti 

[^1]: Aumasson J., Henzen L., Meier W., Phan R. 2010. [SHA-3 proposal BLAKE](https://decred.org/research/aumasson2010.pdf).
[^2]: Aumasson J., Henzen L., Meier W., Phan R. 2014. La funzione hash BLAKE.
[^3]: Bernstein D. and Lange T. 2013. [eBACS: ECRYPT benchmarking of cryptographic systems](http://bench.cr.yp.to).
