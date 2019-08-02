# <img class="dcr-icon" src="/img/dcr-icons/Transactions.svg" /> Transaction Details 

---

Decred transactions are transfers of DCR that exist within blocks. Transactions are comprised primarily of inputs and outputs, though they have a few other fields of data as well. In this page, we will examine the types of transactions Decred supports, the basic format common to all transactions, and examine an example transaction in detail. 


## Transaction Types

To enable Decred's consensus rules, transactions are split into two separate trees within a block: the regular transaction tree and the stake transaction tree. The stake transaction tree contains transactions related to ticket buying and ticket voting rewards. The regular transaction tree contains all other transactions. 

In addition to regular transactions (sending DCR from one address to another), there are a few special transaction types to be aware of:

* **Coinbase transaction:** Every block which is mined contains a single coinbase transaction. A coinbase transaction will typically have three outputs: one output that contains the encoded block height (used to ensure that coinbase hash collisions are impossible), one output that creates the coins added to the project treasury (10% of the block reward), and one output that creates the coins paid to the PoW miner for creating the block (60% of the block reward). Coinbase transactions are part of the regular transaction tree, which means that they will be rejected if Proof-of-Stake (PoS) voters vote to disapprove the block which contains them. Decred created in coinbase transactions cannot be spent until the coinbase maturity period has passed.
* **Stakebase transaction:** Every block starting at the stake validation height which is mined will contain a stakebase transaction for each ticket which voted on that block. The stakebase transaction will identify the ticket that voted, as well as produce the Decred which was spent to purchase the ticket, and the newly created Decred constituting the voting reward. Stakebase transactions belong to the stake transaction tree, which means that these transactions cannot be rejected by PoS voters, even if they vote to disapprove the block which contains them.
* **Multisignature:** Multisignature refers to transactions which can be authorized by more than one private key. Multisignature transactions can support multiple keys (N) and a subset of those (M) are required to transact (commonly known as “MofN”). For example, a 2 of 3 multisignature transaction would have three valid keys, however only two of them would be required to authorize. Multisignature transactions are in the regular transaction tree.


## Transaction Format 

At the protocol level, all transactions share the same basic transaction format; the transaction type is determined by the signature type present in the transaction. The section below describes this basic transaction format. 

