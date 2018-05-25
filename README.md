# dcrdocs

Documentation for [Decred].

## Installation

dcrdocs is built with [MkDocs]. In order to install MkDocs you will need [Python] installed on your system, as well as the Python package manager, [pip]. You can check if you have these already installed from the command line:

```bash
$ python --version
Python 2.7.6
$ pip --version
pip 8.1.1
```

MkDocs supports Python versions 2.6, 2.7, 3.3, 3.4 and 3.5.

On Windows it is recommended that you install Python and pip with [Chocolatey].

Install the `mkdocs` package, [python-markdown-math] \(required for rendering equations\), [mkdocs-bootswatch] themes, and fontawesome packages using pip:

```bash
$ pip install --user -r requirements.txt
```

## Getting started

Getting started is super easy.

```bash
$ cd dcrdocs
```

There is a single configuration file named `mkdocs.yml`, and a folder named `docs` that will contain the documentation source files. MkDocs comes with a built-in dev-server that lets you preview the documentation as you work on it. Make sure you are in the same directory as the `mkdocs.yml` configuration file, and then start the server by running the `mkdocs serve` command:

```bash
$ mkdocs serve
INFO    -  Building documentation...
INFO    -  Cleaning site directory
[I 160402 15:50:43 server:271] Serving on http://127.0.0.1:8000
[I 160402 15:50:43 handlers:58] Start watching changes
[I 160402 15:50:43 handlers:60] Start detecting changes
```

Open up <http://127.0.0.1:8000> in your browser, and you will see the default home page being displayed. The dev-server also supports auto-reloading, and will rebuild your documentation whenever anything in the configuration file, documentation directory, or theme directory changes.

## Building the site

To deploy dcrdocs, first build the documentation:

```bash
$ mkdocs build
```

This will create a new directory, named `site`. After some time, files may be removed from the documentation but they will still reside in the `site` directory. To remove those stale files, just run `mkdocs` with the `--clean` switch.

```bash
$ mkdocs build --clean
```

To view a list of options available on a given command, use the `--help` flag with that command. For example, to get a list of all options available for the `build` command run the following:

```bash
$ mkdocs build --help
```

## Deploying

The version of dcrdocs that you just built only uses static files which are all contained in the `site/`, directory so you will be able to host it from pretty much anywhere. You can view a live version of the documentation at https://docs.decred.org.

### Docker

dcrdocs can also be hosted in a docker container. Build the container using

```bash
$ ./build_docker.sh
```

The container can then be run with

```bash
$ docker run -d --rm -p <local port>:80 decred/dcrdocs:latest
```


## Localization

The below commands must be run when either the content changes or there are updates in the translations in Transifex.  You'll first need to install the [Transifex client](https://docs.transifex.com/client/installing-the-client).

#### Downloading web site code

Make sure you have [git](https://git-scm.com/) installed.

```sh
git clone https://github.com/decred/dcrweb
cd dcrweb;
```

#### Importing new translations and content updates

When translations are added/updated in [Transifex](https://www.transifex.com/decred/), pull the updates:

```sh
npm run transifex:pull
```

When you run this for the first time, you'll be asked to log in with your Transifex username/password.

To push the changes to staging:

```sh
git commit -m'Translation update'
git push origin
```

This triggers the update on the staging site, which will be rebuilt usually in a few minutes (give it 5):

[https://dcrweb.herokuapp.com/](https://dcrweb.herokuapp.com/)

#### Updating the message catalog

When the master content changes in the HTML files, you'll need to re-generate the message catalog and push it to Transifex so that translators can update the localized message catalogs.  After adding new content or making changes, be sure to validate the Markdown files in order to avoid issues while importing the catalogs.

```sh
npm run lint
```

If there are any errors, fix the files before continuing.  Once the lint command displays no errors, proceed to uploading the message catalog:

```sh
npm run transifex:push
```

#### Adding a new language

  1. Add the new language in Transifex
  2. In the repository folder, run `npm run transifex:pull`, and once it completes, add the resulting new files to git: `git add src/i18n`
  5. Commit files to git + push to repo

## Getting help

To get help with dcrdocs, please use the [forum], [GitHub issues], or the Decred development IRC channel `#decred-dev` on freenode.

[Chocolatey]: https://chocolatey.org
[Decred]: https://github.com/decred
[forum]: https://forum.decred.org
[GitHub issues]: https://github.com/decred/dcrdocs/issues
[mkdocs-bootswatch]: https://mkdocs.github.io/mkdocs-bootswatch
[MkDocs]: https://mkdocs.org
[pip]: http://pip.readthedocs.org/en/latest/installing.html
[python-markdown-math]: https://pypi.python.org/pypi/python-markdown-math
[Python]: https://www.python.org
