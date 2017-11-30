# Verificando Binarios

---

Los
[Lanzamientos Decred] oficiales (https://github.com/decred/decred-release) tienen
hashes firmados que debe comprobar para confirmar que son los mismos
binarios que los desarrolladores publicaron. Esta página proporciona instrucciones
para eso.

Con el fin de verificar binarios u otros archivos firmados del Proyecto  Decred
, hay un par de piezas de software requeridas:

* SHA256 -- Una vez que descargue su(s) archivo(s), necesita comprobar los
  hashes SHA256, así que puede que necesite descargar una herramienta para hacer esto,
  dependiendo de su Sistema Operativo.
* GnuPG o PGP - Esto es necesario para importar llaves públicas y verificar
  firmas. Los siguientes ejemplos usan GnuPG.

The following instructions should work as is on Linux/UNIX/macOS.
Windows users will have to install sha256 and gnupg themselves and use
the windows cmd terminal to do this.  The steps to verify the binaries
are as follows:

> Primer Paso

Descargue el manifiesto del archivo, la firma del manifiesto del archivo y
el zip/tarball para su sistema operativo desde [aquí] (https://github.com/decred/decred-binaries). Obtenga el valor SHA256 del
zip/tarball para su sistema operativo y compruebe que coincide con el valor en el
archivo manifiesto, ej.: para Linux 64-bits:

```no-highlight
$ sha256sum linux-amd64-20160127-02.tar.gz
8ffaa268a329890ebf0f96b3cd1bc9f69359e431edbb95d89cec5a605108574b linux-amd64-20160127-02.tar.gz
```

> Segundo Paso

Compare el valor que obtuvo en el Primer Paso con el valor del archivo en el
archivo de manifiesto.

> Paso Tres

Importe la Llave de Firma de la Versión Decred en GnuPG. Solo necesitará
hacer ésto una sola vez y puede saltarse ésto cuando verifique versiones posteriores
en el mismo computador.

```no-highlight
$ gpg --keyserver pgp.mit.edu --recv-keys 0x518A031D
gpg: requesting key 518A031D from hkp server pgp.mit.edu
gpg: /home/user/.gnupg/trustdb.gpg: trustdb created
gpg: key 7608AF04: public key "Decred Release <release@decred.org>" imported
gpg: Total number processed: 1
gpg: imported: 1 (RSA: 1)
```

>Paso Cuatro

Compruebe que la firma del archivo de manifiesto es válida y que fué creada por la
Llave de Firma de la Versión Decred:

```no-highlight
$ gpg --verify manifest-20160127-02.txt.asc
gpg: asumiendo datos firmados en `manifest-20160127-02.txt'
gpg: Firma hecha el Mie 27 Ene 2016 08:56:59 PM UTC usando la llave RSA ID 518A031D
gpg: Buena firma de "Versión Decred <release@decred.org>"
gpg: AVISO: Esta llave no esta certificada con una firma de confianza!
gpg: No hay indicación que la firma pertenezca al propietario.
Huella dactilar de llave primaria: FD13 B683 5E24 8FAF 4BD1 838D 6DF6 34AA 7608 AF04
Sub-llave huella dactilar: F516 ADB7 A069 852C 7C28 A02D 6D89 7EDF 518A 031D
```

El zip o tarball con binarios para su plataforma ahora está verificado y
puede estar seguro de que fueron generados por el Proyecto Decred.
