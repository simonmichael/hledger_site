# Checking for errors

hledger can check your data in various ways. See
[strict mode](https://hledger.org/hledger.html#strict-mode)
and the [check](https://hledger.org/hledger.html#check) command.

Below are some other ways to catch errors:

## Old way to check accounts

Here's another way to check for undeclared accounts, that works with older hledger versions,
showing some diff tricks:
```shell
$ diff -U0 --label "Unused Accounts" --label "Undeclared Accounts" <(hledger accounts --declared) <(hledger accounts --used)
```

## Compare report output

Save the output of a report, and later use `diff` to compare the
output of the same report, revealing any changes.

```shell
$ hledger COMMAND > report.txt
$ hledger COMMAND > report2.txt
$ diff report.txt report2.txt
```

Or, periodically commit a report's output into your version control system.
Then you can use the VCS to detect any changes since the last commit, eg:

```shell
$ hledger COMMAND > report.txt; git add report.txt; git commit -m 'report' report.txt
$ hledger COMMAND > report.txt; git diff -- report.txt
```

## A pre-commit hook

Version control systems often support a "pre-commit hook", a script which
is required to succeed before each commit. Eg:

```bash
#!/bin/bash
set -e
hledger check -s
```

## Todo / maybe

Here are some checks we don't support, but could:

- **accountsactive** - for each account used, if there is posting with an `open:` [tag](journal.html#tags), 
  it must have a corresponding posting with a `close:` tag, and all other postings 
  must be chronologically between (and if on the same date, textually between)
  open and close postings. ("Accounts are posted to only within their declared active period.")
- **pricebalanced** - transactions are balanced, possibly using explicit transaction prices but not auto-inferred ones
- **fullybalanced** - transactions are balanced in each commodity, without needing any conversions
- **explicitamounts** - all transaction amounts have been recorded explicitly

