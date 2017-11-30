# Hajautettu Stake Pooling

---

Yksi kysymys joka on noussut esiin aikaisemmissa PoS-malleissa on miten soveltaa poolia PoS-louhintaan samalla tavalla kuin PoW-louhintaan.

Decred ratkaisee ongelman sallimalla useita inputteja lipukkeenostotapahtumaan ja sitoutumalla UTXO-palkkion jakoon jokaiselle inputille suhteutetusti, samalla kun se tekee uuden julkisen output-avaimen tai scriptin näille palkkioille. Tärkeää on että itse äänen luominen jätetään toisen julkisen avaimen tai scriptin haltuun joka ei voi manipuloida palkkiota. Äänen luomisen pystyy jakamaan tasaisesti käyttämällä scriptiä joka mahdollistaa lipukkeen allekirjoittamisen useamman tahon toimesta.
