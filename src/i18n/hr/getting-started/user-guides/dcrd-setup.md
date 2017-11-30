# Dcrd Vodič instalacije 

Zadnje ažuriranje za v1.0.0.

Ovaj vam vodič namjerava pomoći da postavite aplikaciju `dcrd` pomoću [pocetak zastave](/getting-started/startup-basics.md#startup-command-flags). 

**Preduvjeti:**

- Koristite najnovije [dcrinstalacija](/getting-started/user-guides/cli-installation.md) za instaliranje `dcrd`. Dodatni koraci bit će potrebni ako se koristi druga metoda instalacije.
- Review how the launch commands for the Command Prompt (Windows) and Bash (macOS/Linux) shells differ [here](/getting-started/cli-differences.md).

---

`dcrd` je čvorni servis za Decred. Servis je program koji radi u pozadini da se ne povezujete izravno. `dcrd` održava cjelokupnu transakcijsku knjigu (ili lanacblokova) od Decred i omogućava prosljeđivanje transakcija drugim Decred čvorovima širom svijeta. Možete ga zamisliti kao svoj osobni Decred lanacblokova poslužitelj. Lanacblokova se sprema u mapu `data` unutar kućnog direktora `dcrd`.

**Napredni korisnici: Ako radite ne razmišljajuću putem SSH-a,** morat ćete upotrijebiti terminalni multiplekser kao što je [ekran](http://www.howtogeek.com/howto/ubuntu/keep-your-ssh-session-running-when-you-disconnect/)
ili [tmux](https://tmux.github.io/). Gdje vidite upute
premjestiti se na drugi omotač, morat ćete pokrenuti novi prozor u `screen`
ili `tmux`.

---

## <i class="fa fa-cloud"></i> Spojite se na mrežu Decred 

Prvi put pokreće `dcrd`, povezat će se s mrežom Decred i započeti s preuzimanjem lanacblokova. da biste dopustili da `dcrwallet` i `dcrctl` komuniciraju s `dcrd`, konfiguracijske datoteke moraju imati postavke `rpcuser` i `rpcpass`. 

> Konfigurirajte RPC korisničko ime i lozinku

Ako ste upotrijebili [`dcrinstall`](/getting-started/user-guides/cli-installation.md),  vaše konfiguracijske datoteke već su postavljene pomoću RPC korisničkog imena / lozinke za `dcrd`, `dcrwallet`, i `dcrctl`.

Ako niste koristili `dcrinstall`, morat ćete omogućiti minimalne postavke u konfiguracijskim datotekama. Slijedite [ovaj vodič](/advanced/manual-cli-install.md#minimum-configuration) kako biste to učinili. 

> Pokreni dcrd 

S pravilno postavljenim konfiguracijskim datotekama otvorite drugi prozor s omotačem u odjeljku Decred (ili upotrijebite posljednji prozor ako ste upravo stvorili račun). Upišite sljedeću naredbu (pregledajte preduvjete za ovaj vodič da biste odredili odgovarajuću naredbu za vaš OS / Shell program):

```no-highlight
dcrd
```

> Pričekajte da se dcrd sinkronizira s Decred lanacblokovima

Kada `dcrd` pokrene uspješno, trebali biste vidjeti da se vaš prozor ljuske počinje ispunjavati porukama dok se servis povezuje s mrežom i započne obraditi blokove. Pričekajte dok se ne dovrši - cijeli lanacblokova se preuzima u `dcrd` direktorij podataka. 

Na početku ćete vidjeti liniju ovako:

```no-highlight
22:58:04 2016-02-09 [INF] BMGR: Syncing to block height 617 from peer 104.236.167.133:9108
```

Zatim, dok nastavak s preuzimanjem blokova, vidjet ćete u sljedećim redcima:

```no-highlight
22:58:16 2016-02-09 [INF] BMGR: Processed 321 blocks in the last 10.03s (544 transactions, height 322, 2016-02-09 09:50:34 +1000 EST)
```

lanacblokova će biti u potpunosti sinkroniziran nakon što je najnoviji obrađeni blok trenutačna visina bloka. Možete usporediti datum i vrijeme u dnevnici ili uspoređivati ​​visinu posljednjeg bloka koji se obrađuju prema zadnjoj visini bloka na [službenom istraživanju bloka](https://mainnet.decred.org/).  

Imajte na umu da će ta veza biti korištena u budućnosti. Morate napustiti ovu `dcrd` instancu kako biste mogli koristiti `dcrwallet`.

---

Sada kada ste postavili `dcrd`, posjetite vodič [dcrračun instalacija](/getting-started/user-guides/dcrwallet-setup.md).
