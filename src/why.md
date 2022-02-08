# Why hledger ?

<div class=pagetoc>
<!-- toc -->
</div>

See also:
[hledger and Ledger](ledger.html)


## Plain text accounting

hledger is a **[Plain Text Accounting]** system, 
where your accounting data is stored in a readable plain text file, often version-controlled.
Some strengths of the PTA approach:

- Runs on your local computer, keeping your financial data private and under your control
- Simple model of  operation: put a log of transactions in, get reports out
- Simple, expressive, human-readable, future-proof plain text format
- Can be version controlled, eg with [Git], to safeguard your data,
  track changes, or collaborate
- Edit with your favourite text editor, or a data entry UI, or import
  from other formats
- Easy to script, automate, and integrate into custom workflows
- Lightweight, fast, non-distracting to use
- Great for learning more of double-entry bookkeeping and accounting.

<br clear=all>

## Batteries included

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
<!-- [scripts](scripting.html), [addons](hledger.html#add-on-commands)  -->

</td>
</tr>
</table>


## Fast

- Reports normally take a fraction of a second.
- `hledger-ui --watch` normally updates instantly as you edit.
- On a 2021 macbook air m1, hledger parses and analyses about 25000 transactions per second.

## Easy

Within its scope of Plain Text Accounting,
hledger aims to be intuitive, learnable and highly usable,
taking only the best from other PTA tools and leaving the rest.
Here are some things it provides out of the box:

- Easy multi-currency double-entry accounting [using only a plain text file](#usage)
- Easy [assisted data entry](add.html) or [CSV import](import-csv.html)
- Easy zero-setup [command line], [terminal], and [web] user interfaces
- Easy multi-period [balance sheet], [income statement], and [cashflow] reports
- Easy summarising of account balances to a [desired depth][depth limiting]
- Easy output to [text, HTML, CSV, JSON or SQL][output format]
- Easy import/export/co-usage with Ledger CLI or Beancount
- Easy to [download] or [build] on all major platforms

## Dependable

hledger strives to be comfortable to use, to be absolutely reliable,
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

- Robust testing:
  The software is continually tested by extensive automated tests.

- Robust features: built-in commands and options combine well with one
  another, and are expected to do something sensible in all cases,
  with all kinds of input.

- Robust calculation: results are expected to always perfectly match
  what you would calculate on paper, up to 255 decimal places.

- Robust parsing: dated items, such as balance assertions and balance
  assignments, are processed in date order. Assertions/assignments
  with the same date are processed in parse order. Multiple
  assertions/assignments within a single transaction work as you would
  expect.
  
- Robust reporting: reports are deterministic and not affected by the
  order of input files or data items except where that is part of
  their spec.

- Robust documentation: all functionality is documented precisely,
  with a mnemonic permalink. User manuals for your hledger
  version are available online, and built in for offline viewing.
  General and command-specific command line help is provided. We
  favour documentation-driven development.

## Compatible

hledger is a rewrite of the pioneering [Ledger CLI], aiming to
build out the same core features to a higher level of quality,
and to add new ones making it useful to more people.
Ledger users will find the file formats and commands familiar,
and with a little care can run both tools on the same data files.
(You can read more about
the [origins](faq.html#why-did-you-start-hledger--how-does-it-relate-to-ledger-)
and [differences](faq.html#how-is-hledger-different-from-ledger-).)

hledger can read [Beancount] files, or vice versa, by converting them
with the [beancount2ledger] and [ledger2beancount] tools.

Many [tools](https://plaintextaccounting.org/#data-importconversion)
exist for importing from other applications.  Data can be exported as
CSV, JSON or basic SQL.

## Free Software

[![github](https://img.shields.io/github/stars/simonmichael/hledger.svg?logo=GitHub&label=Github)](https://github.com/simonmichael/hledger)
[![hledger CI](https://github.com/simonmichael/hledger/workflows/hledger%20CI/badge.svg)](https://github.com/simonmichael/hledger/actions)
[![on hackage](https://img.shields.io/hackage/v/hledger.svg?logo=Haskell&label=Hackage&colorB=green)](http://hackage.haskell.org/package/hledger)
[![](https://repology.org/badge/version-for-repo/stackage_nighly/hledger.svg)](https://repology.org/metapackage/hledger)

hledger is [free software], with no purchase price or monthly fees.
It is licensed under [GNU GPLv3][gpl], providing the strongest guarantee
that you will always have the right to run, inspect, modify, or share it.
It is [actively maintained], with regular [releases]
and a [large chat room and other support resources](support.html).

<!-- - The plain text format and fast command-line interface -->
<!--   (plus a reusable [library] for building your own [commands][script]) -->
<!--   facilitate scripting and customisation. -->

## Limitations

What are some current limitations of hledger and Plain Text Accounting ?

- The "GUIs" are minimalist; there is no rich GUI competitive with Quicken or GNUCash.

- As a beginner you might feel there's too much choice, too much to
  read, yet not enough clear opinionated guidance.
  (We're working on it. A request in the chat will produce quick help.)


<!--
What is planned for hledger ?

More support for investing,
more support for correctness and accounting/business rules,
more input/output formats,
more speed,
more GUI,
charts,
better getting started experience.
See also [ROADMAP](ROADMAP.html).
-->

[blog posts]:                 https://plaintextaccounting.org/#articles-blog-posts
[example files]:              https://github.com/simonmichael/hledger/tree/master/examples
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
