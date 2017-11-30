# Minage Preuve-de-Travail (PdT)

---

## Aperçu

Le minage de la preuve de travail, plus communément appelée minage PdT, est l'activité
de commettre le matériel et les ressources de votre ordinateur pour traiter le réseau
les transactions et construire les blocs qui composent la chaîne de blocs dans le décred
réseau. Chaque fois qu'un bloc est créé (par un mineur), environ 30 nouveaux coins Decred
sont faits. Ces pièces sont divisées comme suit:

Subvention | Party
---     | ---
60%   | PdT Mineurs
30%   | PdE Voteurs
10%   | Subvention de développement Decred

En moyenne, vous recevrez une récompense approximativement proportionnelle au
hashrate de votre mineur et le hashrate global du réseau lorsque vous commettez
votre ordinateur au minage PdT. Pour commencer, vous devez avoir un ordinateur avec un
carte vidéo. La plupart des cartes vidéo peuvent être utilisées pour l'extraction (y compris le "mobile"
types trouvés dans certains ordinateurs portables). En général, les cartes vidéo haut de gamme se produisent à
hashrate plus élevés et reçoivent donc des récompenses plus élevées.
---

## Minage Solo ou Minage en Pool

> <i class="fa fa-male"></i> Minage Solo

<i class="fa fa-exclamation-triangle"></i> **Le minage Solo n'est pas recommandé et n'est pas couvert par cette documentation! ** Le réseau de Decred voit régulièrement un taux de hachage du réseau jusqu'à 10 000 Gh/s . Le minage en solo n'est généralement effectué que par des personnes avancées ou des groupes organisés avec un grand groupe de GPU, de sorte qu'il ne soit pas abordé ici.

> <i class="fa fa-users"></i> Minage en Pool

Lorsque vous minez dans une pool, votre hashrate est combiné avec tous les autres hashrates des mineurs de la pool pour rechercher la solution correcte pour un bloc. Vous recevrez une récompense en fonction de la quantité de travail que votre mineur effectue dans la pool.
La pool de minage distribue des actions en fonction des blocs trouvés afin que vous puissiez gagner une quantité constante de Decred plutôt que le «tout ou rien» du minage en solo.

---

## Obtenez une adresse Decred pour recevoir des fonds avec

Suivez le guide [dcrctl Basics](/start-up/user-guides/dcrctl-basics.md) et créez une adresse afin que vous puissiez retirer des récompenses de minage.

---

## <i class="fa fa-life-ring"></i> Inscrivez-vous pour une Pool de Minage

Ces pool de minage sont connues pour soutenir Decred:

* [<i class="fa fa-external-link-square"></i> http://decredpool.org](http://decredpool.org)
* [<i class="fa fa-external-link-square"></i> http://yiimp.ccminer.org](http://yiimp.ccminer.org)
* [<i class="fa fa-external-link-square"></i> http://coinmine.pl/dcr](http://coinmine.pl/dcr)
* [<i class="fa fa-external-link-square"></i> https://dcr.maxminers.net](https://dcr.maxminers.net)
* [<i class="fa fa-external-link-square"></i> https://dcr.suprnova.cc](https://dcr.suprnova.cc)
* [<i class="fa fa-external-link-square"></i> https://pool.mn/dcr](https://pool.mn/dcr)
* [<i class="fa fa-external-link-square"></i> https://zpool.ca](https://zpool.ca)

Les pools de minage fonctionnent tous plus ou moins les mêmes, mais vous pouvez vous inscrire à plusieurs pools et voir lequel vous convient le mieux.

Veuillez choisir de miner sur une plus petite pool afin que le hashrate du réseau puisse être réparti pour une meilleure décentralisation du pouvoir de minage!

---

## GPU Drivers/Software  

Les pilotes GPU contiennent habituellement les bibliothèques nécessaires au minage. Si vous avez des difficultés à exécuter le logiciel, vous pouvez réinstaller et vérifier spécifiquement que les bibliothèques OpenCL (AMD) ou CUDA (NVIDIA) sont sélectionnées.

---

## <i class="fa fa-download"></i> Sélectionnez et téléchargez le logiciel de minage

### Official Decred Mineur (gominer)

Gominer est le mineur déclaré officiel développé et soutenu par l'équipe de Decred. C'est le mineur le plus facile à configurer et à démarrer pour le minage, et il est recommandé pour la plupart des utilisateurs. Actuellement, la dernière version de gominer est **<i class="fa fa-github"></i> [v1.0.0] (https://github.com/decred/gominer/releases/)** et le les fichiers binaires officiels peuvent être téléchargés à partir de **[https://github.com/decred/decred-binaries/releases/tag/v1.0.0](https://github.com/decred/decred-binaries/releases/tag/v1.0.0)**

Assurez-vous de sélectionner le système d'exploitation correct (Windows/Linux) et la version correcte pour votre type de GPU (CUDA pour les cartes NVIDIA, OpenCL/OpenCLADL pour les cartes AMD). Gominer n'est disponible que pour les systèmes d'exploitation 64 bits. Les guides d'utilisation pour commencer le minage avec gominer peuvent être trouvés ici:

- [Windows Pool-Mining](/mining/proof-of-work/pool-mining/gominer/windows.md)

### Mineurs non officiels

* <i class="fa fa-github"></i> [cgminer](https://github.com/kR105-zz/cgminer) - cgminer est un mineur populaire pour **AMD** GPU qui a longue histoire d'utilisation dans de nombreuses différentes cryptocurrency. Il est plus difficile à utiliser qu'avec le gominer Decred.

* <i class="fa fa-github"></i> [ccminer](https://github.com/tpruvot/ccminer) - ccminer est un mineur populaire pour **NVIDIA** GPU qui a une longue histoire d'utilisation dans de nombreuses différentes cryptocurrency. Il est plus difficile à utiliser qu'avec le gominer Decred.

* <i class="fa fa-github"></i> [sgminer](https://github.com/tpruvot/sgminer) - Ceux qui ont une carte graphique **AMD** exécutant Windows peuvent vouloir télécharger sgminer.

---

## Exécution du logiciel

* Décompressez et installez le logiciel dans un lieu de votre choix.
* Ouvrez une invite de commandes sur ce chemin.
* Suivez les instructions de votre pool de minage pour l'installation.
* Exécutez le mineur.

Continuez à [Minage PdT FAQ](/faq/proof-of-work-mining.md)
