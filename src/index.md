<!-- <img id="coins" src="images/coins2-248.png" style="width:120px; margin:2em 1em; float:left;" /> -->
<!-- <img id="coins" src="images/coins2-248.png" style="width:120px; margin:2em 1em; float:right;" /> -->
<link rel="stylesheet" href="https://fonts.googleapis.com/css2?family=Gabarito">
<style>
.content h1 { 
  font-family: Gabarito;
  font-size: 6em;
  white-space:normal;
  text-align:center;
  margin: 0.5em 0 0;
  display:block;
}
.responsive-image {
  width: 25%;
  margin: 1em 1em;
  float: right;
}
@media (max-width: 500px) {  /* typical breakpoint for tablets/phones */
  .content h1 { font-size:20vw; }  /* fit "hledger" within a small screen */
  .responsive-image {  /* put the image on its own line */
      float: none;
      display: block;
      width: 50%;
      margin: 1em auto;
  }
}
</style>


<img id="coins" class="responsive-image" src="images/coins2-248.png" />
<div id="heading">

# hledger

<div id="tagline" style="margin-bottom:1em;">
Robust, friendly, fast<br> plain text accounting software
</div>

</div>

<div id="quotes">

*I discovered hledger last week and I hope it's not too early to describe it as life-changing. thank you for building this software --gnidan*

*I have massively enjoyed using hledger and am incredibly impressed with how active the development and support for it are! --Pixelized*

*I completed my first year of bookkeeping for both business and personal expenses with hledger last year. I can honestly say that I observed zero bugs with the software. It has worked seamlessly. --csgagnon*

*I've been using hledger for managing my personal finances for a few years now, and I'm really happy with it! --guivho*

*hledger focuses on testing and correctness alongside comprehensive documentation, giving me a much better picture of its capabilities.
I dove in and spent a week entering a year and a half of data, which was enough to convince me.
hledger is truly an amazing tool. I can’t count how many times I’ve thought wouldn’t it be nice if… only to realize it can already do that ... 
The attention to detail is marvelous. --Shiv J. M.*

