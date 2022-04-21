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
in the main hledger repo. Here's one (slow) way to install them:

```cli
$ cd ~/finance   # wherever you keep financial files
$ git clone https://github.com/simonmichael/hledger.git
$ ln -s hledger/bin
```
Now do the PATH dance, eg as a bash user:

```cli
$ echo "export PATH=$PATH:$PWD/bin" >>~/.bash_profile"
$ export PATH=$PATH:$PWD/bin
```

### Bash aliases and functions

[`bin/bashrc`](https://github.com/simonmichael/hledger/blob/master/bin/bashrc)
defines some example bash aliases and functions.
After the above steps, as a bash user,

```cli
# customise FINDIR and LEDGER_FILE at the top of bin/bashrc
$ source bin/bashrc
$ fin        # list the scripts available
```

### Bash script files

[`hledger-simplebal.sh`](https://github.com/simonmichael/hledger/blob/master/bin/hledger-simplebal.sh)
is a standalone bash script. 
Because it is named `hledger-something`, it is also an *add-on command*:
it will appear as a new command named `something` in `hledger`'s commands list.
It calls hledger with lots of options (read it to see what it does).

```cli
$ hledger simplebal
```

### Haskell scripts

Other add-on commands in the bin directory are Haskell scripts (`hledger-*.hs`).
These call hledger to process command line arguments, show help, read data, 
run reports etc., so they can be as powerful as built-in commands.
You can run them interpreted, for easy customisation (you will need the
[`stack`](https://haskellstack.org) tool).  Or you can
compile them for faster startup. They include:

[`hledger-print-location.hs`](https://github.com/simonmichael/hledger/blob/master/bin/hledger-print-location.hs)
is not very useful, but is a simple example of a haskell script with hledger-style command-line help.
It is a customised version of the built-in `print` command, 
that adds the file and line number to every transaction, as a tag:

```cli
$ hledger print-location -f hledger/examples/sample.journal desc:eat
2008/06/03 * eat & shop
  ; location: /Users/simon/src/hledger/examples/sample.journal:30
  expenses:food                  $1
  expenses:supplies              $1
  assets:cash
```

[`hledger-check-fancyassertions.hs`](https://github.com/simonmichael/hledger/blob/master/bin/hledger-check-fancyassertions.hs)
checks account balances in more complex ways than the built-in balance assertions.

See [`bin/README`](https://github.com/simonmichael/hledger/tree/master/bin#readme)
and the other scripts for details of what they do.

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


