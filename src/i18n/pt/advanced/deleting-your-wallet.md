# <i class="fa fa-hdd-o"></i> Deletando Sua Carteira

Há alguns motivos pelos quais você talvez precise deletar sua carteira. 

* Você precisa restaurar sua carteira a partir da seed.
* Você não tem mais a seed e quer fazer uma nova carteira.
* Você quer remover a carteira de um computador específico.

Em primeiro lugar você precisa encontrar o diretório do programa dcrwallet, que varia de plataforma para plataforma.
Esse é o mesmo diretório que é a  home para seus [arquivos de configuração](/getting-started/startup-basics.md#configuration-files).

Já no diretório você tem que apagar o arquivo  `mainnet/wallet.db`.
Isso irá remover completamente sua carteira do computador. Para acessá-la
novamente você precisará restaurar a partir da seed original.

É importante destacar que é possível (porém não com certeza) que um
arquivo deletado possa ser recuperado utilizando ferramentas para recuperação de arquivos. Se você está
apagando isso por questões de segurança talvez precise usar uma ferramenta segura
de remoção como
[GNU shred](https://www.gnu.org/software/coreutils/manual/html_node/shred-invocation.html). 


