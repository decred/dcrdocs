# <img class="dcr-icon" src="/img/dcr-icons/PoWMine.svg" /> Block Production Times 

---

Decred’s difficulty adjusts such that new blocks are found every five minutes on average. The Proof-of-Work (PoW) difficulty is calculated from the exponentially weighted average of differences in previous block times, similar to PeerCoin[^1]. However, in Decred, this calculation is also interpolated into Bitcoin-like difficulty window periods. 

The time between blocks can be modeled as a Poisson process ($\Lambda=1$, $k=0$) . Because this is a special case of a [once in an interval](https://en.wikipedia.org/wiki/Poisson_distribution#Once_in_an_interval_events:_The_special_case_of_%CE%BB_=_1_and_k_=_0) event, the probability of a block being produced in a given time after the last block was produced can be modeled with a [Cumulative Distribution Function (CDF)](https://en.wikipedia.org/wiki/Cumulative_distribution_function) for an [exponential distribution](https://en.wikipedia.org/wiki/Exponential_distribution). 

The table below shows the percentage of blocks we expect to find for different time intervals as well as the actual percentages found from analyzing the mainnet blockchain for 231681 blocks. For example, ~18.13% of the blocks should be found within 1 minute, ~63.21% should be found within 5 minutes, and ~86.47% should be found within 10 minutes, etc.

| Elapsed | Expected | Actual |
|---------|----------|--------|
| 10 sec  | 3.28%    | 2.30%  |
| 30 sec  | 9.52%    | 8.46%  |
| 1 min   | 18.13%   | 17.81% |
| 2 min   | 32.97%   | 33.42% |
| 3 min   | 45.12%   | 45.54% |
| 4 min   | 55.07%   | 55.58% |
| 5 min   | 63.21%   | 63.74% |
| 6 min   | 69.88%   | 70.38% |
| 7 min   | 75.34%   | 75.74% |
| 10 min  | 86.47%   | 86.72% |
| 20 min  | 98.17%   | 98.09% |
| 30 min  | 99.75%   | 99.70% |

The figure below shows shows the actual values plotted against the CDF used to derive expected percentages.

![block times chart](/img/block_times_chart.png)

As we can see, it turns out that the actual distribution is quite close to the expected perfect distribution, which shows the network is operating in a healthy fashion. Note that the 0 to 10 and 0 to 30 second intervals slightly underperform the ideal values, which is expected because miners must wait for the votes to arrive before they can start building a new block, and this fact slightly skews the number of blocks found within the time spans downwards.


## :fa-book: References

[^1]: King S. and Nadal S. 2012. [PPCoin: Peer-to-Peer Crypto-Currency with Proof-of-Stake](https://decred.org/research/king2012.pdf).

