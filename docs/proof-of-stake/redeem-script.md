# <img class="dcr-icon" src="/img/dcr-icons/QuestionTicket.svg" /> Redeem Script

---

When users sign up with a [Voting Service Provider](../glossary.md#voting-service-provider) (VSP), both the user and the VSP jointly create a 1-of-2 multisignature script. This script is known as the redeem script.

When a VSP user buys a new ticket, the voting rights are given to a hash of the redeem script. The redeem script involves both a public key from the user and a public key from the VSP, so either are able to vote or revoke the purchased tickets.

---

## Why users must backup their scripts

At first, when a user has just signed up to a VSP, the redeem script is not known by anyone except the user and the VSP. When a ticket votes or is revoked, that redeem script is revealed on-chain as a part of the process.

The VSP handles voting and revoking for the user, but if it goes offline, it is up to the user to vote the remaining active tickets or revoke those that have expired. In order to do this, the users wallet also needs to know the redeem script.

When registering with a VSP, the user wallet will automatically store a copy of the redeem script, but currently, users can't reconstruct these scripts from their own seed. This is why they must [backup their redeem scripts](../wallets/decrediton/using-decrediton.md#backup-redeem-script) to ensure they don't end up with locked funds due to the VSP going offline.

---

## What happens if the script is lost?

A user who purchased a ticket through a VSP that is no longer available and lost their redeem script won't be able to vote or revoke their tickets.

Users risk having their funds locked if the following conditions are met:

- The user has not backed up their redeem script as the documentation and software instructs
- The user lost all access to their existing wallet
- The user has not backed up their wallet (or underlying wallet.db) that knows the script
- The VSP went offline before ever voting or revoking a ticket with that redeem script
- The user's wallet has been offline during that entire period to have not voted or revoked a ticket with that redeem script
- The VSP operator is unresponsive to requests for the copy of the redeem script

---

## Recovery methods

Only redeem scripts that have been used at least once to vote or revoke a ticket can be recovered. If this is your case, you can find it using Decred's block explorer, [dcrdata](https://dcrdata.org).

1. Look for one of your vote or revoke transactions. This can be done creating a new wallet using your seed phrase, and checking your past tickets.

1. Search for the transaction using dcrdata. Once found, look under the 'Transaction Details' tab for the decoded JSON. Inside this JSON file, find the `scriptSig` in the `vin` key.

1.  Under `scriptSig`, you should see a field for the `asm`, a deserialized form of the script. The `asm` value should be a long string separated by a white space. Grab the second part of the `scriptSig` `asm`, this is your redeem script.

1. Import the script into your wallet to vote or revoke your tickets as usual.

