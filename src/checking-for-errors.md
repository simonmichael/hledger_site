# Checking for errors

hledger can check your data in various ways. See
[strict mode](https://hledger.org/hledger.html#strict-mode)
and [check](https://hledger.org/hledger.html#check) command.

Here are some other ways to catch errors.

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

## Diffing

Here's another way to check for undeclared accounts, that works with older hledger versions,
showing some diff tricks:
```shell
$ diff -U0 --label "Unused Accounts" --label "Undeclared Accounts" <(hledger accounts --declared) <(hledger accounts --used)
```

## Todo / maybe

Here are some checks we don't support, but possibly might add in future:

- **accountsactive** - for each account used, if there is posting with an `open:` [tag](journal.html#tags), 
  it must have a corresponding posting with a `close:` tag, and all other postings 
  must be chronologically between (and if on the same date, textually between)
  open and close postings. ("Accounts are posted to only within their declared active period.")
- **pricebalanced** - transactions are balanced, possibly using explicit transaction prices but not auto-inferred ones
- **fullybalanced** - transactions are balanced in each commodity, without needing any conversions
- **explicitamounts** - all transaction amounts have been recorded explicitly

