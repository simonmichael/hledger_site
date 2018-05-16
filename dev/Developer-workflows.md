Moved from hledger.org/contributing.html, needs update.

### Review code

- review and discuss new [pull requests](http://prs.hledger.org) and commits on github
- build hledger and test the latest changes in your own repo
- read the existing [code docs and source](#quick-links)
- send feedback or discuss via [IRC or mail list](/docs.html#helpfeedback)

### Build hledger

1. get [`stack`](/download.html#b) and (except on Windows, where stack provides it) [`git`](http://git-scm.com), then:
2. `git clone https://github.com/simonmichael/hledger && cd hledger && stack install`

<div style="margin-left:1em; margin-right:1em; padding:.5em; border:thin solid #ddd; border-radius:.5em;">
In more detail:

**1. Get tools**

[`stack`](/download.html#b)
is the recommended tool for building hledger.  You can use cabal-install
if you prefer, but that requires more expertise;
the hledger docs assume stack.

[`git`](http://git-scm.com) is the version control tool needed to
fetch the hledger source and submit changes. On Windows, stack will
install this as well.

<!--
While you're installing, here are some optional extra tools:

- `ghcid`: gives real-time feedback as you make code changes, reliable and useful.
- `hasktags`: generates tag files for quick code navigation in editors like Emacs and vi.
- `shelltestrunner`: if you want to run hledger's functional tests.
- [GNU Make](http://www.gnu.org/software/make): if you want to use some convenient [Makefile rules](#make).

```shell
$ stack install ghcid hasktags shelltestrunner
```
-->

**2. Get the source**

```shell
$ git clone https://github.com/simonmichael/hledger   # or git:
```

**3. Build/install**

```shell
$ cd hledger
$ stack install
```

This builds all the hledger packages, and installs executables in
`$HOME/.local/bin/` (or the Windows equivalent), which you should 
[add to your `$PATH`](/download.html#b).

This can take a while!
To save time, you can build fewer [packages](/manual.html#official-add-ons), eg just the CLI:
```shell
$ stack install hledger
```

You can also build and run in place, without installing executables:
```shell
$ stack build; stack exec -- hledger [ARGS]
```

Note stack fetches most required dependencies automatically,
but not C libraries such as curses or terminfo, which you might need
to install yourself, using your system's package manager.
In case of trouble, see [download](/download.html#b).

</div>

### Use GHCI

These all work from the main hledger source directory (at least).

First, ensure all required dependencies are installed with these
commands. (You might also need to install some system libs like
terminfo or curses.)

```shell
$ stack test
$ stack bench
```

Get a GHCI prompt for hledger-lib:
```shell
$ cd hledger-lib; stack ghci hledger-lib
```
Changing into the package directory isn't actually needed, but it
enables a custom .ghci script which sets a more useful short prompt.

Get a GHCI prompt for hledger:
```shell
$ cd hledger; stack ghci hledger
```

Get a GHCI prompt for hledger-ui:
```shell
$ cd hledger-ui; stack ghci hledger-ui
```
Get a GHCI prompt for hledger-web:
```shell
$ cd hledger-web; stack ghci hledger-web
```
hledger-web also needs to find some things in its current directory (like the static/ directory).
This normally just works, if not please [send details](https://github.com/simonmichael/hledger/issues/274).

<!--
Get a GHCI prompt for hledger and hledger-lib:
```shell
$ make ghci
```

Get a GHCI prompt for hledger-web, hledger and hledger-lib:
```shell
$ make ghci-web
```

For the dev.hs developer script:
```shell
$ make ghci-dev
```
-->

### Add a test

- identify what to test
- choose the test type: unit ? functional ? benchmark ?
- currently expected to pass or fail ?
- figure out where it goes
- write test, verify expected result
- get it committed

### Fix a bug or add a feature

- research, discuss, validate the issue/feature on irc/list/bug tracker
- look for related tests, run the tests and check they are passing
- add a test ?
- develop a patch
- include any related issue numbers in the patch name, eg: "fix for blah blah (#NNN)"
- get it committed

### Get your changes accepted

Follow the usual github workflow:

- fork the main hledger repo on github,
- git clone it to your local machine,
- git commit, after (?) pulling and merging the latest upstream changes
- git push back to github,
- open a pull request on github,
- follow up on any discussion there.

If you're new to this process, [help.github.com](http://help.github.com) may be useful.

### Add yourself to the contributor list

- after getting something into the master branch, read and sign the [contributor list & agreement](contributors.html). Or, [ask](/docs.html#helpfeedback) to be added.
- give yourself a high five!

### Work on docs

Most docs tasks are handled by [[Shake]]. List Shake rules:

    ./Shake

Generate man/info/txt manuals (in hledger*/) and embed in hledger executables:

    ./Shake manuals
    stack build

Generate html manuals and the hledger website (in site/_site/):

    ./Shake website

Regenerate the hledger website (does not generate html manuals) and serve locally at http://localhost:8000, on file change:

    make site-preview

Regenerate html manuals and the website and serve locally on file change (using [entr](http://www.entrproject.org)):

    ls doc/lib.m4 hledger*/*.m4.md site/{index,intro,download,release-notes}.md | entr -r bash -c './Shake website && make site-preview'

site/hakyll-std/hakyll-std.hs is a generic Hakyll script called by Shake.
It gets confused if you regenerate source files too quickly, and then won't show the latest content.
To reset it and start over:

    make site-clean

To do the above and also reset all files generated by Shake:

    ./Shake Clean

### Use ghcid for rapid feedback

[ghcid](http://hackage.haskell.org/package/ghcid) is the most reliable and fastest way to see GHC's feedback, and optionally run tests or arbitrary GHCI command, as you edit.

Some make rules are provided to make running it easier. Run `make` to see a list. These cause ghcid to watch multiple packages rather than just one. Eg hledger-lib and hledger:

    make ghcid

### Use entr for rapid feedback

[entr](http://entrproject.org/) is the most robust cross-platform tool for watching files and running arbitrary commands when they change. It is tremendously useful.

Rerun a single functional test:

    ls tests/budget/budget.test hledger-lib/Hledger/Reports/BudgetReport.hs | entr bash -c 'clear; COLUMNS=80 stack exec -- shelltest --execdir tests/budget/budget.test -i12'
