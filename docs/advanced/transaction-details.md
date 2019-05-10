# <img class="dcr-icon" src="/img/dcr-icons/Transactions.svg" /> Transaction Details 

---

Decred transactions are transfers of DCR that exist within blocks. Transactions are comprised primarily of inputs and outputs, though they have a few other fields of data as well. 


## Transaction Format 

Field        | Description                                                                                    | Size
---          | ---                                                                                            | ---
Version      | Transaction version. This number is used to signify how the transaction should be interpreted. The upper 16 bits specify the serialization format and the lower 16 bits specify the version number.   | 4 bytes
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

## Example Transaction

Below we examine an [example transaction](https://explorer.dcrdata.org/tx/a58389bd42520a9b9ecbae5432e27b91fde74d2f8e74ac6f8c22cda57b8ae348) from the Decred mainnet.

### Raw Transaction (Hex)

Here is the raw hex data for the example transaction.

`01000000024ff28b534361e383b5b149df4572feb1fbc659cb07067c3cb6c684452ae79f540100000000ffffffffc619e6ade3f469b8bb60b8ae9b0599eeeca05cd2db251cadea443344eafdac570100000000ffffffff0291c2e26d0200000000001976a914f2ccddc70f8b8bcea24a362bf404841d53cbebc088acd676dd680100000000001976a9141a1f5c7e9f7696989dced5cb9b61464f95790b7288ac000000000000000002ca68865402000000a29c0400040000006a4730440220139466bd10b1f071f9b4ac16ed434d63d090613fd06470f7bca9bba2b6ea6a0a02203cad1297ab9384466b3f304cd61e7e4ffa9abc1ae9fe1630207fae6f200da1680121024d540859b805c5780f2f0da350df8757c1defb72e3381b252d20874478a5549c49743a82010000009e9c0400010000006b483045022100da5b0fde58c4c57a88d96f83b02eddcb67b1b68ce95cc562c895f2e4e57bb44302201a8744aed654d2979bdd797187f6bf63ad1898c5d5c585309eeca558742858b201210307e3d98b004b15561c0f5aa158c90f93de33756d3bfd1f8a1058a4d90ffc7ec7`


### Transaction Breakdown

Below is a breakdown of the above raw hex transaction data into fields. This transaction uses the full serialization format, so we can see witness data along with inputs and outputs. Note that hex values are in little-endian format.

Field        | Value        | Description
---          | ---          | ---
Version      | `01`  | Version: 1
Serialization format  | `00`  | Serialization: Full serialization
Number inputs |  `000002`     | Inputs: 2                                              
1st input | `4ff2,8b53,4361,e383,b5b1,49df,4572,feb1,fbc6,59cb,0706,7c3c,b6c6,8445,2ae7,9f54`                 | Transaction hash
      | `0100,0000`                                              | Output index: 1
    | `00`       | Tree: 0
       | `ffff,ffff`                     | Sequence number: 4294967295
2nd input | `c619,e6ad,e3f4,69b8,bb60,b8ae,9b05,99ee,eca0,5cd2,db25,1cad,ea44,3344,eafd,ac57`                 | Transaction hash
      | `0100,0000`                                              | Output index: 1
    | `00`       | Tree: 0
       | `ffff,ffff`                     | Sequence number: 4294967295
1st output | `91c2,e26d,0200,0000`                 | Output amount: 104.33
      | `0000`                                              | Version: 0
    | `19`       | Public key script (length): 25
       | `76a914f2ccddc70f8b8bcea24a362bf404841d53cbebc088ac`                     | Public key script
2nd output | `d676,dd68,0100,0000`                 | Output amount: 60.54
      | `0000`                                              | Version: 0
    | `19`       | Public key script (length): 25
       | `76a9141a1f5c7e9f7696989dced5cb9b61464f95790b7288ac`                     | Public key script
Lock time      | `00000000`  | Lock time: 0 
Expiry     | `00000000`  | Expiry: 0
Number witnesses     | `02`  | Witnesses: 2
1st witness    | `ca68,8654,0200,0000`  | Input amount: 100.08
    | `a29c,0400`  | Block height: 302242
        | `0400,0000`  | Block index: 4
        | `6a`  | Signature script (length): 106
        | `4730440220139466bd10b1f071f9b4ac16ed434d63d090613fd06470f7bca9bba2b6ea6a0a02203cad1297ab9384466b3f304cd61e7e4ffa9abc1ae9fe1630207fae6f200da1680121024d540859b805c5780f2f0da350df8757c1defb72e3381b252d20874478a5549c`  | Signature script 
2nd witness    | `4974,3a82,0100,0000`  | Input amount: 64.79
    | `9e9c,0400`  | Block height: 302238
        | `0100,0000`  | Block index: 1
        | `6b`  | Signature script (length): 107
        | `483045022100da5b0fde58c4c57a88d96f83b02eddcb67b1b68ce95cc562c895f2e4e57bb44302201a8744aed654d2979bdd797187f6bf63ad1898c5d5c585309eeca558742858b201210307e3d98b004b15561c0f5aa158c90f93de33756d3bfd1f8a1058a4d90ffc7ec7`  | Signature script 












