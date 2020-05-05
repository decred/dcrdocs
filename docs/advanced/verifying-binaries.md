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
        WFOp0iCvCqsdMXqjaZUrv2HYCpmpuLkhII9z8y8=
        =+HJT
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