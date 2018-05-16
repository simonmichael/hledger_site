### Get developer tools

Ensure [`stack`](https://haskell-lang.org/get-started) is installed
(or if you’re a [cabal](https://www.haskell.org/cabal/) expert, feel free to use that.)

Ensure [`git`](http://git-scm.com) is installed. On Windows, it comes with stack.

Here are some useful optional tools:

- [GNU Make](http://www.gnu.org/software/make): to use the convenient [Make rules](#make).
- [`entr`](http://www.entrproject.org/) runs arbitrary commands when files change.
- [`ghcid`](http://hackage.haskell.org/package/ghcid) gives real-time GHC feedback as you make code changes.
- [`shelltestrunner`](http://hackage.haskell.org/package/shelltestrunner) runs hledger's functional tests.
- [`quickbench`](http://hackage.haskell.org/package/quickbench) measures and reports time taken by commands.
- [`hasktags`](http://hackage.haskell.org/package/hasktags) generates tag files for quick code navigation in editors like Emacs and vim.
- For browsing and editing Haskell code, popular tools include: Emacs, Vim, IDEA, VS Code, Atom..

Eg:

    stack install ghcid shelltestrunner quickbench hasktags
    brew install entr

### Get the source:

    git clone https://github.com/simonmichael/hledger
    cd hledger

### Review code

- review and discuss new [pull requests](http://prs.hledger.org) and commits on github
- build hledger and test the latest changes in your own repo
- read the existing [code docs and source](#quick-links)
- send feedback or discuss via [IRC or mail list](/docs.html#helpfeedback)

#### Build in place:

See also http://hledger.org/download.html#c.-build-the-development-version .

    stack build    # hledger hledger-ui ...

This fetches the required GHC version and haskell dependencies from the default stackage snapshot (configured in `stack.yaml`), 
then builds all hledger packages.
This can take a while! To save time, you can build individual packages, eg just the CLI and TUI.

Note stack does not fetch C libraries such as curses or terminfo, which you might need to install yourself, using your system's package manager.
In case of trouble, see [download](/download.html#link-errors).

If you want to use an older snapshot/GHC for some reason, specify one of the older stack-ghc*.yaml files:

    stack --stack-yaml stack-ghc8.2.yaml build
    
#### Run in place:

    stack exec -- hledger     # ARGS...
    stack exec -- hledger-ui  # ARGS...
    stack exec -- which hledger

#### Build and install:

This builds and also copies the hledger executables to `~/.local/bin` or the Windows equivalent
(which you should  [add to your `$PATH`](/download.html#b)).

    stack install    # hledger hledger-ui ...

### Use GHCI

These all work from the main hledger source directory (at least).

First, ensure all required dependencies are installed with these
commands. (You might also need to install some system libs like
terminfo or curses.)

    stack test
    stack bench

#### Get a GHCI prompt for hledger-lib:

    cd hledger-lib; stack ghci hledger-lib

Changing into the package directory isn't actually needed, but it
enables a custom .ghci script which sets a more useful short prompt.

#### Get a GHCI prompt for hledger:

    cd hledger; stack ghci hledger

#### Get a GHCI prompt for hledger-ui:

    cd hledger-ui; stack ghci hledger-ui

#### Get a GHCI prompt for hledger-web:

    cd hledger-web; stack ghci hledger-web

hledger-web also needs to find some things in its current directory (like the static/ directory).
This normally just works, if not please [send details](https://github.com/simonmichael/hledger/issues/274).

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

Most docs tasks are handled by [[Shake]]. 

#### List Shake rules:

    ./Shake

#### Generate man/info/txt manuals (in hledger*/) and embed in hledger executables:

    ./Shake manuals
    stack build

#### Generate html manuals and the hledger website (in site/_site/):

    ./Shake website

#### Regenerate the hledger website (does not generate html manuals) and serve locally at http://localhost:8000, on file change:

    make site-preview

#### Regenerate html manuals and the website and serve locally on file change (using [entr](http://www.entrproject.org)):

    ls doc/lib.m4 hledger*/*.m4.md site/{index,intro,download,release-notes}.md | entr -r bash -c './Shake website && make site-preview'

#### To remove all files generated by Shake:

    ./Shake Clean

### Use ghcid for rapid feedback

[ghcid](http://hackage.haskell.org/package/ghcid) is the most reliable and fastest way to see GHC's feedback, and optionally run tests or arbitrary GHCI command, as you edit.

Some make rules are provided to make running it easier. Run `make` to see a list. These cause ghcid to watch multiple packages rather than just one. 

#### Watch for compile errors in hledger-lib and hledger:

    make ghcid

#### Watch compile errors and the output of some hledger command:

    ghcid -c 'make ghci' -T ':main -f a.j bal --budget -N'

### Use entr for rapid feedback

[entr](http://entrproject.org/) is the most robust cross-platform tool for watching files and running arbitrary commands when they change. 

Its first argument is an executable, to run an arbitrary shell command use `bash -c "CMD"`.

#### Rerun a single functional test as you change it:

    ls tests/budget/budget.test | entr bash -c 'clear; COLUMNS=80 stack exec -- shelltest --execdir tests/budget/budget.test -i12'
