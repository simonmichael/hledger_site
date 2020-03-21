<!-- stylesheet at bottom -->

<div id="grabber">
<div class="heading" style="margin:0.5em;">Are you...</div>

Vague about money ?\
Not trusting your financial reports ?\
Unable to document how you spent time ?\
Dreading: taxes.. wasting money.. running out of cash.. ?\
Overwhelmed by bookkeeping or complex accounting software ?\
Wanting a complete, up-to-date model of all your finances under your control ?\
Ready for a lean, robust, private, Free, supported accounting tool that fits your brain ?\
Just wanting basic financial reports, forecasting, and budgets with minimum effort ?\
Interested in efficiency, complex transactions, and automating your finances ?\
Keen to see principled double entry bookkeeping finally making sense ?\
Seeking a community of helpful folks solving similar problems ?\
Open to accounting being empowering and 
<span style="color:red; font-weight:bold; font-style:italic; position:relative; top:-1px;">f</span><span style="color:blue; font-weight:bold; font-style:normal; position:relative; top:2px;">u</span><span style="color:darkorange; font-weight:bold; font-style:italic; position:relative; top:-1px;">n</span> ?
<div class="heading" style="position:relative; top:-0.5em;">Don't Panic!</div>
</div>

# hledger
<div id="tagline">
and <span style="font-size:100%; font-weight:bold;">plain text accounting</span>
<br>
are here to help!
</div>
<!-- Easy plain text accounting. -->
<!-- Robust plain text accounting. -->
<!-- Friendly, robust plain text accounting. -->
<!-- Robust, powerful, plain text accounting. -->
<!-- Robust, precise, plain text accounting. -->
<!-- Plain text accounting for everyone. -->
<!-- Making accounting fun for techies. -->
<!-- save time: drop these for now: -->
<!-- <img id="coins" src="_static/images/coins2-248.png"  style="width:120px; position:absolute; margin:3em 2em;" /> -->
<!-- <img id="coins" src="_static/images/coins2-248.png"  style="width:120px; position:absolute; margin:1em 2em;" /> -->

<span id="leadingword">hledger</span> is a robust, cross-platform accounting tool,
freely licensed under GNU GPLv3.
You can use it to track time, money, investments, cryptocurrencies, inventory and more,
using the command line, terminal, or a web browser.

If you know a little double entry accounting,
hledger can be a fast, dependable, secure alternative to applications like
Quicken, Xero, YNAB or GnuCash.
And if you don't, it is a great way to learn!

