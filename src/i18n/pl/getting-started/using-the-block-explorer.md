# <i class="fa fa-cubes"></i> Używanie eksploratora bloków

---

## <i class="fa fa-info-circle"></i> Przegląd

Sieć Decred korzysta z eksploratora bloków opartego na 
[Insight](https://github.com/bitpay/insight-ui). Wszystkie bloki i transakcje w blockchainie Decred są widoczne przy użyciu eksploratora bloków, który znajduje się pod adresem 
[`https://mainnet.decred.org`](https://mainnet.decred.org) oraz
[`https://testnet.decred.org`](https://testnet.decred.org) dla portfela sieci testnet. Poniżej znajdziesz szybki przegląd tego, jak korzystać z niego korzystać.

Opcja         | Wyjaśnienie
---            | ---
`Height`       | Numer bloku.
`Age`          | Jak dawno dodano blok do blockchaina.
`Transactions` | Liczba transakcji zawartych w bloku.
`Votes`        | Liczba głosów na Proof-of-Stake zawartych w bloku.
`Fresh Stake`  | Liczba nowych biletów kupionych w tym bloku.
`Size`         | Rozmiar bloku (w bajtach).

W sekcji `Ostatnie transakcje` można zobaczyć identyfikator transakcji (txid) i
wartość (w DCR) transmitowaną przez sieć.

---

## <i class="fa fa-cube"></i> Bloki

Bloki można znaleźć wyszukując ich wysokość bloku
klikając na wartość `wysokość` na stronie głównej lub przez 
wartość `BlockHash`. Starsze bloki będą miały niższe numery. Wyższa
połowa przeglądu bloku zawiera istotne informacje na temat
konkretnego bloku. Informacje te obejmują: wysokość bloku, hasz bloku
i kilka kluczowych parametrów sieci, opisanych poniżej:

Opcja                   | Wyjaśnienie
---                      | ---
`Number of Transactions` | Liczba standardowych transakcji (DCR wysyłane od jednego użytkownika do drugiego).
`Height`                 | Wysokość w blockchainie na której znajduje się ten blok.
`Block Reward`           | Ilość DCR wytworzonych w tym bloku.
`Timestamp`              | Czas, w którym ten blok został stworzony przez górnika i został włączony do blockchaina.
`Merkle Root`            | Wartość hasz wszystkich haszów transakcji załączonych w tym bloku.
`Stake Root`             | Wartość hasz wszystkich haszów związanych z transakcjami stake w tym bloku. Wchodzą w to kupno biletów, głosy, oraz odwołania biletów.
`VoteBits`               | (1) Blok został zatwierdzony przez wyborców uprawnionych do głosowania. (2) Blok został zakwestionowany przez wyborców, a wszystkie transakcje niezwiązane z głosowaniami w bloku zostały unieważnione, łącznie z nagrodą za wydobycie bloku oraz dotacją na cele rozwoju.
`Final State`            | Końcowy stan pseudolosowego generatora liczb wykorzystywanego do wyboru biletów.
`Voters`                 | Liczba udanych głosów Proof-of-Stake oddanych w tym bloku. Maksymalna wartość wynosi 5.
`Fresh Stake`            | Liczba zakupionych biletów potwierdzonych w tym bloku.
`Revocations`            | Liczba biletów, które nie głosowały i zostały odwołane.
`PoolSize`               | Całkowita liczba aktywnych biletów Proof-of-Stake.
`Difficulty`             | Trudność wydobycia w sieci Proof-of-Work.
`SBits`                  | Cena jednego biletu Proof-of-Stake.
`Bits`                   | Kompaktowa wersja trudności sieci w czasie, gdy blok był wydobyty.
`Size`                   | Rozmiar bloku (w bajtach).
`Version`                | Wersja bloku.
`Nonce`                  | Wartość wykorzystywana przez górnika do znalezienia właściwego rozwiązania tego bloku.

## <i class="fa fa-exchange"></i> Transakcje

Ten dział wylicza wszystkie transakcje, które został włączone w ten 
blok. Jako pierwsze z sieci mempool wybierane są transakcje 
z najwyższą opłatą. Wszystkie transakcje w podsumowaniu bloku pojawiają się w podanej
kolejności: transakcje standardowe (transfer peer-to-peer), głosy Proof-of-Stake, kupno biletów Proof-of-Stake. Poniższy dział omówi każdy z rodzajów transakcji.

---

### Standardowe transakcje

Oto informacje zawarte w standardowych transakcjach Decred.

Opcja              | Wyjaśnienie
---                 | ---
`Size`              | Rozmiar transakcji w bajtach.
`Fee rate`          | Wysokość opłat pobieranych przez sieć (na kB).
`Received Time`     | Czas, w którym sieć potwierdziła transakcję.
`Mined Time`        | Czas, w którym górnik zawarł transakcję w bloku.
`Included in Block` | Numer bloku, którego transakcja stała się częścią.

Warto zauważyć, że wartości `Received Time`, `Mined Time`, oraz `Included in Block`  nie będą posiadały wartości dopóki górnik nie zatwierdzi transakcji i nie wcieli jej w blok. Po potwierdzeniu w bloku transakcja uważana jest za zakończoną.


---

### Kupno biletów

Kupno biletów (zawarcie transakcji stake mining) różni się nieco
od podanych transakcji standardowych.

Zwróć uwagę na różnicę w szczegółach: słowo `bilet` pojawia się powyżej 
adresu portfela nadawcy po lewej stronie, a słowa `zobowiązanie subsydium` pojawiają się po prawej stronie. Ten konkretny użytkownik zakupił 
bilet za 8.75411638 DCR i otrzymał resztę na kwotę 7.15994209 DCR. Adres podany po lewej stronie pod hasłem `bilet`
to adres, który zawiera środki na zakup tego
biletu. Pierwszym zwrotem z prawej strony jest adres, który posiada
prawa głosu do tego konkretnego biletu. Drugie wyjście, `zobowiązanie subsydium`, jest adresem, na który zostanie wypłacona nagroda. Na tą chwilę nie jest to jeszcze widoczne w eksploratorze bloków. Trzeci i ostatni zwrot
jest adresem, na który zostanie wysłana reszta z tej transakcji.

---

### Głosy Proof-of-Stake

Zwróć uwagę na znaczące hasła w dziale "szczegóły": `vote`, `stake base`, `block commitment`, oraz `vote bits`:

Te słowa kluczowe wskazują, że owa transakcja jest głosem, który oddany został
przez posiadacza głosu Proof-of-Stake. W tym konkretnym przykładzie 
użytkownik kupił uprzednio bilet za 8.99472311 DCR po czym 
otrzymał 10.82959184 DCR po tym, jak głos został oddany w tej transakcji.
