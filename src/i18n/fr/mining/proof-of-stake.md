# Minage Preuve-d'Enjeu (PdE)

Dernière mise à jour pour v1.0.0

Ce document est destiné à être une ressource éducative pour le minage de la preuve d'enjeu (jalonnement) avec Decred. Il couvrira le but du protocole de preuve d'enjeu, une brève introduction au processus de jalonnement, un cycle de vie des tickets et vous permet de commencer par l'achat de tickets.

---

## Aperçu

Le protocole de preuve d'enjeu unique de Decred a plusieurs objectifs:

Fournir une métrique pour les parties prenantes/support de l'utilisateur de fin à toute mise à jour du consensus. C'est-à-dire que les parties prenantes peuvent voter sur des propositions/agenda spécifiques sur la chaîne de blocs de Decred. Les agendas peuvent inclure la décision de savoir si l'équipe de développeur passe ou non la mise en œuvre d'une caractéristique spécifique, en activant le code d'une fonctionnalité déjà soumise pour la mise en œuvre ou en prenant d'autres décisions telles que la façon dont la subvention du développement devrait être dépensée. Vous trouverez plus d'informations sur le vote dans notre [Mainnet Voting Guide](/start-started/user-guides/agenda-voting.md).

PdE de Decred fournit également un système de vérification et contrepoids pour les mineurs non conformes. Les parties prenantes peuvent voter un bloc invalide si cela ne correspond pas aux règles de consensus du réseau.

---

## Staking 101 

Pour participer à la preuve d'enjeu, les parties prenantes verrouillent certains DCR en échange d'un ticket. Chaque ticket possédé donne à un intervenant la possibilité de voter. Lors du vote, chaque billet renvoie une petite récompense plus le prix **du ticket** du billet. Chaque ticket est sélectionné pour voter au hasard, donnant un temps de vote moyen de 28 jours, mais nécessitant peut-être jusqu'à 142 jours, avec une chance de .5% d'expirer avant d'être choisi pour voter (cette expiration renvoie l'original **Prix du Ticket** sans récompense). Chaque bloc extrait doit inclure 5 votes (les mineurs sont pénalisés par une déduction de récompense si moins de 5 votes sont inclus). Chaque bloc extrait peut également inclure jusqu'à 20 achats de billets frais. Un nouveau ticket nécessite 256 blocs pour mûrir avant qu'il ne soit entré dans le **Ticket Pool* et puisse être appelé à voter.

Il existe quelques variables importantes dont vous devriez vous familiariser avec le jalonnement.

Tous les 144 blocs (~12 heures), l'algorithme de difficulté de mise en jeu calcule un nouveau **Prix de ticket** dans le but de garder la taille **Ticket Pool** près de la taille du pool cible de 40 960 tickets. Cette fenêtre de bloc 144 est appelée `StakeDiffWindowSize`.

