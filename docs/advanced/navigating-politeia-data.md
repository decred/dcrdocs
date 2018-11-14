# <img class="dcr-icon" src="/img/dcr-icons/Politeia.svg" /> Navigating Politeia Data

---

Data from the [proposals.decred.org](https://proposals.decred.org/) site is stored in [this repository](https://github.com/decred-proposals/mainnet). This page gives an overview of how to navigate that repository and how to interpret the contents of its files.

For the purpose of this guide I will be using [this proposal](https://github.com/decred-proposals/mainnet/tree/master/c68bb790ba0843980bb9695de4628995e75e0d1f36c992951db49eca7b3b4bcd/) as an example. Links from [proposals.decred.org](https://proposals.decred.org/) will take you one layer deeper to the [most recent version of the proposal](https://github.com/decred-proposals/mainnet/tree/master/c68bb790ba0843980bb9695de4628995e75e0d1f36c992951db49eca7b3b4bcd/2). 

![The root of the mainnet repository. * = proposal folders, A = anchoring data](/img/politeia/mainnet-pi-repo.png)

The root of the mainnet repository. * = proposal folders, A = anchoring data.

The folder and file marked A relate to the anchoring of Politeia data to the Decred blockchain through dcrtime. This guide will not describe those files in detail as they are not likely to be of interest for analysis. They are functional and facilitate Politeia's transparent censorship.

Within each proposal folder there are sequentially numbered sub-folders for each version of the proposal.

![Versions of the example proposal](/img/politeia/example-proposal.png)

All relevant data for the proposal can be found within the version number folder.

![Folder for version 2 of the example proposal](/img/politeia/prop-version2.png)

**payload** folder contains an index.md file, which has the full text of the proposal and any images associated with the proposal

**plugins/decred** folder contains comments.journal (comments and up/down vote data) and, for proposals that have opened for voting, a ballot.journal file which contains ticket voting data

**00.metadata.txt**: data about proposal submission. 

* timestamp
* pubkey of submitter 
* title 
* signature

**02.metadata.txt**: data about admin approval for display. 

* timestamp 
* pubkey of admin

**13.metadata.txt:** data about proposal owner authorizing the start of voting. Where proposal owner has authorized and then rescinded authorization this will appear in multiple commits.

* timestamp
* owner pubkey 
* transaction hash 

**14.metadata.txt**: data about admin authorizing the start of voting. Includes specification of the vote:
duration (2016 blocks)

* quorum requirement (20%)
* approval threshold (60%)
* id and descriptions for voting options

**15.metadata.txt**: data about voting period. 

* starting block height and hash
* ending block height 
* a list of every ticket eligible to vote on the proposal

**recordmetadata.json**: 

The plugins/decred files warrant further explanation.

The ballot and comment journal files are updated on the server in real time as votes are cast and comments are made. Every hour, a git commit is made for the latest journal file changes. Making a git commit is expensive performance wise so making a new commit every time a comment was made or a vote was cast would not be practical.

**ballot.journal**

This file contains a list of votes on the proposal. The commit history can be consulted to see which hour votes were cast in.

- **token** is the proposal being voted on
- **ticket** is the ticket which is voting
- **votebit** shows whether the vote was Yes (2) or No (1)
- **signature**
- **receipt**

**comments.journal**

This file contains two types of row

**action:add** rows describe the addition of comments.

* **token** is the proposal being commented on
* **parentid** is either 0 for top-level comments, or the comment_id of the comment which is being responded to
* **commentid** is an identifier for each comment
* **comment** is the body (text) of the comment
* **timestamp** is a unix timestamp for when the comment was made
* **publickey** is the public key of the Politeia user who made the comment
* **censored** records whether the comment has been censored, where censored == true the comment will not be shown on proposals.decred.org
* **signature** 
* **receipt**
* **totalvotes**
* **resultvotes**

**action:addLike** rows describe the addition of up/down votes on comments, many of the fields have the same meaning as for action:add rows. 

* **action** can be either 1 (upvote) or -1 (downvote)

In these data-sets, **Politeia users are identified by their public keys**. The method of associating a public key with a username is a little convoluted at present, in that one must start with the username. There is currently no way to look up a username from a pubkey, but that feature will be added.

To look up the pubkeys associated with a user, click their username on proposals.decred.org to go to a page with a url like this: <https://proposals.decred.org/user/350a4b6c-5cdd-4d87-822a-4900dc3a930c>

The final part of this url is a UUID (universally unique ID) for the account.

There is a public API which can be used to look up all of the pubkeys associated with a Politeia user account, it takes the UUID as an input. All of the public data about this user can be found at: <https://proposals.decred.org/api/v1/user/350a4b6c-5cdd-4d87-822a-4900dc3a930c>
