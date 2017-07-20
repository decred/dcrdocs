# ** Preuve-de-Travail (PdT) Minage**

---

## ** Solo Minage ou Pool Minage **

> <i class="fa fa-male"></i> Solo Minage

<i class="fa fa-exclamation-triangle"></i> **Solo minage n'est pas recommandé et n'est pas couvert dans cette documentation!** Le réseau de Decred voit régulièrement un taux de hash réseau de plus de 10 000 Gh/s. Miner en solo n'est généralement effectuée que par des personnes avancées ou des groupes organisés avec un grand groupe de GPU, de sorte qu'il ne soit pas abordé ici.

> <i class="fa fa-users"></i> Pool Minage

Lorsque vous vous trouvez dans une piscine, votre hash est combiné avec tous les autres hashrates des mineurs de pool pour rechercher la solution correcte pour un bloc. Vous recevrez une récompense en fonction de la quantité de travail effectué par votre mineur dans la pool.
Le minage en pool distribue des actions en fonction des blocs trouvés afin que vous puissiez gagner un montant stable de Decred plutôt que de «tout ou rien» en minage solo

---

## Obtenir une Adresse Decred et Recevoir des Fonds avec

Suivez le guide [dcrctl Basics](/getting-started/user-guides/dcrctl-basics.md) Et créez une adresse afin que vous puissiez retirer des récompenses de minage.

---

## **<i class="fa fa-life-ring"></i> Signez sur une Pool de Minage**

Ces Pool de Minage sont Connues et Supportées par Decred:

* [<i class="fa fa-external-link-square"></i> http://decredpool.org](http://decredpool.org)
* [<i class="fa fa-external-link-square"></i> http://yiimp.ccminer.org](http://yiimp.ccminer.org)
* [<i class="fa fa-external-link-square"></i> http://coinmine.pl/dcr](http://coinmine.pl/dcr)
* [<i class="fa fa-external-link-square"></i> https://dcr.maxminers.net](https://dcr.maxminers.net)
* [<i class="fa fa-external-link-square"></i> https://dcr.suprnova.cc](https://dcr.suprnova.cc)
* [<i class="fa fa-external-link-square"></i> https://pool.mn/dcr](https://pool.mn/dcr)
* [<i class="fa fa-external-link-square"></i> https://zpool.ca](https://zpool.ca)

Les pools de minage fonctionnent tous plus ou moins les mêmes, mais vous pouvez vous inscrire à plusieurs pools et voir celle qui vous convient le mieux.

Choisissez de miner sur une plus petite pool afin que le hash du réseau puisse être réparti pour une meilleure décentralisation du pouvoir de minage!

---

## ** GPU Drivers/Software **

Les pilotes GPU contiennent habituellement les bibliothèques nécessaires au minage. Si vous avez des difficultés à exécuter le logiciel, vous pouvez réinstaller et vérifier spécifiquement que les bibliothèques OpenCL (AMD) ou CUDA (NVIDIA) sont sélectionnées.

---

## **<i class="fa fa-download"></i> Selectionner and Télécharger le Software de Minage **

> Software de Minage Officiel de Decred

#### **[<i class="fa fa-github"></i> gominer](https://github.com/decred/gominer)**

Il est recommandé que tous utilisent gominer pour Decred. C'est le mineur le plus facile à configurer et à démarrer pour miner. Actuellement, la dernière version de gominer est **[<i class="fa fa-github"></i>v0.8.0](https://github.com/decred/gominer/releases/)** et les binaire officiels peuvent être téléchargés depuis **[https://github.com/decred/decred-binaries/releases/tag/v0.8.0](https://github.com/decred/decred-binaries/releases/tag/v0.8.0)**

Assurez-vous de sélectionner le système d'exploitation correct (Windows/Linux) et la version correcte pour votre type de GPU (CUDA pour les cartes NVIDIA, OpenCL/OpenCLADL pour les cartes AMD). Gominer n'est disponible que pour les systèmes d'exploitation 64 bits. Les guides d'utilisation pour commencer l'extraction avec gominer peuvent être trouvés ici: 

- [Windows Pool-de-Minage](/mining/proof-of-work/pool-mining/gominer/windows.md)

#### **[<i class="fa fa-github"></i> cgminer](https://github.com/decred/cgminer)**

cgminer est un populaire mineur pour **AMD** GPUs qui a une longue histoire d'utilisation dans de différentes et nombreuses cryptocurrency. Il est plus difficile à utiliser que le gominer Decred.

#### **[<i class="fa fa-github"></i> ccminer](https://github.com/decred/ccminer)**

ccminer est un mineur populaire **NVIDIA** GPUs qui a une longue histoire d'utilisation dans de différentes et nombreuses cryptocurrency. Il est plus difficile à utiliser que le gominer Decred.

**Logiciels officiels de ccminer et cgminer sont disponibles sur GitHub depuis ce lien: <br />
[https://github.com/decred/decred-release/releases/tag/v0.1.0_miners](https://github.com/decred/decred-release/releases/tag/v0.1.0_miners)**

> Mineurs Non-official

Ceux avec une carte graphique **AMD** utilisant Windows peuvent vouloir télécharger [sgminer](https://github.com/tpruvot/sgminer/releases).

---

## **Lancer le Software**

* Décompressez et installez le logiciel dans un lieu de votre choix.
* Ouvrez une invite de commandes sur ce chemin.
* Suivez les instructions de vos pools de minage pour la configuration.
* Exécuter le mineur.

Continuer à [PdT Minage FAQ](/faq/proof-of-work-mining.md)
