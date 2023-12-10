# Features

<div class=pagetoc>

<!-- toc -->
</div>

## What can hledger do for me ?

hledger can provide clarity and insight into your personal or business
finances, time logs, or other dated quantitative data, with relatively
little effort on your part.  You need only provide a list of
transactions, as a plain text file in a simple human-readable
format. (Or a CSV file plus some conversion rules.) From this hledger
can generate a variety of useful reports and interactive views.
There is also a growing ecosystem of complementary tools and apps,
and if you are a programmer you can easily build your own integrations.

## How is it different from other accounting software ?

hledger is a **[Plain Text Accounting]** system, which means:

- Data is stored in simple plain text files, which can be easily read by humans, tracked with version control software such as Git, and maintained with text processing tools. This facilitates auditing, portability, and longevity of your valuable accounting data.

- The data format is flexible and easy to write or generate, but hledger can check it and prevent many kinds of error. This, plus the transparency and version control, provides confidence in your data and reports.

- Data and software is kept on your local computer, keeping your financial data private and under your control. But if you should want to collaborate, version control makes that easy.

- You can edit data with your favourite text editor or IDE, or a data entry UI, or convert and import data from other formats (eg CSV from your banks).
  
- There is a fast command-line interface, which makes the tool easy to script, automate, and integrate into custom workflows.

- The model of  operation is simple: put a log of transactions in, get reports out.

- It is fast, lightweight, non-distracting, and great for learning more of double-entry bookkeeping and accounting.

## What can it do, in detail ?

hledger can:

- list your transactions, payees, currencies/commodities, accounts, statistics
- show the hierarchy of accounts and subaccounts
- show the transactions affecting any account, and calculate its running balance
- make a balance sheet, showing your asset and liability account balances
- make a cashflow report, showing changes in your cash assets
- make an income statement, showing your revenues and expenses
- show simple bar charts by period
- show purchase costs/selling prices
- show market values in any currency at any valuation date
- calculate the rate of return of a savings account or investment
- make reports from timeclock or timedot time logs
- make reports from any CSV/SSV/TSV file
- make reports from any data which you have converted to a hledger-readable format

It can slice, dice, and present your data in different ways:

- filter out just the items or time period you're interested in
- show multiple periods side by side
- summarise accounts to a certain depth to give the big picture
- rewrite or pivot account names to transform reports
- output reports as plain text, HTML, CSV, TSV, JSON, SQL...
- run as a live-updating terminal UI, for fast interactive exploration
- run as a web app, allowing remote/multi-user browsing and data entry
- run as a JSON web API, for integrating with custom apps

If you add a few directives to the file, hledger can:

- combine multiple files / data sets
- generate recurring transactions by rule
- generate extra postings (splits) on transactions by rule
- show a forecast of future activity, eg to help with planning
- make a budget report, showing your budget goals and performance by account and period

Also, it can:

- generate interest transactions by rule
- help you enter new transactions with prompts or a terminal UI
- help you convert and import new transactions from external sources, eg banks
- be used as a library in a quick Haskell script or compiled program

## Batteries are included

hledger comes with multiple user interfaces that just work:

<style>
table#screenshots td { 
  border:none; 
  padding-left:0;
  padding-right:2em;
}
</style>
<table id="screenshots">
<tr valign="top">
<td width="25%">

<a href="/images/balance-q-inc.png" class="highslide" onclick="return hs.expand(this)"><img src="/images/balance-q-inc.png" title="Balance report showing income/expense by quarter" /></a>

A command-line tool (CLI).
Transactions are stored in a journal file which you can edit with a text editor.
From this hledger produces various reports, without changing your data.

</td>
<td width="25%">

<a href="/images/hledger-ui/hledger-ui-bcexample-acc.png" class="highslide" onclick="return hs.expand(this)"><img src="/images/hledger-ui/hledger-ui-bcexample-acc.png" title="hledger-ui accounts screen" /></a>

