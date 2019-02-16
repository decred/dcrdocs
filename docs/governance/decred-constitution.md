# <img class="dcr-icon" src="/img/dcr-icons/Constitution.svg" /> Decred Constitution

* *Decred* (/ˈdi:ˈkred/, /dɪˈkred/, dee-cred) is a secure, adaptable and self-funding cryptocurrency with a system of community-based governance integrated into its blockchain. The project mission is to develop technology for the public benefit, with a primary focus on cryptocurrency technology. *Decred*, as a currency and as a project, is bound by the following set of rules, which include guiding principles, a system of governance, and a funding mechanism. These rules have been established in an effort to create an equitable and sustainable framework within which to achieve *Decred*'s goals.

  ------

  ## Principles

* *Free and Open-Source Software* - All software developed as part of *Decred* shall be free and open source-software.

* *Free Speech and Consideration* - Everyone has the right to communicate opinions and ideas without fear of censorship. Consideration shall be given to all constructive speech that is based in fact and reason.

* *Multi-Stakeholder Inclusivity* - Inclusivity represents a multi-stakeholder system and an active effort shall be maintained to include a diverse set of views and users. While it would be ideal to include everyone, *Decred* shall comply with all relevant bodies of law in the jurisdictions where applicable, such as embargoes and other trade sanctions.

* *Incremental Privacy and Security* - Privacy and security are priorities and shall be balanced with the complexity of their implementations. Additional privacy and security technology shall be implemented on a continuing and incremental basis, both proactively and on-demand in response to attacks.

* *Fixed Finite Supply* - Issuance is finite and the total maximum number of coins in *Decred* shall not change. The total maximum supply for *Decred* is 20,999,999.99800912 coins, with a per-block subsidy that adjusts every 6,144 blocks (approximately 21.33 days) by reducing by a factor of 100/101. The genesis block subsidy starts at 31.19582664 coins.

* *Universal Fungibility* - Universal fungibility is fundamental to *Decred* being a store of value and attacks against it shall be actively monitored and countermeasures pursued as necessary.

------

## Blockchain Governance

- Governance of the network occurs directly through the blockchain via hybridization of a block's proof-of-work ("PoW") with its proof-of-stake ("PoS"). PoS voters, also known as stakeholders, can effectively override PoW contributors, known as miners, if 60% or more of the stakeholders vote against a particular block created by a miner.
- A lottery system is used to determine which stakeholders vote on each block and collect a subsidy.
- To be a stakeholder, one must purchase one or more tickets, which entails locking a specific amount of coins. The amount of DCR that must be locked, also known as the ticket price, fluctuates as the system targets 40,960 tickets in the live pool.
- After waiting for the ticket to mature, the ticket is entered into a lottery that runs once per block where five winning tickets gain the ability to vote on the previous block.
- Stakeholders must wait an average of 28 days (8,192 blocks) to vote their tickets, and during this time the coins used to purchase the ticket remain locked. The wait may be much longer or shorter than the average of 28 days because the ticket selection process is pseudorandom. Tickets expire after approximately 142 days (40,960 blocks).
- Stakeholder votes recorded in the blockchain are rewarded with 6% of each block subsidy, and each block can have up to 5 votes for a total of 30% of each block subsidy.
- PoW receives 60% of each block subsidy, subject to the constraint that their subsidy scales linearly with the number of PoS votes included, e.g. including 3 of 5 votes reduces PoW subsidy to 60% of the maximum.
- The votes themselves decide by majority decision whether the regular transaction tree of the previous block, including the PoW subsidy, is valid. Thus, if PoS voters vote against a particular PoW block, it destroys the PoW reward (and Treasury reward) and invalidates any regular transactions within that block.
- Additional vote bits may be set when stakeholders submit votes, allowing stakeholders to vote on matters besides the previous block. The method of adopting changes to the consensus rules uses these additional vote bits.

------

## Project Governance and Funding

* Sustainability and longevity require that 10% of all block rewards be given to a project Treasury fund, administered by a development organization.
* The initial development organization is *Decred Holdings Group* LLC ("DHG"), a Nevis LLC that is responsible for funding work related to the development of the project, such as software development, infrastructure, and awareness.
* DHG shall only fund work that adheres to the guiding principles.
* The project aims to transition to a Decentralized Autonomous Entity which controls the disbursement of Treasury funds.
* Politeia proposals are the mechanism through which stakeholders make policy decisions and approve programs of work. 
* Politeia proposals must be approved by at least 60% of the tickets that vote, and at least 20% of the eligible tickets must participate in the vote. The default voting period is 2016 blocks (~1 week).
* Decred contractors are individuals and corporations who work on the project, under an agreement that they are compensated for their work. 
* Decred contractors are autonomous, they cannot be managed directly by stakeholders. Through Politeia, stakeholders can approve or reject programs of work as performed by specific contractors, but they cannot mandate that workers take certain actions. 
* The Decred contractor collective is a self-regulating entity, wherein cells working on specific aspects resolve disputes and add new members independently.
* As described in the approved [Decred Contractor Clearance proposal](https://proposals.decred.org/proposals/fa38a3593d9a3f6cb2478a24c25114f5097c572f6dadf24c78bb521ed10992a4), disputes that cannot be satisfactorily resolved within a team can be escalated to an all contractor vote - once the contractor management system which will facilitate this is operational. If necessary, unresolved matters could be further escalated to a stakeholder vote as the ultimate decision-making authority. 
