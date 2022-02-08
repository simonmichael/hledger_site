<!-- stylesheet at bottom -->
<img id="coins" src="/images/coins2-248.png" style="width:120px; margin:2em 1em; float:left;" />
<img id="coins" src="/images/coins2-248.png" style="width:120px; margin:2em 1em; float:right;" />

# hledger
<!-- 
This page's verbosity continually oscillates. General plan:
brief blurbs with links to more detail:
- what (& examples)
- why (& why not)
- who (for)
- how
-->

<!-- 
Tagline
https://www.stephendiehl.com/posts/marketing.html#persuasion-and-decision-makers :
1. It is memorable
2. It includes a key benefit
3. It differentiates
4. It imparts positivity
-->
<div id="tagline">
Fast, robust, intuitive<br>
plain text accounting.
</div>

<div class=pagetoc>
<!-- toc -->
</div>

## What is this ?

***hledger*** is free, cross-platform, high quality ***Plain Text Accounting*** software:
a fast and light multicurrency accounting system 
that uses human-readable, version-controllable plain text files.

With it you can track your money, investments, cryptocurrencies, time, inventory, or any other commodity, 
dependably and privately without needing any cloud service or vendor.

I'm Simon Michael, hledger project founder and PTA fan. Welcome! 

## Why use hledger ?
The [General FAQ](faq.html) or the [plaintextaccounting.org](https://plaintextaccounting.org) site introduce Plain Text Accounting.

Compared to [other PTA apps](https://plaintextaccounting.org/#software) like Ledger and Beancount,
hledger has a particular focus on intuitive UX and practicality for day-to-day accounting.
Accurate documentation and "just works" are prioritised, and it is actively maintained.
It supports most of Ledger's and Beancount's features but omits
some of the more programmer-oriented ones (value expressions, lot-matching notations).

We hope non-programmers will appreciate hledger's 
built-in financial statements, 
multi-period reports, 
choice of user interfaces, 
easy CSV import system
and general robustness.
And that programmers will enjoy its
speed (25k txns/s on a macbook air m1), 
accuracy (up to 255 decimal places), 
reliability ($100 bounty for regressions), 
and easy extensibility/embeddability via Haskell scripts/apps.
Here's more about [Why hledger ?](why.html)

[![github](https://img.shields.io/github/stars/simonmichael/hledger.svg?logo=GitHub&label=Github)](https://github.com/simonmichael/hledger)

## How do I get started ?
Here are some of the most useful docs:
[General FAQ](faq.html),
[Install](install.html),
[Getting Started Guide](start.html),
[hledger manual](hledger.html),
[Support/Discussion](support.html),
[Accounting concepts](accounting.html).

For more, see the site's sidebar; click/tap the horizontal-lines icon at top left to open it.
You can also use the magnifying-glass icon to search this site,
and there are [access keys](https://en.wikipedia.org/wiki/Access_key#Access_in_different_browsers):\
`s` sidebar, `t` theme, `/` search, `1` home, `2` changes, `<` previous page, `>` next page.

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

## How is it funded ?

hledger is brought to you by [Simon Michael](http://joyful.com) and [140+ contributors](CREDITS.html).
I have been building and relying on this project continuously since 2007, funded mostly by unrelated consulting work.
I hope you too will find it useful in transforming your relationship with time and money.
When you have achieved some success, please consider joining the [sponsors](sponsor.html)
to support the project. Thanks!

<a name="help"></a>
<a name="help-feedback"></a>

## Where should I go next ?

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
- Ask questions/introduce yourself in #hledger chat via [matrix](http://matrix.hledger.org) or [IRC](http://irc.hledger.org);
  browse the [mail list](http://list.hledger.org);
  explore the other [Support/Discussion](support.html) options.



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

</style>
