# مواصفات رأسية الكتلة

---

## تنسيق رأسية الكتلة

رؤوس كتلة ديكريد تشغل 180 بايت عند تسلسلها. 
تنسيق التسلسل لرأسية الكتلة يكون كما هو موضح أسفلاً  

حقل          | وصف                                                                 | حجم
---            | ---                                                                         | ---
الإصدار        | إصدار رأسية الكتلة                                                        | 4 بايت
الكتلة السابقة      | تجزئة الكتلة السابقة                                                  | 32 بايت
جذر ميركل     | تم حساب تجزئة شجرة ميركل باستخدام جميع المعاملات في الكتلة             | 32 بايت
جذر الحصة      | تم حساب تجزئة شجرة ميركل باستخدام جميع حصص المعاملات في الكتلة       | 32 بايت
تصويت بت       | أعلام بت. حاليا تستخدم فقط للدلالة على أصوات جذر ميركل السابق | 2 بايت
الحالة النهائية     | الالتزام بالحالة النهائية ل PRNG ( لأغراض اليانصيب)            | 6 بايت
الناخبين         | عدد الناخبين المشاركين في الكتلة                                 | 2 بايت
حصة جديدة     | عدد التذاكر الجديدة في الكتلة                                          | 1 بايت
الاسترجاعات     | عدد الاسترجاعات الموجودة في الكتلة                                  | 1 بايت
حجم التجمع       | حجم تجمع التذكرة                                                      | 4 بايت
بت           | الصعوبة المستهدفة للكتلة                                             | 4 بايت
SBits          | صعوبة الحصة المستهدفة للكتلة                                       | 8 بايت
الارتفاع         | عدد الكتل السابقة في سلسلة الكتل                 | 4 بايت
الحجم           | عدد وحدات البايت التي شغلت الكتلة المتسلسلة                           | 4 بايت
الختم الزمني        | وقت إنشاء الكتلة                                             | 4 بايت
الرقم الخاص            | الرقم الخاص المستخدمة لتوليد الكتلة                                         | 4 بايت
بيانات اضافية      | أي بيانات أخرى (يمكن استخدامها في وقت لاحق لأغراض  توافق الآراء)                   | 32 بايت
إصدار الحصة   | إصدار الحصة يستخدم للتصويت على الكتلة التي تم إنشاؤها                      | 4 بايت

---

## مثال على رأسية الكتلة المشفرة

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

## مثال على رأسية الكتلة المشفرة كبايت أولي

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

## تفاصيل التعدين

Both getwork and getblocktemplate are implemented, but neither is
precisely the same as in Bitcoin. getwork is very similar, but returns
a non-int32 reversed byte string to work off of. The 'data' field
refers to the properly padded blake256 input of 3x64 byte chunks. Only
the last chunk needs to be modified when mining.

:Example `getwork` response

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

`getblocktemplate` also returns a full header and data about the
transactions that are included in the block. An example:

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

يتم تنفيذ التعدين عن طريق زيادة الرقم الخاص حتى تكون رأسية
 الكتلة أقل من الهدف. البيانات الإضافية تسمح بستخدام
  رقم خاص إضافي للاجهزه السريعة مثل ASICs ، ولكن التشعب الخفيف
 قد يغير هذا في وقت لاحق ( لسماح باستخدامها في 
هياكل البيانات التوافقية).
