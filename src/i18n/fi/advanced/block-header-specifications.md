# Lohkojen Ylätunnisteiden Määrittely

---

## Lohkojen ylätunnisteiden formaatti

Decredin lohkojen ylätunnisteet käyttävät 180 bittiä tilaa sarjoitettuna.
Sarjoitusformaatti nähtävissä alla:

Kenttä          | Kuvaus                                                                 | Koko
---            | ---                                                                         | ---
Versio        | Lohkon ylätunniste-versio                                                        | 4 bittiä
PrevBlock      | Edellisen lohkon hash                                                  | 32 bittiä
MerkleRoot     | Merkle tree hash laskettuna käyttäen kaikkia lohkon sisältämiä siirtoja             | 32 bittiä
StakeRoot      | Merkle tree hash laskettuna käyttäen kaikkia lohkon sisältämiä stake-siirtoja       | 32 bittiä
VoteBits       | Bit flägit. Tämänhetkinen käyttötarkoitus on vain merkitä äänet edelliseen merkle rootiin | 2 bittiä
FinalState     | Sitoutuminen PRNG:n viimeiseen tilaan (arvontatarkoituksiin)            | 6 bittiä
Äänestäjät         | Äänestykseen osallistuneiden määrä lohkossa                                 | 2 bittiä
FreshStake     | Uusien lipukkeiden määrä lohkossa                                          | 1 bitti
Peruutukset    | Peruutusten määrä lohkossa                                  | 1 bitti
Poolin Koko       | Lipukepoolin koko                                                     | 4 bittiä
Bitit           | Lohkon tavoiteltu vaikeustaso                                             | 4 bittiä
SBits          | Lohkon tavoiteltu stake-vaikeustaso                                       | 8 bittiä
Korkeus         | Lohkoa edeltävien lohkojen kokonaismäärä ketjussa               | 4 bittiä
Koko           | Sarjoitetun lohkon käyttämä bittimäärä                          | 4 bittiä
Timestamp      | Aika jolloin lohko on louhittu                                             | 4 bittiä
Nonce          | Nonce-arvo jonka avulla lohko on ratkaistu                                        | 4 bittiä
ExtraData      | Muut tiedot (voidaan käyttää konsensus-tarkoituksiin)                   | 32 bittiä
StakeVersio   | Lohkossa äänestämiseen käytetty stake versio                      | 4 bittiä

---

## Esimerkki lohkon ylätunnisteesta

```javascript
        0x01, 0x00, 0x00, 0x00, // Version
        0x6f, 0xe2, 0x8c, 0x0a, 0xb6, 0xf1, 0xb3, 0x72, // PrevBlock
        0xc1, 0xa6, 0xa2, 0x46, 0xae, 0x63, 0xf7, 0x4f,
        0x93, 0x1e, 0x83, 0x65, 0xe1, 0x5a, 0x08, 0x9c,
        0x68, 0xd6, 0x19, 0x00, 0x00, 0x00, 0x00, 0x00,
        0x3b, 0xa3, 0xed, 0xfd, 0x7a, 0x7b, 0x12, 0xb2, // MerkleRoot
        0x7a, 0xc7, 0x2c, 0x3e, 0x67, 0x76, 0x8f, 0x61,
        0x7f, 0xc8, 0x1b, 0xc3, 0x88, 0x8a, 0x51, 0x32,
        0x3a, 0x9f, 0xb8, 0xaa, 0x4b, 0x1e, 0x5e, 0x4a,
        0x3b, 0xa3, 0xed, 0xfd, 0x7a, 0x7b, 0x12, 0xb2, // StakeRoot
        0x7a, 0xc7, 0x2c, 0x3e, 0x67, 0x76, 0x8f, 0x61,
        0x7f, 0xc8, 0x1b, 0xc3, 0x88, 0x8a, 0x51, 0x32,
        0x3a, 0x9f, 0xb8, 0xaa, 0x4b, 0x1e, 0x5e, 0x4a,
        0x00, 0x00, // VoteBits
        0x00, 0x00, 0x00, 0x00, 0x00, 0x00, // FinalState
        0x00, 0x00, // Voters
        0x00, // FreshStake
        0x00, // Revocations
        0x00, 0x00, 0x00, 0x00, //Poolsize
        0xff, 0xff, 0x00, 0x1d, // Bits
        0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, // SBits
        0x00, 0x00, 0x00, 0x00, // Height
        0x00, 0x00, 0x00, 0x00, // Size
        0x29, 0xab, 0x5f, 0x49, // Timestamp
        0xf3, 0xe0, 0x01, 0x00, // Nonce
        0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, // ExtraData
        0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00,
        0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00,
        0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00,
        0x03, 0x00, 0x00, 0x00, // StakeVersion
```

---

## Esimerkki lohkon ylätunniste raakoina bitteinä

```no-highlight
        010000006fe28c0ab6f1b372c1a6a246
        ae63f74f931e8365e15a089c68d61900
        000000003ba3edfd7a7b12b27ac72c3e
        67768f617fc81bc3888a51323a9fb8aa
        4b1e5e4a3ba3edfd7a7b12b27ac72c3e
        67768f617fc81bc3888a51323a9fb8aa
        4b1e5e4a000000000000000000000000
        0000000ffff001d00000000000000000
        00000000000000029ab5f49f3e001000
        00000000000000000000000000000000
        00000000000000000000000000000000
        3000000
```

