# Checking for errors

<div class=pagetoc>

<!-- toc -->
</div>

hledger can check your data in various ways. 

## Built in checks

In hledger 1.21+,
see [strict mode](https://hledger.org/hledger.html#strict-mode)
and the [check](https://hledger.org/hledger.html#check) command.

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

Or, periodically commit a report's output into your version control system,
then use the VCS to detect any changes since the last commit.

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

## Flymake mode

If you use Emacs, you can configure Flymake to run your preferred
checks when you edit a journal file.  This integration gives very
useful real-time feedback.  Setup tips:

- in Emacs, install the `flymake-hledger` package
- customize the `flycheck-hledger-checkers` variable to include the
  checks you want ("strict" checks are enabled by default)

## Flycheck mode

If you use Emacs, you can configure flycheck to run your preferred checks when you edit a journal file.
This integration is currently quite basic, but it still gives very useful real-time feedback.
Setup tips:

- in Emacs, install the `flycheck-hledger` package and customise the `flycheck-checkers` variable, adding `hledger` to the list
- customise the `flycheck-hledger-strict` and `flycheck-hledger-checks` variables

## Todo / maybe

Here are some checks we don't support, but could:

- **accountsactive** - for each account used, if there is posting with an `open:` [tag](hledger.md#tags), 
  it must have a corresponding posting with a `close:` tag, and all other postings 
  must be chronologically between (and if on the same date, textually between)
  open and close postings. ("Accounts are posted to only within their declared active period.")
- **explicitamounts** - all transaction amounts have been recorded explicitly

