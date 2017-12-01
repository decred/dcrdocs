# Transaction Details 

---

Decred transactions are transfers of DCR that exist within blocks. Transactions are comprised primarily of inputs and outputs, though they have a few other fields of data as well. 


## Transaction Format 

Field        | Description                                                                                    | Size
---          | ---                                                                                            | ---
Version      | Transaction version. This number is used to signify how the transaction should be interpreted  | 4 bytes
Input count  | The number of inputs in the transaction encoded as a variable-length integer                   | 1-9 bytes
Inputs       | Serialized list of all the transaction's inputs                                                | Variable
Output count | The number of outputs in the transaction encoded as a variable-length integer                  | 1-9 bytes
Outputs      | Serialized list of all the transaction's outputs                                               | Variable
Lock time    | The time when a transaction can be spent. (usually zero, in which case it has no effect)       | 4 bytes
Expiry       | The block height at which the transaction expires and is no longer valid                       | 4 bytes


### Inputs
Inputs spend previously-made outputs. There are two types of transaction inputs: Witness and non-witness.


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
* **3 (Witness signing)** - The transaction's witness data is the only data present, and is serialized for signing purposes. For each input, this includes only its signature script.
* **4 (Witness signing with value)** - The transaction's witness data is the only data present, and is serialized for signing purposes. Unlike the Witness signing format, this format includes the value of each input before its signature script.
