# <i class="fa fa-male"></i> Solo stake mining

---

#### 1. Czy potrzebuję mocy haszowej, żeby brać udział w wydobyciu Proof-of-Stake?

Wydobycie "stake" nie potrzebuje żadnej mocy haszowej. To trochę jak odsetki z zainwestowanych monet. Blokujesz środki na pewien okres czasu, aby móc kupić bilet, który daje Ci wysokie prawdopodobieństwo (>99%) zdobycia prawa do głosowania i otrzymania odsetek w zamian za oddanie głosu, oraz za brak możliwości wykorzystania swoich środków w tym okresie, który potencjalnie wynosi do ok. ~5 miesięcy.

Jeśli masz już kupione bilety, to monety, za które je kupiłeś są zablokowane, aż bilety wygrają lub wygasną. Stawiasz na wydobycie solo, a zatem Twój portfel MUSI być otwarty 24/7 do momentu, gdy wszystkie Twoje bilety zagłosują (bądź wygasną), w przeciwnym razie przegapisz nagrodę, gdyż nie możesz zagłosować, gdy Twój portfel nie jest online. Ponieważ postawione monety są zablokowane, nie ma sposobu na to, aby je zmienić.

Z drugiej strony, stake poole pozwalają Ci na oddelegowanie prawa do głosowania do poola, który odpowiedzialny jest za bycie online 24/7 i oddawanie za Ciebie głosu.

---

#### 2. Czy jednym z powodów stake miningu nie jest to, żeby zapewnić sieci wystarczającą ilość peerów, którzy są online?

Zdecydowanie nie. Stake mining nie ma możliwości narzucenia tego. Portfel w stylu SPV mógłby z łatwością uprawiać staking poprzez komunikację z innymi pełnymi węzłami (przykłady `dcrd`) w sieci. Prawdą jest, że obecny portfel wymaga `dcrd` do działania, ale nie zawsze będzie to wymagane.

Nawet jeśli software próbowałby to narzucić, to nie można powstrzymać ludzi przez pisaniem narzędzi i tym podobnych, które robiłyby to przez sieć peer-to-peer bez potrzeby uruchamiania ich własnej, lokalnej instancji.

---

#### 3. Co się stanie, jeśli mój portfel jest nieosiągalny lub zablokowany, gdy moje bilety są wybierane przez górników?

Jeśli portfel jest offline lub zablokowany podczas wybierania biletów, traci się nagrody, a bilet zostanie natychmiast usunięty z puli. Nie ma "powtórnych głosowań".

---

#### 4. Czy mogę jakoś przetestować, czy moja maszyna jest dostępna do głosowania? Innymi słowy, zasymulować akcje górnika, który chciałby uzyskać mój głos.

Nie musisz być dostępny. Głosowanie jest deterministyczne w oparciu o zasadę per-block. Oznacza to, że Twój portfel będzie wiedział, czy Twój bilet został wybrany na podstawie bieżącego bloku, a transakcja "głosowania" (transakcja ssgen) jest rozsyłana do sieci, podobnie jak inne transakcje.

---

#### 5. Czy mogę używać wielu portfeli tylko do głosowania z tym samym seedem na wielu serwerach?

Możesz mieć wiele portfeli tylko do głosowania, ponieważ nie tworzą nowych adresów. Problem pojawia się, gdy masz dwa portfele tworzące transakcje obejmujące nowe adresy, ponieważ nie wiedzą, co robią pozostałe.

Jeśli wykonujesz gorącą i zimną konfigurację, możesz utworzyć wiele portfeli gorących wyłącznie do głosowania bez problemów, o ile wszystkie wiedzą o adresie, któremu przyznasz prawa głosu.

Przejdź do strony  [Stake Pools FAQ](/faq/proof-of-stake/stake-pools.md)

---

## <i class="fa fa-book"></i> Źródła

[^9304]: Decred Forum, [Post 9,304](https://forum.decred.org/threads/626/page-2#post-9304)
[^9311]: Decred Forum, [Post 9,311](https://forum.decred.org/threads/582/page-2#post-9311)
[^9806]: Decred Forum, [Post 9,806](https://forum.decred.org/threads/180/page-6#post-9806)
[^12697]: Decred Forum, [Post 12,697] (https://forum.decred.org/threads/1127/#post-12697)
