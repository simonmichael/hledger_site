<!-- * Home ----------------------------------------------------------------->

<!-- ** High priority styles (?) --------------------------------------------->

<link rel="stylesheet" href="https://fonts.googleapis.com/css2?family=Gabarito">
<style>
.content h1 { 
  font-family: Gabarito;
  font-size: 6em;
  white-space:normal;
  text-align:center;
  margin: 0.5em 0 0;
  display:block;
}
.responsive-image {
  width: 25%;
  margin: 1em 1em;
  float: right;
}
@media (max-width: 500px) {  /* typical breakpoint for tablets/phones */
  .content h1 { font-size:20vw; }  /* fit "hledger" within a small screen */
  .responsive-image {  /* put the image on its own line */
      float: none;
      display: block;
      width: 50%;
      margin: 1em auto;
  }
}
</style>

<!-- ** Banner --------------------------------------------------------------->

<img id="coins" class="responsive-image" src="images/coins2-248.png" />
<div id="heading">

# hledger

<div id="tagline" style="margin-bottom:1em;">
Robust, friendly, fast,<br>
plain text accounting.
</div>
</div>
<div style="display:flex; justify-content:center; align-items:flex-start; flex-wrap:wrap; margin-top:1em;">
<a href="/images/cli-green-bs-reg.png" class="highslide" onclick="return hs.expand(this, { captionText:'The hledger command line interface.' })"><img src="images/cli-green-bs-reg.png" width="200"></a>
<a href="/images/home-ui-3.png"        class="highslide" onclick="return hs.expand(this, { captionText:'The hledger-ui text user interface.' })"><img src="images/home-ui-3.png"        width="200"></a>
<a href="/images/web-bcexample.png"    class="highslide" onclick="return hs.expand(this, { captionText:'The hledger-web web user interface.' })"><img src="images/web-bcexample.png"    width="200"></a>
</div>
<div id="quote" class="quote" title="Quote updates hourly.">
  <noscript> <span class="quote-text"></span> <span class="quote-author"></span> </noscript>
  <span id="quote-text" class="quote-text"></span> <span id="quote-author" class="quote-author"></span>
</div>

<br>
<br>

----

<!-- ** Description ---------------------------------------------------------->
<a name="description"></a>

<div class=pagetoc>

<!-- toc -->
</div>

**hledger** is free, friendly, fast, battle-tested, cross-platform, double-entry, multi-currency, multi-interface, GNU GPLv3-licensed, **[plain text accounting software](https://plaintextaccounting.org)**!
It lets you track and analyse money, investments, and cryptocurrencies; also time, inventory, or other things involving dates or numbers.

hledger is built around human-readable, version-controllable, future-proof, **plain text data**.
You can **import from CSV** or other data sources;
or you can record transactions with your favourite text editing tools, IDEs, or data entry UIs.

hledger's user interfaces might seem basic, but you'll find it is **powerful, expressive, and fun to use**.
It scales smoothly from simple to sophisticated needs.
In fact, hledger is a combination of

- user-friendly, dependable accounting app
- swiss army penknife and power tool for financial data
- hands-on bookkeeping tutorial / refresher course / library
- and a supportive community of fellow money wranglers.

More about it:

- **[Why hledger ?](why.md)**, including
  - [How is it different from traditional accounting software ?](why.md#how-is-it-different-from-traditional-accounting-software-)
  - [What problems does hledger solve ?](why.md#what-problems-does-hledger-solve-)
  - [When might hledger not be a good choice ?](why.md#when-might-hledger-not-be-a-good-choice-)
- **[FAQ](faq.md)**, including
  - [Isn't plain text hard to work with ?](faq.md#isnt-plain-text-hard-to-work-with-)
  - [How does hledger relate to Ledger ?](faq.md#how-does-hledger-relate-to-ledger-)
  - [What helpers are available for my text editor or IDE ?](editors.md)
  - [In Emacs, do I have to use hledger-mode ? Is ledger-mode only for Ledger ?](faq.md#in-emacs-do-i-have-to-use-hledger-mode--is-ledger-mode-only-for-ledger-)
  - [Isn't importing from banks a pain ?](faq.md#isnt-importing-from-banks-a-pain-)
  - [Where can I find hledger CSV rules for my financial institutions ?](faq.md#where-can-i-find-hledger-csv-rules-for-my-financial-institutions-)
  - [There are so many docs, where do I even..](faq.md#there-are-so-many-docs-where-do-i-even-)

<!-- ** Start ---------------------------------------------------------------->
<!-- <a name="start"></a> -->

## Get started

- **[Install](install.md)** - How to quickly get hledger installed on your machine.
- **[Support](support.md)** - Don't hesitate to share your questions or feedback.
- **[Docs](doc.md)** - hledger's user documentation, a great place to visit next.

## Get involved

- Add a **[Github star](https://github.com/simonmichael/hledger/tree/master)**
  to help make us a [notable Haskell app](https://joyful.com/Haskell#What%20are%20some%20Haskell%20apps%20?) !
- **[Sponsor hledger](sponsor.md)** - Thank you for helping to sustain this work.
  Here's more about [Finance](FINANCE.md).
- **[Contributor Quick Start](CONTRIBUTING.md)** and [Developer docs](dev.md).
- **[CREDITS](CREDITS.md)** shows many of the people who have contributed code over the years.


<!-- ** Site tips ------------------------------------------------------------>
<a name="site"></a>

## Site tips

- The lines button at top left toggles the site's navigation sidebar.
- The paintbrush button changes the site theme.
- The magnifying-glass button searches this site.
- The left and right arrow keys step through the pages (as listed in the sidebar).
- [Access keys](https://en.wikipedia.org/wiki/Access_key#Access_in_different_browsers) are also available:
  `s` sidebar, `t` theme, `/` search, `1` home, `2` changes.
  You may need to first click the page body to set the focus.


<!--
[command lines](https://tutorial.djangogirls.org/en/intro_to_command_line/), 
[text editors](https://www.codementor.io/@kmcgillivray/introduction-to-text-editors-and-the-command-line-j0upqatas) and 
[version control](https://betterexplained.com/articles/a-visual-guide-to-version-control/) 
-->


<!-- ** Styles --------------------------------------------------------------->
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

/* 
.content h2 { 
  text-align:center;
  font-size: 2em;
  margin-top:2em; 
}
*/

#tagline {
  font-size:xx-large;
  text-align:center;
  margin:0 0 0.5em;
}

div.quote {
  width: 80%;
  margin: auto;
  text-align:center;
  font-style:italic;
  font-size:90%;
}
.quote-text {}
.quote-author { white-space:nowrap; }

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
