# Iscrizione di script di firma e prove di frode 

---

Per prevenire la malleabilità di transazione, la capacità di generare una transazione con gli stessi riferimenti e uscite di input e tuttavia un diverso ID transazioni, gli script di input sono stati rimossi dal calcolo della hash di transazione. Le origini di questa modifica sono state controverse, anche se sembra essere stata implementata in entrambe le monete CryptoNote e sidechains in passato[^1] [^2]. Adesso viene proposto per Bitcoin come una forcella morbida denominata "Testimone segregato"[^3]. ACome nell'implementazione dei sidechains degli Elementi, gli impegni relativi ai dati del testimone sono inclusi nell'albero del segmento del blocco[^2]. Inoltre, le prove di frode, come suggerito per la soft fork di Bitcoin[^3], sono impostate dai miners e si impegnano anche come parte dei dati nel tree del merkle.

---

## <i class="fa fa-book"></i> Riferimenti

[^1]: von Saberhagen N. 2013. [CryptoNote v2.0](https://decred.org/research/saberhagen2013.pdf).
[^2]: Maxwell G. 2015. [Bringing new elements to Bitcoin with sidechains](https://decred.org/research/maxwell2015.pdf).
[^3]: Wuille P. 2015. [Segregated witness for Bitcoin](https://prezi.com/lyghixkrguao/segregated-witness-and-deploying-it-for-bitcoin/).
