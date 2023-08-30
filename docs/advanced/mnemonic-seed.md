# Decred Seed and BIP-0039

Decrediton/dcrwallet and Decred-capable [BIP0039](https://github.com/bitcoin/bips/blob/master/bip-0039.mediawiki) compliant wallets can provide secure [seeds](../glossary.md#seed) in the form of human-readable representations known as a mnemonic seed. The Decred wallet (Decrediton/dcrwallet) will generate a 33 word mnemonic (256 bit) seed using the [PGP Word List](https://en.wikipedia.org/wiki/PGP_word_list). A BIP-0039 compliant wallet can generate 12-24 word mnemonic seed (128-256 bit) using the [BIP-0039-wordlists](https://github.com/bitcoin/bips/blob/master/bip-0039/bip-0039-wordlists.md).

Another important difference to highlight is the function of the passphrase. The Decred wallet passphrase encrypts the locally installed wallet's private keys and will be required when signing new transaction. This passphrase can always be changed and it is not needed in the event of a recovery from seed. The BIP-0039 passphrase, however, functions as a [brain wallet](https://en.bitcoin.it/wiki/Brainwallet) as every mnemonic seed + passphrase combination results in a completely different seed and generates a different wallet. Additionally, this passphrase can never be changed as it is mandatory to regain access to the same wallet.

| Feature    | Decred Seeds  | BIP0039 Seeds          | 
|------------|---------------|--------------------------|
| Mnemonic length| 33 words           | 12 to 24 words          |
| Wordlist | PGP  | BIP-0039         |
| Passphrase | Locally encrypts private keys | Generates different seed | 
|Password can be changed?|Yes|No|

In the event of a Decrediton/dcrwallet restore from a BIP-0039 seed, users will need to convert the BIP-0039 to a binary seed and then encode it as a hex string. [bip39-to-dcr-seed](https://github.com/matheusd/bip39-to-dcr-seed) is a tool that provides an easy way to generate a Decred hex code from a BIP-0039 mnemonic seed.