[![Github repo](https://img.shields.io/github/stars/simonmichael/hledger.svg?logo=GitHub&label=Github+stars&color=brightgreen)](https://github.com/simonmichael/hledger)
[![GitHub downloads, latest](https://img.shields.io/github/downloads/simonmichael/hledger/latest/total?logo=GitHub&label=Github+downloads,+latest&color=brightgreen)](https://github.com/simonmichael/hledger/releases/latest)
[![GitHub downloads](https://img.shields.io/github/downloads/simonmichael/hledger/total?logo=GitHub&label=Github+downloads)](https://github.com/simonmichael/hledger/releases)
[![Homebrew](https://img.shields.io/homebrew/installs/dy/hledger?color=brightgreen&label=homebrew&logo=homebrew)](https://formulae.brew.sh/formula/hledger)
[![Hackage](https://img.shields.io/hackage/v/hledger.svg?logo=Haskell&label=Hackage&colorB=brightgreen)](https://hackage.haskell.org/package/hledger)
[![Stackage LTS](https://repology.org/badge/version-for-repo/stackage_lts/hledger.svg?logo=Haskell&header=Stackage+LTS)](https://www.stackage.org/lts/package/hledger)
<!--
[![Stackage Nightly](https://repology.org/badge/version-for-repo/stackage_nightly/hledger.svg?header=Stackage+Nightly)](https://www.stackage.org/nightly/package/hledger)
  [![CI binaries-linux-x64](https://github.com/simonmichael/hledger/workflows/binaries-linux-x64/badge.svg)](https://github.com/simonmichael/hledger/actions/workflows/binaries-linux-x64.yml)
    [![CI binaries-mac-x64](https://github.com/simonmichael/hledger/workflows/binaries-mac-x64/badge.svg)](https://github.com/simonmichael/hledger/actions/workflows/binaries-mac-x64.yml)
  [![CI binaries-mac-arm64](https://github.com/simonmichael/hledger/workflows/binaries-mac-arm64/badge.svg)](https://github.com/simonmichael/hledger/actions/workflows/binaries-mac-arm64.yml)
[![CI binaries-windows-x64](https://github.com/simonmichael/hledger/workflows/binaries-windows-x64/badge.svg)](https://github.com/simonmichael/hledger/actions/workflows/binaries-windows-x64.yml)
[![Stackage Nightly](https://repology.org/badge/version-for-repo/stackage_nightly/hledger.svg?header=Stackage+Nightly)](https://www.stackage.org/nightly/package/hledger)
![GitHub downloads, linux-x64](https://img.shields.io/github/downloads/simonmichael/hledger/hledger-linux-x64.zip?label=Github+downloads)
![GitHub downloads, latest, linux-x64](https://img.shields.io/github/downloads/simonmichael/hledger/latest/hledger-linux-x64.zip?label=Github+downloads,+latest)
![GitHub downloads, mac-x64](https://img.shields.io/github/downloads/simonmichael/hledger/hledger-mac-x64.zip?label=Github+downloads)
![GitHub downloads, latest, mac-x64](https://img.shields.io/github/downloads/simonmichael/hledger/latest/hledger-mac-x64.zip?label=Github+downloads,+latest)
![GitHub downloads, windows-x64](https://img.shields.io/github/downloads/simonmichael/hledger/hledger-windows-x64.zip?label=Github+downloads)
![GitHub downloads, latest, windows-x64](https://img.shields.io/github/downloads/simonmichael/hledger/latest/hledger-windows-x64.zip?label=Github+downloads,+latest)
![GitHub downloads, latest](https://img.shields.io/github/downloads/simonmichael/hledger/latest/hledger-linux-x64.zip?label=Github_downloads,_latest,_linux-x64)
![GitHub downloads, latest](https://img.shields.io/github/downloads/simonmichael/hledger/latest/hledger-mac-x64.zip?label=Github_downloads,_latest,_mac-x64)
![GitHub downloads, latest](https://img.shields.io/github/downloads/simonmichael/hledger/latest/hledger-windows-x64.zip?label=Github_downloads,_latest,_windows-x64)
-->
<!--
[Features](#hledger-is) |
[Quick start](#quick-start) |
[Other user interfaces](#other-user-interfaces) |
[Time tracking](#time-tracking) |
[CSV import](#csv-import) |
[More examples](#more-examples) |
[Site tips](#site-tips) |
-->
</div>

<div class=pagetoc style="margin-top:2.5em">

<!-- toc -->
</div>

## hledger is...

- free GPLv3+ accounting software that runs on unix, mac, windows, and the web
- based on readable, version-controllable, future-proof plain text files
- the most user friendly [plain text accounting](https://plaintextaccounting.org) app
- interoperable with [Ledger](ledger.md), [Beancount](beancount.md), [Fava](https://beancount.github.io/fava/), [Paisa](https://paisa.fyi), ...
- fast, lightweight, and dependable (we pay $50 for [regression reports/fixes](REGRESSIONS.md))
- local, not cloud-based (your private financial data remains under your control)
- free from vendor lock-in
- shipped with [command line](basics.md), [terminal](ui.md), and [web](web.md) UIs <!--, [JSON](hledger-web.md#json-api) and [Haskell](https://hackage.haskell.org/package/hledger-lib) -->
- good at importing CSV from banks and other financial institutions
- good for tracking money, investments, time, or any countable commodity
- good for learning  more about [double entry bookkeeping](accounting.md)
- comfortable for technical users, also usable by non-techies
  (command line skills are useful but not essential)
- automatable and [scripting-friendly](scripting.md)
- built with the powerful, high assurance [Haskell language](https://www.haskell.org/)
- actively used, developed and supported by [Simon Michael](https://joyful.com) and [contributors](CREDITS.md) since 2007
- strengthened by community feedback and [funding](sponsor.md)
<!--
  [command lines](https://tutorial.djangogirls.org/en/intro_to_command_line/), 
  [text editors](https://www.codementor.io/@kmcgillivray/introduction-to-text-editors-and-the-command-line-j0upqatas) and 
  [version control](https://betterexplained.com/articles/a-visual-guide-to-version-control/) 
-->

More about [Features](features.md).

Welcome!
Don't hesitate to [ask questions](support.md).
Or explore the documentation links in the sidebar (if not visible, click/tap the icon at top left).

## Quick start

This plain text accounting stuff is both useful and more fun than it sounds - care to give it a try ?
Read on... or see [Get&nbsp;Started](start.md) for more detailed tutorials.

### 1. Install hledger

The [Install](install.md) page shows how to get an up-to-date version quickly.

### 2. Record transactions

hledger reads transactions from a [journal file](hledger.md#input) -
usually `~/.hledger.journal`, or `C:\Users\USER\.hledger.journal`, or whatever you've set LEDGER_FILE to.
<!-- It uses [journal format](hledger.md#journal). -->

Transactions are recorded there, like this:

```journal
2025-04-10 MyGas
  Expenses:Automotive              $9.19
  Liabilities:Acme Credit Card
```

A date and description are followed by several indented account postings, with two or more spaces between each account name and its amount.

Account names are flexible and may contain spaces. A colon indicates a subaccount.

The amounts in a transaction must add up to zero. If you leave one amount blank, it will be calculated automatically.

A positive amount means "added to this account", a negative amount means "removed from this account" ([debit and credit](https://plaintextaccounting.org/FAQ#where-are-debits-and-credits)).

Here are the parts in more detail:

[![a hledger transaction entry, showing names of parts](https://raw.githubusercontent.com/RobertNielsen1/hledger/master/hledger%20basic%20transaction%20--%20terms.png)](https://github.com/RobertNielsen1/hledger/blob/master/hledger%20basic%20transaction%20--%20terms.png)

Here's the start of a journal, with comments.
To follow along with these examples, you can save this as your journal file.
You can use a text editor, 
or you could run [hledger add](hledger.md#add) or [hledger web](hledger.md#web) and record these transactions interactively (no need to enter the comments).

```journal

2023-01-01 opening balances            ; <- First transaction sets starting balances.
    assets:bank:checking        $1000  ; <- Account names can be anything.
    assets:bank:savings         $2000  ; <- Colons indicate subaccounts.
    assets:cash                  $100  ; <- 2+ spaces are required before the amount.
    liabilities:credit card      $-50  ; <- A debt; these are negative.
    equity:opening/closing     $-3050  ; <- Starting balances come from equity.
                                       ;    Equity is also usually negative.
                                       ;    (Reports can show as positive when needed.)

2023-02-01 GOODWORKS CORP              ; <- Date order is recommended but optional.
    assets:bank:checking       $1000
    income:salary                      ; <- $-1000 is inferred here to balance the txn.
                                       ;    Income amounts are negative.

2023-02-15 market
    expenses:food             $50
    assets:cash                        ; <- $-50 is inferred here.
```
<!--
(It it looks verbose, note we often use auto-completion, or generate entries automatically from bank data.
You can also use shorter account names or aliases.)
-->


### 3. Add declarations

The above is all you need to get started, but we usually add some declarations at the top of the file, to allow more error checking:

**Commodities**

Declare your currencies/commodities, and their display style:

```

commodity $1000.00
```

or it could be:

```

commodity $ 1.000,00
```

Now you can check that all amounts have a valid commodity symbol:
```cli
$ hledger check commodities
$
```

**Accounts**

It's good to declare at least your top level accounts and their [type](hledger.md#account-types),
to help reports show the right accounts. Like this:

```journal

account assets                   ; type:A
account liabilities              ; type:L
account equity                   ; type:E
account income                   ; type:R
account expenses                 ; type:X

account assets:bank              ; type:C
account assets:cash              ; type:C

account equity:conversion        ; type:V
```
Or in your preferred language:
[ar](https://github.com/simonmichael/hledger/blob/master/examples/i18n/ar.journal)
[da](https://github.com/simonmichael/hledger/blob/master/examples/i18n/da.journal)
[de](https://github.com/simonmichael/hledger/blob/master/examples/i18n/de.journal)
[en](https://github.com/simonmichael/hledger/blob/master/examples/i18n/en.journal)
[es](https://github.com/simonmichael/hledger/blob/master/examples/i18n/es.journal)
[fr](https://github.com/simonmichael/hledger/blob/master/examples/i18n/fr.journal)
[ja](https://github.com/simonmichael/hledger/blob/master/examples/i18n/ja.journal)
[ko](https://github.com/simonmichael/hledger/blob/master/examples/i18n/ko.journal)
[no](https://github.com/simonmichael/hledger/blob/master/examples/i18n/no.journal)
[pt](https://github.com/simonmichael/hledger/blob/master/examples/i18n/pt.journal)
[se](https://github.com/simonmichael/hledger/blob/master/examples/i18n/se.journal)
[zh](https://github.com/simonmichael/hledger/blob/master/examples/i18n/zh.journal)
...

Declaring accounts also sets their preferred [display order](hledger.md#account-display-order) in reports.

For stronger error checking, you can declare all account names, not just the top-level ones:

```journal

account assets                   ; type:A
account assets:bank              ; type:C
account assets:bank:checking
account assets:bank:savings
account assets:cash              ; type:C

account liabilities              ; type:L
account liabilities:credit card

account equity                   ; type:E
account equity:conversion        ; type:V
account equity:opening/closing

account income                   ; type:R
account income:salary
account income:gifts

account expenses                 ; type:X
account expenses:rent
account expenses:food
account expenses:gifts
```

Then you can check that all transactions use valid account names:
```cli
$ hledger check accounts
$
```

You can also enable [strict mode](hledger.md#strict-mode), which checks commodity and account names,
by adding `-s`/`--strict` to any command (or your [config file](hledger.md#config-file)).

### 4. Run reports

Now you can see reports, such as...

A list of accounts, showing the hierarchy and types detected:
```cli
$ hledger accounts --tree --types
assets               ; type: A
  bank               ; type: C
    checking         ; type: C
    savings          ; type: C
  cash               ; type: C
liabilities          ; type: L
  credit card        ; type: L
equity               ; type: E
  conversion         ; type: V
  opening/closing    ; type: E
income               ; type: R
  salary             ; type: R
  gifts              ; type: R
expenses             ; type: X
  rent               ; type: X
  food               ; type: X
  gifts              ; type: X
```

A balance sheet, showing what you own and owe:
```cli
$ hledger bs
Balance Sheet 2023-02-15

                         || 2023-02-15 
=========================++============
 Assets                  ||            
-------------------------++------------
 assets:bank:checking    ||      $2000 
 assets:bank:savings     ||      $2000 
 assets:cash             ||        $50 
-------------------------++------------
                         ||      $4050 
=========================++============
 Liabilities             ||            
-------------------------++------------
 liabilities:credit card ||        $50 
-------------------------++------------
                         ||        $50 
=========================++============
 Net:                    ||      $4000 
```

An income statement (AKA profit and loss report), showing what you received and spent:
```cli
$ hledger is -MTA
Income Statement 2023-01-01..2023-02-28

               || Jan    Feb    Total  Average 
===============++==============================
 Revenues      ||                              
---------------++------------------------------
 income:salary ||   0  $1000    $1000     $500 
---------------++------------------------------
               ||   0  $1000    $1000     $500 
===============++==============================
 Expenses      ||                              
---------------++------------------------------
 expenses:food ||   0    $50      $50      $25 
---------------++------------------------------
               ||   0    $50      $50      $25 
===============++==============================
 Net:          ||   0   $950     $950     $475 
```

An account register, showing the transactions and running balance in a particular account:
```cli
$ hledger aregister checking
Transactions in assets:bank:checking and subaccounts:
2023-01-01 opening balances     as:ba:savings, as:..         $1000         $1000
2023-02-01 GOODWORKS CORP       in:salary                    $1000         $2000
```

Congratulations, you can now begin to track your daily finances with hledger!

[Get&nbsp;Started](start.md) has more detailed help.
If you are new to bookkeeping, accounting, or plain text accounting, know that these are valuable skills, which take time to master.
With practice, more doc reading, and [support/discussion](support.md), you will gradually
- build up a set of account names best suited to you
- learn the proper journal entries for your real-world transactions
- learn how to produce the reports most useful for you
- and learn new workflows that you may find more convenient.
<!-- - learn how to prevent, detect and fix errors quickly -->

## Other user interfaces

Instead of using the command line, you can use the [`ui`](ui.md) or [`web`](web.md) interfaces
(or [`repl`](hledger.md#repl), [`add`](hledger.md#add), [`iadd`](scripts.md#iadd), ...)

<a href="/images/cli-green-bs-reg.png" class="highslide" onclick="return hs.expand(this, { captionText:'The hledger command line interface.' })"><img src="images/cli-green-bs-reg.png" height="190"></a>
<a href="/images/home-ui-3.png"        class="highslide" onclick="return hs.expand(this, { captionText:'The hledger-ui text user interface.' })"><img src="images/home-ui-3.png"        height="190"></a>
<a href="/images/web-bcexample.png"    class="highslide" onclick="return hs.expand(this, { captionText:'The hledger-web web user interface.' })"><img src="images/web-bcexample.png"    height="190"></a>

## Time tracking

hledger can also read time logs, in [timeclock](hledger.md#timeclock) format:

```timeclock

i 2023/03/27 09:00:00 projects:a
o 2023/03/27 17:00:34
i 2023/03/31 22:21:45 personal:reading:online
o 2023/04/01 02:00:34
```
```
$ hledger -f 2023.timeclock register -D
2023-03-27   projects:a                         8.01h         8.01h
2023-03-31   personal:reading:online            1.64h         9.65h
2023-04-01   personal:reading:online            2.01h        11.66h
```

or in [timedot](hledger.md#timedot) format:

```timedot

2023/2/1
biz:research  .... ..
fos:hledger   .... .... ....

2023/2/2
fos:ledger    .
fos:haskell   ..
biz:client1   .... ....
```
```
$ hledger -f 2023.timedot balance -tDTA  # tree, Daily, Total, Average
Balance changes in 2023-02-01..2023-02-02:

            || 2023-02-01  2023-02-02    Total  Average 
============++==========================================
 biz        ||       1.50        2.00     3.50     1.75 
   client1  ||          0        2.00     2.00     1.00 
   research ||       1.50           0     1.50     0.75 
 fos        ||       3.00        0.75     3.75     1.88 
   haskell  ||          0        0.50     0.50     0.25 
   hledger  ||       3.00           0     3.00     1.50 
   ledger   ||          0        0.25     0.25     0.12 
------------++------------------------------------------
            ||       4.50        2.75     7.25     3.62 
```

## CSV import

Most banks and financial institutions provide data in CSV format.
hledger can read from any [CSV](hledger.md#csv) (or SSV, TSV, or other character-separated) file representing transactions. Eg:

```csv

"Date","Notes","Amount"
"2023/2/22","DEPOSIT","50.00"
"2023/2/23","TRANSFER TO SAVINGS","-10.00"
```
```rules

# bank.csv.rules  # this rules file tells hledger how to read bank.csv
skip 1
fields date, description, amount
currency $
account1 assets:bank:checking

if WHOLE FOODS
 account2 expenses:food

if (TO|FROM) SAVINGS
 account2 assets:bank:savings
```

```cli
$ hledger -f bank.csv print
2023-02-22 DEPOSIT
    assets:bank:checking          $50.00
    income:unknown               $-50.00

2023-02-23 TRANSFER TO SAVINGS
    assets:bank:checking         $-10.00
    assets:bank:savings           $10.00

```

The [import](hledger.md#import) command detects just the new transactions, and adds them to the journal:
```cli
$ hledger import bank.csv
imported 2 new transactions from bank.csv
```
```cli
$ hledger import bank.csv
no new transactions found in bank.csv
```
```cli
$ hledger aregister checking
2023-01-01 opening balances     as:ba:savings, as:..      $1000.00      $1000.00
2023-02-01 GOODWORKS CORP       in:salary                 $1000.00      $2000.00
2023-02-22 DEPOSIT              in:unknown                  $50.00      $2050.00
2023-02-23 TRANSFER TO SAVINGS  as:ba:savings              $-10.00      $2040.00
```

More: [Tutorial: Import CSV data](import-csv.md)


## More examples...

- [Charts and Graphs](charts.md)
- [HTML reports](report-examples.md#income-statement-2012-01-012014-10-11)
- [Interop with other software](cookbook.md#other-software)
- [Investing and trading](cookbook#investing-and-trading)
- [Mobile apps](mobile.md)
- [Scripts](scripts.md) and [Scripting](scripting.md)
- [Workflows](workflows.md)
- The hledger [Cookbook](cookbook.md)
- The [PTA Cookbook](https://plaintextaccounting.org/Cookbook)

## Site tips

- Use the horizontal lines icon at top left to toggle the sidebar.
- Use the paintbrush icon to change theme.
- Use the magnifying-glass icon to search.
- [Access keys](https://en.wikipedia.org/wiki/Access_key#Access_in_different_browsers) are also available:\
  `s` toggle sidebar, `t` theme, `/` search,\
  `1` home page, `2` recent changes, `<` previous page, `>` next page.


<style>

#grabber {
  text-align:center;
  padding:1em 1em 0 1em;
/*  border:2px solid limegreen; */
  border-radius:8px; 
  margin:1em;
}
#grabber .heading {
  /*font-style: italic; */
  font-size:x-large;
  font-weight:bold;
}

/* 
.content h2 { 
  text-align:center;
  font-size: 2em;
  margin-top:2em; 
}
*/

#tagline {
  font-size:xx-large;
  font-style:italic; 
  text-align:center;
  margin:0 0 0.5em;
}

#quotes {
  width: 80%;
  margin: auto;
  text-align:center;
  <!-- font-size:xx-large; -->
  <!-- font-style:italic;  -->
  <!-- margin:0 0 0.5em; -->
}

#leadingword {
  font-weight:bold;
  font-style:italic;
  font-size:x-large;
}

#screenshots td {
  border: 0 !important;
  padding: 0 2em 0 0;
}

code::first-line {
  font-weight:bold;
}
</style>