hledger is one of the leading [plain text accounting](http://plaintextaccounting.org) apps, 
known for their plain text data formats, flexibility, and simplicity.
There is an enthusiastic and growing community practising this way of accounting,
which can be quite educational and enjoyable.

Compared to [the others](http://plaintextaccounting.org#software), hledger is robust, consistent, and intuitive, with a high level of documentation and maintenance.
It is a high quality rewrite, in [Haskell](https://haskell.org), of the pioneering [Ledger](https://ledger-cli.org).
hledger has been created by [Simon Michael](http://joyful.com) and 120+ contributors.
I've been building and relying on it continuously    since 2007;
I hope you too will find it helpful in mastering your time and money!

## Quick Start

<div style="text-align:center; margin:1em;">
<a href="download.html"><button type="button" class="btn btn-primary" title="All the ways to install hledger. Get it now!">Download/Install</button></a>
<a href="https://github.com/simonmichael/hledger"><button type="button" class="btn btn-neutral" style="padding:4px;" title="hledger on Github. Star us!"><img width="142" src="https://img.shields.io/github/stars/simonmichael/hledger.svg?style=for-the-badge&logo=GitHub&label=Github&color=lightgrey"></button></a>
</div>

You can start with hledger very simply, and get more sophisticated as you learn more about double-entry accounting.
Here's the most basic workflow:

<table>
<tr>
<td style="padding-right:1em;">

**Step 1.** Record transactions in a [plain text file](journal.html) (one way or another). For example:
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

**Step 2.** Run hledger in a [terminal](https://itconnect.uw.edu/learn/workshops/online-tutorials/web-publishing/what-is-a-terminal/)
to report [balances](https://en.wikipedia.org/wiki/Balance_sheet#Personal), 
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

<!-- I use it for: -->

<!-- - tracking spending and income -->
<!-- - seeing time reports by day/week/month/project -->
<!-- - getting accurate numbers for client billing and tax filing -->
<!-- - tracking invoices -->
<!-- - building financial and time clarity and serenity -->

All hledger docs are linked in the sidebar to your left
(or on small screens, in the drop-down menu at top left).
Note that it scrolls, and expands to show the current page's table of contents.
ABOUT, TUTORIALS, and MANUALS are official docs, expected to be up to date;
COOKBOOK docs are not.

Next, depending on how you like to learn, you could:

- Jump to interesting tutorials or cookbook topics in the sidebar
- Read the hledger manual's **[intro](hledger.html#hledger)** 
  and **[COMMON TASKS](hledger.html#common-tasks)**
- Skim or read the manuals in full:\
  the **[hledger](hledger.html)**,
  **[hledger-ui](hledger-ui.html)**,
  **[hledger-web](hledger-web.html)** tools and
  **[journal](journal.html)**,
  **[csv](csv.html)**,
  **[timeclock](timeclock.html)**,
  **[timedot](timedot.html)** file formats
- Watch **[videos](videos.html)**, such as the "hledger fan" lessons on youtube
- Browse the hledger-related 
  **[blog posts](https://plaintextaccounting.org/#articles-blog-posts)**
  on plaintextaccounting.org\
  (some of the others can be helpful too).
- Look at **[example files](https://github.com/simonmichael/hledger/tree/master/examples)**
- Introduce yourself in our chat room, or browse the mail list archive
  (**[below](#help)**)
- Read on...

## hledger is...

### Free software

<a href="http://www.gnu.org/licenses/gpl.html" style="float:right; margin:0 0 1em 0;"><img width="104" height="20" src="https://img.shields.io/badge/license-GPLv3+-brightgreen.svg" /></a>
hledger is Free software, created by [Simon Michael](http://joyful.com)
and released under GNU GPLv3+.

### inspired by Ledger

hledger is a Haskell [reimplementation](faq.html#how-why-was-hledger-started)
of the excellent [Ledger](http://ledger-cli.org).
It remains substantially compatible with Ledger, and if you wish you can keep your data compatible with both.
Read more about the [differences](faq.html#ledger) in our FAQ.

### a command-line tool

<a href="_static/images/balance-q-inc.png" class="highslide" onclick="return hs.expand(this)"><img src="_static/images/balance-q-inc.png" title="Balance report showing income/expense by quarter" /></a>

hledger is first a command-line tool.
Your data lives in a plain text journal file which you can edit
any way you wish; hledger reads that file and produces reports of
various kinds, without changing your data. (It can help you add new
transactions, but does not change existing ones.)

### a console UI

<a href="_static/images/hledger-ui/hledger-ui-bcexample-acc.png" class="highslide" onclick="return hs.expand(this)"><img src="_static/images/hledger-ui/hledger-ui-bcexample-acc.png" title="hledger-ui accounts screen" /></a>
hledger also provides a [terminal&nbsp;interface](hledger-ui.html)
that lets you review account balances and transactions quickly and without fuss.
([screencast](https://asciinema.org/a/29665))

### a web UI

<a href="_static/images/hledger-web/normal/register.png" class="highslide" onclick="return hs.expand(this)"><img src="_static/images/hledger-web/normal/register.png" title="Account register view with accounts sidebar" /></a>

And, a zero-setup
[web&nbsp;app](hledger-web) for a more point-and-click experience
([demo](http://demo.hledger.org)).
Run it on your local machine, or on a server, 
or set it up with a few clicks on
[Sandstorm](https://apps.sandstorm.io/app/8x12h6p0x0nrzk73hfq6zh2jxtgyzzcty7qsatkg7jfg2mzw5n90).

There's also a [UI running in the browser](https://hledger.alhur.es) (hledger compiled with GHCJS).
This is a prototype, but it's nice sandbox for trying out hledger's journal syntax.

### a Haskell app and library

<a href="_static/images/hledger-lib-api.png" class="highslide" onclick="return hs.expand(this)"><img src="_static/images/hledger-lib-api.png" title="Part of hledger-lib's haddock api documentation" /></a>

hledger is written in Haskell, a modern, highly-regarded
programming language which contributes to hledger's robustness,
performance and long-term maintainability.  Most functionality is
exposed as
[reusable](http://hackage.haskell.org/package/hledger-lib)
[Haskell](http://hackage.haskell.org/package/hledger)
[libraries](http://hackage.haskell.org/package/hledger-web), making it
easy to write your own hledger-compatible
[scripts](scripting.html), [add-ons](hledger.html#add-on-commands) and
applications.
&nbsp;&nbsp;
[![hledger CI](https://github.com/simonmichael/hledger/workflows/hledger%20CI/badge.svg)](https://github.com/simonmichael/hledger/actions)
[![on hackage](https://img.shields.io/hackage/v/hledger.svg?label=hackage&colorB=green)](http://hackage.haskell.org/package/hledger)
[![](https://repology.org/badge/version-for-repo/stackage_nighly/hledger.svg)](https://repology.org/metapackage/hledger)

<!-- <div class="indent1"> -->
<!-- ### comfortable for techies, usable by all -->

<!-- hledger aims to be useful to both computer experts and regular folks. -->
<!-- Currently it is a bit more suited to power users, who appreciate the -->
<!-- power of text files, revision control, scriptability and double entry -->
<!-- accounting. The web interface helps make it accessible to GUI-only -->
<!-- folk as well. -->
<!-- </div> -->

### fully documented

We practice documentation-driven development. 
Every feature must be well documented,
and getting started must be easy.

### focussed on serving users

hledger strives to be usable, practical and to provide real-world value.
Intuitive features, bug-free operation and complete, accurate documentation are top goals.
Currently it is particularly suited to techies, ie users who appreciate the
power of text files, revision control, scriptability and double entry
accounting.


## Help/Feedback

<div id="help">
<table>
  <tr>
    <td>Chat:</td>
    <td>
      <a href="http://irc.hledger.org">#hledger</a> on Freenode IRC (<a href="http://matrix.hledger.org">#freenode_#hledger:matrix.org</a> via Matrix)
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
</table>
</div>


## Sponsorship

<div id="fund">
<table>
  <tr>
    <td>
Building and supporting good software and documentation costs a lot.
Maybe these thousands of person-hours have helped you ?
You can be one of the wise and attractive people helping to sustain and accelerate the hledger project.
    </td>
    <td>
<a href="https://www.paypal.com/cgi-bin/webscr?cmd=_s-xclick&amp;hosted_button_id=5J33NLXYXCYAY"><img width=62 height=31 border=0 src="https://www.paypal.com/en_US/i/btn/x-click-but04.gif" title="Give one time or recurringly with Paypal" alt="paypal"></a><br>
<a href="https://github.com/sponsors/simonmichael"><img border="0" src="https://img.shields.io/badge/Sponsor_on-Github-limegreen" title="Sponsor the project leader on Github" alt="github"></a><br>
<a href="https://liberapay.com/simonmichael"><img border="0" src="https://img.shields.io/badge/Sponsor_on-Liberapay-limegreen" title="Sponsor the project leader on Github" alt="liberapay"></a><br>
<div style="margin-top:0.5em; font-size:small; white-space:nowrap;">Open Collective:</div>
<a href="https://opencollective.com/hledger#support"><img border="0" src="https://opencollective.com/hledger/backers/badge.svg" title="Back us with a monthly donation at Open Collective" alt="open collective backers"></a>
<a href="https://opencollective.com/hledger#support"><img border="0" src="https://opencollective.com/hledger/sponsors/badge.svg" title="Sponsor us with a $100+ monthly donation at Open Collective and get your organization's logo on our README" alt="open collective sponsors"></a><br>
<!-- <a href="https://patreon.com/simonmichael"><img border="0" src="https://img.shields.io/badge/Sponsor_on-Patreon-limegreen" title="Sponsor the project leader on Github" alt="patreon"></a><br> -->
<!-- <a href="https://www.bountysource.com/trackers/536505-simonmichael-hledger"><img border=0 src="https://www.bountysource.com/badge/tracker?tracker_id=536505" title="Contribute or claim issue bounties via Bountysource" alt="bountysource"></a> -->
    </td>
  </tr>
</table>
</div>



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
  font-size:large;
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
#fund td { 
  width:50%;
}

a { white-space:nowrap; }

.highslide img {max-width:200px; float:right; margin:0 0 1em 1em;}
.highslide-caption {color:white; background-color:black;}

</style>
