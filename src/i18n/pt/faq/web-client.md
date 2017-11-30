# <i class="fa fa-firefox"></i> Web Wallet

---

#### 1. Quão seguro é o web client?

O cliente web é um fork de [Copay](https://copay.io), por isso é tão seguro quanto a isso [^7981]. A Seed (e, portanto, as chaves privadas) são mantidas e computadas localmente no armazenamento local do navegador e tudo é executado no lado do cliente. O servidor nunca tem acesso a nenhum dos dados privados necessários para gastar moedas.

---

#### 2. Você pode fazer mineração (solo stake) com web client?

Não, lembre-se de que a web wallet é executada localmente em sua máquina. Isso não pode correr muito bem 24/7. Como resultado, a web wallet nunca será capaz de participar da POS[^9093]. No entanto, seria possível suportar o agrupamento da POS com ela. As Stake pool's fornecem a capacidade de não ter uma carteira  24/7, uma vez que será responsabilidade das pool's estarem online e votar em seu nome nesse caso.

---

#### 3. É seguro excluir a carteira e iniciar novamente?

É seguro[^10652]. A única diferença é que você precisará acessar na opção  `Import Wallet` desta vez, em vez de criar uma nova.

---

## <i class="fa fa-book"></i> Fontes

[^7981]: Decred Forum, [Post 7,981](https://forum.decred.org/threads/518/#post-7981)
[^9093]: Decred Forum, [Post 9,093](https://forum.decred.org/threads/617/#post-9093)
[^10652]: Decred Forum, [Post 10,652](https://forum.decred.org/threads/643/page-2#post-10652)
