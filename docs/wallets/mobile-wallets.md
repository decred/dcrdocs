# ![](../img/dcr-icons/Wallet.svg){ .dcr-icon } Mobile Wallets

---

### Mobile Wallets
Decred is supported on multiple mobile wallet platforms for both Android and iOS:

[Cake Wallet](https://cakewallet.com/): Privacy-focused, open-source multi-chain wallet

[Exodus](https://www.exodus.com/): Multi-chain wallet with intuitive design

[Trust Wallet](https://trustwallet.com/): Popular multi-chain wallet

### Architecture and Privacy Considerations
Mobile wallets do not download and validate the entire Decred blockchain like desktop wallets. Instead, they use lightweight methods to minimize system resource usage and data consumption:

Cake Wallet uses SPV (Simplified Payment Verification) mode for Decred, which connects directly to the blockchain network and validates block headers. This provides better privacy and decentralization compared to server-based architectures, making Cake Wallet the preferred option for mobile users. Cake Wallet is also maintained by Decred developers via Politeia proposal.

Exodus and Trust Wallet use RPC (Remote Procedure Call) connections to remote servers/nodes to retrieve blockchain data. While convenient, this approach relies on third-party infrastructure and may have different privacy characteristics.

### Proof-of-Stake and Privacy Participation

Mobile wallets do not support Proof-of-Stake participation (ticket buying and voting) or privacy mixing. If you want to mix, participate in Decred's PoS consensus system and earn staking rewards, please use a desktop wallet instead.
