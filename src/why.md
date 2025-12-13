# Why hledger ?

<div class=pagetoc>

<!-- toc -->
</div>


[hledger](index.md) is free, user-friendly accounting software designed to be:

**Dependable** - Your data stays local, private, version-controlled, and future-proof.
Plain text files work with your favorite text tools and never lock you in.

**Fast and lightweight** - Starts instantly, processes 15k-25k transactions/second.
Single executable, no database, no configuration required.

**Versatile** - Track money, investments, cryptocurrencies, time, or any commodity using battle-tested
[double-entry bookkeeping](accounting.md). Scales from personal use to business accounting.

**Actively maintained** - New releases quarterly since 2008, extensive documentation,
active chat community. [We'll pay you $50](REGRESSIONS.md) if you find or fix a regression bug.

## How is it different from traditional accounting software ?

hledger is a **[plain text accounting]** system, which means:

- Data is stored in simple plain text files, which can be easily read by humans, tracked with version control software such as Git, and maintained with text processing tools. This facilitates auditing, portability, and longevity of your valuable accounting data.

- The data format is flexible and easy to write or generate, but hledger can check it and prevent many kinds of error. This, plus the transparency and version control, provides confidence in your data and reports.

- Data and software is kept on your local computer, keeping your financial data private and under your control. But if you should want to collaborate, version control makes that easy.

- You can edit data with your favourite text editor or IDE, or a data entry UI, or convert and import data from other formats (eg CSV from your banks).
  
- There is a fast command-line interface, which makes the tool easy to script, automate, and integrate into custom workflows.

- The model of  operation is simple: put a log of transactions in, get reports out.

- It is fast, lightweight, non-distracting, and great for learning more of double-entry bookkeeping and accounting.

## How is it different from other plain text accounting apps ?

See [hledger and Ledger](ledger.md)
and [hledger and Beancount](beancount.md).


## What can hledger do ?

hledger can provide clarity and insight into your personal or business
finances, time logs, or other dated quantitative data. You provide a list of
transactions (plain text or CSV), and hledger generates reports and interactive views.

### For your goals

It can help you to:
- understand bookkeeping
- keep your financial records safe, correct, and private
- untangle accounting messes
- know your financial status
- keep track of loans, due dates, invoices
- forecast future activity and balances
- search your financial history
- categorise your spending
- understand your patterns
- make impactful changes and plans
- track spending and saving goals
- answer financial questions
- explore what-if scenarios
- produce detailed time reports
- get data needed for tax preparation
- convert/transform financial data
- check the correctness of other systems
- automate accounting tasks
- create more clarity, balance, and peace of mind

### Core capabilities

hledger can:
- list transactions, payees, currencies/commodities, accounts, statistics
- show account hierarchies and subaccounts
- show transactions affecting any account with running balances
- make balance sheets, cashflow reports, income statements
- show simple bar charts by period
- show purchase costs/selling prices and market values in any currency
- calculate rates of return for investments
- make reports from timeclock, timedot, or CSV/SSV/TSV files
- filter by time period, account, or any criteria
- show multiple periods side by side
- summarise accounts to any depth
- rewrite or pivot account names to transform reports
- output as plain text, HTML, CSV, TSV, JSON, SQL
- run as a live-updating terminal UI for fast interactive exploration
- run as a web app for remote/multi-user browsing and data entry
- run as a JSON web API for custom integrations
- combine multiple files and data sets
- generate recurring transactions and forecasts by rule
- generate extra postings (splits) on transactions by rule
- make budget reports showing goals vs actual performance
- generate interest transactions by rule
- help you enter new transactions with prompts or a terminal UI
- import and convert transactions from banks and other sources
- be used as a library in Haskell scripts or programs

More examples: [Charts and Graphs](charts.md) • [HTML reports](report-examples.md#income-statement-2012-01-012014-10-11) • [Working with other software](doc.md#other-software) • [Investing and trading](doc.md#investing-and-trading) • [Scripts and addons](scripts.md)

## What problems does hledger solve ?

Here are some problems a plain text accounting app, and hledger specifically, can solve.
Do any of these apply to you ?

<style>
h3 { margin:0 0 -0.5em;}
</style>

<!-- toc -->

### I am a technical person wanting to track finances with familiar tools and a minimum of fuss
You can learn hledger's syntax quickly, manage data with your favourite text processing tools,
and produce useful financial reports right away with a single executable requiring no configuration.

### I don't have an effective accounting system, and am experiencing financial chaos, loss, or worry
(This was my situation when I started writing hledger.)
I can tell you that having some kind of system to keep a record of financial activity and give clarity and insight is a huge help; it can be life-changing.
hledger is a free, highly dependable accounting tool, that scales smoothly from basic to advanced needs.
It provides structure, extensive documentation, and a supportive community.
It is lightweight and minimal, so you can start simply without feeling overwhelmed by complex software.

### I’m worried I may accidentally lose my financial records (paper or digital).
hledger data takes up no physical space.
Because the files are plain text and relatively small, it’s easy to copy them and to make redundant backups, and to use a version control system providing a clear history of changes.
Multiple independent software apps can read them, and you could relatively easily build a new one.
They are also human-readable and printable, useful even without software or computers.

### I do single entry accounting; sometimes reports are wrong, I can't rely on them
You can do single entry with hledger too, if you like.
But for centuries, the standard for serious accounting has been double entry, because it is so good at preventing errors.
hledger, like other plaintext accounting apps, is built around double entry accounting.
This provides great reassurance that your reports are rock solid, so you can confidently make decisions and take actions based on them.

### I am confused by accounting and bookkeeping, and I want to get better at it
Using a plain text accounting app like hledger,
you'll be working hands-on with double entry bookkeeping and general journal entries,
with a minimum of distracting software and jargon.
Also you'll have a supportive community of fellow learners and experts to answer questions.

### I want to try Plain Text Accounting, but I am finding it hard to get started
Perhaps you've struggled to get a productive Beancount setup.
Or you weren't able to figure out how to do some things with Ledger.
You are finding it too much work to produce basic financial reports at the command line.
Maybe you want a GUI or TUI, that's simple to install and use.
You want more up to date and complete documentation, or active chat rooms where you can get quick support.\
hledger aims to serve both techies and non-techies and to provide a smoother getting started experience,
with standard financial reports and simple UIs that work out of the box.

### My paper-based system is too much work and too hard to get insights from
hledger can optionally import bank data, reducing the work of manual data entry.
With a little programming you can automate many accounting tasks.
And hledger provides many useful and flexible reports.

### My accounting spreadsheet has grown too large, too error prone, or too limiting
hledger provides a simple, expressive, widely used syntax for describing any kind of financial transaction, using standard double entry bookkeeping.
It scales up to large files, provides extensive error checking, and provides very flexible reports.

### My accounting software is expensive, invasive, and hard to leave
As GPLv3-licensed Free Software, hledger both is free in price, and also works to preserve your personal freedoms.
It runs entirely under your control, on your private machine.
You can see all of its code, and you can improve it or fix it yourself, or you can hire someone to do that.
There's no lock-in, and there are multiple ways to export data, including to other plain text accounting apps like Ledger, Beancount, Fava, Paisa etc.

### My accounting software works only with an online connection
hledger is local software that works offline.
The user manuals are also built in and viewable on any machine.
The only time you might need the internet is to download bank data
or to run your own hledger-web server, and these are optional.

### My accounting software is opaque or unreliable, and I worry about messing up my data
Most hledger operations are read only and can't affect your data.
Commands that change your files are clearly identified, and often are append-only.
hledger provides extensive error checking to help you avoid data errors, and the app itself is heavily tested and written in a high assurance programming language.
Best of all, the plain text data files are ideal for version control. 
This means you can review and audit every change to your data, and undo or roll back history at any time.

### My accounting software is inefficient
Is it slow to start up ? Are certain operations tedious and time-consuming ?\
hledger is lightweight and fast, starting instantly and usually producing results in a fraction of a second even on old machines.
It stores data as human-readable plain text files, which means you can do even large-scale bulk edits quickly and easily.
The command line interface means you can turn complex operations into easy commands, or integrate it in automated scripts.

### My accounting software is not improving, and I would prefer a tool that's actively maintained and supported
hledger has delivered a new major release every quarter since 2017.
It's the only PTA app with active chat rooms (matrix and IRC).
It's the most-used PTA app in
[some](https://chaos.social/@scy/114663971347130842)
[circles](https://matrix.to/#/#plaintextaccounting:matrix.org/$YPqMTQy8ij5G3Jv7axvWcaFDYPipl940L-FhvdXQJ8s).

## Batteries are included

hledger is a combination of

- user-friendly, dependable accounting app
- swiss army penknife and power tool for financial data
- hands-on bookkeeping tutorial / refresher course / library
- and a supportive community of fellow money wranglers.

It comes with multiple user interfaces that just work:

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
- Easy [assisted data entry](add.md) or [CSV import](import-csv.md)
- Easy zero-setup [command line], [terminal], and [web] user interfaces
- Easy multi-period [balance sheet], [income statement], and [cashflow] reports
- Easy summarising of account balances to a [desired depth][depth limiting]
- Easy output to [text, HTML, CSV, JSON or SQL][output format]
- Easy import/export/co-usage with Ledger CLI or Beancount
- Easy to [download] or [build] on all major platforms

## It's dependable

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

## It's fast

- Reports normally take a fraction of a second.
- `hledger-ui --watch` normally updates instantly as you edit.
- On a 2021 macbook air m1, hledger processes about [15k-25k transactions per second](ledger.md#performance)
  ([depending on version](https://github.com/simonmichael/hledger/issues/2122)).

## It's compatible

hledger is a rewrite of the pioneering [Ledger CLI], aiming to
build out the same core features to a higher level of quality,
and to add new ones making it useful to more people.
Ledger users will find the file formats and commands familiar,
and with a little care can run both tools on the same data files.
(You can read more about
the [origins](ledger.md)
and [differences](ledger.md#differences).)

hledger can also convert its files to [Beancount] format
(and Beancount can convert its files to hledger format).

Many [tools](https://plaintextaccounting.org/#data-importconversion)
exist for importing from other applications.  Data can be exported as
CSV, JSON or basic SQL.

## It's Free Software

hledger is [Free Software], with no purchase price or monthly fees.
It is licensed under [GNU GPLv3+][gpl], providing the strongest guarantee
that you will always have the right to run, inspect, modify, or share it.
It is [actively maintained], with regular [releases]
and a [large chat room and other support resources](support.md).



## When might hledger not be a good choice ?

hledger is not yet ..

- easy for completely non-technical people to install and use without help
- easy to use on a phone
- equipped with mature, polished GUIs, or easy charts
- able to download directly from banks and financial institutions
- capable of automatically tracking capital gains like Beancount and Ledger
- masterable in a day (or a week..)

Plain Text Accounting, and Double Entry Bookkeeping and Accounting generally, are deep and rich topics.
As a newcomer you might feel there's both too much and not enough to read;
too much flexibility, and not enough structure or guidance.

You may need to [pace yourself](doc.md), 
ask the [chat](support.md) for tips, 
and learn through hands-on practice.


[blog posts]:                 https://plaintextaccounting.org/#articles-blog-posts
[example files]:              https://github.com/simonmichael/hledger/tree/master/examples
[mail list]:                  https://groups.google.com/forum/#!forum/hledger
[Ledger CLI]:                 https://ledger-cli.org
[command line]:               hledger.md
[terminal]:                   hledger-ui.md
[web]:                        hledger-web.md
[balance sheet]:              hledger.md#balancesheet
[income statement]:           hledger.md#incomestatement
[cashflow]:                   hledger.md#cashflow
[depth limiting]:             hledger.md#depth-limiting
[output format]:              hledger.md#output-format
[download]:                   install.md#binary-packages
[build]:                      install.md#building-from-source
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

