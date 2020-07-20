<!-- 
The TL;DR intro to hledger.           -*- fill-column:78; -*-
Maintained as a .md file but intended to be read as rendered HTML.
-->
<style>
/* mimic old-school plain text docs a little */
body, p {
    color: black;
    font-family: Monaco,Consolas,"Liberation Mono","Courier New",Courier,monospace;
    font-size: 13px;
    line-height: normal;
}
h1, h2, h3, h4, h5, h6 {
    font-family: Monaco,Consolas,"Liberation Mono","Courier New",Courier,monospace;
}
h1 { padding:0; font-size:2em; }
h2 { padding:0; font-size:1em; }
body { margin: 8px; }
p { margin-bottom: 1em; max-width:55em; }
a { text-decoration:underline; }
ol pre { line-height: normal; }
pre, .rst-content div[class^="highlight"], .rst-content div[class^="highlight"] pre { 
    overflow:visible; 
/*    overflow:auto; */
}
.rst-content div[class^="highlight"] pre {
    margin:1em; 
    padding:0;
}
.rst-content pre.literal-block, .rst-content div[class^="highlight"] { 
    border:none; 
    margin: 1px 0 1px 0;
}
.highlight { background:none; }
</style>

# hledger essentials

<!--
  [What is it ?](#about)
| [Install](#install)
| [Transactions](#transactions)
| [Reports](#reports)
| [Files](#files)
| [Import](#csv)
-->

Welcome!
You've found the quick intro to hledger. 
This doc aims to distill just the most frequently needed, practical info to
help you get productive as efficiently as possible.
When you want more detail, follow links to the [full website] (and
particularly the manuals, which describe everything hledger does: [hledger],
[hledger-ui], [hledger-web], [journal], [csv], [timeclock], [timedot]).

[full website]: https://hledger.org
[hledger]:      https://hledger.org/hledger.html
[hledger-ui]:   https://hledger.org/hledger-ui.html
[hledger-web]:  https://hledger.org/hledger-web.html
[journal]:      https://hledger.org/journal.html
[csv]:          https://hledger.org/csv.html
[timeclock]:    https://hledger.org/timeclock.html
[timedot]:      https://hledger.org/timedot.html

<a name="about"></a>
## What is it ?

hledger: free GPLv3+ accounting software for linux, mac, windows, web, etc. 

- reads a flexible, future-proof, version-controllable, expressive plain text format
- or any CSV file downloaded from financial institutions
- produces powerful, precise financial reports as text/HTML/CSV/JSON:
  balance sheet, income statement, cashflow, budget, roi, transaction register, time, ...
- use via CLI, TUI, WUI, HTTP API or Haskell library
- easy to script and extend
- user-friendly, well documented, robust
- scales smoothly from simple to complex accounting, and makes it fun.

## Install

Fastest: [download binaries](download.html), eg one of:

```
$ apt install hledger hledger-ui hledger-web
$ brew install hledger
$ curl -LO https://github.com/simonmichael/hledger/releases/download/1.18.1/hledger-ubuntu.zip; unzip hledger-ubuntu.zip  # also macos, windows, etc.
$ dnf install hledger
$ docker pull dastapov/hledger
$ make -C /usr/ports/openbsd-wip/productivity/hledger install
$ nix-env -f https://github.com/NixOS/nixpkgs/archive/2f9a9064.tar.gz -iA hledger hledger-web hledger-ui 
$ pacman -S hledger hledger-ui hledger-web
$ sudo layman -a haskell && sudo emerge hledger hledger-ui hledger-web
$ xbps-install -S hledger hledger-ui hledger-web
```

Freshest: [build from source](download.html#building-from-source):
 
1. $ apt install libtinfo-dev [or equivalent](download.html#ensure-c-libraries-are-installed)
2. [check UTF-8 locale](download.html#ensure-your-system-locale-supports-utf-8)
3. then one of:
   <pre>
   $ curl -sO https://raw.githubusercontent.com/simonmichael/hledger/master/hledger-install/hledger-install.sh; less hledger-install.sh; bash hledger-install.sh
   $ <a href="https://haskellstack.org">stack</a> update; stack install --resolver=lts hledger-lib-1.18.1 hledger-1.18.1 hledger-ui-1.18.1 hledger-web-1.18.1 --silent
   $ <a href="https://www.haskell.org/cabal/#install-upgrade">cabal</a> update; cabal install hledger-1.18.1 hledger-web-1.18.1 hledger-ui-1.18.1
   $ git clone https://github.com/simonmichael/hledger; cd hledger; stack install  # super fresh
   </pre>

<a name="transactions"></a>
## Enter some transactions

Run the add command for assisted data entry ([tutorial](add.html)):

```shell
$ hledger add
...
Date [2020-07-19]: ...
```

Or run hledger-web, and when the web browser opens, press a to add
([tutorial](web.html)):

```shell
$ hledger-web
...
Opening web browser...
```

Or using a [text editor](editors.html), record transactions in
~/.hledger.journal or $LEDGER_FILE like so:

```journal
 ; Optional account declarations, good for non-english names and display order:
 account assets       ; type:A
 account assets:cash  ; type:C
 account liabilities  ; type:L
 account equity       ; type:E
 account revenues     ; type:R
 account expenses     ; type:X

 ; A transaction. Usually the first one is to set opening balances:
 2020-01-01 opening balances on january 1st
     assets:checking         $1000  ; a posting, increasing assets:checking's balance by $1000
     assets:cash              $100
     liabilities                $0
     equity                 $-1100  ; each transaction must sum to zero

 2020-03-05 client payment
     assets:checking         $2000
     revenues:consulting    $-2000  ; revenues/liabilities/equity normally appear negative

 2020-03-20 Sprouts
     expenses:food:groceries  $100
     assets:cash               $40
     assets:checking                ; a missing amount will be inferred ($-140 here)
```

<a name="reports"></a>
## Run some reports

```shell
$ hledger accounts   # account names declared and used, as a list
assets
assets:cash
assets:checking
liabilities
equity
revenues
revenues:consulting
expenses
expenses:food:groceries

$ hledger accounts --tree   # accounts are actually a hierarchy
assets
  cash
  checking
equity
expenses
  food
    groceries
liabilities
revenues
  consulting

$ hledger balancesheet    # what do I own and owe ?
Balance Sheet 2020-03-20

                 || 2020-03-20 
=================++============
 Assets          ||            
-----------------++------------
 assets:cash     ||       $140 
 assets:checking ||      $2860 
-----------------++------------
                 ||      $3000 
=================++============
 Liabilities     ||            
-----------------++------------
-----------------++------------
                 ||            
=================++============
 Net:            ||      $3000 

$ hledger aregister checking   # or hledger register checking
Transactions in assets:checking and subaccounts:
2020-01-01 opening balances on january..  as:cash, equity                        $1000         $1000
2020-03-05 client payment                 re:consulting                          $2000         $3000
2020-03-20 Sprouts                        ex:fo:groceries, as:cash               $-140         $2860

$ hledger incomestatement --monthly --depth 2    # where is it coming from and going to ?
Income Statement 2020-01-01..2020-03-20

                     || Jan  Feb    Mar 
=====================++=================
 Revenues            ||                 
---------------------++-----------------
 revenues:consulting ||   0    0  $2000 
---------------------++-----------------
                     ||   0    0  $2000 
=====================++=================
 Expenses            ||                 
---------------------++-----------------
 expenses:food       ||   0    0   $100 
---------------------++-----------------
                     ||   0    0   $100 
=====================++=================
 Net:                ||   0    0  $1900 

$ hledger-ui
...

$ hledger
-------------------------------------------------------------------------------
hledger 1.18.99
Usage: hledger COMMAND [OPTIONS] [-- ADDONCMDOPTIONS]
Commands (+ addons found in $PATH):
...

$ hledger help
Please choose a manual by typing "hledger help MANUAL" (any substring is ok).
A viewer (info, man, a pager, or stdout) will be auto-selected,
or type "hledger help -h" to see options. Manuals available:

 hledger hledger-ui hledger-web journal csv timeclock timedot
```

<a name="files"></a>
## File management

Many folks use a dedicated directory, and a journal file for each year:

```shell
$ mkdir ~/finance
$ mv ~/.hledger.journal ~/finance/2020.journal   # move old file here if you had one
```

To make hledger use this file without needing the -f option, set LEDGER_FILE.
Eg if you use bash:

```shell
$ echo "export LEDGER_FILE=~/finance/2020.journal" >> ~/.bashrc; source ~/.bashrc
```

Or, you can keep a ~/.hledger.journal file that points to the main file:

```journal
include ~/finance/2020.journal
```

Version control is optional, and useful. Eg with git:

```shell
$ cd ~/finance
$ git init
$ git add 2020.journal
$ git commit -am 'initial commit'
```

Don't forget to also keep *backups*!

<a name="csv"></a>
## Import CSV

Download one or more CSV files containing transaction info, then create a 
[csv rules file](convert-csv-files.html) for each. Eg if SomeBank.csv looks
like:

```csv
"Date","Note","Amount"
"2020/3/22","DEPOSIT","50.00"
"2020/3/23","ATM WITHDRAWAL","-10.00"
```

Create SomeBank.csv.rules containing rules like:

```rules
skip 1
fields date, description, amount
currency $
account1 assets:checking
account2 expenses:misc
if DEPOSIT
 account2 revenues:misc
if ATM WITHDRAWAL
 account2 assets:cash
```

Check the csv conversion looks ok:

```shell
$ hledger -f SomeBank.csv print
2020-03-22 DEPOSIT
    assets:checking          $50.00
    revenues:misc           $-50.00

2020-03-23 ATM WITHDRAWAL
    assets:checking         $-10.00
    assets:cash              $10.00
```

You can run reports directly from the csv, but I like to import it into the
main journal, keeping things in one place. The import command ignores csv
records it has seen before, saving the latest dates in .latest.SomeBank.csv.
This works for most csv files - you can try a dry run first:

```shell
$ hledger import *.csv --dry-run
; would import 2 new transactions from SomeBank.csv:

2020-03-22 DEPOSIT
    assets:checking          $50.00
    revenues:misc           $-50.00

2020-03-23 ATM WITHDRAWAL
    assets:checking         $-10.00
    assets:cash              $10.00

$ hledger import *.csv 
imported 2 new transactions from SomeBank.csv
$ hledger import *.csv
no new transactions found in SomeBank.csv
```

Now to commit the new rules file and changed journal file:

```shell
$ git add SomeBank.csv.rules
$ git commit -m 'SomeBank csv rules' SomeBank.csv.rules
$ git commit -m 'txns' 2020.journal
```

In the above workflow, the journal file is permanent and downloaded csv files
are temporary. Some folks ([Full-fledged hledger], [hledger-flow]) prefer to
instead commit all csv files and regenerate the journal file.

[Full-fledged hledger]: https://github.com/adept/full-fledged-hledger
[hledger-flow]: https://github.com/apauley/hledger-flow
