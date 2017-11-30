# Decred Pull Requestit ja Kontribuutiot

---

Kaikki Decredin koodi löytyy GitHubista. Tästä dokumentista löydät tietoa tavastamme käsitellä koodikontribuutiot, sekä tietoa miten voit itse osallistua. Tämä dokumentti perustuu osin  [btcsuite]n vastaavaan dokumenttiin (https://github.com/btcsuite).

---

## Alkuvalmistelut

Hyvä ensiaskel on lukea [Code Contribution Guidelines documentation](https://github.com/decred/dcrd/blob/master/docs/code_contribution_guidelines.md) jotta saat hyvän ymmärryksen projektin käytännöistä.
Dokumentti keskittyy enimmäkseen Go codebaseen mutta on silti hyvä alku.

Seuraavat esimerkit on jaettu kahteen osioon, toinen Go-projekteille (dcrd, dcrwallet, gominer, etc), ja toinen projekteille jotka eivät käytä Go:ta (decrediton, Paymetheus, dcrdocs, etc). Tutustu jokaisen projektin README.md:en jos tarvitset apua projektin setupin kanssa.

---

## Perusmalli

Tällä prosessilla päämäärämme on tehdä osallistuminen helpoksi ja samalla pitää koodin taso korkeana. Decred-tiimin jäsenet seuraavat samoja käytäntöjä kuin ulkopuoliset osallistujat.

Seuraavassa pääpiirteittäin koodinhakkerointimallimme. Jos jokin tästä on vaikeaselkoista, ei huolta, tarkempi selitys löytyy myöhemmistä osioista.

1. Etsi issue jota haluat työstää. Jos et löydä sellaista jonka kuvaus on sopiva, avaa uusi, joka selittää mitä olet aikeissa tehdä.
1. Tee koodimuutokset branchiin.
1. Lisää muutokset omaan forkattuun GitHub repoosi.
1. Kun koodisi on valmis tarkasteltavaksi tai jos vain haluat näkemyksiä muilta developereilta, avaa Pull Request (PR) main repossa GitHub-sivulta.
1. Lisää PR:ään kommentti jossa kerrot, mitä issueta olet korjaamassa. Lisää teksti Closes # tai Fixes # ja perään issuen numero yhdellä rivillä. Näin GitHub linkittää PR:n automaattisesti kyseiseen issueen, ja sulkee issuen kun PR suljetaan.
1. Voit pyytää tarkistusta haluamaltasi henkilöltä GitHub-sivulta tai voit kysyä irc/slack-kanavaltamme jotakuta tarkastelemaan.
1. KAIKEN koodin pitää olla tarkastettu ja vähintään yhden tiimin jäsenen hyväksymä ennen kuin se voidaan ottaa käyttöön. Vain tiimin jäsenet voivat virallisesti hyväksyä koodin, mutta kommentit muilta käyttäjiltä ovat tervetulleita.
1. Jos saat muutosehdotuksia, tee pyydetyt muutokset ja committaa ne paikalliseen branchiisi.
1. Lisää muutokset samaan branchiin mitä olet hakkeroinut. Näin ne näkyvät PR:ssä ja niitä voi tarkastellessa verrata aikaisempaan versioon.
1. Once your code is approved, it can be merged into master.  To keep history clean, we only allow non-fast-forward merges (that means we want a linear history).  Most PRs also must be squashed to a single commit (although if there is reason to have it as multiple commits that can be considered on a case by case basis).
1. Jos PR:si on yksittäinen commit (tai voidaan squashata GitHubin toimesta automaattisesti) ja on ajan tasalla masterin kanssa, tarkistaja yhdistää PR:si. Jos branchisi on liian paljon jäljessä, sinulta saatetaan pyytää commit rebasea. Kun tämä on tehty ja pushed, tarkistaja yhdistää committisi.

---

## Go 

Go:ta käyttäville projekteille, voit seurata tätä menettelyä. dcrd:tä käytetään tässä esimerkkinä. Olettamus on että sinulla on jo go1.6 tai uudempi asennettuja, ja toimiva `$GOPATH`.

### Kerta-asennus
- Forkkaa dcrd GitHubissa
- Aja seuraavat komennot hankkiaksesi dcrd:n ja asenna se:

```bash
$ mkdir -p $GOPATH/src/github.com/decred/
$ git clone https://github.com/decred/dcrd $GOPATH/src/github.com/decred/dcrd
$ cd $GOPATH/src/github.com/decred/dcrd
$ go dep ensure
$ go install . ./cmd/...
```

- Lisää git remote forkkiisi:

```bash
$ git remote add <yourname> https://github.com/<yourname>/dcrd.git
```

## Muut projektit

Projekteille joita ei ole kirjoitettu Go:lla, aloitus-setuppi riippuu projektista. Käytämme tässä dcrdocsia esimerkkinä, mutta perusasiat ovat samat kaikille projekteille. Tietty setuppi löytyy projektin README.md:stä (esim. miten asentaa mkdocs toimimaan dcrdocsissa tai electronissa decreditonille).

### Kerta-asennus
- Forkkaa dcrdocs GitHubissa
- Aja seuraavat komennot hankkiaksesi dcrd ja asenna se:

```bash
$ mkdir -p code/decred
$ cd code/decred
$ git clone https://github.com/decred/dcrdocs
$ cd dcrdocs
```

- Lisää git remote forkkiisi:

```bash
$ git remote add <yourname> https://github.com/<yourname>/dcrdocs.git
```

## Uuden ominaisuuden pull requestin tekeminen
- Etsi tai avaa issue GitHub repossa (alkuperäisessä, ei omassa forkissasi) ominaisuudelle jota haluat parannella.
- Checkout uusi feature branch majoittamaan muutokset joita aiot tehdä:

```bash
$ git checkout -b <feature_branch>
```
- Tee mitä muutoksia on tarpeen ja committaa ne
- Push feature brachisi omaan forkkiisi:

```bash
$ git push <yourname> <feature_branch>
```
- Mene selaimellasi osoitteeseen https://github.com/decred/dcrd 
- Tee pull request GitHub UI:lla. Voit pyytää tarkistusta GitHub websivulla tai voit pyytää jotakuta irc:ssä tai slackissä.

## Olemassa olevan pull requestisi rebaseminen

Toisinaan sinua pyydetään rebaseamaan ja squashaamaan pull request uusimpaan master branchiin.

- Varmista että master branch on ajantasalla:

```bash
$ git checkout master
$ git pull
```
- Checkout olemassa oleva feature branch ja rebase se interaktiivisella flägillä:

```bash
$ git checkout <feature_branch>
$ git rebase -i master
```
- Follow the directions presented to specify 's' meaning squash for the additional commits (the first commit must remain 'p' or 'pick').
- Kirjoita yksi commit-viesti editorissa jonka olet asettanut kattamaan kaikki sisällytetyt commitit.
- Tallenna ja sulje editori ja git generoi yhden commitin, joka sisältää spesifioimasi viestin ja kaikki lisätyt commitit. Voit tarkastaa commitin komennolla ```git show```.
- Force push branch omaan forkkiisi:

```bash
$ git push -f <yourname> <feature_branch>
```

## Muuta Huomioonotettavaa

On muutamia muita asioita jotka tulisi ottaa huomioon pull requestiä tehdessä. Go-koodin ollessa kyseessä, test coveragea on jo reilusti. Jos olet lisäämässä koodia, sinun tulee lisätä myös testit. Jos olet korjaamassa jotain, sinun pitää varmistaa että et riko mitään olemassa olevaa. Go-koodille on olemassa scripti ```goclean.sh``` jokaisessa repossa testien ja static checkerien ajamista varten. MITÄÄN koodia ei hyväksytä ellei se ole läpäissyt kaikkia testejä. node.js-koodin (decrediton) tapauksessa, kaiken koodin pitää läpäistä eslint. Voit tarkistaa tämän komennolla ```npm run lint```.

Lopuksi, jokaisessa repossa on LICENSE. Uuden koodisi pitää olla saman lisenssin alainen kuin olemassaoleva koodi, ja copyrightit luovutettu 'The Decred Developers':lle. Useimmissa tapauksista tämä on hyvin vapaa ISC-lisenssi mutta jotkut repot ovat erilaisia. Tarkista repo ollaksesi varma.

Jos sinulla on kysyttävää osallistumisesta, voit vapaasti kysyä irc:ssä/slackissä tai GitHubissa. Decred-tiimin jäsenet (ja luultavasti myös yhteisön jäsenet) auttavat mielellään.