---

## Louhintadetailit

Sekä getwork että getblocktemplate on sisällytetty, mutta kumpikaan ei
ole täysin sama kuin Bitcoinissa. getwork on hyvin samankaltainen mutta
palauttaa non-int32 reversed byte stringing jonka pohjalta työskennellä. 'Data'-kenttä
viittaa oikein täytettyyn 3x64 bitin blake256 inputiin. Vain viimeistä palaa 
tarvitsee modifioida louhittaessa.

Esimerkki `getwork` vastaus:

```
{
  "data": "00000000bf9d58482135c4d8d9445af7604b24ccf1d31b33df33abf21a4e11f52c
000000ef9d462a20d734def40076f0027faa8ef8d9c52d68c46741d03b1732377a556ed9cbf3b
694e65c1b287e8fd2be2e2243a74356d1ef95413d9fc74ffb8a8a07530100e11754a6af500500
03000115000000096f1d28d1354d000000000a0d0000591300009329a55600000000000000000
00000000000000000000000000000000000000000000000000000000000000080000001000000
00000005a0",
  "target": "000000000000000000000000000000000000000000000000000000096f000000"
}
```

`getblocktemplate` näyttää myös koko ylätunnisteen ja tiedot
lohkon sisältämistä siirroista. Esimerkki:

```
{
  "header": "...",
  "sigoplimit": 20000,
  "sizelimit": 1000000,
  "transactions": [
    {
      "data": "...",
      "hash": "9e72fdd4f0ac763da72ef672e6a4a9ec157412439fc578f979a6643fb9ad3bb6",
      "depends": [],
      "fee": 1000,
      "sigops": 2,
      "txtype": "regular"
    }
  ],
  "stransactions": [
    {
      "data": "...",
      "hash": "53b4dd7e041f492d9b2de54215b8fff107885313e4556eadabec7784b936f96e",
      "depends": [],
      "fee": 0,
      "sigops": 1,
      "txtype": "vote"
    },
    {
      "data": "...",
      "hash": "316819cd5ab8a67d56e81cb02f2386a52ce9e88e2984c8fb773b9a7435a843fe",
      "depends": [],
      "fee": 0,
      "sigops": 1,
      "txtype": "vote"
    },
    {
      "data": "...",
      "hash": "ec478ed0572049dea679feeb2cfac70740644dde18ad9241d9075501ea293f25",
      "depends": [],
      "fee": 0,
      "sigops": 1,
      "txtype": "vote"
    },
    {
      "data": "...",
      "hash": "c83befd244e25cc79b79956d1046003c605aaee672da14c03f4a12a42ba85126",
      "depends": [],
      "fee": 0,
      "sigops": 1,
      "txtype": "vote"
    },
    {
      "data": "...",
      "hash": "17e7cad2a56540c64c6a655263de22bf45c3ed4d43d059f808038212e3c7d840",
      "depends": [],
      "fee": 0,
      "sigops": 1,
      "txtype": "vote"
    },
    {
      "data": "...",
      "hash": "e4f17fd4f487fdbf8c24cd1bde1b621203561e9edce975c9f649961160819afb",
      "depends": [],
      "fee": 1000,
      "sigops": 3,
      "txtype": "ticket"
    },
    {
      "data": "...",
      "hash": "e214c31c466a60772cfc463b856c29236c7db10126d0a7a4da000aba0e2a58bb",
      "depends": [],
      "fee": 1000,
      "sigops": 2,
      "txtype": "ticket"
    },
    {
      "data": "...",
      "hash": "2dd201d2960a8e44cbe33caae34d8cdb4c7a9bcfcfc397e88fb5e4afd9e3e425",
      "depends": [],
      "fee": 1000,
      "sigops": 2,
      "txtype": "ticket"
    },
    {
      "data": "...",
      "hash": "b00a34879e4dffacd79f1adae07cf78a415c733695cb309290843f81b860a570",
      "depends": [],
      "fee": 1000,
      "sigops": 3,
      "txtype": "ticket"
    }
  ],
  "coinbaseaux": {
    "flags": "062f646372642f"
  },
  "coinbasevalue": 247524752,
  "longpollid": "0000005de504d40790bbcccdbe7c693b5bbc0e4871c2d9375625e5248be2f645-1453664716",
  "target": "0000006f09000000000000000000000000000000000000000000000000000000",
  "maxtime": 1453671916,
  "mintime": 1453664454,
  "mutable": [
    "time",
    "transactions/add",
    "prevblock",
    "coinbase/append"
  ],
  "noncerange": "00000000ffffffff",
  "capabilities": [
    "proposal"
  ]
}
```

Louhintaa tehdessä nonce-arvoa muutetaan kunnes lohkon
ylätynniste on tavoitteen alla. ExtraDataa voi käyttää
ylimääräisenä noncena nopeasti laskeville laitteille kuten ASICeille, mutta soft fork
saattaa muuttaa tämän jossain vaiheessa (antaakseen sen muiden
konsensus datastruktuurien käyttöön).
