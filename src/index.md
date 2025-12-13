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
@media (max-width: 500px) {
  .content h1 { font-size:20vw; }
  .responsive-image {
      float: none;
      display: block;
      width: 50%;
      margin: 1em auto;
  }
}
#tagline {
  font-size:xx-large;
  text-align:center;
  margin:0 0 0.5em;
}
.quote {
  width: 80%;
  margin: auto;
  text-align:center;
  font-style:italic;
  font-size:90%;
}
.quote-author { white-space:nowrap; }
#site-tips {
  margin:3em;
  text-align:center;
}
</style>

<img id="coins" class="responsive-image" src="images/coins2-248.png" alt="hledger logo" />
<div id="heading">

# hledger

<div id="tagline" style="margin-bottom:1em;">
Robust, friendly, fast,<br>plain text accounting.
</div>
</div>
<div style="display:flex; justify-content:center; align-items:flex-start; flex-wrap:wrap; margin-top:1em;">
<a  href="/images/cli-green-bs-reg.png" class="highslide" onclick="return hs.expand(this, { captionText:'The hledger command line interface.' })"
><img src="images/cli-green-bs-reg.png" width="200"                                                 alt="The hledger command line interface."></a>
<a  href="/images/home-ui-3.png"        class="highslide" onclick="return hs.expand(this, { captionText:'The hledger-ui text user interface.' })"
><img src="images/home-ui-3.png"        width="200"                                                 alt="The hledger-ui text user interface."></a>
<a  href="/images/web-bcexample.png"    class="highslide" onclick="return hs.expand(this, { captionText:'The hledger-web web user interface.' })"
><img src="images/web-bcexample.png"    width="200"                                                 alt="The hledger-web web user interface."></a>
</div>
<div id="quote" class="quote" title="Quote updates hourly.">
  <span id="quote-text"></span> <span id="quote-author" class="quote-author"></span>
</div>

<br>
<br>

----

**hledger** is friendly, fast, and dependable accounting software for tracking
money, investments, cryptocurrencies, time, or any countable commodity.
It uses human-readable **[plain text data](https://plaintextaccounting.org)** that you control.

You can import CSV from banks, or enter data via web/terminal interfaces or your favorite text editor.
hledger provides powerful reports and scales smoothly from simple to sophisticated needs.
It works well with version control, scripts, and LLMs.
Read more at **[Why hledger ?](why.md)** and **[FAQ](faq.md)**.

**Get started**

- **[Install](install.md)** - quickly get hledger installed on your machine. Here's the [release notes](relnotes.md).
- **[Docs](doc.md)** - browse the documentation. Or start with **[hledger by example](hledger-by-example.md)** or the **[manual](hledger.md)**.
- **[Support](support.md)** - ask questions or share feedback.

**Get involved**

- **[Star us on Github](https://github.com/simonmichael/hledger/tree/master)**
  to help make us a [notable Haskell app](https://joyful.com/Haskell#What%20are%20some%20Haskell%20apps%20?)!
- **[Sponsor hledger](sponsor.md)** to help sustain this work. Here's more about [Finance](FINANCE.md).
- **[Contributor Quick Start](CONTRIBUTING.md)** and **[Developer docs](dev.md)**.
- **[CREDITS](CREDITS.md)** shows many of the people who have contributed code over the years.

<div id="site-tips">

Click the lines button at top left to toggle the navigation sidebar.\
Click the paintbrush to change theme, or magnifying glass to search.\
Press the **left** or **right** arrow keys to step through pages.\
[Access keys](https://en.wikipedia.org/wiki/Access_key#Access_in_different_browsers):
**s** sidebar,
**t** theme,
**/** find in site,
**1** home,
**2** changes\
(you might need to click the page first).

</div>
<script src="js/quotes.js"></script>
