# Verificando os Binários / Executáveis

--

Os [releases oficiais](https://github.com/decred/decred-release)
da Decred possuem assinaturas hash que você deve verificar para
confirmar que eles são os mesmos binários que os desenvolvedores
postaram. Esta página contém instruções para este procedimento.

Para verificar os binários ou outros arquivos assinados do Projeto
Decred, são necessários alguns programas:

* SHA256 -- Assim que você fizer o download do(s) seu(s) arquivo(s), você precisa verificar seus
  hashes SHA256, portanto você precisa fazer o download de um programa para isso,
  dependendo do seu sistema operacional.
* GnuPG ou PGP -- Uma destas ferramentas é necessária para importar chaves públicas e verificar
  assinaturas. Os exemplos abaixo usarão o GnuPG.

As instruções a seguir devem funcionar no Linux/UNIX/OSX.
Usuários do Windows deverão instalar o sha256 e gnupg e usar
o terminal do windows, o cmd. Os passos para verificar os binários
são os seguintes:

> Passo 1

Faça o download do arquivo manifest, da assinatura para o manifest e
o arquivo zip/tarball para seu sistema operacional [aqui](https://github.com/decred/decred-binaries). Obtenha o valor SHA256 para o
zip/tarball para sua plataforma e verifique se o valor bate com o valor no
arquivo manifest. Ex. para Linux 64-bit:

```no-highlight
$ sha256sum linux-amd64-20160127-02.tar.gz
8ffaa268a329890ebf0f96b3cd1bc9f69359e431edbb95d89cec5a605108574b linux-amd64-20160127-02.tar.gz
```

> Passo 2

Compare o resultado do comando do Passo 1 com o valor no arquivo manifest.

> Passo 3

Importe a Decred Release Signing Key no GnuPG. Você só precisa fazer
isso uma vez e pode pular este passo quando verificar próximos releases
no mesmo computador.

```no-highlight
$ gpg --keyserver pgp.mit.edu --recv-keys 0x518A031D
gpg: requesting key 518A031D from hkp server pgp.mit.edu
gpg: /home/user/.gnupg/trustdb.gpg: trustdb created
gpg: key 7608AF04: public key "Decred Release <release@decred.org>" imported
gpg: Total number processed: 1
gpg: imported: 1 (RSA: 1)
```

> Passo 4

Verifique se a assinatura do arquivo manifest é valida e criada por
Decred Release Signing Key:

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

O arquivo zip ou tarball com os binários para sua plataforma agora estão verificados e
você pode ter confiança que eles foram gerados pelo Projeto Decred.
