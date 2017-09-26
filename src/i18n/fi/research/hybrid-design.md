# Hybrid Design 

---

Suuri eroavaisuus seuraa-satoshia-järjestelmään, kuvailtuna aikaisemmin[^1] on uusi arvontajärjestelmä jossa käyttäjän pitää ostaa lipukkeita ja odottaa tietty aika niiden kypsymistä ennen kuin ne voidaan valita ja käyttää. Lipukkeiden valinta lohkoa varten tehdään leksikografisesti kypsien lipukkeiden poolista perustuen lohkon ylätunnisteessa olevaan pseudosatunnaisuuteen. Koska tämän pseudosatunnaisuuden manipulointi PoW-järjestelmässä on vaikeaa, lipukkeenvalinnan manipulointi on yhteydessä PoW-louhijan kuluihin. Lipukkeiden valintaa aikajaksolla voidaan kuvailla todennäköisyystiheysfunktiolla joka on samankaltainen kuin todennäköisyys lohkon löytämiseen PoW-järjestelmässä tasaisella hash ratella ajan myötä tasaisella vaikeustasolla[^2], tuottaen todennäköisyysdistribuution joka on keskimäärin sama kuin puolet lipukepoolin koosta. Lipukkeen ostohinnan määrittelee uusi stake-vaikeustaso joka määritetään eksponentiaalisesti painotetulla ostettujen lipukkeiden keskiarvomäärällä ja kypsien lipukkeiden poolin koolla edellisissä lohkoissa.

PoW-lohkojen vahvistaminen selitetään seuraavassa:

1. PoW-louhija louhii lohkon, ja lisää valitsemansa siirrot lohkoon. Stake-järjestelmään liittyvät siirrot sisällytetään UTXO settiin.
2. PoS-louhijat äänestävät lohkosta tuottamalla äänestyssiirron lipukkeestaan. Ääni sekä sallii uuden lohkon rakentamisen edellisen päälle että päättää onko edellinen regular transaction tree (joka sisältää coinbasen ja stakeen liittymättömät siirrot) validi.
3. Toinen PoW-louhija alkaa kasaamaan lohkoa, sisällyttäen siihen PoS-louhijoiden äänet. Enemmistö annetuista äänistä pitää sisällyttää seuraavaan lohkoon jotta se voidaan hyväksyä verkon toimesta. Tämän uuden lohkon äänestyssiirroista, PoW-louhija etsii flägiä nähdäkseen indikoiko PoS-louhija että lohkon regular transaction tree oli validi. Nämä voting flägit lasketaan ja enemmistön ääneen perustuen lohkolle asetetaan bit flag joka merkkaa oliko edellisen lohkon regular transaction tree validi.
4. Verkon vaikeusvaatimukset täyttävä nonce-arvo löytyy, ja lohko lisätään lohkoketjuun. Jos edellisen lohkon regular transaction tree vahvistettiin oikeaksi, lisää nämä siirrot UTXO setiin. Siirry kohtaan 1.

Jätettyjen äänien manipuloinnin ehkäisemiseksi lohkoon lisätään sakkomaksu jos kaikkia äänestystapahtumia ei ole sisällytetty lohkoon. "Pehmeä" sakko joka kumoaa aiemman siirtoketjun auttaa estämään työn hylkäämisen, joka on verkon kannalta elintärkeää, ja olettaa että seuraavan lohkon louhii joku jolla ei ole kiinnostusta edellisen lohkon palkkiosta omansa edellä. Vaikka tämä ei olisi totta, pahantahtoinen louhija jolla on korkea hash rate tarvitsee silti ((\text{number for majority}/2)+1\) ääntä oman aiemman lohkonsa ketjun hyväksi, jotta saa aikaiseksi lohkon joka tuottaa myös ketjun aiemmasta lohkosta palkkion hänelle itselleen.

Bit flägit lisätään sekä lohkojen ylätunnisteisiin että ääniin nimenomaisesti jotta louhijat voivat helposti äänestää uusista hard tai soft forkeista.

---

## <i class="fa fa-book"></i> Lähteet

[^1]: Bentov I., Lee C., Mizrahi A., Rosenfeld M. 2014. [Proof-of-activity: Extending Bitcoin's proof-of-work via proof-of-stake](https://decred.org/research/bentov2014.pdf).
[^2]: Nakamoto S. 2008. [Bitcoin: A peer-to-peer electronic cash system](https://decred.org/research/nakamoto2008.pdf).