Lower-level documentation for each possible variant of signature can be found in the relevant source files in the [dcrd](https://github.com/decred/dcrd) repo.

Below are the top-level fields of any transaction.

Field        | Description                                                                                    | Size
---          | ---                                                                                            | ---
Version      | Transaction version. This number is used to signify how the transaction should be interpreted. The upper 16 bits specify the serialization format and the lower 16 bits specify the version number.   | 4 bytes
Input count  | The number of inputs in the transaction encoded as a variable-length integer                   | 1-9 bytes
Inputs       | Serialized list of all the transaction's inputs                                                | Variable
Output count | The number of outputs in the transaction encoded as a variable-length integer                  | 1-9 bytes
Outputs      | Serialized list of all the transaction's outputs                                               | Variable
Lock time    | The time when a transaction can be spent. (usually zero, in which case it has no effect)       | 4 bytes
Expiry       | The block height at which the transaction expires and is no longer valid                       | 4 bytes

### Bitcoin similarities

Decred originally began as fork of the Bitcoin client [btcd](https://github.com/btcsuite/btcd), and its transaction format has similarities to Bitcoin's. However, to address some issues Bitcoin transactions had at the time, Decred implemented separate fields that allowed for script versioning and transaction immalleability. Bitcoin later added support for these features in the SegWit [soft fork](https://en.wikipedia.org/wiki/SegWit). However, to avoid a hard fork and preserve backwards compatibility, Bitcoin implemented these changes inside the signature scripts, not as separate fields. In this respect, Decred and Bitcoin transactions are conceptually similar, but differ somewhat in their implementation.


### Inputs
In Decred, there are two types of transaction inputs: witness and non-witness. A non-witness transaction input is a reference to an unspent output (inputs spend previously-made outputs), and a sequence number. A witness transaction input contains the data necessary to prove that an output can be spent. 


#### Non-Witness Inputs
A non-witness transaction input is a reference to an unspent output and a sequence number. A reference to an unspent output is called an "outpoint." Outpoints have three fields:

Field            | Description                                                                                                                           | Size
---              | ---                                                                                                                                   | ---
Transaction hash | The hash of the transaction which contains the output being spent                                                                     | 32 bytes
Output index     | The index of the output being spent                                                                                                   | 4 bytes
Tree             | Which tree the output being spent is in. This is required because there is more than one tree used to locate transactions in a block. | 1 byte

In addition to an outpoint, non-witness inputs contain a sequence number. This number has more historical significance than relevant usage; however, its most relevant purpose is to enable "locking" of payments so that they cannot be redeemed until a certain time.


#### Witness Inputs
A witness transaction input contains the data necessary to prove that an output can be spent. Witness inputs contain four fields of data:

Field            | Description
---              | ---
Value            | The amount of coins that the output being spent transfers.
Block height     | The height of the block containing the transaction in which the output being spent is located.
Block index      | The index of the transaction in which the output being spent is located.
Signature script length | The length of the signature script as a variable-length integer 
Signature script | The script that satisfies the requirements of the script in the output being spent.


### Outputs
Outputs are transfers of DCR that can be spent by inputs. Outputs always have three fields of data:

Field             | Description                                                                                     | Size
---               | ---                                                                                             | ---
Value             | The amount of DCR being sent by the output.                                                     | 8 bytes
Version           | The version of the output. This number is used to signify how the output should be interpreted. | 2 bytes
Public key script | The script that must be satisfied to spend the output                                           | Variable

---

## Serialization 
The format displayed above is not the format that transactions are sent and received in. When sending or receiving transactions, they can be serialized in a few ways. The way that a transaction should be deserialized can be determined from its version. Transaction versions occupy four bytes, but those four bytes are actually used to store two separate values. The first two bytes of a transaction's version denote its actual version number. The second two bytes denote its serialization format.


### Serialization Formats
When serializing, there are two main parts of a transaction: Its "prefix" and its witness data.
The transaction prefix is comprised of:

* Inputs (without any witness data)
* Outputs
* Lock time
* Expiry

The witness data of a transaction involves only its inputs. The included data fields of its inputs depend on the specific serialization format. This format can be any one of the following:

* **0 (Full serialization)** - The transaction's prefix is located immediately before its witness data.
* **1 (No witness)** - The transaction's prefix is the only data present.
* **2 (Only witness)** - The transaction's witness data is the only data present. For each input, this includes its value, block height, block index, and signature script.

## Example Transaction

Below we examine an example [transaction](https://dcrdata.decred.org/tx/a58389bd42520a9b9ecbae5432e27b91fde74d2f8e74ac6f8c22cda57b8ae348) from the Decred mainnet.

### Raw Transaction (Hex)

Here is the raw hex data for the example transaction.

```no-highlight
01000000024ff28b534361e383b5b149df4572feb1fbc659cb07067c3cb6c684452ae79f540100000000ffffffffc619e6ade3f469b8bb60b8ae9b0599eeeca05cd2db251cadea443344eafdac570100000000ffffffff0291c2e26d0200000000001976a914f2ccddc70f8b8bcea24a362bf404841d53cbebc088acd676dd680100000000001976a9141a1f5c7e9f7696989dced5cb9b61464f95790b7288ac000000000000000002ca68865402000000a29c0400040000006a4730440220139466bd10b1f071f9b4ac16ed434d63d090613fd06470f7bca9bba2b6ea6a0a02203cad1297ab9384466b3f304cd61e7e4ffa9abc1ae9fe1630207fae6f200da1680121024d540859b805c5780f2f0da350df8757c1defb72e3381b252d20874478a5549c49743a82010000009e9c0400010000006b483045022100da5b0fde58c4c57a88d96f83b02eddcb67b1b68ce95cc562c895f2e4e57bb44302201a8744aed654d2979bdd797187f6bf63ad1898c5d5c585309eeca558742858b201210307e3d98b004b15561c0f5aa158c90f93de33756d3bfd1f8a1058a4d90ffc7ec7
```


### Transaction Breakdown

Below is a breakdown of the above raw hex transaction data into fields. This transaction uses the full serialization format, so we can see witness data along with inputs and outputs. 

<table style="overflow-wrap: break-word;">
<thead>
<tr>
<th>Field</th>
<th>Value</th>
<th>Description</th>
</tr>
</thead>
<tbody>
<tr>
<td>Version</td>
<td><code>01</code></td>
<td>1</td>
</tr>
<tr>
<td>Serialization format</td>
<td><code>00</code></td>
<td>Full serialization</td>
</tr>
<tr>
<td>Number inputs</td>
<td><code>000002</code></td>
<td>2</td>
</tr>
<tr>
<td colspan="3" style="text-align: center;">1st input</td>
</tr>
<td>Transaction hash</td>
<td style="word-break: break-all;"><code>4ff28b534361e383b5b149df4572feb1fbc659cb07067c3cb6c684452ae79f54</code></td>
<td></td>
</tr>
<tr>
<td>Output index</td>
<td><code>01000000</code></td>
<td>1</td>
</tr>
<tr>
<td>Tree</td>
<td><code>00</code></td>
<td>0 <br>(regular transaction tree)</td>
</tr>
<tr>
<td>Sequence number</td>
<td><code>ffffffff</code></td>
<td>4294967295 <br>(transaction finalized)</td>
</tr>
<tr>
<td colspan="3" style="text-align: center;">2nd input</td>
</tr>
<tr>
<td>Transaction hash</td>
<td style="word-break: break-all;"><code>c619e6ade3f469b8bb60b8ae9b0599eeeca05cd2db251cadea443344eafdac57</code></td>
<td></td>
</tr>
<tr>
<td>Output index</td>
<td><code>01000000</code></td>
<td>1</td>
</tr>
<tr>
<td>Tree</td>
<td><code>00</code></td>
<td>0 <br>(regular transaction tree)</td>
</tr>
<tr>
<td>Sequence number</td>
<td><code>ffffffff</code></td>
<td>4294967295 <br>(transaction finalized)</td>
</tr>
<tr>
<td colspan="3" style="text-align: center;">1st output</td>
</tr>
<tr>
<td>Output amount</td>
<td><code>91c2e26d02000000</code></td>
<td>104.33512081</td>
</tr>
<tr>
<td>Script Version</td>
<td><code>0000</code></td>
<td>0</td>
</tr>
<tr>
<td>Public key script length</td>
<td><code>19</code></td>
<td>25</td>
</tr>
<tr>
<td>Public key script</td>
<td style="word-break: break-all;"><code>76a914f2ccddc70f8b8bcea24a362bf404841d53cbebc088ac</code></td>
<td style="word-break: break-all; word-wrap: break-word;">OP_DUP OP_HASH160 f2ccddc70f8b8bcea24a362bf404841d53cbebc0 OP_EQUALVERIFY OP_CHECKSIG <br><br>(Pay-To-Pubkey-Hash (P2PKH)<br> script)</td>
</tr>
<tr>
<td colspan="3" style="text-align: center;">2nd output</td>
</tr>
<tr>
<td>Output amount</td>
<td><code>d676dd6801000000</code></td>
<td>60.54311638</td>
</tr>
<tr>
<td>Script Version</td>
<td><code>0000</code></td>
<td>0</td>
</tr>
<tr>
<td>Public key script length</td>
<td><code>19</code></td>
<td>25</td>
</tr>
<tr>
<td>Public key script</td>
<td style="word-break: break-all;"><code>76a9141a1f5c7e9f7696989dced5cb9b61464f95790b7288ac</code></td>
<td style="word-break: break-all; word-wrap: break-word;">OP_DUP OP_HASH160 1a1f5c7e9f7696989dced5cb9b61464f95790b72 OP_EQUALVERIFY OP_CHECKSIG <br><br>(Pay-To-Pubkey-Hash (P2PKH)<br> script)</td>
</tr>
<tr>
<td>Lock time</td>
<td><code>00000000</code></td>
<td>0<br>(no lock time)</td>
</tr>
<tr>
<td>Expiry</td>
<td><code>00000000</code></td>
<td>0<br>(no expiry)</td>
</tr>
<tr>
<td>Number witnesses</td>
<td><code>02</code></td>
<td>2</td>
</tr>
<tr>
<td colspan="3" style="text-align: center;">1st witness</td>
</tr>
<tr>
<td>Input amount</td>
<td><code>ca68865402000000</code></td>
<td>100.08029386</td>
</tr>
<tr>
<td>Block height</td>
<td><code>a29c0400</code></td>
<td>302242</td>
</tr>
<tr>
<td>Block index</td>
<td><code>04000000</code></td>
<td>4</td>
</tr>
<tr>
<td>Signature script length</td>
<td><code>6a</code></td>
<td>106</td>
</tr>
<tr>
<td>Signature script</td>
<td style="word-break: break-all;"><code>4730440220139466bd10b1f071f9b4ac16ed434d63d090613fd06470f7bca9bba2b6ea6a0a02203cad1297ab9384466b3f304cd61e7e4ffa9abc1ae9fe1630207fae6f200da1680121024d540859b805c5780f2f0da350df8757c1defb72e3381b252d20874478a5549c</code></td>
<td style="word-break: break-all;">
  The signature script contains two <br>pieces of data to be pushed onto<br> the stack:<br><br>1st push<br>(DER signature)<br><code>30440220139466bd10b1f071f9b4ac16ed434d63d090613fd06470f7bca9bba2b6ea6a0a02203cad1297ab9384466b3f304cd61e7e4ffa9abc1ae9fe1630207fae6f200da16801</code><br><br>2nd push<br>(public key)<br><br><code>024d540859b805c5780f2f0da350df8757c1defb72e3381b252d20874478a5549c</code></td>
</tr>
<tr>
<td colspan="3" style="text-align: center;">2nd witness</td>
</tr>
<tr>
<td>Input amount</td>
<td><code>49743a8201000000</code></td>
<td>64.79836233</td>
</tr>
<tr>
<td>Block height: 302238</td>
<td><code>9e9c0400</code></td>
<td>302238</td>
</tr>
<tr>
<td>Block index: 1</td>
<td><code>01000000</code></td>
<td>1</td>
</tr>
<tr>
<td>Signature script length</td>
<td><code>6b</code></td>
<td>107</td>
</tr>
<tr>
<td>Signature script</td>
<td style="word-break: break-all;"><code>483045022100da5b0fde58c4c57a88d96f83b02eddcb67b1b68ce95cc562c895f2e4e57bb44302201a8744aed654d2979bdd797187f6bf63ad1898c5d5c585309eeca558742858b201210307e3d98b004b15561c0f5aa158c90f93de33756d3bfd1f8a1058a4d90ffc7ec7</code></td>
<td style="word-break: break-all;">The signature script contains two <br>pieces of data to be pushed onto<br> the stack:<br><br>1st push<br>(DER signature<br><code style="word-break: break-all">3045022100da5b0fde58c4c57a88d96f83b02eddcb67b1b68ce95cc562c895f2e4e 57bb44302201a8744aed654d2979bdd797187f6bf63ad1898c5d5c585309eeca558742858b201</code><br><br>2nd push<br>(public key)<br><br><code style="word-break: break-all;">0307e3d98b004b15561c0f5aa158c90f93de33756d3bfd1f8a1058a4d90ffc7ec7</code></td>
</tr>
</tbody>
</table>

