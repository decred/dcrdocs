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

The version of dcrdocs that you just built only uses static files so you will be able to host it from pretty much anywhere. You can view a live version of the documentation at https://docs.decred.org.

## Translations
### Adding a new translation

These are the recommended steps to contribute a new language to dcrdocs:

1. Find the two letter code which represents the language according to [ISO 639-2](https://en.wikipedia.org/wiki/List_of_ISO_639-2_codes). For the rest of this guide we will use the Russian language as an example (code "ru")
1. Add 'ru' to the list of languages in `build_docs.sh`. In this case ```LANG="de es"``` becomes ```LANG="de es ru"```
1. Run `build_docs.sh`. This will create the directory `ru_docs` which will contain a full copy of the English documentation
1. Copy `mkdocs.yml` to `ru_mkdocs.yml` and give it an extra line `docs_dir: 'ru_docs'`
1. Translate each of the markdown files in `ru_docs`. Make one commit for each file translated to more easily track progress and changes in the commit history. The commit message should be formatted as `ru translation filename.md`
1. Translate the table of contents by updating the headings in `ru_mkdocs.yml`
1. Translate the copyright message in `ru_mkdocs.yml`
1. Run `build_docs.sh` again and check the output contains no errors to validate your work. 

Properly translating the documentation will take a considerable amount of time and the pace of change in dcrdocs is fairly rapid. While translating it is important to keep an eye on changes which are happening in the English language version to ensure the translated version is also kept up to date. The command `git log <FILENAME>` may be useful to check the history of individual files.

### Locally serving dcrdocs translations
Run `mkdocs serve -f de_docs.yml` in the repository root, substituting `de_docs.yml` with the config file for the language you wish to use.

```bash
$ mkdocs serve -f de_docs.yml
INFO    -  Building documentation...
INFO    -  Cleaning site directory
[I 160402 15:50:43 server:271] Serving on http://127.0.0.1:8000
[I 160402 15:50:43 handlers:58] Start watching changes
[I 160402 15:50:43 handlers:60] Start detecting changes
```

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
