# Potpis Schnorr 

---

Schnorrove potpise predložene su za Bitcoin. Također su se opsežno koristili u drugim kriptoznim valutama, kao što su Nxt i CryptoNote kovanice. U najjednostavnijem slučaju, kriptosustav Schnorr potpisa ECDSA može se opisati na sljedeći način:

1. \(y = xG\) gdje \(y\) je točka javnog ključa na krivulji, \(x\) je privatni skalar, \(G\) je generator krivulje.
2. \(r = kG\) gdje je \(r\) točka na krivulji koja proizlazi iz množenja \(k\), nonce skalara, od strane generatora.
3. \(h = H(M || r)\) gdje je \(H\)  sigurna ključna funkcija, \(M\) je poruka (obično 32 byte ključ), a \(r\) Prethodno opisana kodirana točka. \(||\) označava povezivanje.
4. \(s = k - hx\) gdje je \(s\) skalar označen s \(k - hx\).
5. Potpis je \((r,s)\), a potvrda je jednostavno \(H(M || r) == hQ + sG\).

U gore navedenom, množenja velikim slovom (npr., \(kG\)) su množenja točaka pomoću skalara, pa uvijek rezultiraju točkom na krivulji. Dodatak ovih točaka rezultira još jednom. Povećanje i umnožavanje skalara među sobom jednako je redovitoj umnožavanju koju biste učinili s bilo kojim brojem. Važno je napomenuti da se množenje točke skalarom smatra nepovratnim korakom, jer izračun skalara iz nove točke zadane je za diskretni logaritamski problem.

Iz gore navedenog jasno je da je \(r\) točka na krivulji, dok je \(s\) skalar.  Razmislite o grupi potpisnika koji su zastupljeni \(x_{sum} = x_1 + ... + x_n\) s nonces \(k_{sum} = k_1 + ... + k_n\). Javni ključ za privatni skalarni iznos bio bi: \(y = x_{sum} G\). TPotpis za te iznose (iz svih sudionika grupe) bio bi: \(r' = k_{sum} G s' = k_{sum} - h x_{sum}\). Za stvaranje ovog potpisa svi sudionici morali bi podijeliti svoj privatni ključ i ne prije. Očito želimo ovo izbjeći, stoga, umjesto toga, neka svaki sudionik stvori djelomični potpis. \(r_n = k_1 G + ... + k_n G = r'\) (zbroj javnih nonce bodova, koje sudionici mogu slobodno pojedinačno objaviti) \(s_n = k_n - h x_n\). Zamjenjujući to u opće formule za potpise i korištenjem dodatka točaka ili skalara: \(r = r_n = r'\) (isto kao i gore) \(s = s_1 + ... + s_n = s'\) (jednostavni skalar Mora biti istina da \((k_1 - h x_1) + ... + (k_n - h x_n) = s_1 + ... + s_n = s')\). Učiniti m-of-n potpis je ne-trivijalan. Predloženo je da se za te slučajeve koristi znakovno stablo koje sadrži sve moguće zbirke javnih ključeva za sudionike \(m\) stvarajući potpis \(log(n)\) veličinu [28].

---

## <i class="fa fa-book"></i> Preporuke 

[^1]: Wuille P. 2015. [Firme stabla: Višestrukipotpis na steroide pomoću potpisa stabala](https://decred.org/research/wuille2015.pdf).
