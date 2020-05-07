# <img class="dcr-icon" src="/img/dcr-icons/Code.svg" /> Verifying Binaries
---

## Overview

### What is a binary?

Binaries are typically the easiest way for users to install software.

A binary is a file in machine-language format that a computer can read and
execute. Most programmers don’t write software in machine-language. Instead,
programmers write code in human-readable programming languages like Go,
Javascript, C, or Python--otherwise known as *source code*. Advanced users and
programmers can then compile the source code, which creates an executable
binary.

However, if you aren’t a programmer and you don’t want to have to download
compilers to run a piece of software, you can just download a binary executable.
This binary file will have been compiled from the source code into a stand-alone
program by someone else.

### Why should you verify binaries *before* running them?

You shouldn’t immediately trust that a binary is safe, even if you downloaded
it from a familiar website.

If you run a binary that you didn't compile yourself, you're placing your trust
in whomever compiled the binary for you. This carries inherent risks. Since
binary code is not human-readable, it's impossible to directly tell if the
binary was compiled from the true source code, or if the source code was
tampered with by an adversary first.

Consider the case where an adversary created malware and disguised it to look
like a Decred binary. Adversaries can try to trick you into running their
malware by setting up fake download locations, phishing, or using a
[Man-in-the-middle attack](https://en.wikipedia.org/wiki/Man-in-the-middle_attack).
In theory, even if you download the binary from somewhere you trust (like
GitHub), an attacker could still potentially intercept and replace your download
with their own malware. If you run the binary without verifying that it isn’t
malware, you expose yourself to security risks.

Therefore, to protect yourself, you should always verify that your binary is
authentic Decred software.

### How do you verify that a binary hasn’t been tampered with?

The core concept of [file verification](https://en.wikipedia.org/wiki/File_verification)
relies on hashing. The Decred project takes it a step further and uses
[GnuPG](https://gnupg.org/index.html) to sign their hashes. The signature
guarantees that the files are distributed directly by Decred.

When the Decred project compiles source code into binaries, each binary is
hashed using [SHA-256](https://en.wikipedia.org/wiki/SHA-2). Each hash is stored
in a `manifest.txt` file. Then the manifest is signed using the Decred project's
public GnuPG key. This creates a unique signature file, ending in
`manifest.txt.asc`.

To check if your downloaded binary is a 100% match to the Decred project's
binary release, you need to do two things:

1. **Verify that the manifest was directly signed by the Decred project:**
   Download the `manifest.txt` and the signature `manifest.txt.asc`. Use GnuPG
   to check the signature against the public Decred release signing key.

     * SUCCESS: If the signatures match, you know you can trust that the
       manifest came directly from the Decred project, and that the hashes
       inside it are trustworthy.

     * FAIL: If the signatures don't match, then your manifest is not the
       official Decred project manifest. Do not continue, delete the files you've
       downloaded, and check for security problems before trying again.

2. **Verify that the binary hash matches the manifest hash:** Hash your
   downloaded binary and verify that its hash matches the hash in the Decred
   project's `manifest.txt`.

     * SUCCESS: If your hash matches the hash in the manifest, you know you can
       trust and run the binary.

     * FAIL: If your hash doesn't match, your binary doesn't match the official
       Decred project's binary release, and you should not continue. Delete the
       binary you've downloaded, and check for security problems before trying
       again.

---
## Detailed Instructions

### Preliminary Steps

First, go to the [Decred releases](https://github.com/decred/decred-binaries/releases)
page and download:

* The binary installer for your specific OS / architecture
* The file manifest and hashes, ending in `-manifest.txt`
* The signature for the manifest, ending in `-manifest.txt.asc`

Also, make sure GnuPG is installed:

* On Windows, install GnuPG with the latest version of [gpg4win](https://www.gpg4win.org/).
* On macOS, install GnuPG with the latest version of [GPGTools](https://gpgtools.org/).
* On Linux, GnuPG is installed by default.

With GnuPG installed, the following instructions will work from any terminal on
Windows, macOS, or Linux/UNIX

### Add the Decred project's release public keys to your GnuPG keyring.

You only need to do this step one time, so you can skip this step when
verifying later releases on the same computer.

There are several ways to import the Decred release public keys into GnuPG.
The most direct method is to use the ASCII Key Block below:

??? info "The Decred Release ASCII Key Block (click to expand)"

        -----BEGIN PGP PUBLIC KEY BLOCK-----

        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
        O6GuapL0x1I9SeIk9WX9VRrpZmENhlri
        =JrM6
        -----END PGP PUBLIC KEY BLOCK-----

Simply copy that entire text, save it as key.txt, and open a terminal.

In the terminal, use the `cd` command to navigate to the directory path where
you've saved key.txt. Then use the `gpg --import` command.

(Note that Windows uses `\` for directory paths, but Linux/macOS use `/`)

```
$ cd /path/to/the/key
$ gpg --import < key.txt
```

You can then delete key.txt.

You could also skip the entire "save it as a file" step and just type
`gpg --import`, press `enter` so you're on a new line, then paste the raw text
of the key block directly into your terminal. `enter` again for a new line,
`Ctrl + Z` and `enter` on Windows or `Ctrl + D` on Linux, and you're done.

Example output:
```
gpg: key 6DF634AA7608AF04: public key "Decred Release <release@decred.org>" imported
gpg: Total number processed: 1
gpg:               imported: 1
```

Just to confirm, you can check if the Decred release public keys are on your
GnuPG keyring:
```
$ gpg --list-keys release@decred.org
```

Example output:
```
pub   rsa4096 2016-01-27 [SC]
      FD13B6835E248FAF4BD1838D6DF634AA7608AF04
uid           [ unknown] Decred Release <release@decred.org>
sub   rsa4096 2016-01-27 [S]
sub   rsa4096 2016-01-27 [E]
```

### Verify that the manifest was directly signed by the Decred project

If you have the Decred project's release public keys on your GnuPG keyring, you
can verify if the signature for the manifest was created by the Decred release
signing key.

In a terminal, navigate to where you saved both the `manifest.txt` and the
`manifest.txt.asc`. Then ask GnuPG to verify the signed manifest, like so:

```
$ gpg --verify <your manifest.txt.asc file>
```

For example, if you wanted to verify `decred-v1.5.1-manifest.txt.asc`:

```
$ gpg --verify decred-v1.5.1-manifest.txt.asc
```

Example output:
```
gpg: assuming signed data in 'decred-v1.5.1-manifest.txt'
gpg: Signature made 01/29/20 15:17:58 Eastern Standard Time
gpg:                using RSA key F516ADB7A069852C7C28A02D6D897EDF518A031D
gpg: Good signature from "Decred Release <release@decred.org>" [unknown]
gpg: WARNING: This key is not certified with a trusted signature!
gpg:          There is no indication that the signature belongs to the owner.
Primary key fingerprint: FD13 B683 5E24 8FAF 4BD1  838D 6DF6 34AA 7608 AF04
     Subkey fingerprint: F516 ADB7 A069 852C 7C28  A02D 6D89 7EDF 518A 031D
```

If you see `Good signature from "Decred Release <release@decred.org>"`, then
you're successful! You can trust that the `manifest.txt` came directly from the
Decred project.

The WARNING shown is not a problem. It just means you haven't told GnuPG that
you want to trust Decred.

### Verify that the binary hash matches the manifest hash

Now that you know you can trust the `manifest.txt`, open it and view the
SHA-256 hashes. Find the row for the binary (or zip of binaries) you're
interested in. The first 64 characters are the "correct" hash from the Decred
project. You want to check your binary and make sure you get the same hash.

There are many ways to generate a SHA-256 hash, but here are a few:

* Windows:

    * If you have [7-Zip](https://7-zip.org/) installed, simply open up Windows
      Explorer, right click on the binary file, mouseover `CRC SHA`, then click
      `SHA-256`.

    * In a terminal:

            $ certutil -hashfile <your binary file> SHA256

* macOS

    * In a terminal:

            $ shasum -a 256 <your binary file>

* Linux

    * In a terminal:

            $ sha256sum <your binary file>

Example output:
```
0c43caffa428cebb8a4d3c8efb2a341220fd1c232640ff3b4403ff67e1873e1a  decred-linux-amd64-v1.5.1.tar.gz
```

If your output hash matches the hash from the manifest, you're done! The binary
for your platform is now verified and you can be confident it was generated by
the Decred Project. It's safe to install the software.

---
## Links for further reading

[https://gnupg.org/gph/en/manual.html#CONCEPTS](https://gnupg.org/gph/en/manual.html#CONCEPTS)

[https://alexcabal.com/creating-the-perfect-gpg-keypair](https://alexcabal.com/creating-the-perfect-gpg-keypair)