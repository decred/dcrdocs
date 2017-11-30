# <i class="fa fa-hdd-o"></i> Kasowanie portfela

Istnieje parę powodów, dla których mógłbyś potrzebować usunąć swój portfel.

* Chcesz odtworzyć swój portfel z seeda.
* Nie posiadasz już seeda i chcesz utworzyć nowy portfel.
* Chcesz usunąć portfel z konkretnego komputera.

Najpierw musisz znaleźć katalog aplikacji dcrwallet, którego lokalizacja różni się w zależności od platformy.
Jest to ten sam katalog, w którym znajdują się Twoje  [configuration files](/getting-started/startup-basics.md#configuration-files).

W tym katalogu należy usunąć plik `mainnet / wallet.db`.
Usunie to całkowicie portfel z tego komputera. Aby ponownie uzyskać do niego dostęp
trzeba będzie przywrócić go z oryginalnego seeda.

Warto zauważyć, że możliwe jest (ale nie pewne), że 
usunięty plik może zostać odzyskany przy użyciu narzędzi do odzyskiwania plików. Jeśli
usuwasz portfel ze względów bezpieczeństwa, powinieneś użyć bezpiecznego narzędzia do usuwania, takiego jak np.
[GNU shred] (https://www.gnu.org/software/coreutils/manual/html_node/shred-invocation.html).


