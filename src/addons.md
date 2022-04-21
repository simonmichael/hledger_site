# Add-ons & scripts

<div class=pagetoc>
<!-- toc -->
</div>

This page lists some extra tools and scripts you can install to augment the core hledger tools.

These are several common types:

- small shell scripts - aliases, functions, or script files - which run the `hledger` program in useful ways, saving work
- scripts or compiled programs which don't use hledger directly, but perform useful related tasks
- haskell scripts or programs which call hledger as a library, to do more advanced tasks.

To learn more about scripts and how to make your own, see [Scripting](scripting.html).

## hledger/bin

Some scripts are collected in the [bin/](https://github.com/simonmichael/hledger/tree/master/bin) directory
in the main hledger repo. To install them:

```cli
$ cd ~/finance   # wherever you keep financial files

# (the fast way, no version control:)
$ curl -LOJ https://github.com/simonmichael/hledger/archive/refs/heads/master.zip && unzip hledger-master.zip && mv hledger-master hledger

# (or the slow way, with version control:)
# git clone https://github.com/simonmichael/hledger.git

$ ln -s hledger/bin
```
Now do the PATH dance, eg as a bash user:

```cli
$ echo "export PATH=$PATH:$PWD/bin" >>~/.bash_profile"
$ export PATH=$PATH:$PWD/bin
```

### Shell aliases / functions

[`bin/bashrc`](https://github.com/simonmichael/hledger/blob/master/bin/bashrc)
defines some example bash aliases and functions.
After the above steps, as a bash user,

```cli
# customise FINDIR and LEDGER_FILE at the top of bin/bashrc
$ source bin/bashrc
$ fin        # list the scripts available
```

### Shell script files

[`hledger-simplebal.sh`](https://github.com/simonmichael/hledger/blob/master/bin/hledger-simplebal.sh)
is a standalone bash script. 
Being named `hledger-something`, and an executable in $PATH, it is also an *add-on command*,
ie it will appear as in `hledger`'s commands list.
It calls hledger with lots of options (read it to see what it does).

```cli
$ hledger simplebal
```

[`hledger-git`](https://github.com/simonmichael/hledger/blob/master/bin/hledger-git)
provides easy version control for your journal files, using git. Run it with no arguments for help.
```cli
$ hledger git log
$ hledger git status
$ hledger git record [MSG]
```

[`hledger-pijul`](https://github.com/simonmichael/hledger/blob/master/bin/hledger-pijul)
provides the same thing using the [pijul](https://pijul.org) version control system..
```cli
$ hledger pijul log
$ hledger pijul status
$ hledger pijul record [MSG]
```



### Haskell scripts

Other add-on commands in the bin directory are Haskell scripts (`hledger-*.hs`).
These call hledger as a library to process command line arguments, read data, 
run reports etc., so they can be as powerful as built-in commands.
You can run them interpreted, for easy customisation (you will need the
[`stack`](https://haskellstack.org) tool).  Or you can
compile them for faster startup. They include:

[`hledger-print-location.hs`](https://github.com/simonmichael/hledger/blob/master/bin/hledger-print-location.hs)
is a simple example of a haskell script with hledger-style command-line help.
It is a custom version of the built-in `print` command, 
that adds the file and line number to every transaction, as a tag:

```cli
$ hledger print-location -f hledger/examples/sample.journal desc:eat
2008/06/03 * eat & shop
  ; location: /Users/simon/src/hledger/examples/sample.journal:30
  expenses:food                  $1
  expenses:supplies              $1
  assets:cash
```

[`hledger-check-tagfiles.hs`](https://github.com/simonmichael/hledger/blob/master/bin/hledger-check-tagfiles.hs)
interprets all tag values containing a `/` (forward slash) as file paths, and checks that those files exist.

[`hledger-check-tagfiles.cabal.hs`](https://github.com/simonmichael/hledger/blob/master/bin/hledger-check-tagfiles.cabal.hs)
is the above as a cabal script.

[`hledger-swap-dates.hs`](https://github.com/simonmichael/hledger/blob/master/bin/hledger-swap-dates.hs)
prints transactions with their date and date2 fields swapped.

[`hledger-balance-as-budget.hs`](https://github.com/simonmichael/hledger/blob/master/bin/hledger-balance-as-budget.hs)
uses one balance report to set budget goals for another balance report.

[`hledger-combine-balances.hs`](https://github.com/simonmichael/hledger/blob/master/bin/hledger-combine-balances.hs)
shows balance reports for two different periods side by side.

[`hledger-smooth.hs`](https://github.com/simonmichael/hledger/blob/master/bin/hledger-smooth.hs)
is an incomplete attempt at automatically splitting infrequent/irregular transactions.

[`hledger-check-fancyassertions.hs`](https://github.com/simonmichael/hledger/blob/master/bin/hledger-check-fancyassertions.hs)
is a more complex command that checks account balances in ways that the built-in balance assertions can't.

## More add-on commands

`hledger-ui` and `hledger-web` are two add-on commands which are usually installed together with `hledger`.

Other add-ons are maintained as separate packages, and can be installed separately with stack or cabal. 
If you have trouble, check their READMEs or ask for help in chat. They include:

[`hledger-iadd`](http://hackage.haskell.org/package/hledger-iadd)
is a terminal UI alternative to hledger's `add` command. 

[`hledger-interest`](http://hackage.haskell.org/package/hledger-interest)
generates interest transactions for an account according to various schemes. 

[`hledger-irr`](http://hackage.haskell.org/package/hledger-irr)
calculates the internal rate of return of an investment account.

## More tools

[`ledger-autosync`](https://pypi.python.org/pypi/ledger-autosync)
can download, deduplicate and/or convert OFX data (includes hledger support;
rename it to hledger-autosync to see it in commands list).

[plaintextaccounting: related tools](http://plaintextaccounting.org/#related-tools)
lists more plain text accounting helper tools.


