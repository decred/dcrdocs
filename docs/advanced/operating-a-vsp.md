# Operating a Voting Service Provider (VSP)

---

## Overview

VSPs are a key part of the Decred infrastructure which make participating in proof-of-stake much more accessible for the average user. It is desirable to increase the number of operating VSPs in order to promote decentralization, improve the stability of the Decred network, and give stakeholders more choice.

This is a high level guide of how to set up a VSP, and the steps required to list a VSP on [decred.org](https://decred.org/vsp) and in Decrediton wallet. The guide is deliberately written at a high level and with minimal details because a level of system admin experience is assumed for VSP operators.

---

## Operator Requirements

* Familiarity with system administration work on Linux, e.g. configuring and running nginx, MySQL, ssh, IPSec, duplicity, monit
* Familiarity with compiling from source, setting up and maintaining `dcrd` and `dcrwallet`
* Ability to effectively communicate in English
* Availability to update VSP binaries when new releases are produced
* Operators should be pairs of individuals or larger groups, e.g. corporate entities, so that the unavailability of a single person does not lead to extended outages in their absence.

---

## VSP Requirements

There are several requirements for the VSP configuration:

* At least one machine to host the web front end, handling web connections from VSP users and allowing them to configure their account.
* At least three machines to host voting wallets. Necessary because at least one voting wallet needs to be connected to the network and ready to vote at any time.
* Each voting wallet should be connected to a dedicated instance of `dcrd`.
* The physical or virtual machines used to host the configuration must be spread across 3 or more physical locations.
* More specifically, voting wallets must be in 3+ physically separate locations.
* The web frontend must have an IP that is distinct from those of the voting wallets, and is ideally located in another physical location.
* Source code for the VSP is available [on Github](https://github.com/decred/dcrstakepool) and binaries must be compiled from source.
* The VSP must be run on testnet for 1 week to confirm it is working properly. Uptime and number of votes made versus missed will be checked.
* Company 0 will verify the VSP configuration is proper before moving to mainnet.  Unprivileged shell accounts will be made available so the configuration can be verified after running for 1 week on testnet.
* The VSP must be run on mainnet in test mode (no public access) until a VSP operator demonstrates they have successfully voted 1 ticket of their own using the VSP.
* The operator must demonstrate their monitoring solution by temporarily sending alerts to a specified email address.  An example monit configuration will be supplied to avoid requiring operators to setup their own monitoring solution from scratch. After this has been verified, the VSP will be opened to the public.

---

## Further Information

More detailed instructions on how to setup a VSP can be found on Github in the [dcrstakepool repo](https://github.com/decred/dcrstakepool). For further support you can contact the [Decred community](https://decred.org/community).
