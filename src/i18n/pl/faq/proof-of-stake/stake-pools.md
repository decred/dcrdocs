# <i class="fa fa-life-ring"></i> Stake poole

---

#### 1. Czy istnieją jakieś inne korzyści dla puli akcji inne niż niewymaganie uruchomienia pełnego węzła i odblokowania portfela? Na przykład, czy mają większe szanse na wygraną, czy coś podobnego?

Zazwyczaj pule wprowadzają redundancję dzięki wielu portfelom, które są fizycznie dystrybuowane na całym świecie. Oznacza to, że istnieje mniejsze prawdopodobieństwo głosowania, które pominie nasz głos, gdy jeden portfel nie będzie online.
Zmniejsza to również opóźnienie pomiędzy portfelem i siecią, co może zmniejszyć szanse na utratę głosu.

---

#### 2. Czy stakepool dzieli nagrodę pomiędzy wszystkich uczestników (% w oparciu o ilość biletów, które przekazałeś do puli)?

Z technicznego punktu widzenia możliwe jest utworzenie puli obsługującej proporcjonalny podział nagród, ale obecna implementacja odnośnika `dcrstakepool` nie umożliwia tego. Stakepool po prostu głosuje w Twoim imieniu. Dokonuje tego poprzez przerobienie Twojego prawa do głosowania na wielopodpisowy skrypt P2SH 1-z-2 . Pool podpisuje głos z kluczem prywatnym w momencie wyboru biletu. Skoro jest to skrypt z wieloma podpisami 1-z-2, oznacza to, że nie można głosować za Ciebie z jakiegokolwiek powodu (jest to mało prawdopodobne, ponieważ pula mainneta będzie miała wiele nadmiarowości i automatycznego przełączania awaryjnego). Możliwe jest wciąż głosowania za samego siebie, ponieważ posiadasz drugą część klucza prywatnego i możesz spełnić wymóg dostarczenia ważnego podpisu 1-z-2. 

Ponadto ważne jest, aby pamiętać, że zakup oryginalnego biletu zawiera zobowiązanie do przejścia na adres nagród, do którego tylko Ty masz klucz prywatny. Zasady konsensusu w sprawie głosowania zobowiązują do wyegzekwowania zobowiązania, dlatego stakepool nie może ukraść Twoich funduszy.

W celu podziału nagród, pula musiałaby być odbiorcą wszystkich nagród, a następnie mieć na tyle zaufania, aby odpowiednio rozdzielić nagrody wśród wszystkich uczestników zgodnie z ich proporcjonalnością. Oczekuje się, że taki system zostanie opracowany z myślą o tym, że jest on mniej bezpieczny niż podejście stosowane w obecnym modelu puli.

---

#### 3. Muszę uruchomić mój portfel, aby kupić bilety, ale czy będą głosować poprawnie bez mnie, jeśli go zamknę, a pula zamiast tego zagłosuje na mnie?

Tak, zgadza się. Wystarczy uruchomić portfel, aby wydawać pieniądze na zakup biletu, który deleguje Twoje prawa głosu do puli, która następnie głosuje w Twoim imieniu. Adres nagród jest zobowiązaniem konsensusowym przy zakupie na jeden z Twoich własnych adresów, dla których tylko Ty masz klucz prywatny.

---

#### 4. Czy istnieją jakieś problemy, które mogłyby wyniknąć z puli akcji posiadającej zbyt wiele osób? Na przykład wymuszone głosowanie potwierdzające, bądź odrzucające blok?

Jest to z pewnością możliwe, ale jedna z rzeczy, które wszystkie poole powinny wspierać, pozwala każdemu użytkownikowi na wybranie indywidualnych preferencji głosowania. W ten sposób, gdy ich bilet się pojawi, a ich głosy głosują w ich imieniu, głosują zgodnie z ich preferencjami.

---

#### 5. Czy bity głosowania są ustawione przy zakupie biletu, czy dopiero gdy bilet jest wezwany do głosowania? Czy zmienia się to, gdy korzystam ze stake poola?

Bity głosowania są ustawione, gdy faktycznie głosujesz (i tylko taka opcja ma sens, ponieważ kupiłeś bilety tygodnie lub miesiące zanim przedstawiona zostaje sprawa, nad która można głosować).

Stakepool może działać, jakkolwiek chce, ponieważ jest dużo miejsca na elastyczność ze względu na system kupna biletów. Ogólnie rzecz ujmując, ludzie powinni unikać stosowania puli akcji, które nie pozwalają im kontrolować, w jaki sposób chcą głosować na kwestie nie związane z konkretnym poolem.

---

#### 6. Jakie zabezpieczenia są wprowadzone, żeby zatrzymać właścicieli pooli przed zniknięciem ze zgromadzonymi w nich funduszami?

Obecny projekt pooli jest taki, że pool NIE MOŻE kraść funduszy. Wydzielasz tylko prawa głosu (w rzeczywistości jest to multisig 1-z-2, co oznacza, że albo Ty, albo pool może głosować). Zakup biletów zawiera zobowiązanie konsensusu dotyczące ostatecznego adresu subsydium, więc po prostu nie ma możliwości, by pool ukradł fundusze.

Najgorsze, co mogłoby się zdarzyć, jeśli właściciel puli zniknie, to fakt, że głosy przegapią kolej do głosowania, co zaskutkuje odwołaniem biletu, co z kolei powoduje, że oryginalne monety powracają do pierwotnego właściciela (minus oczywiście wstępna opłata transakcyjna). Jednakże, jak wspomniano wcześniej, ponieważ bilet jest multisigiem 1-z-2, każdy użytkownik może uruchomić własny portfel w celu głosowania, jeśli właściciel puli zniknie.

---

#### 7. Gdzie mogę zobaczyć przykład biletu ze stake poola w eksploratorze bloków?

Stake poole zawierają adresy 'Dc', ponieważ stosują adresy "pay-to-script-hash". Na przykład zobacz txid: [c0abc0ec63a8de15550f067e2b6fde28f0432fb91b938574b282daa69f914103] (https://mainnet.decred.org/tx/c0abc0ec63a8de15550f067e2b6fde28f0432fb91b938574b282daa69f914103).

Przejdź do strony [PoS Voting Tickets FAQ] (/ faq / proof-of-stake / voting-tickets.md)

---

## <i class="fa fa-book"></i> Żródła

[^9262]: Decred Forum, [Post 9,262](https://forum.decred.org/threads/626/#post-9262)
[^9274]: Decred Forum, [Post 9,274](https://forum.decred.org/threads/626/#post-9274)
[^9311]: Decred Forum, [Post 9,311](https://forum.decred.org/threads/582/page-2#post-9311)
[^13607]: Decred Forum, [Post 13,607](https://forum.decred.org/threads/1236/#post-13607)
[^14593]: Decred Forum, [Post 14,593](https://forum.decred.org/threads/1321/#post-14593)
[^17515]: Decred Forum, [Post 17,515](https://forum.decred.org/threads/1289/#post-17515)
