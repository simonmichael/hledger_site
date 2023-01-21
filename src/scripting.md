# Scripting hledger

<div class=pagetoc>

<!-- toc -->
</div>

As a command line program, with plain text data formats, hledger is
easy to extend and customise with scripts and add-on commands.
This page describes some different kinds of scripting you can do around hledger.

For an overview of ready-made scripts you can install, see [Scripts](scripts.html).

Scripts are programs which call other programs to get things done.
They are often (though not always):
- small
- ready to run immediately with no compilation step
- quick to write and modify
- written by you to make your particular tasks easier.

They could be as simple a shell alias remembering the options for a
common report, or a small program automating a more complex operation
such as invoicing.

## Shell aliases

Shell aliases are the simplest type of script.
Their most common use is to save typing, as in the examples below.
(These and most shell examples in these docs are for the popular Bash shell;
translate appropriately if you use a different shell.)

```bash
# ~/finance/bashrc
alias acc='hledger accounts'
alias act='hledger activity'
alias add='hledger add'
alias areg='hledger aregister'
alias bal='hledger balance'
alias close='hledger close'
alias print='hledger print'
alias reg='hledger register'
alias stats='hledger stats'
alias tags='hledger tags'
alias bs='hledger bs'
alias bse='hledger bse'
alias is='hledger is'
alias cf='hledger cashflow'
alias 2020='hledger -f ~/finance/2020.journal'
alias 2019='hledger -f ~/finance/2019.journal'
alias 2018='hledger -f ~/finance/2018.journal'
# ...
alias 2y='hledger -f ~/finance/2year.journal'
alias 3y='hledger -f ~/finance/3year.journal'
alias 4y='hledger -f ~/finance/4year.journal'
alias 5y='hledger -f ~/finance/5year.journal'
alias all='hledger -f ~/finance/all.journal'
```

or to customise hledger's commands:

```bash
alias iadd='hledger-iadd --date-format %Y/%m/%d'
alias ui='hledger-ui --watch'
alias uir='hledger-ui --watch --register'
```

or to remember useful reports:

```bash
alias allone="all --alias '/^([^:]+)(:personal|:business)\b/ = \1' --alias '/^revenues:consulting/=revenues' --alias '/\bwells fargo\b/=wf'"
alias budget='hledger bal --budget'
alias forecast='hledger reg -H date:today- --forecast'
alias tripactivity='hledger act tag:trip -W'
```

## Shell functions

When aliases are too limiting, you can use functions instead:

```bash
alias bassets='bal -H ^assets:business'
alias bdebts='bal -H ^liabilities:business'
alias brevenues='bal ^revenues:business'
alias bexpenses='bal ^expenses:business'

function bsnapshot () { # business balance sheet + year-to-date income statement
 echo Business financial snapshot `date` #+%Y/%m/%d
 echo
 echo Assets today:
 bassets --flat --drop 2 --depth 4 $@
 echo
 echo Debts today:
 bdebts --flat --drop 2 --depth 4 $@
 echo
 echo Revenues this year:
 brevenues --flat --drop 2 --depth 3 $@
 echo
 echo Expenses this year:
 bexpenses --flat --drop 2 --depth 3 $@
 echo
}
```

## Shell scripts

When aliases and functions are too limiting, you can use a shell script file:

```bash
#!/bin/sh
# ~/finance/bin/reports
date
export PATH=/Users/simon/.local/bin:$PATH
export LEDGER_FILE=/Users/simon/finance/2018.journal
/usr/bin/make -s -C /Users/simon/finance reports | /usr/bin/mail -s 'reports' simon
```

## Make

