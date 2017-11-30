# Varias mejoras

---

Como en Bitcoin, el subsidio disminuye exponencialmente con la altura del bloque. Sin embargo, el algoritmo de Decred, aunque también extremadamente simple, interpola mejor esta decaimiento con el tiempo para no producir un shock de mercado con fuertes gotas de subsidio similares a CryptoNote [1]. Al igual que PeerCoin [^2], la dificultad PoW se calcula a partir del promedio exponencialmente ponderado de las diferencias en tiempos de bloques anteriores. Sin embargo, este cálculo también se interpola en períodos de ventana de dificultad similares a Bitcoin. El error "timewarp" en Bitcoin se corrige [^ 3], asegurando que cada diferencia en el tiempo de bloque incorporado en el cálculo de dificultad.

Cabe señalar también que muchos ataques de minerias muy conocidos, como la minería egoísta [^4] y la minería obstinada [5], ya no funcionarán ventajosamente en un sistema en el que exista una efectiva descentralización de la minería de estacas y ningún minero PoW-PoS colusión. Esto es simplemente porque es imposible generar extensiones secretas a blockchain sin la ayuda de mineros de estaca. La resistencia a los ataques mineros previamente descritos y los ataques mineros recién concebidos específicos de nuestro sistema serán un área fructífera para futuras investigaciones.

---

## <i class="fa fa-book"></i> Referencias 

[^1]: Buterin V. 2014. [A next-generation smart contract and decentralized application platform](https://decred.org/research/buterin2014.pdf).
[^2]: King S. and Nadal S. 2012. [PPCoin: Peer-to-peer crypto-currency with proof-of-stake](https://decred.org/research/king2012.pdf).
[^3]: ArtForz. 2011. [Re: Possible way to make a very profitable 50 plus-ish attack for pools?](https://decred.org/research/artforz2011.pdf)
[^4]: Eyal I. 2015. [The miner's dilemma](https://decred.org/research/eyal2015.pdf).
[^5]: Nayak K., Kumar S., Miller A., Shi E. 2015. [Stubborn mining: Generalizing selfish mining and combining with an eclipse attack](https://decred.org/research/nayak2015.pdf).
