# <img class="dcr-icon" src="/img/dcr-icons/Transactions.svg" /> Address Details

---

A Decred address is a representation of a public key, which itself could be a script hash.

The most commonly used address currently is the Pay-to-PubkeyHash (P2PKH) type, which is used to send DCR to a single address. For this address type, the recipient must provide both the public key which hashes to the requisite hash, and a valid signature that is created from the corresponding private key. Other address types require signatures from multiple parties (multi-sig), signatures created within specified time limits, or other more complex constraints. Pay-to-Script-Hash (P2SH) addresses, for example, generate a 1-of-2 multisig transaction utilized by Voting Service Providers (VSPs) that allow VSPs to vote on behalf of ticket holders. In this case, both the ticket holder and VSP have their own private keys, allowing either to vote.

## Address format

Each address has a 2-byte prefix than can be used to identify its type, and a checksum suffix to detect improperly entered addresses. The first byte of the prefix identifies the network. Mainnet addresses start with `D`, testnet addresses start with `T`, simnet addresses start with `S`, and regnet addresses start with `R`. The second byte identifies the address type. Pay-to-PubkeyHash (P2PKH) addresses, for example, contain a lowercase `s` in the second byte. So, a P2PKH address on mainnet will begin with`Ds`, as shown in the sample address below.  

```DsExampleAddr1For2Demo3PurposesOnly```

The table below provides the locking script and prefix details for each address type.

| Address Type                                            | Locking Script | Mainnet | Testnet | Simnet | Regnet | Prefix Size (byte)
| ---                                                     | ---            | ---     | ---     | ---    | ---    | ---
| Pay-to-Pubkey                                           | P2Pk           | Dk      | Tk      | Sk     | Rk     | 2
| Pay-to-PubkeyHash                                       | P2PKH          | Ds      | Ts      | Ss     | Rs     | 2
| Pay-to-PubkeyHash <br/ > (Edwards Address ID)           | P2PKH          | De      | Te      | Se     | Re     | 2
| Pay-to-PubkeyHash <br/ > (secp256k1 Schnorr Address ID) | P2PKH          | DS      | TS      | SS     | RS     | 2
| Pay-to-Script-Hash                                      | P2SH           | Dc      | Tc      | Sc     | Rc     | 2
| Wallet Import format <br/ > (Private Key ID)            | WIF            | Pm      | Pt      | Ps     | Pr     | 2
| Hierarchical deterministic <br/ >(Private Key ID)       | HD             | dprv    | tprv    | sprv   | rprv   | 4
| Hierarchical deterministic <br/ > (Public Key ID)       | HD             | dpub    | tpub    | spub   | rpub   | 4

## P2PKH address generation flow

![How a P2PKH address is generated](/img/p2pkh_address_gen.png)
