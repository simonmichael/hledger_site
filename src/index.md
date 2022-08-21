<!-- stylesheet at bottom -->
<img id="coins" src="images/coins2-248.png" style="width:120px; margin:2em 1em; float:left;" />
<img id="coins" src="images/coins2-248.png" style="width:120px; margin:2em 1em; float:right;" />

# hledger
<!-- 
Tagline
https://www.stephendiehl.com/posts/marketing.html#persuasion-and-decision-makers :
1. It is memorable
2. It includes a key benefit
3. It differentiates
4. It imparts positivity
-->
<div id="tagline">
Fast, accurate, robust<br>
plain text accounting.
</div>

<div class=pagetoc>

<!-- toc -->
</div>

<!-- 
This page's verbosity oscillates. General goal: brief blurbs with links to more detail.
202208 version:
-->

## What is hledger?
<!--
- Fast, reliable, multicurrency double-entry accounting software that runs on unix, mac, windows, and the web.
- Free software, licensed under GNU GPLv3+.
- Developed and updated regularly since 2007
- Written in Haskell, with an extensive test suite and $100 bounties for regression reports.
-->

hledger is fast, reliable, free, multicurrency double-entry accounting software that runs on unix, mac, windows, and the web.
With it you can track money, investments, cryptocurrencies, time, or any other quantifiable commodity; with a future-proof plain text file format, version control for your changes, and without needing any cloud service or vendor.

Developed continuously since 2007, hledger is licensed under GNU GPLv3+, written in Haskell, and thoroughly tested, with $100 bounties for regressions reported.

