# <img class="dcr-icon" src="/img/dcr-icons/Politeia.svg" /> Navigating Politeia Data

---

Data from the [proposals.decred.org](https://proposals.decred.org/) site is stored in the [decred-proposals/mainnet](https://github.com/decred-proposals/mainnet) repo. This page provides a guide on how to navigate this repo and interpret the contents of its files.

For the purpose of this guide we'll be using this [previous proposal](https://proposals.decred.org/proposals/c68bb790ba0843980bb9695de4628995e75e0d1f36c992951db49eca7b3b4bcd) as an example. To see data associated with this proposal, click the on the `See on GitHub` link on the proposal's page. You can also look up a proposal directly in the [decred-proposals/mainnet](https://github.com/decred-proposals/mainnet) repo using the proposal's unique hash number. For our example proposal, the hash is:
`c68bb790ba0843980bb9695de4628995e75e0d1f36c992951db49eca7b3b4bcd`


Below is a screenshot of the root directory of the [decred-proposals/mainnet](https://github.com/decred-proposals/mainnet) repo.  

![The root of the mainnet repository. * = proposal folders, A = anchoring data](/img/politeia/mainnet-pi-repo.png)

Folders marked with `*` contain proposal data. Folders and files marked with `A` contain anchoring data. Anchoring data relates to the anchoring of Politeia data to the Decred blockchain through dcrtime, which facilitates Politeia's transparent censorship functionality. This guide will not describe those files in detail, as they are not likely to be of interest for analysis. 

Within each proposal folder there are sequentially numbered sub-folders, one for each version of the proposal. The first folder ('/1') corresponds to the initial version of the proposal submitted to Politeia. If a proposal author updates their proposal (typically in response to community feedback), and resubmits it, that proposal and associated data is put into folder ('/2'), and so on. 

Below shows the contents of our example proposal's folder. As we can see, there are two versions of the proposal. 

![Versions of the example proposal](/img/politeia/example-proposal.png)

If we click on the latest version ('/2'), we can see all the relevant data for this version. 

![Folder for version 2 of the example proposal](/img/politeia/prop-version2.png)

Below is a table with descriptions of the files and folders found in each proposal version folder. 

| Folder/File         | Description                   |  
| -------------------- | ---------------------- |
| **/payload**           | Folder containing an `index.md file`, which has the full text of the proposal and any images associated with the proposal.    |  
| **/plugins/decred**         |  Folder containing the `comments.journal` file (which contains comments and up/down vote data) and, for proposals that have opened for voting, a `ballot.journal` file, which contains ticket voting data.   |  
| **00.metadata.txt**          | Data about the proposal submission:   <ul style="font-size: 13px"><li>timestamp</li><li>pubkey of submitter</li><li>title</li> <li>signature</li></ul> |  
| **02.metadata.txt**           | Data about admin approval for display: <ul style="font-size: 13px"><li>timestamp</li><li>pubkey of admin</li></ul>     |  
| **13.metadata.txt:**           | Data about proposal owner authorizing the start of voting. Where proposal owner has authorized and then rescinded authorization this will appear in multiple commits:  <ul style="font-size: 13px"><li>timestamp</li><li>owner pubkey </li><li>transaction hash</li></ul>   |  
| **14.metadata.txt**          | Data about admin authorizing the start of voting. Includes specification of the vote: duration (2016 blocks):   <ul style="font-size: 13px"><li>quorum requirement (20%)</li><li>approval threshold (60%)</li><li>id and descriptions for voting options</li></ul> |  
| **15.metadata.txt**          | Data about voting period:  <ul style="font-size: 13px"><li>starting block height and hash</li><li>ending block height </li><li>a list of every ticket eligible to vote on the proposal</li></ul>    |  
| **recordmetadata.json**          | Metadata about the record.   |  


## Voting and comments data

Data on votes cast by ticket holders on a given proposal is stored in the `ballot.journal` file in the `/plugins/decred` folder. Comment data (comment content and up/down votes on comments) is stored in the `comments.journal` file in the same folder. These files are updated on the server in real-time as votes are cast and comments are made. Every hour, a git commit is made updating the `comments.journal` and (if voting has started) `ballot.journal` file ---versions of the proposal submitted prior to the version that is voted on will only have a `comments.journal` file. Commits are made every hour because making a git commit is expensive performance-wise, and making a commit for every vote and comment would not be practical. Additionally, grouping votes in hourly commits helps protect the privacy of ticketholders.

### ballot.journal

The `ballot.journal` file contains a list of votes on the proposal. The commit history for this file can be consulted to see which hour votes were cast in. The table below describes the parameters recorded for each vote. 

| Parameter           | Description                   |  
| -------------------- | ---------------------- | 
| **token**              | The proposal being voted on    |  
| **ticket**              | The ticket which is voting   |  
| **votebit**             | Whether the vote was Yes (2) or No (1)   |  
| **signature**              |    |  
| **receipt**             |   |  

### comments.journal

The `comments.journal` file contains data related to comments. The table below describes the parameters recorded for each comment.


| Parameter           | Description                   |  
| -------------------- | ---------------------- | 
| **action**             | The action taken by the commenter. If a comment is added, `action` = add. If a comment is voted on, `action` = addlike. If `action` = addlike, the comment action is additionally assigned '1' for upvote or '-1' for downvote.    |  
| **token**             | The proposal being commented on.  |  
| **parentid**             | The id of the parent comment, if a parent exists. If no parent comment exists (i.e. top-level comment), `parentid` = 0.  |  
| **commentid**              |  The identifier (id) for the comment  |  
| **timestamp**              |  A unix timestamp specifying time comment was submitted |  
| **publickey**             |  The public key of the Politeia user who made the comment |  
| **censored**             |  The censorship status. If the comment has been censored, `censored` = true, and the comment will not be shown on proposals.decred.org.  |  
| **receipt**             |   |  
| **totalvotes**            |   |  
| **resultvotes**             |   |  


### Identifying users

In these datasets, **Politeia users are identified by their public keys**. The method of associating a public key with a username is a little convoluted at present, in that one must start with the username. There is currently no way to look up a username from a pubkey, but that feature is planned. 

To look up the pubkeys associated with a user, click their username on proposals.decred.org to go to a page with a url like this: <https://proposals.decred.org/user/350a4b6c-5cdd-4d87-822a-4900dc3a930c>

The final part of this url is a UUID (universally unique ID) for the account.

There is a public API which can be used to look up all of the pubkeys associated with a Politeia user account, which takes the UUID as an input. All of the public data about this user can be found at: <https://proposals.decred.org/api/v1/user/350a4b6c-5cdd-4d87-822a-4900dc3a930c>
