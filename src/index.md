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

**hledger** is friendly, fast, and dependable accounting software for tracking
money, investments, cryptocurrencies, time, or any countable commodity.
It uses human-readable **[plain text data](https://plaintextaccounting.org)** that you control.

You can import CSV from banks, or enter data via web/terminal interfaces or your favorite text editor.
hledger provides powerful reports and scales smoothly from simple to sophisticated needs.
It works well with version control, scripts, and LLMs.
Read more at **[Why hledger ?](why.md)** and **[FAQ](faq.md)**.

**Get started**

- **[Install](install.md)** - quickly get hledger installed on your machine.
- **[Docs](doc.md)** - hledger's user documentation.
- **[Support](support.md)** - don't hesitate to ask questions or share feedback.

**Get involved**

- Add a **[Github star](https://github.com/simonmichael/hledger/tree/master)**
  to help make us a [notable Haskell app](https://joyful.com/Haskell#What%20are%20some%20Haskell%20apps%20?) !
- **[Sponsor hledger](sponsor.md)** - Thank you for helping to sustain this work.
  Here's more about [Finance](FINANCE.md).
- **[Contributor Quick Start](CONTRIBUTING.md)** and [Developer docs](dev.md).
- **[CREDITS](CREDITS.md)** shows many of the people who have contributed code over the years.

**Site tips**

- The lines button at top left toggles the site's navigation sidebar.
- The paintbrush button changes the site theme.
- The magnifying-glass button searches this site.
- The left and right arrow keys step through the pages (as listed in the sidebar).
- [Access keys](https://en.wikipedia.org/wiki/Access_key#Access_in_different_browsers) are also available:
  `s` sidebar, `t` theme, `/` search, `1` home, `2` changes.
  You may need to first click the page body to set the focus.



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