Le **Prix du Ticket**/**Difficulté de Participation** est le prix que vous devez payer pour un ticket pendant une seule fenêtre de 144 blocs.

Le **Ticket Pool** est le nombre total de billets dans le réseau de Decred.

Le **Ticket Fee** (`ticketfee`) est le taux d'honoraires qui doit être inclus dans l'achat du billet pour inciter les mineurs à la preuve de travailler à inclure ce ticket dans un nouveau bloc. **Frais de Ticket** se réfère habituellement au taux de frais DCR/kB pour une transaction d'achat de ticket. Par conséquent, avec une taille de transaction plus élevée, vous finirez par payer des frais absolus plus élevés. Par exemple, les achats de ticket de jalonnement en solo sont d'environ 300 octets, ce qui signifie que **la taxe de ticket** de 0,3 DCR/kB entraînera des dépenses sur .1 DCR si, et seulement si, ce ticket est inclus dans un bloc .

Lorsque le **Ticket Price** devient relativement bas pour une seule **Ticket Window**, vous pouvez généralement s'attendre à ce qu'un marché de frais se forme, et de nombreuses parties prenantes essaient d'acheter des tickets avant la fin de la fenêtre. Lorsque **Ticket Price** n'est pas à un prix extrêmement bas et rentable, le **Ticket Fee** par défaut de 0.01 taux DCR/kB est généralement assez élevé pour être inclus dans un bloc.

Lorsqu'un ticket est appelé à voter, le portefeuille qui a droit de vote pour ce ticket doit être en ligne. Si le portefeuille n'est pas en ligne pour voter, le ticket sera marqué comme `manqué` et vous ne recevrez pas de récompense pour ce ticket. Stakepools sont offertes comme une solution pour ceux qui ne peuvent pas avoir un portefeuille de vote en ligne 24 heures sur 24, 7 jours sur 7.

Stakepools permettent aux parties prenantes de générer des transactions d'achat de tickets qui donnent un droit de vote de partage pour votre ticket. Ils votent en votre nom, nécessitant généralement une petite taxe pour la participation (moins de 7%) qui couvre le coût d'hébergement du minimum de 3 serveurs requis pour exécuter un projet de partage. Cette taxe est connue sous le nom **Pool Fee** et n'est retiré que de la petite récompense PdE. Une liste des poteaux peut être trouvée [ci-dessous]( list-of-stakepools).

---

## Cycle de vie des tickets

L'achat d'un ticket pour PdE est assez simple (voir ci-dessous) mais qu'est-ce qui vous arrive après l'avoir acheté?
Un ticket sur le réseau principal (testnet utilise différents paramètres) passera par quelques étapes de sa vie:

1. Vous achetez un ticket en utilisant un Payetheus <!--,Decrediton,--> ou un portefeuille dcrwallet. Le coût total de chaque transaction de billet unique devrait être **Prix du billet** + **Frais de Ticket**(`ticketfee`).
2. Votre ticket entre dans le `mempool`. C'est là que votre ticket attend pour être miné par les mineurs de PdT. Seuls 20 tickets frais sont extraits dans chaque bloc.
3. Les billets sont regroupés dans un bloc avec des transactions plus **Ticket Fee** ayant une priorité plus élevée. Notez que le **Ticket Fee** est DCR par KB de la transaction. Quelques habitudes de transaction courantes sont de 298 octets (achat de tickets solo) et 539 octets (achat d'un ticket collectif).
4. **A-** Si votre ticket est extrait dans un bloc, il devient un ticket immature. Cet état dure 256 blocs (environ 20 heures). Pendant ce temps, le ticket ne peut pas voter. À ce stade, les frais de ticket ne sont pas remboursables. <br />
**B-** Si votre billet n'est pas extrait, les **Prix du Ticket** et **Frais du Ticket** sont retournés au compte d'achat.
5. Après l'échéance de votre billet (256 blocs), il entre dans le **Ticket Pool** et est éligible au vote.
6. Les chances de vote d'un ticket sont basées sur une distribution de Poisson avec une moyenne de 28 jours. Après 28 jours, un ticket a une chance de 50% d'avoir déjà voté.
7. Étant donné une taille de pool cible de 40960 tickets, un ticket donné a une chance de vote de 99,5% en ~142 jours (environ 4,7 mois). Si, après cette période, un ticket n'a pas voté, il expire. Vous recevez un remboursement sur l'original **Prix du Ticket**.
8. Un ticket peut manquer son appel pour voter si le portefeuille de vote ne répond pas ou deux blocs valides se trouvent à proximité immédiate. Si cela se produit, vous recevez un remboursement sur le **Prix du Ticket**.
9. Après qu'un ticket a voté, manqué ou a expiré, les fonds (prix du billet et subvention, le cas échéant, moins les frais) entreront dans un statut immature pour 256 autres blocs, après quoi ils seront libérés. Si un ticket est manqué ou expiré, une transaction de révocation de tickets est soumise par le portefeuille qui libère les sorties des tickets verrouillés. **REMARQUE:** Les révocations ne peuvent être soumises que pour un ticket manqué correspondant. Vous ne pouvez pas révoquer un ticket jusqu'à ce qu'il soit manqué.

---

## Comment Miner

Un portefeuille ouvert et déverrouillé 24/7 est *fortement recommandé* pour le jalonnement. Toute perte de temps de disponibilité peut entraîner une perte de vote et une récompense. Stakepools sont disponibles pour ceux qui ne peuvent garder un portefeuille de vote personnel en ligne pour toujours.

La seule autre exigence pour le jalonnement est que vous achetez un ticket. Vous trouverez ci-dessous des guides pour acheter des tickets en utilisant [Paymetheus](#paymetheus) et [dcrwallet](#dcrwallet).

Si vous avez l'intention d'utiliser une stakepool, vous devez d'abord vous inscrire à une. Des liens vers des points d'intérêt officiellement reconnus sont fournis [ici](#list-of-stakepools).

---

## Paymetheus 

L' application de Paymetheus est incapable de voter elle-même, ce qui signifie que les droits de vote doivent être attribués à une stakepool.

Consultez le [Purchase Tickets tab guide](/getting-started/user-guides/using-paymetheus.md#purchase-tickets-tab) pour Paymetheus pour apprendre à acheter des tickets à l'aide de Paymetheus et d'une stakepool.

---

## dcrwallet 

Le guide  [Buying Tickets with dcrwallet](/getting-started/user-guides/dcrwallet-tickets.md) vous montrera comment acheter des tickets manuellement et automatiquement pour le jalonnement de pool ou solo.

---

## <i class="fa fa-life-ring"></i> Liste des Stakepools

Ces stakepools sont officiellement reconnus:

* [<i class="fa fa-external-link-square"></i> https://dcr.stakepool.net](https://dcr.stakepool.net)
* [<i class="fa fa-external-link-square"></i> https://dcr.stakeminer.com](https://dcr.stakeminer.com)
* [<i class="fa fa-external-link-square"></i> https://pool.d3c.red](https://pool.d3c.red)
* [<i class="fa fa-external-link-square"></i> https://stakepool.dcrstats.com](https://stakepool.dcrstats.com)
* [<i class="fa fa-external-link-square"></i> https://stake.decredbrasil.com](https://stake.decredbrasil.com)
* [<i class="fa fa-external-link-square"></i> https://stakepool.eu](https://stakepool.eu)
* [<i class="fa fa-external-link-square"></i> https://dcr.ubiqsmart.com](https://dcr.ubiqsmart.com)
* [<i class="fa fa-external-link-square"></i> https://ultrapool.eu](https://ultrapool.eu)

Vous pouvez trouver une comparaison des frais et des statistiques de chaque pool en visitant le
[<i class="fa fa-external-link-square"></i> Site Decred](https://decred.org)
Et en cliquant sur le lien 'Stakepools' dans le pied de page au bas de la page.

---

<!-- TODO: **Purchasing Tickets with Decrediton** -->

## Information additionnelle

[Guide de vote de Mainnet](/getting-started/user-guides/agenda-voting.md)

[Commandes de Preuve-d'Enjeu](/advanced/program-options.md#pos-commands)

[Preuve-d'Enjeu FAQ - Général](/faq/proof-of-stake/general.md)

[Preuve-d'Enjeu FAQ - Acheter des billets et frais](/faq/proof-of-stake/buying-tickets-and-fees.md)

[Preuve-d'Enjeu FAQ - Minage Solo](/faq/proof-of-stake/solo-mining.md)

[Preuve-d'Enjeu FAQ - Stake Pools](/faq/proof-of-stake/stake-pools.md)

[Preuve-d'Enjeu FAQ - Tickets de vote](/faq/proof-of-stake/voting-tickets.md)

[Paramètres de Minage Preuve-d'Enjeu](/advanced/program-options.md#pos-network-parameters)
