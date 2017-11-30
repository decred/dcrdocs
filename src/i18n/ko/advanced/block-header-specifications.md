# 허가서블록 헤더 사양 

---

## 블록 헤더 형식 

Decred 블록 헤더는 직렬화 될 때 180 바이트를 차지함.
블록 헤더의 직렬화 형식을 아래에 표시

필드          | 설명                                                                 | 크기
---            | ---                                                                         | ---
Version        | 블록 헤더 버전                                                        | 4 바이트
PrevBlock      | 이전 블록의 해시                                                  | 32 바이트
MerkleRoot     | 블록의 모든 트랜잭션을 사용하여 계산 된 Merkle 트리 해시             | 32 바이트
StakeRoot      | 블록의 모든 스테이크 트랜잭션을 사용하여 계산 된 Merkle 트리 해시       | 32 바이트
VoteBits       | 비트 플래그. 현재는 이전 Merkle 루트에서 투표를 나타 내기 위해 사용됨 | 2 바이트
FinalState     | PRNG의 최종 국가에 대한 헌신 (복권 목적)            | 6 바이트
Voters         | 블록에 참여하는 유권자 수                                 | 2 바이트
FreshStake     | 블록의 새 티켓 수                                          | 1 바이트
Revocations    | 블록에있는 취소 수                                  | 1 바이트
PoolSize       | 표 풀의 크기                                                     | 4 바이트
Bits           | 블록의 난이도 목표                                             | 4 바이트
SBits          | 블록에 대한 스테이크 난이도 목표                                       | 8 바이트
Height         | 블록 체인에서 블록 앞에있는 블록 수               | 4 바이트
Size           | 직렬화 된 블록이 차지하는 바이트 수                          | 4 바이트
Timestamp      | 블록이 작성된 시간                                             | 4 바이트
Nonce          | 블록을 생성하는 데 사용되는 nonce                                        | 4 바이트
ExtraData      | 기타 모든 데이터 (나중에 합의를 위해 사용될 수 있음)                   | 32 바이트
StakeVersion   | 생성 된 블록에 투표하는 데 사용되는 스테이크 버전                      | 4 바이트

---

## 인코딩 된 블록 헤더의 예 

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
        0x00,                   // FreshStake
        0x00,                   // Revocations
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

## 인코딩 된 블록 헤더를 원시 바이트로 사용하는 예 

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

## 광업 세부 정보 

getwork와 getblocktemplate 모두 구현되지만 둘 다 구현되지 않습니다.
Bitcoin과 정확히 동일합니다. 네트워크는 매우 유사하지만 반환합니다.
int32가 아닌 반전 된 바이트 문자열을 처리해야합니다. '데이터'입력란
3x64 바이트 청크의 적절히 패딩 된 blake256 입력을 나타냅니다. 만
최종 청크는 마이닝 할 때 수정해야합니다.

 `getwork` 응답의 예 :

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

`getblocktemplate` 은 또한 전체 헤더와 데이터를 반환합니다.
블록에 포함 된 트랜잭션. 예 :

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

블록까지 넌스를 증가시켜 마이닝을 수행한다.
헤더가 타겟 아래에 있습니다. ExtraData는
ASIC과 같은 빠른 해싱 장치를위한 추가적인 논스 (nonce)가 있지만 소프트 포크
어떤 점에서 이것을 바꿀 수있다.
일치 된 데이터 구조).
