<!-- stylesheet at bottom -->


<img id="coins" src="_static/images/coins2-248.png" style="width:120px; margin:2em 1em; float:left;" />
<img id="coins" src="_static/images/coins2-248.png" style="width:120px; margin:2em 1em; float:right;" />

# hledger
<div id="tagline">
easy plain text accounting
</div>

<span id="leadingword">hledger</span> 
is cross-platform accounting software with an unusual combination of strengths:

0. It is a **high quality implementation of [Plain Text Accounting]**. This means:

   - It is a simple yet powerful [double-entry accounting] system
     that can track money, time, investments, cryptocurrencies, inventory and more.

   - Your data is stored as future-proof, human-readable plain text.
     There is no data lock-in; you can migrate to/from other 
     [plain text accounting apps], spreadsheets etc.

   - You can add data with your favourite text editor, or a UI, or
     download it from banks or [any CSV file][convert].

   - You can optionally use a version control system, such as [Git],
     to safeguard your data; track changes; manage alternate what-if
     scenarios; and collaborate with others.

   - You can start with 
     [very basic journal entries and reports](#quick-start),
     and get more sophisticated when you're ready.

   - The plain text format and fast command-line interface
     (plus a reusable [library] for building your own [commands][script])
     facilitate scripting and customisation.

0. It is **free to use**, with no purchase price or monthly fees.
   And it is licensed under **[GNU GPLv3][gpl]**, providing the strongest guarantee
   that you will always have the right to run, inspect, modify, or share it.

0. It runs on your local computer, keeping your financial data
   **private and under your control**. (You can also share/collaborate
   online if you wish.)

0. It is **easy to [install] on all supported platforms**, with official **mac, windows & linux** builds.

0. It comes with supported, zero-setup **[command line]**, **[terminal]**, and **[web]** user interfaces,
   and aims to serve **both power users and folks new to accounting or computers**.

0. It prioritises **robustness**, **usability**, and **thorough documentation**.

0. It is **[actively maintained]**, with regular [releases],
   a large [chat room](#help) and other [support resources](#help).




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
[ledger]:                     https://plaintextaccounting.org/#plain-text-accounting-apps
[beancount]:                  https://plaintextaccounting.org/#plain-text-accounting-apps
[gpl]:                        https://en.wikipedia.org/wiki/GNU_General_Public_License
[library]:                    https://hackage.haskell.org/package/hledger-lib
[script]:                     https://github.com/simonmichael/hledger/blob/master/bin/hledger-check-tag-files.hs
[import]: hledger.html#import
[convert]: convert-csv-files.html


## Quick Start

<div style="text-align:center; margin:1em;">
<a href="download.html"><button type="button" class="btn btn-primary" title="All the ways to install hledger. Get it now!">Download/Install</button></a>
<a href="https://github.com/simonmichael/hledger"><button type="button" class="btn btn-neutral" style="padding:4px;" title="hledger code and issue tracker on Github. Star us!"><img width="142" src="https://img.shields.io/github/stars/simonmichael/hledger.svg?style=for-the-badge&logo=GitHub&label=Github&color=lightgrey"></button></a>
</div>

You can start with hledger very simply, and get more sophisticated as
you learn more about double-entry accounting and automation.
Here are some common ways of using it:

**Command line:**
[Use hledger add](add.html)'s interactive prompts to enter transactions,
run hledger commands to see reports.

**Web or terminal UI:**
[Use hledger-web](web.html) or [use hledger-ui](ui.html) to enter
transactions and see reports.

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

\
Next, you could:

- Explore the sidebar to your left (or on small screens, the menu button at top left).
  It scrolls and expands, and all hledger docs can be found there.
- Look at some tutorials, about
  **[hledger add](add.html)**,
  **[hledger-web](web.html)**,
  **[hledger-ui](ui.html)**, or
  **[accounting](add.html)**.
- Read or skim the manuals: the
  **[hledger](hledger.html)**,
  **[hledger-ui](hledger-ui.html)**, and
  **[hledger-web](hledger-web.html)** tools 
  and the
  **[journal](journal.html)**,
  **[csv](csv.html)**,
  **[timeclock](timeclock.html)**,
  **[timedot](timedot.html)** file formats.
  Or just the **[intro](hledger.html#hledger)** and **[COMMON TASKS](hledger.html#common-tasks)**.
- Browse the **[blog posts]** on plaintextaccounting.org.
- Watch **[videos](videos.html)**, such as "hledger fan"'s beginner lessons.
- Look at lots of **[example files]**.
- Introduce yourself in our **[chat room](#help)**, or browse the **[mail list]**.
- Read on...

[blog posts]: https://plaintextaccounting.org/#articles-blog-posts
[example files]: https://github.com/simonmichael/hledger/tree/master/examples
[mail list]: https://groups.google.com/forum/#!forum/hledger

## More...

hledger is brought to you by [Simon Michael](http://joyful.com) and 120+ contributors.
I've been building and relying on it continuously since 2007;
I hope you too will find it helpful in mastering your time and money!
When your wealth allows, perhaps you'll feel inspired to become a
[sponsor] and help us do more.

hledger is a [Haskell] rewrite/reboot of the pioneering [Ledger](http://ledger-cli.org).
([Why?](faq.html#how-why-was-hledger-started))
Ledger users will find it very familiar, and you can keep your data compatible with both tools if you wish.
Read more about the [differences](faq.html#ledger).

hledger strives to be usable, practical and to provide real-world value.
Intuitive features, dependable bug-free operation and complete, accurate documentation are top goals.

<a href="_static/images/balance-q-inc.png" class="highslide" onclick="return hs.expand(this)"><img src="_static/images/balance-q-inc.png" title="Balance report showing income/expense by quarter" /></a>
hledger is first a command-line tool.
Your data lives in a plain text journal file which you can edit
any way you wish; hledger reads that file and produces reports of
various kinds, without changing your data. (It can help you add new
transactions, but does not change existing ones.)
<br clear="all">

<a href="_static/images/hledger-ui/hledger-ui-bcexample-acc.png" class="highslide" onclick="return hs.expand(this)"><img src="_static/images/hledger-ui/hledger-ui-bcexample-acc.png" title="hledger-ui accounts screen" /></a>
hledger also provides a [terminal&nbsp;interface](hledger-ui.html)
that lets you review account balances and transactions quickly and without fuss.
([screencast](https://asciinema.org/a/29665))
<br clear="all">

<a href="_static/images/hledger-web/normal/register.png" class="highslide" onclick="return hs.expand(this)"><img src="_static/images/hledger-web/normal/register.png" title="Account register view with accounts sidebar" /></a>
And, a zero-setup
[web&nbsp;app](hledger-web) for a more point-and-click experience
([demo](http://demo.hledger.org)).
Run it on your local machine, or on a server, 
or set it up with a few clicks on
[Sandstorm](https://apps.sandstorm.io/app/8x12h6p0x0nrzk73hfq6zh2jxtgyzzcty7qsatkg7jfg2mzw5n90).
<br clear="all">

<!-- There's also a [UI running in the browser](https://hledger.alhur.es) (hledger compiled with GHCJS). -->
<!-- This is a prototype, but it's nice sandbox for trying out hledger's journal syntax. -->

<a href="_static/images/hledger-lib-api.png" class="highslide" onclick="return hs.expand(this)"><img src="_static/images/hledger-lib-api.png" title="Part of hledger-lib's haddock api documentation" /></a>
hledger is written in Haskell, a modern, highly-regarded
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


## Help/Feedback

<div id="help">
<table>
  <tr>
    <td>Chat:</td>
    <td>
      <a href="http://irc.hledger.org">#hledger</a> on Freenode IRC
      (or via Matrix: <a href="http://matrix.hledger.org">#freenode_#hledger:matrix.org</a>)
    </td>
  </tr>
  <tr>
    <td>Mail list:</td>
    <td>
      <a href="http://list.hledger.org">list.hledger.org</a>, <a href="mailto:hledger@googlegroups.com">hledger@googlegroups.com</a>
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
      <a href="http://irc.hledger.org">#plaintextaccounting</a> chat
      (or <a href="https://matrix.to/#/#freenode_#hledger:matrix.org">#freenode_#plaintextaccounting:matrix.org</a>)
      <br>
      <a href="https://www.ledger-cli.org/docs.html">Ledger CLI docs</a>
      <br>
      <a href="http://furius.ca/beancount/doc/index">Beancount docs</a>
      <br>
      <a href="https://twitter.com/LedgerTips">@LedgerTips (2014-2018)</a>
    </td>
  </tr>
</table>
</div>


## Sponsorship

<div id="fund" style="float:right; margin:0 2em 4em;">
<a href="https://www.paypal.com/cgi-bin/webscr?cmd=_s-xclick&amp;hosted_button_id=5J33NLXYXCYAY"><img width=62 height=31 border=0 src="https://www.paypal.com/en_US/i/btn/x-click-but04.gif" title="Give one time or recurringly with Paypal" alt="paypal"></a><br>
<a href="https://github.com/sponsors/simonmichael"><img border="0" src="https://img.shields.io/badge/Sponsor_on-Github-limegreen" title="Sponsor the project leader on Github" alt="github"></a><br>
<a href="https://liberapay.com/simonmichael"><img border="0" src="https://img.shields.io/badge/Sponsor_on-Liberapay-limegreen" title="Sponsor the project leader on Github" alt="liberapay"></a><br>
<div style="margin-top:0.5em; font-size:small; white-space:nowrap;">Open Collective:</div>
<a href="https://opencollective.com/hledger#support"><img border="0" src="https://opencollective.com/hledger/backers/badge.svg" title="Back us with a monthly donation at Open Collective" alt="open collective backers"></a>
<a href="https://opencollective.com/hledger#support"><img border="0" src="https://opencollective.com/hledger/sponsors/badge.svg" title="Sponsor us with a $100+ monthly donation at Open Collective and get your organization's logo on our README" alt="open collective sponsors"></a><br>
<!-- <a href="https://patreon.com/simonmichael"><img border="0" src="https://img.shields.io/badge/Sponsor_on-Patreon-limegreen" title="Sponsor the project leader on Github" alt="patreon"></a><br> -->
<!-- <a href="https://www.bountysource.com/trackers/536505-simonmichael-hledger"><img border=0 src="https://www.bountysource.com/badge/tracker?tracker_id=536505" title="Contribute or claim issue bounties via Bountysource" alt="bountysource"></a> -->
</div>

Building and supporting good software and documentation requires a lot of time and life energy.
Maybe these thousands of person-hours have helped you ?
You can give back at any level and be one of the generous Sponsors
helping to sustain and accelerate the hledger project, and helping
more people to achieve financial freedom.

<br>
<br>


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
  margin:0 0 1em;
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

#fund {
/*
  background-color: #eee;
  border-radius:1em;
  margin:1em .5em .5em 0;
  padding:.1em .5em;
*/
}
/*
#fund td { 
  width:50%;
}
*/

.highslide img {max-width:200px; float:right; margin:0 0 1em 1em;}
.highslide-caption {color:white; background-color:black;}

</style>
