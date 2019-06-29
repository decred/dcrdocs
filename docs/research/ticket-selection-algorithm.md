# <img class="dcr-icon" src="/img/dcr-icons/QuestionTicket.svg" /> Ticket Selection Algorithm

Every block, 5 tickets are pseudorandomly selected from the ticket pool to [vote](../../proof-of-stake/overview/). Below is a high-level description of the ticket selection algorithm. A more detailed, low-level walkthrough of the ticket selection code can be found in this [video](https://www.youtube.com/watch?v=eysGWVhDFWY).

## Pseudorandom number generation

Tickets are selected from the ticket pool using a deterministic [Pseudorandom Number Generator (PRNG)](https://en.wikipedia.org/wiki/Pseudorandom_number_generator) algorithm. It is deterministic because the seed input to the PRNG algorithm is derived from the hash of the previous block (the block being voted on). Specifically, the seed is a serialization of the [header](../advanced/block-header-specifications.md) of the previous block suffixed with a constant derived from the hex representation of Pi, which acts as a publicly verifyable Nothing-Up-My-Sleeve ([NUMS](https://en.wikipedia.org/wiki/Nothing-up-my-sleeve_number)) constant. All eligible tickets in the ticket pool (also referred to as live tickets) are hashed using the [BLAKE-256](blake-256-hash-function.md) hash function and sorted [lexicographically](https://en.wikipedia.org/wiki/Lexicographical_order) by their hash to generate a [total order](https://en.wikipedia.org/wiki/Total_order), with the total number of eligible tickets as an upper bound. Finally, uniformly random values are produced and used as indicices into the total order.

