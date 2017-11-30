# <i class="fa fa-hdd-o"></i> Brisanje Vašeg novčanika.

Posotji nekoliko razloga zbog kojih bi trebali izbrisati Vaš novčanik.

* Morate obnoviti Vaš novčanik iz seed-a.
* Više nemate seed i želite napraviti novi novčanik.
* Želite ukloniti novčanik s određenog računala.

Prvo morate naći direktorij aplikacije dcrwallet koji je različit u raznim platformama. 
To je isti direktorij koji sadrži vaše [configuration files](/getting-started/startup-basics.md#configuration-files).

U tom direktoriju morate obrisati datoteku `mainnet/wallet.db`.
To će u potpunosti ukloniti Vaš novčanik s tog računala. Za ponovni pristup
morati ćete ga obnoviti iz izvornnog seed-a. 

Bitno je za napomeniti da je moguće (ali ne sigurno) da se
obrisana datoteka može vratiti s alatima za povrat podataka. Ako
ih brišete zbog sigurnosnih razloga vjerojatno bi trebali korisiti alate
za sigurno brisanje kao što je
[GNU shred](https://www.gnu.org/software/coreutils/manual/html_node/shred-invocation.html). 


