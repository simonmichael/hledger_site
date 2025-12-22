<link rel="stylesheet" href="https://fonts.googleapis.com/css2?family=Gabarito">
<style>
.content h1 {
  font-family: Gabarito;
  font-size: 6em;
  font-weight: normal;
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
code::first-line {
  font-weight:bold;
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

<details>
<summary><b>A quick example</b></summary>

Transactions are recorded in a journal file.
You don't have to edit this directly, but many people do.
This simple format, invented by the Ledger project, unlocks Plain Text Accounting and Double Entry Bookkeeping.

```journal
; ~/.hledger.journal

2025-12-01 Starting balance
    equity            $-1000     ; <- $1000 moves from the "equity" account
    assets:checking    $1000     ; <- to the "assets:checking" account

2025-12-02 Grocery store
    assets:checking              ; <- if omitted, the amount is implied
    expenses:groceries  $64.50

2025-12-03 Client payment
    income:consulting
    assets:checking    $1500

2025-12-04 Rent
    assets:checking
    expenses:rent     $800
```

From it, hledger generates reports:

```
$ hledger aregister assets
Transactions in assets and subaccounts:
2025-12-01 Starting balance   equity                  $1000.00      $1000.00
2025-12-02 Grocery store      ex:groceries             $-64.50       $935.50
2025-12-03 Client payment     in:consulting           $1500.00      $2435.50
2025-12-04 Rent               ex:rent                 $-800.00      $1635.50
```
```
$ hledger balance
            $1635.50  assets:checking
           $-1000.00  equity
              $64.50  expenses:groceries
             $800.00  expenses:rent
           $-1500.00  income:consulting
--------------------
                   0
```
```
$ hledger is --pretty --tree --daily --row-total --average --begin 2025/12/2
Daily Income Statement 2025-12-02..2025-12-04

┌───────────────────╥────────────┬────────────┬────────────┬──────────┬─────────┐
│                   ║ 2025-12-02 │ 2025-12-03 │ 2025-12-04 │    Total │ Average │
╞═══════════════════╬════════════╪════════════╪════════════╪══════════╪═════════╡
│ Revenues          ║            │            │            │          │         │
├───────────────────╫────────────┼────────────┼────────────┼──────────┼─────────┤
│ income:consulting ║          0 │   $1500.00 │          0 │ $1500.00 │ $500.00 │
├───────────────────╫────────────┼────────────┼────────────┼──────────┼─────────┤
│                   ║          0 │   $1500.00 │          0 │ $1500.00 │ $500.00 │
╞═══════════════════╬════════════╪════════════╪════════════╪══════════╪═════════╡
│ Expenses          ║            │            │            │          │         │
├───────────────────╫────────────┼────────────┼────────────┼──────────┼─────────┤
│ expenses          ║     $64.50 │          0 │    $800.00 │  $864.50 │ $288.17 │
│   groceries       ║     $64.50 │          0 │          0 │   $64.50 │  $21.50 │
│   rent            ║          0 │          0 │    $800.00 │  $800.00 │ $266.67 │
├───────────────────╫────────────┼────────────┼────────────┼──────────┼─────────┤
│                   ║     $64.50 │          0 │    $800.00 │  $864.50 │ $288.17 │
╞═══════════════════╬════════════╪════════════╪════════════╪══════════╪═════════╡
│ Net:              ║    $-64.50 │   $1500.00 │   $-800.00 │  $635.50 │ $211.83 │
└───────────────────╨────────────┴────────────┴────────────┴──────────┴─────────┘
```
or runs other actions:
```
$ hledger add
Adding transactions to journal file /Users/simon/.hledger.journal
...
Date [2025-12-13]:
Description: groc
Using this similar transaction for defaults:
2025-12-02 Grocery store
    assets:checking            $-64.50
    expenses:groceries          $64.50

Account 1 [assets:checking]:
Amount  1 [$-64.50]: _
```
```
$ hledger web
...
Serving web UI and json API at IP address 127.0.0.1 (local access), port 5000
with base url http://127.0.0.1:5000
This server will exit after 2m with no browser windows open (or press ctrl-c)
Opening web browser...
```
```
$ hledger check --strict
hledger: Error: /Users/simon/.hledger.journal:2:
  | 2025-12-01 Starting balance
2 |     equity                   $-1000
  |                              ^^^^^^
  |     assets:checking           $1000

Strict commodity checking is enabled, and
commodity "$" has not been declared.
Consider adding a commodity directive. Examples:

commodity $1000.00
commodity 1.000,00 $
```
```
$ hledger
   __   __       __            
  / /  / /__ ___/ /__ ____ ____
 / _ \/ / -_) _  / _ `/ -_) __/
/_//_/_/\__/\_,_/\_, /\__/_/   
                /___/          
-------------------------------------------------------------------------------
hledger 1.51.99-g67b206380-20251207, mac-aarch64
Usage: hledger [COMMAND] [OPTIONS] [ARGS]
Commands:
...
```

</details>

**Get started**

- **[Install](install.md)** - quickly get hledger installed. Here are [release notes](relnotes.md).
- **[Docs](doc.md)** - browse documentation. Or jump to the **[hledger by example](hledger-by-example.md)** book or the **[manual](hledger.md)**.
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
**f** find in site,
**1** home,
**2** changes\
(you might need to click the page first).

</div>
<script src="js/quotes.js"></script>