[Makefiles](https://www.gnu.org/software/make/) can work well for
collections of simple scripts, especially if they are local to a
particular directory.

```make
# ~/finance/Makefile

# regular reports, mailed by cron
reports: \
	is \
	time-report \
	todo \

is:
	@echo 'Monthly Income Statement'
	hledger is -M cur:.
	@echo

YEAR:=$(shell date +%Y)
TIMEJOURNAL=time-$(YEAR).journal
HLEDGER=hledger
TIME=$(HLEDGER) --alias "/\./=:" -f $(TIMEJOURNAL)

time-report:
	@echo 'Monthly Time Report'
	$(TIME) bal -MAT -1
	@echo

todo:
	@echo "TODOs in this year's journals"
	@grep TODO $(YEAR)*
	@grep TODO $(YEAR)* | wc -l
	@echo
```

If you are not comfortable with Make's syntax, or when scripts get more complex,
dedicated or multi-function shell scripts will be less hassle.

## Add-on commands

If you name scripts hledger-something and make them executable in PATH,
they'll be recognised as [add-on commands](hledger.html#add-on-commands).

Eg here's a simple script which adds `estimatedtax` as a hledger command.
This one is in haskell, but it could be written in any language:

```hs
#!/usr/bin/env runhaskell
-- hledger-estimatedtax.hs
-- Given a gross income amount, estimate the corresponding federal and
-- state taxes based on historical tax per gross income.  These
-- amounts can be posted to your tax liability account, to estimate
-- taxes due from this year's income so far.

import System.Environment
import Text.Printf

-- | How much of taxable income to save for federal & state estimated tax payments,
-- these are usually about right for me
fedrate       = 0.28
staterate     = 0.04

main = do
  taxableincome <- fmap (read . head) getArgs :: IO Int
  let fedtax        = round $ fromIntegral taxableincome * fedrate
      statetax      = round $ fromIntegral taxableincome * staterate
      totaltax      = fedtax + statetax
      posttaxincome = taxableincome - totaltax
  printf (
    "Taxable income:  %5d\n" ++
    "US tax:          %5d\n" ++
    "CA tax:          %5d\n" ++
    "Total tax:       %5d\n" ++
    "Post-tax income: %5d\n")
    taxableincome fedtax statetax totaltax posttaxincome
```

## hledger-lib scripts

These are scripts written in haskell, which use the same
[hledger-lib](https://hackage.haskell.org/package/hledger-lib) and
[hledger](https://hackage.haskell.org/package/hledger) APIs that hledger uses.
They can be simple interpreted scripts, or can grow as large and powerful as you need,
and can be optionally compiled for more speed and durability.
Example scripts and more tips can be found at
<https://github.com/simonmichael/hledger/tree/master/bin/>.

hledger-lib scripts installed as add-ons (`hledger-newcmd.hs` in PATH) 
are a good way to prototype new commands, perhaps to become builtin commands later.
(Though, converting a haskell script command to a builtin command currently requires
rearranging its code; we'd like to improve this.)

## Haskell scripting tips

If you want others, or future-you, to be able to run your haskell scripts reliably,
make them [stack scripts] or [cabal scripts].
stack scripts are currently best for reliability, performance, and sharing, because they:

- ensure the required GHC version is installed
- ensure the required haskell packages are installed, based on the script's imports
- specify all package versions for more reliable builds
- automatically recompile themselves when changed, only when needed.

[stack scripts]: https://docs.haskellstack.org/en/stable/GUIDE/#writing-independent-and-reliable-scripts
[cabal scripts]: https://cabal.readthedocs.io/en/latest/cabal-commands.html#cabal-v2-run

## Plugins

In general we would like for hledger users to be able to quickly customise
its behaviour and features with small code "plugins",
without having to change and recompile hledger itself.
Haskell is not a very "dynamically pluggable" language,
so currently the best way to build "plugins" is pre-processing scripts, post-processing scripts, or hledger-lib-using haskell scripts.

We identify several desirable plugin types:

| Plugin&nbsp;type | Purpose,<br>Current status                                                                                                                                                              |
|------------------|:----------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------|
| reader           | Parse/ingest new data formats/sources to hledger journal data.                        <br>Can be done by generating journal or csv format.                                              |
| processor        | Process/transform hledger journal data, after parsing (ideally) and before reporting. <br>Not well supported, somewhat possible in a haskell script, or by transforming journal format. |
| writer           | Render/export hledger journal data to new data formats/destinations.                  <br>Can be done (lossily) by transforming print's txt/csv/json/sql output.                        |
| formatter        | Render a hledger report's output to a new output format.                              <br>Can be done by transforming the report's txt/csv/json/html output.                            |
| command          | Provide new `hledger` subcommands implementing new reports or actions.                <br>Can be done by putting `hledger-foo` add-on scripts/programs in PATH.                         |

Below are some examples of each type to give you ideas.
More like these can be found at <https://hledger.org/scripts.html> or <https://plaintextaccounting.org/#data-importconversion>.

### reader

- the builtin journal, csv, timeclock, timedot readers
- beancount2ledger, pricehist, reckon, qb2ledger, ynab-to-ledger..

### processor

- the builtin amount/cost/equity inferring; amount style normalisation; auto postings; periodic transactions; normal and strict checks..
- hledger-print-location..

### writer

- the `print` command's builtin output formats
- ledger2beancount..

### formatter

- the report commands' builtin output formats
- hreports, hledger-plot..

### command

- hledger-ui, hledger-web, hledger-iadd, hledger-git, hledger-move..
