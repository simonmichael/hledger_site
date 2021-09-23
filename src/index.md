<!-- stylesheet at bottom -->
<img id="coins" src="/images/coins2-248.png" style="width:120px; margin:2em 1em; float:left;" />
<img id="coins" src="/images/coins2-248.png" style="width:120px; margin:2em 1em; float:right;" />

# hledger

<!-- 
https://www.stephendiehl.com/posts/marketing.html#persuasion-and-decision-makers
1. It is memorable
2. It includes a key benefit
3. It differentiates
4. It imparts positivity
-->
<div id="tagline">
easy, dependable<br> plain text accounting
</div>

<div class=pagetoc>
<!-- toc -->
</div>

<span id="leadingword">hledger</span> is free cross-platform accounting software 
for both power users and folks new to accounting.
It's good for tracking money, time, investments, cryptocurrencies, inventory and more,
with high accuracy, flexibility and privacy.
It is a more actively maintained, largely compatible reimplementation of Ledger CLI,
with a particular focus on ease of use and robustness.

<!--
*Quick links:\
[install](download.html),
[quick start](quickstart.html),
[manual](hledger.html),
[support/discussion](#help),
[sponsors](#sponsorship),
[development](CONTRIBUTING.html),
<a href="https://github.com/simonmichael/hledger"><img height="20" 
src="https://img.shields.io/github/stars/simonmichael/hledger.svg?style=for-the-badge&logo=GitHub&label=Github&color=lightgrey" 
alt="github" title="hledger code repo/issue tracker"></a>*
-->

## Show me...

hledger offers multiple user interfaces:

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


## Plain text what now ?

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

## Easy, you say ?

Well - depending on your experience, hledger or Plain Text Accounting
may or may not seem *easy* at first encounter.
(It may just be that our intro docs aren't good enough yet;
we're working on that.)

But certainly within its scope of Plain Text Accounting,
hledger aims to be intuitive, learnable and highly usable,
taking only the best from other PTA tools and leaving the rest.
Here are some things it provides out of the box:

- Easy multi-currency double-entry accounting [using only a plain text file](#usage)
- Easy [assisted data entry](add.html) or [CSV import][convert]
- Easy zero-setup [command line], [terminal], and [web] user interfaces
- Easy multi-period [balance sheet], [income statement], and [cashflow] reports
- Easy summarising of account balances to a [desired depth][depth limiting]
- Easy output to [text, HTML, CSV, JSON or SQL][output format]
- Easy import/export/co-usage with Ledger CLI or Beancount
- Easy to [download] or [build] on all major platforms
- Fast. Reports normally take a fraction of a second, and hledger-ui
  updates instantly as you edit.
  <!-- (hledger parses and analyses ~2000 txns/s on a 2013 macbook.) -->

## Dependable ?

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

hledger is [free software], with no purchase price or monthly fees.
It is licensed under [GNU GPLv3][gpl], providing the strongest guarantee
that you will always have the right to run, inspect, modify, or share it.
It is [actively maintained], with regular [releases]
and a [large chat room and other support resources](discuss.html).

<!-- - The plain text format and fast command-line interface -->
<!--   (plus a reusable [library] for building your own [commands][script]) -->
<!--   facilitate scripting and customisation. -->

## Limitations

What are some current limitations of hledger and Plain Text Accounting ?

- The "GUIs" are minimalist; there is no rich GUI competitive with Quicken or GNUCash.

- As a beginner you might feel there's too much choice, too much to
  read, yet not enough clear opinionated guidance.
  (We're working on it. A request in the chat will produce quick help.)

- hledger is fast, but not yet as fast as Ledger.


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

## Where to next ?

Next, you could:

- Scan through the docs listed in the sidebar to your left. If it's not visible, click the menu button at top left.
- Check the [FAQ](faq.html).
- Do a tutorial:
  [Quick Start](quickstart.html),
  [Accounting concepts](accounting.html), or
  [Easy workflow #1](add.html),
  [#2](web.html), or
  [#3](ui.html).
- Become an expert: read or skim the [hledger](hledger.html) user manual.
- Or just the [COMMON TASKS](hledger.html#common-tasks).
- Check out the [hledger-ui](hledger-ui.html) and [hledger-web](hledger-web.html) manuals.
- Browse the [blog posts] on plaintextaccounting.org.
- Watch [videos](videos.html), such as hledger fan's beginner lessons.
- Look at lots of [example files].
- Introduce yourself in our [chat room](#help), or browse the [mail list].

## But wait...

hledger is brought to you by 
**[Simon Michael](http://joyful.com)**
and 
**[140+ contributors](CREDITS.html)**.
I have been building and relying on this project continuously since 2007.
I hope you too will find it useful in transforming your relationship with time and money.
When you have achieved some success, please consider joining the 
**[sponsors](sponsor.html)**
to support the project. Thanks!



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
[download]:                   download.html#binary-packages
[build]:                      download.html#building-from-source
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
[install]:                    download.html
[ledgerlikes]:                https://plaintextaccounting.org/#plain-text-accounting-apps
[ledger]:                     https://www.ledger-cli.org
[ledger features]:            https://www.ledger-cli.org/features.html
[beancount]:                  http://furius.ca/beancount
[beancount2ledger]:           https://github.com/beancount/beancount2ledger
[ledger2beancount]:           https://github.com/beancount/ledger2beancount
[gpl]:                        https://en.wikipedia.org/wiki/GNU_General_Public_License
[library]:                    https://hackage.haskell.org/package/hledger-lib
[script]:                     https://github.com/simonmichael/hledger/blob/master/bin/hledger-check-tag-files.hs
[import]:                     hledger.html#import
[convert]:                    convert-csv-files.html
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

.content h2 { 
  text-align:center;
  font-size: 2em;
  margin-top:2em; 
}

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

</style>
