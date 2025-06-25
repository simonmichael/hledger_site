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
Don't hesitate to [ask questions](support.md), or explore the [Docs](doc.md).

This plain text accounting stuff is both useful and more fun than it sounds - care to give it a try ?
The [Install](install.md) page shows how to get an up-to-date version quickly.

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
