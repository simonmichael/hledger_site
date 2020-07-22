<!-- 
The TL;DR intro to hledger.           -*- fill-column:78; -*-
Maintained as a .md file but intended to be read as rendered HTML.
-->
<style>
/* mimic old-school plain text docs a bit. */

body, p, h1, h2, h3, h4, h5, h6, pre {
    font-family: SFMono-Regular,Menlo,Monaco,Consolas,"Liberation Mono","Courier New",Courier,monospace;
    color: black;
}
/* workaround for some of those fonts causing numbered list labels to overflow */
li::marker { font-size: small; }
body { padding: 2%; }
body, p {
    line-height: normal;
}
p { margin-bottom: 1em; max-width:55em; }
/* !important makes it easier to neutralise the complicated sphinx styles */
pre, div[class^="highlight"] {
    line-height: normal !important;
    font-size: inherit !important;
    border: none !important;
    overflow:auto !important;
}
.highlight { background:none; }
h1 { padding:0; font-size:2em; }
h2 { margin-top:2em; font-size:1em; }
a { text-decoration:underline; }
ol ul { padding-bottom:1em; }
a:visited { color:black; }
/* a:hover { color:#9B59B6; } */
a:active { color:red; }
</style>


# hledger essentials

Welcome! You've found the
<a href="https://github.com/simonmichael/hledger_site/commits/master/essentials.md">newest</a>
intro to hledger. This one aims to distill just the most needed practical info
to help you get productive as efficiently as possible. When you want more
detail, follow links to the [full website] (and particularly the manuals,
which describe everything hledger does: [hledger], [hledger-ui],
[hledger-web], [journal], [csv], [timeclock], [timedot]).

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

- reads transactions from a flexible, future-proof, version-controllable [plain text format][journal]
- or [CSV files][csv] from any financial institution
- produces precise [multiperiod] financial reports as [text/HTML/CSV/JSON/SQL][output-format]<br> 
  ([balance sheet], [income statement], [cashflow], [budget], [roi],
  [transactions], [time], [forecast]...)
- unlimited account hierarchy with [summarising], [aliasing], [pivoting]
- unlimited currencies/commodities, with cost/market [valuation]
- use via [CLI], [TUI], [WUI], [JSON API] or [Haskell library]
- easy to [script and extend]
- user-friendly, well documented, robust
- scales smoothly from simple, easy accounting needs to complex ones.

[output-format]: hledger.html#output-format
[balance sheet]: hledger.html#balancesheet
[income statement]: hledger.html#incomestatement
[cashflow]: hledger.html#cashflow
[budget]: hledger.html#budget-report
[roi]: hledger.html#roi
[transactions]: hledger.html#aregister
[time]: timedot.html
[forecast]: journal.html#periodic-transactions
[multiperiod]: hledger.html#multicolumn-balance-report
[multiple currencies]: journal.html#declaring-commodities
[valuation]: hledger.html#valuation
[summarising]: hledger.html#depth-limiting
[aliasing]: journal.html#rewriting-accounts
[pivoting]: hledger.html#pivoting
[CLI]: hledger.html
[TUI]: ui.html
[WUI]: web.html
[JSON API]: hledger-web.html#json-api
[Haskell library]: https://hackage.haskell.org/package/hledger-lib
[script and extend]: scripting.html


<a name="workflow"></a>
## How do I use it ?

<!-- Here's the most common getting started/work flow for hledger users: -->
At the start:

1. [Install](#install) one or more of the hledger tools
2. [Set up a journal](#setup), and maybe version control

On a regular basis (eg daily, can be <5m):

3. [Enter transactions](#transactions) manually and/or
4. [Import transactions](#import) from banks' CSV
5. [Reconcile](#reconcile) to catch mistakes

Whenever you like:

6. [Run reports](#reports) to answer questions and gain insight
7. Refine account names, CSV rules etc. to improve your reports and efficiency.

Knowing some [double entry accounting] will help you get the most from hledger,
but you can do fine just by following the examples below. You'll find your
bookkeeping/accounting skills improve naturally (and [help] is available).

[double entry accounting]: https://hledger.org/accounting.html#accounting-links
[help]: https://hledger.org/#help-feedback


<a name="install"></a>
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


<a name="setup"></a>
## Set up a journal

The [journal file](journal.html) is a plain text file where transactions are
recorded. By default it is ~/.hledger.journal, and the add command or web add
form described below will create it automatically, so actually you don't need
to do anything here.

But here are some common changes people make sooner or later, so why not now:

- A dedicated folder, to consolidate financial files and make version control
  and backups easier:

  ```shell
  $ mkdir ~/finance
  $ cd ~/finance
  ```

- A separate journal file for each year, for performance and data
  compartmentalisation:

  ```shell
  $ touch 2020.journal
  ```

- A [LEDGER_FILE](hledger.html#environment) environment variable, so you won't
  have to add -f FILE to every command:

  ```shell
  $ echo "export LEDGER_FILE=~/finance/2020.journal" >> ~/.bashrc
  $ source ~/.bashrc
  ```

- Some optional [directives](journal.html#directives), useful especially with
  non-english account names (replace the account names below with the names
  you will be using):

  ```shell
  $ cat > 2020.journal

  ; Declare top level accounts, setting their types and display order
  account assets      ; type:A, things I own
  account liabilities ; type:L, things I owe
  account equity      ; type:E, net worth, A - L
  account revenues    ; type:R, money sources
  account expenses    ; type:X, money sinks

  ; Declare commodities/currencies and their decimal mark, digit grouping,
  ; number of decimal places..
  commodity $1000.00
  commodity 1.000,00 EUR
  
  <CTRL-D> (paste the command & text above into the terminal, then press control-d)
  ```

- Version control, for tracking changes:

  ```shell
  $ git init
  $ git add 2020.journal
  $ git commit 2020.journal -m 'start journal for 2020'
  ```

- Remember to also keep *backups*.


<a name="transactions"></a>
## Enter transactions

Run the add command for assisted data entry in the terminal ([tutorial](add.html)):

```shell
$ hledger add
...
Date [2020-07-19]: ...
```

Or run hledger-web and when the web browser opens, press a to add
([tutorial](web.html)):

```shell
$ hledger-web
...
Opening web browser...
```

Or using a [text editor](editors.html), add transactions to
[your journal file](essentials.html#setup) like so:

```journal
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

As shown above, make the first transaction a dummy one that sets the opening
balances of your asset & liability accounts on some start date. hledger will
show accurate real-world account balances from this date onward, as long as
you record the subsequent transactions.

To make things easy on yourself, you can pick a very recent start date, like
today or last monday. Prioritise recording the transactions that happen after
this date. (Tip: the more often you do this, the easier it is.)

Then, as your time and financial records and desire for historical reports
allow, you can add older transactions. As you do, you'll need to adjust the
opening balances transaction, moving it back in time. Perhaps focus on one
account at a time, each with its own opening balances transaction if
necessary.


<a name="import"></a>
## Import transactions

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

You can run reports directly from the csv, but I like to import the new
transactions into the main journal, keeping things in one place. The import
command ignores csv records it has seen before, saving the latest dates in
.latest.SomeBank.csv. This works for most csv files - you can try a dry run
first:

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


<a name="reconcile"></a>
## Reconcile

After entering or importing transactions, it's important to check for mistakes
(yours or others'), by comparing your reports with reality - your wallet,
statements, online balances etc.
See [Reconciling](hledger.html#reconciling).

<a name="reports"></a>
## Run reports

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