A live-updating terminal interface (TUI), 
that lets you review account balances and transactions quickly.
([screencast](https://asciinema.org/a/29665))

</td>
<td width="25%">

<a href="/images/hledger-web/normal/register.png" class="highslide" onclick="return hs.expand(this)"><img src="/images/hledger-web/normal/register.png" title="Account register view with accounts sidebar" /></a>

A zero-setup web interface (WUI),
allowing terminal-free, point-and-click usage.
Run it privately on your local machine, or on a server to collaborate with others.
([demo](http://demo.hledger.org)).

<!-- (hledger can also run [in your web browser](https://hledger.alhur.es) (prototype).) -->

</td>
<td width="25%">

<a href="/images/hledger-lib-api.png" class="highslide" onclick="return hs.expand(this)"><img src="/images/hledger-lib-api.png" title="Part of hledger-lib's haddock api documentation" /></a>

A haskell library. You can write scripts, add-on commands, or financial applications 
as powerful as hledger itself.
<!-- [scripts](scripting.md), [addons](hledger.md#add-on-commands)  -->

</td>
</tr>
</table>

## It's relatively easy

Within its scope - a Plain Text Accounting tool, which is by nature slightly technical -
hledger aims to be intuitive, learnable and highly usable,
learning from other PTA tools and taking PTA to a higher level of usability and utility.
Here are some things it provides out of the box:

- Easy multi-currency double-entry accounting [using only a plain text file](#usage)
- Easy [assisted data entry](basics.md) or [CSV import](import-csv.md)
- Easy zero-setup [command line], [terminal], and [web] user interfaces
- Easy multi-period [balance sheet], [income statement], and [cashflow] reports
- Easy summarising of account balances to a [desired depth][depth limiting]
- Easy output to [text, HTML, CSV, JSON or SQL][output format]
- Easy import/export/co-usage with Ledger CLI or Beancount
- Easy to [download] or [build] on all major platforms

## Dependable

hledger strives to be comfortable to use, to be absolutely dependable,
to provide real-world value, and to never waste your time. It provides:

- Robust installation: multiple options are provided for binary and
  source installation. Building from source is reliable and consistent
  across platforms.

- Robust execution: 
  hledger is written in [Haskell], a modern, highly-regarded
  programming language.
  Runtime failures are minimised by Haskell's memory management and
  strong compile-time type checking.
  Failures caused by user input are reported clearly and promptly.

- Robust features: built-in commands and options combine well with one
  another, and are expected to do something sensible in all cases,
  with all kinds of input.

- Robust parsing: dated items, such as balance assertions and balance
  assignments, are processed in date order. Assertions/assignments
  with the same date are processed in parse order. Multiple
  assertions/assignments within a single transaction work as you would
  expect.
  
- Robust calculation: results are expected to always perfectly match
  what you would calculate on paper, up to 255 decimal places.

- Robust reporting: reports are deterministic and not affected by the
  order of input files or data items except where that is part of
  their spec.

- Robust testing:
  The software is continually tested by more than a thousand automated tests.

- Robust documentation: all functionality is documented precisely,
  with a mnemonic permalink. User manuals for your hledger
  version are available online, and also built in for offline viewing.
  General and command-specific command line help is provided. We
  favour documentation-driven development.

## Fast

- Reports normally take a fraction of a second.
- `hledger-ui --watch` normally updates instantly as you edit.
- On a 2021 macbook air m1, hledger processes about [15k-25k transactions per second](ledger.md#performance)
  ([depending on version](https://github.com/simonmichael/hledger/issues/2122)).

## Compatible

hledger is a rewrite of the pioneering [Ledger CLI], aiming to
build out the same core features to a higher level of quality,
and to add new ones making it useful to more people.
Ledger users will find the file formats and commands familiar,
and with a little care can run both tools on the same data files.
(You can read more about
the [origins](ledger.md)
and [differences](ledger.md#differences).)

hledger can read [Beancount] files, or vice versa, by converting them
with the [beancount2ledger] and [ledger2beancount] tools.

Many [tools](https://plaintextaccounting.org/#data-importconversion)
exist for importing from other applications.  Data can be exported as
CSV, JSON or basic SQL.

## Free Software

hledger is [Free Software], with no purchase price or monthly fees.
It is licensed under [GNU GPLv3+][gpl], providing the strongest guarantee
that you will always have the right to run, inspect, modify, or share it.
It is [actively maintained], with regular [releases]
and a [large chat room and other support resources](support.md).

[![github](https://img.shields.io/github/stars/simonmichael/hledger.svg?logo=GitHub&label=Github)](https://github.com/simonmichael/hledger)

<!-- - The plain text format and fast command-line interface -->
<!--   (plus a reusable [library] for building your own [commands][script]) -->
<!--   facilitate scripting and customisation. -->

## But not yet...

- ... easy for completely non-technical people to install and use (without a little help)
- ... easy to use on a phone
- ... equipped with mature, polished GUIs
- ... or easy charts
- ... able to download directly from banks and financial institutions
- ... with as many investing-savvy users as Beancount
- ... simple, clear and obvious for all needs, or masterable in a day (or a week).

Double Entry Bookkeeping, Plain Text Accounting, and Accounting in general are deep and rich topics;
as a newcomer you might feel 
there's too both much and not enough to read, 
too much flexibility and not enough structure or guidance.
You may need to [pace yourself](start.md), 
ask the [chat](support.md) for tips, 
and learn through practice.

<!--
What is planned for hledger ?

More support for investing,
more support for correctness and accounting/business rules,
more input/output formats,
more speed,
more GUI,
charts,
better getting started experience.
See also [ROADMAP](ROADMAP.md).
-->

[blog posts]:                 https://plaintextaccounting.org/#articles-blog-posts
[example files]:              https://github.com/simonmichael/hledger/tree/master/examples
[mail list]:                  https://groups.google.com/forum/#!forum/hledger
[Ledger CLI]:                 https://ledger-cli.org
[command line]:               hledger.md
[terminal]:                   ui.md
[web]:                        web.md
[balance sheet]:              hledger.md#balancesheet
[income statement]:           hledger.md#incomestatement
[cashflow]:                   hledger.md#cashflow
[depth limiting]:             hledger.md#depth-limiting
[output format]:              hledger.md#output-format
[download]:                   install.md#binary-packages
[build]:                      install.md#building-from-source
[command line]:               basics.md
[terminal]:                   ui.md
[web]:                        web.md
[actively maintained]:        https://github.com/simonmichael/hledger/graphs/contributors
[releases]:                   https://hledger.org/release-notes
[plain text accounting]:      http://plaintextaccounting.org
[plain text accounting apps]: https://plaintextaccounting.org/#plain-text-accounting-apps
[version control system]:     https://en.wikipedia.org/wiki/Version_control
[git]:                        https://en.wikipedia.org/wiki/Git
[haskell]:                    https://wiki.haskell.org/Haskell
[double-entry accounting]:    https://en.wikipedia.org/wiki/Double-entry_bookkeeping
[install]:                    install.md
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

