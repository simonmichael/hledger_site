# Checking for errors

hledger can check your data in various ways. 
Here are some checks/desirable properties, with short names for convenience:

These checks are run always (with all hledger commands):

- **parseable** - data files are well-formed and can be [successfully parsed](hledger.html#input-files)
- **autobalanced** - all transactions are [balanced](journal.html#postings), inferring missing amounts where necessary, and possibly converting commodities using [transaction prices] or automatically-inferred transaction prices
- **assertions** - all [balance assertions] are passing (except with `-I`/`--ignore-assertions`)

[transaction prices]: journal.html#transaction-prices
[balance assertions]: journal.html#balance-assertions
[strict mode]: hledger.html#strict-mode

These checks are run only in hledger-1.19.99's [strict mode] (with `-s`/`--strict`):

- **accounts** - all account names used by transactions [have been declared](journal.html#account-error-checking)
- **commodities** - all commodity symbols used [have been declared](journal.html#commodity-error-checking)

To perform the above checks, run any command, eg
(the `>/dev/null` part hides the usual output, on Windows it's something different):
```shell
$ hledger stats >/dev/null
```
or
```shell
$ hledger stats --strict >/dev/null
```

These checks are run by special commands (for now):

- **dates** - transactions are ordered by date (command: [`check-dates`](hledger.html#check-dates))
- **leafnames** - all account leaf names are unique (command: [`check-leafnames`](hledger.html#check-leafnames))
- **tagfiles** - all tag values containing / (a forward slash) exist as file paths (addon command: `hledger-check-tagfiles.hs`)
- **fancyassertions** - more complex balance assertions are passing (addon command: `hledger-check-fancyassertions.hs`)

The addon commands are available in <https://github.com/simonmichael/hledger/tree/master/bin> (cf [Scripting](scripting.html)).

## Todo / maybe

These are some checks we might add in future:

- **accountsactive** - for each account used, if there is posting with an `open:` [tag](journal.html#tags), 
  it must have a corresponding posting with a `close:` tag, and all other postings 
  must be chronologically between (and if on the same date, textually between)
  open and close postings. ("Accounts are posted to only within their declared active period.")
- **payees** - all payee names used have been declared
- **pricebalanced** - transactions are balanced, possibly using explicit transaction prices but not auto-inferred ones
- **fullybalanced** - transactions are balanced in each commodity, without needing any conversions
- **explicitamounts** - all transaction amounts have been recorded explicitly

## Comparing report output

Commit some hledger report output into your version control system.
Then you can detect any changes, eg:

```shell
$ hledger COMMAND > report.txt; git diff -- report.txt
```

## Pre-commit hook

Version control systems often support a "pre-commit hook", a script which
is run and required to succeed before each commit. Eg:

```bash
#!/bin/bash
set -e
hledger stats -s
```
