# Zdecentralizowany stake pooling

---

Jednym z problemów wynikających z poprzednich projektów PoS jest sposób łączenia PoS w górnictwo analogiczne do łączenia zasobów obliczeniowych PoW.

Decred rozwiązuje ten problem poprzez zezwalanie na wejście wielu danych wejściowych do transakcji kupna biletu, oraz zobowiązania do kwoty subwencji UTXO proporcjonalnie dla każdego wkładu, jednocześnie zobowiązując te nagrody do nowego wyjścia klucza publicznego bądź skryptu. Subwencja jest przyznawana tym, którzy generują bilet w sposób niewymagający zaufania, a ten można podpisać w algorytmie karuzelowym przed przekazaniem do sieci. Co ważniejsze, kontrola nad produkcją samego głosu jest nadawana innym kluczom publicznym lub skryptom, które nie mogą manipulować subwencją udzieloną odbiorcom. Produkcja głosowania w sposób rozproszony może być osiągnięta za pomocą skryptu na bilecie, który umożliwia wielokrotne podpisywanie.
