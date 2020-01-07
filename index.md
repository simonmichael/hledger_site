# hledger

<div id=tagline>
Easy plain text accounting.
<!-- Robust plain text accounting. -->
<!-- Friendly, robust plain text accounting. -->
<!-- Robust, powerful, plain text accounting. -->
<!-- Robust, precise, plain text accounting. -->
<!-- Plain text accounting for everyone. -->
<!-- Making accounting fun for techies. -->
</div>

<img id="coins" src="_static/images/coins2-248.png" style="width:33%; float:right; margin:1em 1em 0 1em;" />

<span style="font-size:x-large;">hledger</span>
is an elegant, versatile accounting program,
for tracking money, time, or other commodities,
on unix, mac and windows,
with command line, terminal and web interfaces.
If you know a little double entry accounting,
it can be a fast, dependable, secure alternative to applications like
Quicken, Xero, or GnuCash.
(And if you don't, it is a great way to learn.)

hledger is one of the leading implementations of [plain text accounting](http://plaintextaccounting.org),
and is a modern and largely compatible reimplementation of [Ledger](https://ledger-cli.org).
Compared to [the others](https://plaintextaccounting.org/#software),
hledger is robust, consistent, and intuitive, with excellent documentation.

hledger is cross platform GNU GPLv3 free software, written in Haskell.
The project is led by Simon Michael, with 100+ contributors.
I've been building and relying on hledger since 2007;
I hope you too will find it helpful in mastering your time and money.

<div class="row" style="text-align:center; margin-bottom:24px;">
<a href="download.html"><button type="button" class="btn btn-primary" title="All the ways to install hledger. Get it now!">Download</button></a>
&nbsp;
<a href="https://github.com/simonmichael/hledger"><button type="button" class="btn btn-neutral" style="padding:4px;" title="hledger on Github. Star us!"><img width="142" src="https://img.shields.io/github/stars/simonmichael/hledger.svg?style=for-the-badge&logo=GitHub&label=Github&color=lightgrey"></button></a>
</div>


## Quick start

Here's the basic workflow when using hledger:

**Step 1:**
Record your transactions in a [plain text file](journal).
(Use hledger's interactive assistant.. the web interface.. any text editor.. a shell alias.. CSV/OFX import..)
<!-- using a simple format. -->
<!-- Do it daily, or all at once. -->
<!-- Record what you know; you'll get better at it. -->

**Step 2:**
Ask hledger about your accounts.. transactions.. balances.. currencies.. monthly averages.. budgets.. market values..
You can start very simply, and get more sophisticated as you learn more about double-entry accounting.

There is an enthusiastic and growing community practising this way of accounting.
which can be quite educational and enjoyable.
If you'd like more background,
we have collected many useful resources at plaintextaccounting.org (see link above).

Read on for more about hledger, or if you're keen to get going,
**[download](download)** it and start the **[tutorial](basics-tutorial)** now!

<!-- I use it for: -->

<!-- - tracking spending and income -->
<!-- - seeing time reports by day/week/month/project -->
<!-- - getting accurate numbers for client billing and tax filing -->
<!-- - tracking invoices -->
<!-- - building financial and time clarity and serenity -->

## Features

### Free software

<a href="http://www.gnu.org/licenses/gpl.html" style="float:right; margin:0 0 1em 0;"><img width="104" height="20" src="https://img.shields.io/badge/license-GPLv3+-brightgreen.svg" /></a>
hledger is Free software, created by [Simon Michael](http://joyful.com)
and released under GNU GPLv3+.

I have been actively developing and using hledger since 2007,
together with 80+ other committers and an unknown number of usually happy-sounding users.

### inspired by Ledger

hledger is a Haskell [reimplementation](faq.html#how-why-was-hledger-started)
of the excellent [Ledger](http://ledger-cli.org).
It remains substantially compatible with Ledger, and if you wish you can keep your data compatible with both.
Read more about the [differences](faq.html#ledger) in the FAQ.


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
&nbsp;&nbsp;[![build status (travis)](https://travis-ci.org/simonmichael/hledger.svg?branch=master)](https://travis-ci.org/simonmichael/hledger)

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
Every feature must be **well documented**,
and getting started must be easy.

### focussed on serving users

hledger strives to be usable, practical and to provide real-world value.
Intuitive features, bug-free operation and complete, accurate documentation are top goals.
Currently it is particularly suited to techies, i.e. users who appreciate the
power of text files, revision control, scriptability and double entry
accounting.



## Help/Feedback

<table>
  <tr>
    <td>IRC (Chat)</td>
    <td>
      <a href="http://irc.hledger.org">#hledger</a> on Freenode (<a href="http://matrix.hledger.org">#freenode_#hledger:matrix.org</a> on Matrix)
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


<div id=dev class=contentbox>

**Help fund hledger!**\
Building and supporting good software and documentation costs a lot.

<a href="https://www.paypal.com/cgi-bin/webscr?cmd=_s-xclick&amp;hosted_button_id=5J33NLXYXCYAY"><img width=62 height=31 border=0 src="https://www.paypal.com/en_US/i/btn/x-click-but04.gif" title="Give one time or recurringly with Paypal" alt="paypal"></a>
<a href="https://opencollective.com/hledger#support"><img border="0" src="https://opencollective.com/hledger/backers/badge.svg" title="Back us with a monthly donation at Open Collective" alt="open collective backers"></a>
<a href="https://opencollective.com/hledger#support"><img border="0" src="https://opencollective.com/hledger/sponsors/badge.svg" title="Sponsor us with a $100+ monthly donation at Open Collective and get your organization's logo on our README" alt="open collective sponsors"></a>
<a href="https://www.bountysource.com/trackers/536505-simonmichael-hledger"><img border=0 src="https://www.bountysource.com/badge/tracker?tracker_id=536505" title="Contribute or claim issue bounties via Bountysource" alt="bountysource"></a>
</div>



<style>
 .highslide img {max-width:200px; float:right; margin:0 0 1em 1em;}
 .highslide-caption {color:white; background-color:black;}
 a {white-space:nowrap;}

h1 { font-size:4em; margin-bottom:.3em; }

#tagline {
  font-size:xx-large;
  font-style:italic;
  position:relative;
  top:-.5em;
  left:.5em;
  /*text-align:right;*/
}

/* h2 { font-size:x-large; margin-top:.5em; } */
/* h3 { font-size:large; margin-bottom:.2em; } */
tr { border-top:thin solid #bbb; border-bottom:thin solid #bbb; vertical-align:top; }
td:nth-child(1) { padding-right:1em; white-space:nowrap; }
.col-sm-3, .col-sm-4 {
  padding:0;
}
.contentbox {
  margin:1em .5em .5em 0;
  padding:.1em .5em;
  border-radius:1em;
}
#introduction {
/*  background-color:#ffb; */
}
#help {
  background-color:#fdd;
}
#reference {
  background-color:#eef;
  text-align:left;
}
#reference .subcontent {
  margin-left:1em;
}
#dev {
  background-color:#eee;
  text-align:left;
}
#dev .subcontent {
  margin-left:1em;
}
#wiki {
  background-color:#efe;
  text-align:center;
}
#wiki .subcontent {
}
</style>
