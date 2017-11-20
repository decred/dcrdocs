# Decred Pull Requests and Contributions 

---

All code for Decred is kept on GitHub.  This document provides some basic info on how we handle code contributions and some basic info on how to contribute. It is based partially on a similar document from [btcsuite](https://github.com/btcsuite).

---

## Initial Preparation 

A good first step is to read the [Code Contribution Guidelines documentation](https://github.com/decred/dcrd/blob/master/docs/code_contribution_guidelines.md) to get a good understanding of the policies used by the
project.  That document is primarily focused on the Go codebase but it is still a good start.

The following examples will be split into two sections, one for the Go projects (dcrd, dcrwallet, gominer, etc), and one for projects that do not use Go (decrediton, Paymetheus, dcrdocs, etc).  In all cases, be sure to check out the README.md in each project if you need help setting the particular project up.

---

## General Model 

With this process we are trying to make contributing simple while also  maintaining a high level of code quality and clean history.  Members of the Decred team must follow the same procedures as external contributors.

Our model for hacking code in outline form is as follows.  If any of this does not make sense, don't worry, it will be explained in more detail in the next sections.

1. Find an issue you want to work on.  If there are none describing your issue, open one with what you are going to do.
1. Make code changes on a branch.
1. Push these changes to your own forked GitHub repo.
1. When your code is ready to be reviewed or when you just want input from other devs open a Pull Request (PR) on the main repo from the GitHub web page.
1. Add a comment on the PR that says what issue you are fixing.  Put the text Closes # or Fixes # followed by the number of the issue on a single line.  This will allow GitHub to automatically link the PR to the issue and close the issue when the PR is closed.
1. You can request a specific reviewer from the GitHub webpage or you can ask someone on irc/slack to review.
1. ALL code must be reviewed and receive at least one approval before it can go in.  Only team members can give official approval, but comments from other users are encouraged.
1. If there are changes requested, make those changes and commit them to your local branch.
1. Push those changes to the same branch you have been hacking on.  They will show up in the PR that way and the reviewer can then compare to the previous version.
1. Once your code is approved, it can be merged into master.  To keep history clean, we only allow non-fast-forward merges (that means we want a linear history).  Most PRs also must be squashed to a single commit (although if there is reason to have it as multiple commits that can be considered on a case by case basis).
1. If your PR is a single commit (or can be squashed by GitHub automatically) and is caught up with master, the reviewer will merge your PR.  If your branch was too far behind, you may be asked to rebase your commit.  Once that is done and pushed, the reviewer will merge your commit.

---

## Go 

For projects using Go, you can follow this procedure.  dcrd will be used as the example.  This assumes you already have go1.6 or newer installed and a working `$GOPATH`.

### One time setup
- Fork dcrd on GitHub
- Run the following commands to obtain dcrd, all dependencies, and install it:

````bash
$ mkdir -p $GOPATH/src/github.com/decred/
$ git clone https://github.com/decred/dcrd $GOPATH/src/github.com/decred/dcrd
$ cd $GOPATH/src/github.com/decred/dcrd
$ go dep ensure
$ go install . ./cmd/...
```

- Add a git remote for your fork:

```bash
$ git remote add <yourname> https://github.com/<yourname>/dcrd.git
```

## Other projects 

For projects not written in Go, the initial setup will depend on the project.  I will use dcrdocs as an example here, but the basic steps are the same for any of the projects.  Specific setup can be seen in the project README.md (for example how to install mkdocs to work on dcrdocs or electron for decrediton).

### One time setup 
- Fork dcrdocs on GitHub
- Run the following commands to obtain dcrd, all dependencies, and install it:

```bash
$ mkdir -p code/decred
$ cd code/decred
$ git clone https://github.com/decred/dcrdocs
$ cd dcrdocs
```

- Add a git remote for your fork:

```bash
$ git remote add <yourname> https://github.com/<yourname>/dcrdocs.git
```

## Creating a new feature pull request 
- Find or create an issue on the GitHub repo (the original, not your fork) for the feature you want to work on.
- Checkout a new feature branch to house the changes you will be making:

```bash
$ git checkout -b <feature_branch>
```
- Make whatever changes are necessary for the feature and commit them
- Push your feature branch to your fork:

```bash
$ git push <yourname> <feature_branch>
```
- With your browser, navigate to https://github.com/decred/dcrd
- Create a pull request with the GitHub UI.  You can request a reviewer on the GitHub web page or you can ask someone on irc/slack.

## Rebasing one of your existing pull requests 

Sometimes you will be requested to rebase and squash the pull request to the latest master branch.

- Make sure the master branch is up-to-date:

```bash
$ git checkout master
$ git pull
```
- Checkout the existing feature branch and rebase it with the interactive flag:

```bash
$ git checkout <feature_branch>
$ git rebase -i master
```
- Follow the directions presented to specify 's' meaning squash for the additional commits (the first commit must remain 'p' or 'pick').
- Write a single commit message in the editor that you have set to cover all the commits included.
- Save and close the editor and git should generate a single commit with the message you specified and all the commits you added.  You can check the commit with the command ```git show```.
- Force push the branch to your fork:

```bash
$ git push -f <yourname> <feature_branch>
```

## Other Considerations 

There are a few other things to consider when doing a pull request.  In the case of the Go code, there is significant test coverage already.  If you are adding code, you should add tests as well.  If you are fixing something, you need to make sure you do not break any existing tests.  For the Go code, there is a script ```goclean.sh``` in each repo to run the tests and the any static checkers we have.  NO code will be accepted without passing all the tests.  In the case of the node.js code (decrediton) all code must pass eslint.  You can check this with the command ```npm run lint```.

Finally, each repo has a LICENSE.  Your new code must be under the same LICENSE as the existing code and assigned copyright to 'The Decred Developers'.  In most cases this is the very liberal ISC license but a few repos are different.  Check the repo to be sure.

If you have any questions for contributing, feel free to ask on irc/slack or GitHub.  Decred team members (and probably community members too) will be happy to help.
