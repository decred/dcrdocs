# 바이너리 확인 중 

---

공무원
[Decred releases](https://github.com/decred/decred-release) 가 있습니다.
서명 된 해시를 확인해야합니다.
개발자가 게시 한 바이너리 이 페이지는 지침을 제공합니다.

Decred의 바이너리 또는 서명 된 파일을 확인하기 위해
프로젝트에는 몇 가지 소프트웨어가 필요합니다:

* SHA256 - 일단 파일을 다운로드하면 해당 파일을 검사해야합니다.
  SHA256 해시, 이렇게하려면 도구를 다운로드해야 할 수도 있습니다.
  OS에 따라 다릅니다.
* GnuPG 또는 PGP - 공개 키를 가져 와서 확인해야합니다.
  서명. 아래 예제는 GnuPG를 사용합니다.

The following instructions should work as is on Linux/UNIX/macOS.
Windows users will have to install sha256 and gnupg themselves and use
the windows cmd terminal to do this.  The steps to verify the binaries
are as follows:

> 1 단계

파일 목록, 파일 목록의 서명을 다운로드하십시오.
해당 OS의 zip / tarball은 [here](https://github.com/decred/decred-binaries). 에서 다운로드 할 수 있습니다. 에 대한 SHA256 값을 얻습니다.
zip / tarball을 파일 매니페스트에서 실행합니다.
 (예 : 64 비트 Linux :

```no-highlight
$ sha256sum linux-amd64-20160127-02.tar.gz
8ffaa268a329890ebf0f96b3cd1bc9f69359e431edbb95d89cec5a605108574b linux-amd64-20160127-02.tar.gz
```

> 2 단계

1 단계에서 얻은 값과 매니페스트 파일을 비교하십시오.

> 3 단계

GnuPG에서 Decred Release Signing Key를 가져옵니다. 당신은
이 작업은 한 번만 수행하고 이후 릴리스를 확인할 때이를 건너 뛸 수 있습니다.
동일한 컴퓨터에 있습니다.

```no-highlight
$ gpg --keyserver pgp.mit.edu --recv-keys 0x518A031D
gpg: requesting key 518A031D from hkp server pgp.mit.edu
gpg: /home/user/.gnupg/trustdb.gpg: trustdb created
gpg: key 7608AF04: public key "Decred Release <release@decred.org>" imported
gpg: Total number processed: 1
gpg: imported: 1 (RSA: 1)
```

> 4 단계

파일 목록의 서명이 유효하고 파일 목록에 의해 생성되었는지 확인합니다.
Decred Release 서명 키 :

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

플랫폼 용 바이너리가 포함 된 zip 또는 tarball이 이제 확인되고
Decred Project에 의해 생성되었다고 확신 할 수 있습니다.
