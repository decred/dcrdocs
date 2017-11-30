# Razlike u linerarnima naredbama tijekom operacijskih sustava 

Ova je stranica posljednji put ažurirana za v1.0.0.

---

The purpose of this page is to explain the key differences for running the cross-platform command-line applications on Windows, Linux, and macOS.

---

> Pokreni naredbe

Prva velika razlika u aplikacijama naredbenog retka (`dcrd`,`dcrwallet`,`dcrctl`) je kako ih pokrenete iz naredbenog retka. Ovo nije toliko operativni sustav jer je razlika u omotaču. Windows se instalira s CMD-om i PowerShell-om. MacOS koristi pojas u programu Terminal, a mnoge Linux distribucije također koriste pojas. U nastavku su navedeni primjeri osnovnih naredbi za pokretanje za pojas i naredbeni redak.

**Naredbeni redak:** `dcrd.exe`, `dcrwallet.exe`, `dcrctl.exe` <br />
**pojas:** `./dcrd`, `./dcrwallet`, `./dcrctl`

Neki od naših vodiča mogu biti OS-agnostici s naredbama za pokretanje. Ako vodič kaže da pokreće `dcrctl --wallet getbalance`, upućuje na upotrebu `dcrctl.exe --wallet getbalance` za Command Prompt i `./dcrctl --wallet getbalance` za pojas.

> Mjesta na adresi aplikacija

Drugi način razlikovanja klijenata naredbenog retka je mjesto svakog aplikacijskog direktorija (blokovi, računi, konfiguracijske datoteke su pohranjene unutar direktorija podataka). Slijedi tablica zadanih aplikacijskih direktorija za svaku aplikaciju. 

| OS      | dcrd, dcrwallet, dcrctl App Directories      | 
| -------:|:--------------------------------------------- |
| Windows | `C:\Users\<your-username>\AppData\Local\dcrd\`      |
|         | `C:\Users\<your-username>\AppData\Local\dcrwallet\` | 
|         | `C:\Users\<your-username>\AppData\Local\dcrctl\`    |
| macOS   | `~/Library/Application Support/dcrd/`         |
|         | `~/Library/Application Support/dcrwallet/`    |
|         | `~/Library/Application Support/dcrctl/`       |
| Linux   | `~/.dcrd/`                                    |
|         | `~/.dcrwallet/`                               |
|         | `~/.dcrctl/`                                  |

