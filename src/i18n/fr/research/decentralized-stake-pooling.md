# Décentralisation des Pool D'Enjeu

---

Une question découlant des conceptions antérieures de PdE est la façon d'effectuer le minage PdE analogue au minage PdT.

Decred résout ce problème en permettant de multiples entrants dans une transaction d'achat de ticket et en s'engageant dans le montant de subvention UTXO pour chaque entrée proportionnellement, tout en s'engageant sur une nouvelle clé publique ou un script pour ces récompenses proportionnelles. La subvention est ensuite donnée à ceux qui génèrent le ticket de manière sans confiance, et le ticket peut être signé round robin avant de se soumettre au réseau. Il est important de noter que le contrôle de la production du vote lui-même est donné à une autre clé publique ou script qui ne peut pas manipuler la subvention accordée aux destinataires. La production du vote de manière distribuée peut être réalisée en utilisant un script dans le ticket qui permet plusieurs signataires.
