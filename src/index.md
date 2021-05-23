<!-- stylesheet at bottom -->
<img id="coins" src="/images/coins2-248.png" style="width:120px; margin:2em 1em; float:left;" />
<img id="coins" src="/images/coins2-248.png" style="width:120px; margin:2em 1em; float:right;" />
<!-- 
https://www.stephendiehl.com/posts/marketing.html#persuasion-and-decision-makers
1. It is memorable
2. It includes a key benefit
3. It differentiates
4. It imparts positivity
-->

# hledger

<div id="tagline">
plain text accounting,<br>made easy
</div>

<div style="text-align:center; margin:1em;">

*Quick links:
[download](download.html),
[quick start](quickstart.html),
[manual](hledger.html),
[support](#help),
[contributing](CONTRIBUTING.html)*

</div>

<div style="text-align:center; margin:1em;">
<a href="download.html"><button type="button" class="btn btn-primary" title="All the ways to install hledger. Get it now!">Download/Install</button></a>
<a href="https://github.com/simonmichael/hledger"><button type="button" class="btn btn-neutral" style="padding:4px;" title="hledger code and issue tracker on Github. Star us!"><img width="142" src="https://img.shields.io/github/stars/simonmichael/hledger.svg?style=for-the-badge&logo=GitHub&label=Github&color=lightgrey"></button></a>
</div>

<span id="leadingword">hledger</span> is cross-platform accounting software 
for both power users and folks new to accounting.
It's good for tracking money, time, investments, cryptocurrencies, inventory and more.
It is a reimplementation of [Ledger CLI] 
(*I liked Ledger so much, I rebuilt it in Haskell*)
with a particular focus on **ease of use** and **robustness**.

Here are some things it provides out of the box:

- Easy multi-currency double-entry accounting [using only a plain text file](#usage)

- Easy [assisted data entry](add.html) or [CSV import][convert]

- Easy zero-setup [command line], [terminal], and [web] user interfaces

- Easy multi-period [balance sheet], [income statement], and [cashflow] reports

- Easy summarising of account balances to a [desired depth][depth limiting]

- Easy output to [text, HTML, CSV, JSON or SQL][output format]

- Easy import/export/co-usage with Ledger CLI or Beancount

- Easy to [download] or [build] on all major platforms

[Ledger CLI]: https://ledger-cli.org
[command line]: hledger.html
[terminal]: ui.html
[web]: web.html
[balance sheet]: hledger.html#balancesheet
[income statement]: hledger.html#incomestatement
[cashflow]: hledger.html#cashflow
[depth limiting]: hledger.html#depth-limiting
[output format]: hledger.html#output-format
[download]: download.html#binary-packages
[build]: download.html#building-from-source



hledger is a **[Plain Text Accounting]** system.
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



Here are some ways in which hledger strives to provide robustness:

- Robust installation: multiple options are provided for binary and
  source installation. Building from source is reliable and consistent
  across platforms.

- Robust execution: runtime crashes are minimised by Haskell's memory
  management and strong compile-time type checking. 
  The software is also heavily tested by automated test suites and CI.
  Failures caused by user input are reported clearly and promptly.

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

hledger is **free software**, with no purchase price or monthly fees.
It is licensed under **[GNU GPLv3][gpl]**, providing the strongest guarantee
that you will always have the right to run, inspect, modify, or share it.
It is [actively maintained], with regular [releases],
a large [chat room](#help) and other [support resources](#help).

hledger is modelled after the pioneering [Ledger CLI], 
and will read many Ledger files without change. 
Ledger users will find the data formats and commands familiar.
Though not yet as fast as Ledger, it is quite fast,
parsing and analysing ([correctly](faq.html#journal-format)) ~2000 txns/s on a 2013 macbook.
Reports normally take a fraction of a second, and hledger-ui updates instantly as you edit.

<!-- - The plain text format and fast command-line interface -->
<!--   (plus a reusable [library] for building your own [commands][script]) -->
<!--   facilitate scripting and customisation. -->

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
[sponsor]:                    #sponsorship
[ledgerlikes]:                https://plaintextaccounting.org/#plain-text-accounting-apps
[ledger]:                     https://www.ledger-cli.org
[ledger features]:            https://www.ledger-cli.org/features.html
[beancount]:                  http://furius.ca/beancount
[gpl]:                        https://en.wikipedia.org/wiki/GNU_General_Public_License
[library]:                    https://hackage.haskell.org/package/hledger-lib
[script]:                     https://github.com/simonmichael/hledger/blob/master/bin/hledger-check-tag-files.hs
[import]: hledger.html#import
[convert]: convert-csv-files.html


## Usage

You can start with hledger very simply, and get more sophisticated as
you learn more about double-entry accounting.
Here are some common ways of using it:

**Web or terminal UI:**
[Use hledger-web](web.html) or [use hledger-ui](ui.html) to enter
transactions and see reports.

**Command line:**
[Use hledger add](add.html)'s interactive prompts to enter transactions,
run hledger commands to see reports.

**Text editor:**
<table id="example">
<tr>
<td style="padding-right:1em;">

Record transactions in a [plain text file](journal.html),
perhaps assisted by an [editor mode](editors.html):
```journal
; $HOME/.hledger.journal (or $LEDGER_FILE)

2020-01-01 opening balances
    assets:checking         $1234
    equity

2020-03-15 client payment
    assets:checking         $2000
    income:consulting

2020-03-20 Sprouts
    expenses:food:groceries  $100
    assets:cash               $40
    assets:checking
```

</td>
<td>

Run hledger commands to report
[balances](https://en.wikipedia.org/wiki/Balance_sheet#Personal), 
[income and expenses](https://en.wikipedia.org/wiki/Income_statement), 
and more:
```shell
$ hledger bs
Balance Sheet 2020-03-20

             || 2020-03-20 
=============++============
 Assets      ||            
-------------++------------
 assets      ||      $3134 
   cash      ||        $40 
   checking  ||      $3094 
-------------++------------
             ||      $3134 
=============++============
 Liabilities ||            
-------------++------------
-------------++------------
             ||            
=============++============
 Net:        ||      $3134 

$ hledger is -M
Income Statement 2020-01-01-2020-03-20

                         || Jan  Feb    Mar 
=========================++=================
 Revenues                ||                 
-------------------------++-----------------
 income:consulting       ||   0    0  $2000 
-------------------------++-----------------
                         ||   0    0  $2000 
=========================++=================
 Expenses                ||                 
-------------------------++-----------------
 expenses:food:groceries ||   0    0   $100 
-------------------------++-----------------
                         ||   0    0   $100 
=========================++=================
 Net:                    ||   0    0  $1900 
```

</td>
</tr>
</table>

**Automated import:**
Download CSV files from financial institutions, perhaps using an API
like Plaid or Tiller, use hledger's import command to [convert] and
[import] the new transactions, and use any UI to see reports.

## More details

Next, you could:

- Explore the sidebar to your left (or on small screens, the menu button at top left).
  It scrolls and expands; all hledger docs can be found there.
- Check the **[FAQ](faq.html)**.
- Do a tutorial:
  **[Quick Start](quickstart.html)**,
  **[Accounting concepts](accounting.html)**, or
  **[Easy workflow #1](add.html)**,
  **[#2](web.html)**, or
  **[#3](ui.html)**.
- Become an expert: read or skim the **[hledger](hledger.html)** user manual.
- Or just the **[COMMON TASKS](hledger.html#common-tasks)**.
- Check out the **[hledger-ui](hledger-ui.html)** and **[hledger-web](hledger-web.html)** manuals.
- Browse the **[blog posts]** on plaintextaccounting.org.
- Watch **[videos](videos.html)**, such as hledger fan's beginner lessons.
- Look at lots of **[example files]**.
- Introduce yourself in our **[chat room](#help)**, or browse the **[mail list]**.
- Read on...

[blog posts]: https://plaintextaccounting.org/#articles-blog-posts
[example files]: https://github.com/simonmichael/hledger/tree/master/examples
[mail list]: https://groups.google.com/forum/#!forum/hledger

hledger is brought to you by [Simon Michael](http://joyful.com) and 120+ contributors.
I've been building and relying on it continuously since 2007;
I hope you too will find it helpful in mastering your time and money!
When your wealth allows, perhaps you'll feel inspired to become a
[sponsor] and help us do more.

hledger is a rewrite/reboot of the pioneering [Ledger].
([Why?](faq.html#how-why-was-hledger-started))
Read more about the [differences](faq.html#ledger).

hledger strives to be usable, practical and to provide real-world value.
Intuitive features, dependable bug-free operation and complete, accurate documentation are top goals.

<a href="/images/balance-q-inc.png" class="highslide" onclick="return hs.expand(this)"><img src="/images/balance-q-inc.png" title="Balance report showing income/expense by quarter" /></a>
hledger is first a command-line tool.
Your data lives in a plain text journal file which you can edit
any way you wish; hledger reads that file and produces reports of
various kinds, without changing your data. (It can help you add new
transactions, but does not change existing ones.)
<br clear="all">

<a href="/images/hledger-ui/hledger-ui-bcexample-acc.png" class="highslide" onclick="return hs.expand(this)"><img src="/images/hledger-ui/hledger-ui-bcexample-acc.png" title="hledger-ui accounts screen" /></a>
hledger also provides a [terminal&nbsp;interface](hledger-ui.html)
that lets you review account balances and transactions quickly and without fuss.
([screencast](https://asciinema.org/a/29665))
<br clear="all">

<a href="/images/hledger-web/normal/register.png" class="highslide" onclick="return hs.expand(this)"><img src="/images/hledger-web/normal/register.png" title="Account register view with accounts sidebar" /></a>
And, a zero-setup
[web&nbsp;app](hledger-web) for a more point-and-click experience
([demo](http://demo.hledger.org)).
Run it on your local machine, or on a server, 
or set it up with a few clicks on
[Sandstorm](https://apps.sandstorm.io/app/8x12h6p0x0nrzk73hfq6zh2jxtgyzzcty7qsatkg7jfg2mzw5n90).
<br clear="all">

<!-- There's also a [UI running in the browser](https://hledger.alhur.es) (hledger compiled with GHCJS). -->
<!-- This is a prototype, but it's nice sandbox for trying out hledger's journal syntax. -->

<a href="/images/hledger-lib-api.png" class="highslide" onclick="return hs.expand(this)"><img src="/images/hledger-lib-api.png" title="Part of hledger-lib's haddock api documentation" /></a>
hledger is written in [Haskell], a modern, highly-regarded
programming language which contributes to hledger's robustness,
performance and long-term maintainability.  Most functionality is
exposed as [Haskell libraries](http://hackage.haskell.org/package/hledger-lib),
making it easy to write your own hledger-compatible
[scripts](scripting.html), [addons](hledger.html#add-on-commands) and applications.
&nbsp;&nbsp;
[![hledger CI](https://github.com/simonmichael/hledger/workflows/hledger%20CI/badge.svg)](https://github.com/simonmichael/hledger/actions)
[![on hackage](https://img.shields.io/hackage/v/hledger.svg?label=hackage&colorB=green)](http://hackage.haskell.org/package/hledger)
[![](https://repology.org/badge/version-for-repo/stackage_nighly/hledger.svg)](https://repology.org/metapackage/hledger)
<br clear="all">


What are some (current) limitations of PTA and hledger ?

- The "GUIs" are minimalist; there is no rich GUI at the level of
  Quicken or GNUCash.

- As a beginner you might feel there's too much freedom, too much to
  read, yet not enough clear guidance. Some common needs are not yet
  satisfactorily documented.
  (Tip: a request in chat often produces a quick result.)

- hledger doesn't yet calculate capital gains automatically, as Ledger
  and Beancount can; you must do that semi-manually.

- hledger is not yet as fast as Ledger.

What is planned for hledger ?

More support for investing,
more support for correctness and accounting/business rules,
more input/output formats,
more speed,
more GUI,
charts,
better getting started experience.
See also [ROADMAP](ROADMAP.html).

<a name="help"></a><a name="help-feedback"></a>

## Getting help

<div>
<table>
  <tr>
    <td>Chat:</td>
    <td>
      <a href="http://irc.hledger.org">#hledger</a> on Libera IRC
          (<a href="https://groups.google.com/g/hledger/c/9NQ_1_ng1XM/m/OeRFIMbxBQAJ">moved from Freenode 2021-05</a>)
      or <a href="http://matrix.hledger.org">#hledger:matrix.org</a> on Matrix
<!--
      <br>
      To talk, <a href="https://libera.chat/guides/registration">register your nick</a>:
      <br>
      on IRC, type <code>/msg NickServ register newpassword youremailaddress</code>
      <br>
      on Matrix, 
      use <a href="https://github.com/matrix-org/matrix-appservice-irc/wiki/End-user-FAQ#how-do-i-registeridentify-to-nickserv">@freenode_NickServ:matrix.org</a>
      and <a href="https://github.com/matrix-org/matrix-appservice-irc/wiki/End-user-FAQ#and-do-it-automatically">@appservice-irc:matrix.org</a>
-->
    </td>
  </tr>
  <tr>
    <td>Mail list:</td>
    <td>
      <a href="http://list.hledger.org">list.hledger.org</a>, <a href="mailto:hledger@googlegroups.com">hledger@googlegroups.com</a> (<a href="mailto:hledger+subscribe@googlegroups.com">hledger+subscribe@googlegroups.com</a>)
    </td>
  </tr>
  <tr>
    <td>Twitter:</td>
    <td>
      <a href="https://twitter.com/search?q=%23hledger&amp;src=typed_query&amp;f=live">#hledger</a>, <a href="https://twitter.com/search?q=%23plaintextaccounting&amp;src=typed_query&amp;f=live">#plaintextaccounting</a>
    </td>
  </tr>
  <tr>
    <td>Reddit:</td>
    <td>
      <a href="https://www.reddit.com/r/plaintextaccounting/">/r/plaintextaccounting</a>
    </td>
  </tr>
  <tr>
    <td>Hacker News:</td>
    <td>
      <a href="https://hn.algolia.com/?query=hledger&amp;sort=byDate&amp;prefix&amp;page=0&amp;dateRange=all&amp;type=story">stories</a>, <a href="https://hn.algolia.com/?query=hledger&amp;sort=byDate&amp;prefix=false&amp;page=0&amp;dateRange=all&amp;type=comment">comments</a>
    </td>
  </tr>
  <tr>
    <td>Issues:</td>
    <td>
      <a href="http://bugs.hledger.org">bugs.hledger.org</a> (bugs), <a href="http://issues.hledger.org">issues.hledger.org</a> (all), <a href="CONTRIBUTING.html#open-issues">open issues overview</a>, <a href="https://github.com/simonmichael/hledger_site/issues?utf8=%E2%9C%93&amp;q=">website issues</a>
    </td>
  </tr>
  <tr>
    <td>Other:</td>
    <td>
      <a href="mailto:simon@joyful.com">simon@joyful.com</a>
    </td>
  </tr>
  <tr>
    <td>See also:</td>
    <td>
      <a href="https://plaintextaccounting.org">plaintextaccounting.org</a>
      <br>
      <a href="http://kiwiirc.com/nextclient/irc.libera.chat:+6697/#plaintextaccounting">#plaintextaccounting</a> IRC channel
      <br>
      <a href="https://matrix.to/#/#plaintextaccounting:matrix.org">#plaintextaccounting:matrix.org</a> Matrix room
      <br>
      <a href="https://www.ledger-cli.org/docs.html">Ledger CLI docs</a>
      <br>
      <a href="https://beancount.github.io/docs">Beancount docs</a>
      <br>
      <a href="https://twitter.com/LedgerTips">@LedgerTips (2014-2018)</a>
    </td>
  </tr>
</table>
</div>


<a name="sponsor"></a>

## Sponsorship

Building and supporting good software and documentation requires a lot of time and life energy.
Maybe these thousands of person-hours have helped you or your organisation ?

Support us financially at any level, to be a part of this project and
advance our core mission: helping more people achieve financial
literacy and empowerment. Thank you!

<!-- keep synced with README.md: -->

- Sponsor Simon (project leader / broom pusher):\
[![github](https://img.shields.io/badge/Sponsor_on-Github-limegreen "Sponsor the project leader via Github")](https://github.com/sponsors/simonmichael)
[![liberapay](https://img.shields.io/badge/Sponsor_on-Liberapay-limegreen "Sponsor the project leader via Liberapay")](https://liberapay.com/simonmichael)
[![paypal](https://www.paypal.com/en_US/i/btn/x-click-but04.gif "Give one time or recurringly via Paypal")](https://www.paypal.com/cgi-bin/webscr?cmd=_s-xclick&hosted_button_id=5J33NLXYXCYAY)\
₳ ADA: addr1vyzlqfh6pmxuwxwnk6h2y6ww36jndslvqlpljqsumcqwyzq5r9aqw

<!-- OC badges are flaky/confusing. hledger tiers are: Backers, Sponsors -->
<!-- doesn't show correct count: -->
<!-- <img src="https://opencollective.com/hledger/tiers/sponsors/badge.svg?label=Sponsors&color=brightgreen" /> \ -->
<!-- doesn't show all: -->
<!-- [![](https://opencollective.com/hledger/sponsor/0/avatar.svg)](https://opencollective.com/hledger/sponsor/0/website) -->
<!-- [![](https://opencollective.com/hledger/sponsor/1/avatar.svg)](https://opencollective.com/hledger/sponsor/1/website) -->
<!-- [![](https://opencollective.com/hledger/sponsor/2/avatar.svg)](https://opencollective.com/hledger/sponsor/2/website) -->
<!-- [![](https://opencollective.com/hledger/sponsor/3/avatar.svg)](https://opencollective.com/hledger/sponsor/3/website) -->
<!-- [![](https://opencollective.com/hledger/sponsor/4/avatar.svg)](https://opencollective.com/hledger/sponsor/4/website) -->
<!-- [![](https://opencollective.com/hledger/sponsor/5/avatar.svg)](https://opencollective.com/hledger/sponsor/5/website) -->
<!-- [![](https://opencollective.com/hledger/sponsor/6/avatar.svg)](https://opencollective.com/hledger/sponsor/6/website) -->
<!-- [![](https://opencollective.com/hledger/sponsor/7/avatar.svg)](https://opencollective.com/hledger/sponsor/7/website) -->
<!-- [![](https://opencollective.com/hledger/sponsor/8/avatar.svg)](https://opencollective.com/hledger/sponsor/8/website) -->
<!-- [![](https://opencollective.com/hledger/sponsor/9/avatar.svg)](https://opencollective.com/hledger/sponsor/9/website) -->
<!-- [![](https://opencollective.com/hledger/sponsor/10/avatar.svg)](https://opencollective.com/hledger/sponsor/10/website)\ -->
- Sponsor the hledger project with your organisation:\
<a href="https://opencollective.com/hledger/organization/0/website"><img src="https://opencollective.com/hledger/organization/0/avatar.svg?avatarHeight=128"></a>
<a href="https://opencollective.com/hledger/organization/1/website"><img src="https://opencollective.com/hledger/organization/1/avatar.svg?avatarHeight=128"></a>
<a href="https://opencollective.com/hledger/organization/2/website"><img src="https://opencollective.com/hledger/organization/2/avatar.svg?avatarHeight=128"></a>
<a href="https://opencollective.com/hledger/organization/3/website"><img src="https://opencollective.com/hledger/organization/3/avatar.svg?avatarHeight=128"></a>
<a href="https://opencollective.com/hledger/organization/4/website"><img src="https://opencollective.com/hledger/organization/4/avatar.svg?avatarHeight=128"></a>
<a href="https://opencollective.com/hledger/organization/5/website"><img src="https://opencollective.com/hledger/organization/5/avatar.svg?avatarHeight=128"></a>
<a href="https://opencollective.com/hledger/organization/6/website"><img src="https://opencollective.com/hledger/organization/6/avatar.svg?avatarHeight=128"></a>
<a href="https://opencollective.com/hledger/organization/7/website"><img src="https://opencollective.com/hledger/organization/7/avatar.svg?avatarHeight=128"></a>
<a href="https://opencollective.com/hledger/organization/8/website"><img src="https://opencollective.com/hledger/organization/8/avatar.svg?avatarHeight=128"></a>
<a href="https://opencollective.com/hledger/organization/9/website"><img src="https://opencollective.com/hledger/organization/9/avatar.svg?avatarHeight=128"></a>
<!-- ^ major trouble resizing these -->

<!-- <img src="https://opencollective.com/hledger/tiers/backers/badge.svg?label=Backers&color=brightgreen" /> \ -->
- Sponsor the hledger project as an individual:\
[![](https://opencollective.com/hledger/individual/0/avatar.svg)](https://opencollective.com/hledger/individual/0/website)
[![](https://opencollective.com/hledger/individual/1/avatar.svg)](https://opencollective.com/hledger/individual/1/website)
[![](https://opencollective.com/hledger/individual/2/avatar.svg)](https://opencollective.com/hledger/individual/2/website)
[![](https://opencollective.com/hledger/individual/3/avatar.svg)](https://opencollective.com/hledger/individual/3/website)
[![](https://opencollective.com/hledger/individual/4/avatar.svg)](https://opencollective.com/hledger/individual/4/website)
[![](https://opencollective.com/hledger/individual/5/avatar.svg)](https://opencollective.com/hledger/individual/5/website)
[![](https://opencollective.com/hledger/individual/6/avatar.svg)](https://opencollective.com/hledger/individual/6/website)
[![](https://opencollective.com/hledger/individual/7/avatar.svg)](https://opencollective.com/hledger/individual/7/website)
[![](https://opencollective.com/hledger/individual/8/avatar.svg)](https://opencollective.com/hledger/individual/8/website)
[![](https://opencollective.com/hledger/individual/9/avatar.svg)](https://opencollective.com/hledger/individual/9/website)
[![](https://opencollective.com/hledger/individual/10/avatar.svg)](https://opencollective.com/hledger/individual/10/website)
[![](https://opencollective.com/hledger/individual/11/avatar.svg)](https://opencollective.com/hledger/individual/11/website)
[![](https://opencollective.com/hledger/individual/12/avatar.svg)](https://opencollective.com/hledger/individual/12/website)
[![](https://opencollective.com/hledger/individual/13/avatar.svg)](https://opencollective.com/hledger/individual/13/website)
[![](https://opencollective.com/hledger/individual/14/avatar.svg)](https://opencollective.com/hledger/individual/14/website)
[![](https://opencollective.com/hledger/individual/15/avatar.svg)](https://opencollective.com/hledger/individual/15/website)
[![](https://opencollective.com/hledger/individual/16/avatar.svg)](https://opencollective.com/hledger/individual/16/website)
[![](https://opencollective.com/hledger/individual/17/avatar.svg)](https://opencollective.com/hledger/individual/17/website)
[![](https://opencollective.com/hledger/individual/18/avatar.svg)](https://opencollective.com/hledger/individual/18/website)
[![](https://opencollective.com/hledger/individual/19/avatar.svg)](https://opencollective.com/hledger/individual/19/website)
[![](https://opencollective.com/hledger/individual/20/avatar.svg)](https://opencollective.com/hledger/individual/20/website)

<!-- doesn't show all: -->
<!-- - <object type="image/svg+xml" data="https://opencollective.com/hledger/tiers/sponsors.svg?avatarHeight=36&width=600"></object> -->

<!-- doesn't show all: -->
<!-- - <object type="image/svg+xml" data="https://opencollective.com/hledger/tiers/backers.svg?avatarHeight=36&width=600"></object> -->

- Sponsor specific tasks with bounties:\
[![all bounties](https://img.shields.io/badge/github-All_bountied_issues-30bae8 "all bountied issues, bountysource and otherwise")](https://github.com/simonmichael/hledger/issues?q=label:bounty)
[![bountysource bounties](https://api.bountysource.com/badge/team?team_id=75979&style=bounties_received "issues bountied via bountysource")](https://www.bountysource.com/teams/hledger)\
(For small amounts, feel free to just post a pledge on an [issue](CONTRIBUTING.html#open-issues). If you use Bountysource, contribute to a specific issue (not the hledger team), and then announce it on the issue page. Thanks!)

<!---------------------------------------------------------------------------->
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

h1 { 
  font-size: 5em;
  font-style: italic;
  text-align:center;
  margin: 0.5em 0 0;
  display:block;
}

h2 { 
  text-align:center;
  font-size: 2em;
  margin-top:2em; 
}

/* h3 { font-size:large; margin-bottom:.2em; } */

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

#help {
  background-color:lavenderblush;
}

#help tr { 
  border-top:   thin solid lightpink; 
  border-bottom:thin solid lightpink; 
  vertical-align:top; 
}
#help td:nth-child(1) { 
  padding-right:1em; 
  white-space:nowrap; 
}

.highslide img {max-width:200px; float:right; margin:0 0 1em 1em;}
.highslide-caption {color:white; background-color:black;}

/* major trouble resizing open collective logos */
/* .rst-content img { height:inherit; } */
/* img.sponsor { height:128px; } */

</style>
