# <img class="dcr-icon" src="/img/dcr-icons/Politeia.svg" /> Navigating Politeia Data

---

Data from the [proposals.decred.org](https://proposals.decred.org/) site is stored in the [decred-proposals/mainnet](https://github.com/decred-proposals/mainnet) repo. This page provides a guide on how to navigate this repo and interpret the contents of its files.

For the purpose of this guide we'll be using this [previous proposal](https://proposals.decred.org/proposals/c68bb790ba0843980bb9695de4628995e75e0d1f36c992951db49eca7b3b4bcd) as an example. To see data associated with this proposal, click the on the `See on GitHub` link on the proposal's page. You can also look up a proposal directly in the [decred-proposals/mainnet](https://github.com/decred-proposals/mainnet) repo using the proposal's unique hash number. For our example proposal, the hash is:
`c68bb790ba0843980bb9695de4628995e75e0d1f36c992951db49eca7b3b4bcd`


Below is a screenshot of the root directory of the [decred-proposals/mainnet](https://github.com/decred-proposals/mainnet) repo.  

![The root of the mainnet repository. * = proposal folders, A = anchoring data](/img/politeia/mainnet-pi-repo.png)

Folders marked with `*` contain proposal data. Folders and files marked with `A` contain anchoring data. Anchoring data relates to the anchoring of Politeia data to the Decred blockchain through [dcrtime](dcrtime.md), which facilitates Politeia's transparent censorship functionality. This guide will not describe those files in detail, as they are not likely to be of interest for analysis. 

Within each proposal folder there are sequentially numbered sub-folders, one for each version of the proposal. The first folder ('/1') corresponds to the initial version of the proposal submitted to Politeia. If a proposal author updates their proposal (typically in response to community feedback), the updated version and its associated data are put into folder ('/2'), and so on.

Below shows the contents of our example proposal's folder. As we can see, there are two versions of the proposal. 

![Versions of the example proposal](/img/politeia/example-proposal.png)

If we click on the latest version ('/2'), we can see all the relevant data for this version. 

![Folder for version 2 of the example proposal](/img/politeia/prop-version2.png)

Below is a table with descriptions of the files and folders found in each proposal version folder. 

#### Proposal data

| Folder/File         | Description                   |  
| -------------------- | ---------------------- |
| **/payload**           | Folder containing an `index.md` file, which has the full text of the proposal and any images associated with the proposal.    |  
| **/plugins/decred**         |  Folder containing the `comments.journal` file, which contains comments and up/down vote data for comments. If a proposal has begun voting (or finished voting), this folder will also contain a `ballot.journal` file containing the ticket holder voting data.    
| **00.metadata.txt**          | Data about the proposal submission:   <ul style="font-size: 13px"><li>timestamp</li><li>pubkey of submitter</li><li>title</li> <li>signature</li></ul> |  
| **02.metadata.txt**           | Data about admin approval for display: <ul style="font-size: 13px"><li>timestamp</li><li>pubkey of admin</li></ul>     |  
| **13.metadata.txt:**           | Data about proposal owner authorizing the start of voting. Where proposal owner has authorized and then rescinded authorization this will appear in multiple commits:  <ul style="font-size: 13px"><li>timestamp</li><li>owner pubkey </li><li>transaction hash</li></ul>   |  
| **14.metadata.txt**          | Data about admin authorizing the start of voting. Includes specification of the vote: duration (2016 blocks):   <ul style="font-size: 13px"><li>quorum requirement (20%) (subject to change)</li><li>approval threshold (60%) (subject to change)</li><li>id and descriptions for voting options</li></ul> |  
| **15.metadata.txt**          | Data about voting period:  <ul style="font-size: 13px"><li>starting block height and hash</li><li>ending block height </li><li>a list of every ticket eligible to vote on the proposal</li></ul>    |  
| **recordmetadata.json**          | Metadata about the record.   |  


### Voting and comment data 

A git commit is made every hour for each active proposal to update the `comments.journal` file. If voting has started on a proposal, the same commit will also be used to update its `ballot.journal` file. The hourly commits are stopped once the voting has been completed and all votes have been recorded in git. Commits are made every hour because making a git commit is expensive performance-wise and making a commit for every vote and comment would not be practical. Additionally, grouping votes in hourly commits helps protect the privacy of ticketholders.


### Vote data

Data on votes cast by ticket holders on a given proposal is stored in the `ballot.journal` file in the `/plugins/decred` folder. The commit history for this file can be consulted to see which hour votes were cast in. The table below describes the parameters recorded for each vote. 

#### ballot.journal 

| Parameter           | Description                   |  
| -------------------- | ---------------------- | 
| **token**              | The proposal being voted on    |  
| **ticket**              | The ticket which is voting   |  
| **votebit**             | Whether the vote was Yes (2) or No (1)   |  
| **signature**              |  Signature of the vote, which is created using the voter's private key. This can be used to verify the proposal voted on, the ticket that voted, and the vote choice.  |  
| **receipt**             |  The Politeia server signature of the vote signature. This can be used to verify that the vote was signed (verified) by the Politeia server using the Politeia server's private key. |  


### Comment data 

Data on comments is stored in the `comments.journal` file in the `/plugins/decred` folder. The table below describes the parameters recorded for each comment.  

#### comments.journal

| Parameter           | Description                   |  
| -------------------- | ---------------------- | 
| **action**             | The action taken by the commenter. If a comment is added, `action` = add. If a comment is voted on, `action` = addlike. If `action` = addlike, the comment action is additionally assigned '1' for upvote or '-1' for downvote.    |  
| **token**             | The proposal being commented on.  |  
| **parentid**             | The id of the parent comment, or '0' if a top-level comment.  |  
| **commentid**              |  The identifier (id) for the comment  |  
| **timestamp**              |  A unix timestamp specifying time comment was submitted |  
| **publickey**             |  The public key of the Politeia user who made the comment |  
| **censored**             |  The censorship status. If the comment has been censored, `censored` = true, and the comment will not be shown on proposals.decred.org.  |  
| **signature**             | Signature of the ProposalToken+ParentCommentID+Comment, which is created using the commenter's private key. This can be used to verify the proposal (or comment on a proposal) that was commented on, the public key of the commenter, and the content of the comment.  |  
| **receipt**             |  The Politeia server signature of the comment signature. This can be used to verify that the comment was signed (verified) by the Politeia server using the Politeia server's private key. |  
| **totalvotes**            |   |  
| **resultvotes**             |   |  


### User data

In the datasets presented here, **users are identified by their public keys**. On [proposals.decred.org](https://proposals.decred.org/), users are identified by their username (chosen when they created their public/private key pair). 

Currently, to associate a public key with a username, you need to go through [proposals.decred.org](https://proposals.decred.org/). To look up the public key for a user, click on their username anywhere on the site. This will take you to the user's profile, which has a URL like this: 
<https://proposals.decred.org/user/350a4b6c-5cdd-4d87-822a-4900dc3a930c>

The final part of this URL is the Universally Unique ID (UUID) for the account. This can be input into a [public API](https://proposals.decred.org/api/v1/user/) exposed by the Politeia website, which will takes the UUID as an input and outputs user profile data, including the public key. For example, if you paste the above example UUID into a browser,
<https://proposals.decred.org/api/v1/user/350a4b6c-5cdd-4d87-822a-4900dc3a930c>, it will return all publicly-available data for that user, including their public key: `"publickey":"cd6e57b93f95dd0386d670c7ce42cb0ccd1cd5b997e87a716e9359e20251994e"`



