# Izolacija skripte potpisa i dokaza o prijevarama

---

Kako bi se spriječila fleksibilnost transakcije, iz izračuna transakcijskog raspršivanja uklonjena je mogućnost stvaranja transakcije s istim ulaznim referencama i izlazima, a ipak različit ID transakcije. Podrijetlo ove izmjene bilo je kontroverzno, iako se čini da je u prošlosti bila implementirana u oba CryptoNote kovanica i lanaca blokova[^1] [^2]. Sada se predlaže za Bitcoin kao lagano grananje koja se naziva "Segregirani svjedok"[^3]. Kao u implementaciji Sidechains elemenata, obveze prema podacima o svjedocima su uključene u stablo markusa bloka[^2]. Osim toga, dokazi o prijevari, kao što je predloženo za Bitcoinovu lagano grananje[^3], postavljaju rudari i također se obvezuju kao dio podataka u stablu marke.

---

## <i class="fa fa-book"></i> Preporuke 

[^1]: von Saberhagen N. 2013. [CryptoNote v2.0](https://decred.org/research/saberhagen2013.pdf).
[^2]: Maxwell G. 2015. [Dovođenje novih elemenata Bitcoinu s bočnim nosačima](https://decred.org/research/maxwell2015.pdf).
[^3]: Wuille P. 2015. [Usamljeni svjedok za Bitcoin](https://prezi.com/lyghixkrguao/segregated-witness-and-deploying-it-for-bitcoin/).
