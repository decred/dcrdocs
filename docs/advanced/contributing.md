# <img class="dcr-icon" src="/img/dcr-icons/Code.svg" /> Source Code Contributions 

---

## Initial Preparation 

A good first step is to read the [Code Contribution Guidelines documentation](https://github.com/decred/dcrd/blob/master/docs/code_contribution_guidelines.md) to get a good understanding of the policies used by the
project.  That document is primarily focused on the Go codebase but it is still a good start.

The following examples will be split into two sections, one for the Go projects (dcrd, dcrwallet, gominer, etc), and one for projects that do not use Go (decrediton, insight, dcrdocs, etc).  In all cases, be sure to check out the README.md in each project if you need help setting the particular project up.

---

## Go 

For projects using Go, you can follow this procedure.  dcrd will be used as the example.  This assumes you already have go1.6 or newer installed and a working `$GOPATH`.

### One time setup
- Fork dcrd on GitHub
- Run the following commands to obtain dcrd, all dependencies, and install it:

```bash
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

---

## Other Considerations 

There are a few other things to consider when doing a pull request.  In the case of the Go code, there is significant test coverage already.  If you are adding code, you should add tests as well.  If you are fixing something, you need to make sure you do not break any existing tests.  For the Go code, there is a script ```goclean.sh``` in each repo to run the tests and the any static checkers we have.  NO code will be accepted without passing all the tests.  In the case of the node.js code (decrediton) all code must pass eslint.  You can check this with the command ```npm run lint```.

If you have any questions for contributing, feel free to ask on irc/slack or GitHub.  Decred team members (and probably community members too) will be happy to help.
