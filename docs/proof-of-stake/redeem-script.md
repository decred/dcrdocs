# <img class="dcr-icon" src="/img/dcr-icons/QuestionTicket.svg" /> Redeem Script

---

When users sign up with a VSP, both the user and the VSP jointly create a 1-of-2 multisignatura script. This script is known as the redeem script.

The redeem script involves both a public key from the user and a public key from the VSP so that both can vote and revoke the ticket. When the user buys a new ticket, the voting rights are given to a hash of that redeem script.

---

## Why users must backup their scripts

At first, when the user just signs up, the redeem script is not known by anyone except the user and the VSP. When the ticket votes or is revoked, that redeem script is revealed as a part of the process.

The VSP handles voting and revoking for the user, but if it goes offline is up to the user to vote or revoke, which means the wallet needs to know the redeem script.

Currently, users can't reconstruct these scripts from their own seed, this is why users must backup their redeem scripts to ensure they don't end up with locked funds due to the VSP going offline.

---

## What happens if the script is lost?

User who purchased a ticket through a VSP that is no longer available and lost their redeem scripts won't be able to vote or revoke their tickets. This means their funds will remain locked.

This is why users must back up their redeem script as soon as they sign up with a VSP and store it in a safe place.

---

## Recovery methods

Only redeem scripts that have been used at least once to vote or revoke a ticket can be recovered. If this is your case, you can find it using Decred’s block explorer, [dcrdata](https://explorer.dcrdata.org).

1. Look for one of your vote o revoke transactions. This can be done creating a new wallet using your seed phrase, and checking your past tickets.

2. Open the transaction using [dcrdata](https://dcrdata.org) and look into the decoded JSON to find the `scripSig`. It can be found inside the `vin` key.

3.  The `asm` value should be a long string separated by a white space. Grab the second part of the `scriptSig` `asm`, this is your redeem script.

4. Import the script into your wallet to vote or revoke your tickets as usual.