[![github](https://img.shields.io/github/stars/simonmichael/hledger.svg?logo=GitHub&label=Github)](https://github.com/simonmichael/hledger)

## What does it look like?

Currently, three user interfaces are provided out of the box:
a powerful command line interface, a quick terminal UI, and a simple web UI.

<a href="/images/cli-green-bs-reg.png" class="highslide" onclick="return hs.expand(this, { captionText:'The hledger command line interface.' })"><img src="images/cli-green-bs-reg.png" height="190"></a>
<a href="/images/home-ui-3.png"        class="highslide" onclick="return hs.expand(this, { captionText:'The hledger-ui text user interface.' })"><img src="images/home-ui-3.png"        height="190"></a>
<a href="/images/web-bcexample.png"    class="highslide" onclick="return hs.expand(this, { captionText:'The hledger-web web user interface.' })"><img src="images/web-bcexample.png"    height="190"></a>

## Plain text accounting

Plain Text Accounting ([plaintextaccounting.org](https://plaintextaccounting.org)) means:

- Data is stored in plain text files, which can be easily read by humans, tracked with version control software such as Git, and maintained with text processing tools. This facilitates portability, longevity and privacy for your valuable accounting data.

- The data format is flexible and easy to write or generate, but hledger can check it and prevent many kinds of error. This, plus the auditability provided by version control, provides confidence in your data and reports.

- There is a fast command-line interface, which makes the tool flexible and easy to integrate into custom workflows.

hledger is a robust, largely compatible reimplementation of the original PTA app, Ledger CLI.

<!-- Why not Gnucash, Quicken, or Xero ? -->
<!-- Why not another PTA app ? -->

## What can you use it for?

### Tracking finances

For yourself, your business, or other organisations, track and report on:

- Assets and liabilities
- Billables, receivables and payables
- Revenues and expenses
- Cashflow
- Budgets
- Forecasts
- Investments
- Cryptocurrencies or NFTs

### Learning accounting

With the readable data format and lightweight software, hledger and PTA users tend to rapidly improve their understanding of double-entry bookkeeping and accounting.

Here's an example of the main `journal` format. This represents an accounting General Journal. Positive amounts are debits, negatives are credits, but all you need to remember is that each transaction is balanced, summing to zero. (One amount may optionally be omitted to save typing.)

```journal
# 2022.journal

2022-01-01 opening balances as of this date
    assets:bank:checking                $1000
    assets:bank:savings                 $2000
    assets:cash                          $100
    liabilities:creditcard               $-50
    equity:opening/closing balances

2022-02-01 GOODWORKS CORP
    assets:bank:checking           $1000
    income:salary                 $-1000

2022-02-15 market
    expenses:food             $50
    assets:cash

```

### Tracking time

Support for two time logging formats is built in: `timeclock` format, for precise time tracking:

```timeclock
# 2009.timeclock

i 2009/03/27 09:00:00 projects:a
o 2009/03/27 17:00:34
i 2009/03/31 22:21:45 personal:reading:online
o 2009/04/01 02:00:34
i 2009/04/02 09:00:00 projects:b
o 2009/04/02 17:00:34
```

And `timedot` format, for convenient approximate time tracking:

```timedot
# 2016.timedot

2016/2/1
fos:haskell   ....
biz:research  .
inc:client1   .... .... .... .... .... ....

2016/2/2
biz:research  .... ..
fos:hledger   .... .... ....
fos:ledger    0.25
fos:haskell   .5
inc:client1   2

```

<!--
Some other ideas:

- Eco accounting: tracking carbon footprint, tracking energy & resource usage
-->

## Why use hledger?

hledger's [General FAQ](faq.html) or the [plaintextaccounting.org](https://plaintextaccounting.org) site discuss the benefits of Plain Text Accounting.

Among the [PTA apps](https://plaintextaccounting.org/#pta-apps), why choose hledger ?
hledger has a strong focus on ease of use and practicality for day-to-day accounting.
It prioritises "just works" and accessible documentation,
and is actively maintained, with a lively [chat](support.html).
It supports most Ledger and Beancount features but omits some of the more complex ones
(value expression language, implicit lot matching).

Non-programmers will enjoy hledger's 
built-in financial statements, 
multi-period reports, 
choice of user interfaces, 
easy CSV import system
and general robustness.

Programmers may appreciate its
speed (25k txn/s on a macbook air m1), 
accuracy (up to 255 decimal places), 
reliability (1100+ tests, $100 bounty for regressions), 
powerful scriptability/embeddability
and clean statically-typed Haskell implementation.

Read more: [Why hledger ?](why.html)

And why might you not choose hledger ?
- If you need a rich GUI above all, you might prefer GnuCash, KMyMoney, or Quickbooks.
- If you like spreadsheets and don't have a ton of data, you might find those quicker.
- If you do a lot of advanced trading, or want to hack a lot with Python, also look at Beancount.
- If you want to mix more code in your financial data, or hack on C++, evaluate Ledger.
- If you like minimalist unix tools and think all the above are bloat, see [pta](https://mandoc.bsd.lv/pta).
- If you are mobile-only and don't need version control or flexibility, maybe a phone app will do.
- If you don't need version control or privacy, but do need friction-free collaboration with financial professionals and institutions,
you might prefer a commercial web-based system.

## How is the project organised and funded ?

I'm [Simon Michael](http://joyful.com), hledger project founder and PTA fan. Welcome! 

I have been building and relying on this project since 2007, 
together with [140+ contributors](CREDITS.html).

We hope you too will find hledger/PTA useful in transforming your relationship with money and time.
After enjoying some personal or organisational success with it,
you might want to become one of the generous [sponsors](sponsor.html)
to help sustain this work. 

<a name="help"></a>
<a name="help-feedback"></a>

## How to get started?

See [Getting Started](start.html).

## Site tips

The main site contents are listed in the sidebar to your left. If it's not visible, click/tap the horizontal-lines icon at top left, or press the `s` [access key].

You can search this site quickly for any topic by using the magnifying-glass icon at top left, or the `/` access key.

Other access keys are: `t` change theme, `1` home page, `2` recent changes, `<` previous page, `>` next page.


[access key]:                 https://en.wikipedia.org/wiki/Access_key#Access_in_different_browsers
[mail list]:                  https://groups.google.com/forum/#!forum/hledger
[Ledger CLI]:                 https://ledger-cli.org
[command line]:               hledger.html
[terminal]:                   ui.html
[web]:                        web.html
[balance sheet]:              hledger.html#balancesheet
[income statement]:           hledger.html#incomestatement
[cashflow]:                   hledger.html#cashflow
[depth limiting]:             hledger.html#depth-limiting
[output format]:              hledger.html#output-format
[download]:                   install.html#binary-packages
[build]:                      install.html#building-from-source
[command line]:               add.html
[terminal]:                   ui.html
[web]:                        web.html
[actively maintained]:        https://github.com/simonmichael/hledger/graphs/contributors
[releases]:                   https://hledger.org/release-notes
[plain text accounting]:      http://plaintextaccounting.org
[plain text accounting apps]: https://plaintextaccounting.org/#plain-text-accounting-apps
[version control system]:     https://en.wikipedia.org/wiki/Version_control
[git]:                        https://en.wikipedia.org/wiki/Git
[haskell]:                    https://wiki.haskell.org/Haskell
[double-entry accounting]:    https://en.wikipedia.org/wiki/Double-entry_bookkeeping
[install]:                    install.html
[ledgerlikes]:                https://plaintextaccounting.org/#plain-text-accounting-apps
[ledger]:                     https://www.ledger-cli.org
[ledger features]:            https://www.ledger-cli.org/features.html
[beancount]:                  http://furius.ca/beancount
[beancount2ledger]:           https://github.com/beancount/beancount2ledger
[ledger2beancount]:           https://github.com/beancount/ledger2beancount
[gpl]:                        https://en.wikipedia.org/wiki/GNU_General_Public_License
[library]:                    https://hackage.haskell.org/package/hledger-lib
[script]:                     https://github.com/simonmichael/hledger/blob/master/bin/hledger-check-tag-files.hs
[free software]:              https://en.wikipedia.org/wiki/Free_software


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

.content h1 { 
  font-size: 5em;
  font-style: italic;
  text-align:center;
  margin: 0.5em 0 0;
  display:block;
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
