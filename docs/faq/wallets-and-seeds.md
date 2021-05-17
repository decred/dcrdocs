# ![](../img/dcr-icons/CreateWallet.svg){ .dcr-icon } Wallets and Seeds

---

#### 1. Why should I not store my seed in a file on my machine or share the seed with someone?

Your seed is used to recreate your wallet and its accounts granting anyone with knowledge of the seed complete control of the funds within the wallet. If your machine were to be compromised and your seed stolen, the attacker would have the ability to drain your funds by sending your DCR to wallets under their control. Likewise, sharing your seed with anyone regardless of your current level of trust is highly discouraged as this could pose a major security risk for your wallet that they may misuse access in the future or store the copy of the seed less securely than you.

The safest method of storing your seed is on a physical medium, eg. written on paper. Store this paper as you would a key to your personal vault of gold. This is essentially what these seed words represent.

---

#### 2. How can I convert my wallet seed hex to seed words?

You can use the [dcrseedhextowords](https://github.com/davecgh/dcrseedhextowords) utility to convert a Decred seed from hex to the seed words needed for importing into wallets.

Binaries are available for Windows/Linux/Mac under the [Releases
tab](https://github.com/davecgh/dcrseedhextowords/releases).

To use it, just run:

```no-highlight
$ dcrseedhextowords "whatever your seed hex is here"
```

---

#### 3. Can someone steal my coins if they access wallet.db?

Nobody can steal your coins if they get access to the wallet.db file unless they
also have your private passphrase. If you chose to use public encryption, they
also cannot get access to any of your extended public keys or addresses.

---

#### 4. Can someone use a brute-force attack on a random wallet to regenerate its seed words?

A wallet seed is nothing more than a 32 byte (256-bit) cryptographically secure
random number.
An extra byte is added to act as a checksum, giving a total of 33 bytes.
These 33 bytes are then mapped to a [set of English
words](https://en.wikipedia.org/wiki/PGP_word_list) to yield a 33 word seed.

Since each of the 32 bytes has 256 possible values, there are 256^32^ possible
seeds.
In scientific notation that is more than 1.15*10^77^.
Attempting to brute force a specific seed given this many possibilities is
computationally infeasible.

To put this in perspective, assuming there are 7 billion people on the planet,
with each person owning 10 computers, and each computer testing a billion
possibilities a second, it would still take approximately 26x10^48^ (that’s 26
trillion trillion trillion trillion) years to brute-force a single seed.

---

#### 5. My seed is not working. What can I do?

If you are using the CLI wallet, make sure all of the words are on a single line
separated by only spaces. When the seed is initially generated it is printed on
multiple lines for readability, but they must be entered on a single line when
restoring a wallet.

Also double-check your words have no typos by comparing them to the words in the [PGP word list](https://en.wikipedia.org/wiki/PGP_word_list).

---

#### 6. What is the difference between a testnet and mainnet public key address?

A public key address, also called Pay-To-Pubkey (P2Pk), can be identified with its 2-byte prefix which identifies the network and type. A mainnet public key address starts with the letters `Dk` while a testnet public key address starts with the letters `Tk`. For details on address types, see the [address details](https://devdocs.decred.org/developer-guides/addresses/) page in the developer documentation.  

---

#### 7. I have lost my seed. What can I do?

If you have lost all copies of your seed *and* the wallet (or the wallet's passphrase), then you're out of luck: your funds are truly lost.

If you still have access to the wallet and the passphrase you need to **IMMEDIATELY CREATE A NEW WALLET** with a new seed that you properly store and then transfer your funds from the old wallet to the new.

If you have live tickets, maintain both wallets until all tickets have voted, then transfer the remaining funds to the new wallet.

You should backup your `wallet.db` file (preferably in a thumb drive stored in a secure location) until all funds have been transferred.

---

#### 8. Could wallet security be improved using 2-Factor Authentication (2FA)?

2-Factor Authentication (2FA) would provide no extra security to Decrediton or
dcrwallet.

2FA is an authentication technique in which a computer user is granted access
only after successfully presenting two or more pieces of evidence (or factors)
to an authentication mechanism.
These are typically "something you know", such as a password, and "something you
possess", such as a smartphone.
Proving possession of a smartphone is often achieved using a piece of software
on the device which implements a [Time-based One-Time Password
(TOTP)](https://en.wikipedia.org/wiki/Time-based_One-time_Password_algorithm)
algorithm.
Google Authenticator and Authy are two well known examples.

2FA using TOTP is most commonly used in client/server applications as a
mechanism for clients to prove their identity to the server.
The security added by this mechanism depends on both the client and the
server agreeing upon a TOTP algorithm, and each implementing it independently.
In order to subvert authentication, an attacker would have to compromise both the
client and the server software.

In the case of Decrediton or dcrwallet, both the client and server
implementations of TOTP would exist on the same machine, which would negate the
primary security enhancement usually attributed to 2FA.

For extra reading on this topic, Exodus wallet has a detailed article named [Why
local apps and 2FA aren't friends
yet](https://support.exodus.io/article/1208-why-local-apps-and-2fa-arent-friends-yet).
