<img id="coins" src="images/coins2-248.png" style="width:120px; margin:2em 1em; float:left;" />
<img id="coins" src="images/coins2-248.png" style="width:120px; margin:2em 1em; float:right;" />


# hledger
<div id="tagline">
Fast, robust, user-friendly<br>plain text accounting.
</div>

## hledger is...
- free GPLv3+ accounting software based on [plain text files](https://plaintextaccounting.org)
- actively developed and supported by [Simon Michael](http://joyful.com) and [contributors](CREDITS.html) since 2007
- runnable on unix, mac, windows, and the web
- good for tracking money, investments, time, or any numeric commodity
- shipped with [web](web.md), [terminal](ui.md), [command line](add.md), [JSON](https://hledger.org/dev/hledger-web.html#json-api) and [Haskell](https://hackage.haskell.org/package/hledger-lib) interfaces
- based on [double entry accounting](accounting.md), and great for learning that
- built on plain text formats: safe, readable, easy to version control and audit, and future-proof
- fast, lightweight, extremely reliable, pays $100 bounties for [regression reports](http://hledger.org/regressionbounty)
- the most user friendly plain text accounting app
- comparable to [Ledger](ledger.md) and [Beancount](beancount.md)
- built with Haskell
- free from vendor lock-in
- local, not cloud-based; your private financial data remains under your control
- [scripting-friendly](scripting.md) and automatable
- comfortable for technical users; knowing about command lines, text editing and version control is helpful, though not required
- strengthened by your [work](CONTRIBUTING.md) or [money contributions](sponsor.html)
  [![github](https://img.shields.io/github/stars/simonmichael/hledger.svg?logo=GitHub&label=Github&color=brightgreen)](https://github.com/simonmichael/hledger)

## Examples
The only setup needed is to record some transactions in [`journal` format](hledger.md#journal-format). Here are three; note that each transaction must balance, that is, its amounts must sum to zero. One amount in each transaction can be omitted for convenience. Accounts and currencies can be anything you like.

```journal
2022-01-01 opening balances
    assets:bank:checking                $1000
    assets:bank:savings                 $2000
    assets:cash                          $100
    liabilities:creditcard               $-50
    equity:opening/closing             $-3050

2022-02-01 GOODWORKS CORP
    assets:bank:checking           $1000
    income:salary                 $-1000

2022-02-15 market
    expenses:food             $50
    assets:cash
```

Now you can see reports, eg using the command line interface:
```shell
$ hledger cf -MTA
Cashflow Statement 2022-01-01..2022-02-28

                      ||   Jan    Feb    Total  Average 
======================++================================
 Cash flows           ||                                
----------------------++--------------------------------
 assets:bank:checking || $1000  $1000    $2000    $1000 
 assets:bank:savings  || $2000      0    $2000    $1000 
 assets:cash          ||  $100   $-50      $50      $25 
----------------------++--------------------------------
                      || $3100   $950    $4050    $2025 
```

Here's some more complex data in the CLI, terminal, and web interfaces:

<a href="/images/cli-green-bs-reg.png" class="highslide" onclick="return hs.expand(this, { captionText:'The hledger command line interface.' })"><img src="images/cli-green-bs-reg.png" height="190"></a>
<a href="/images/home-ui-3.png"        class="highslide" onclick="return hs.expand(this, { captionText:'The hledger-ui text user interface.' })"><img src="images/home-ui-3.png"        height="190"></a>
<a href="/images/web-bcexample.png"    class="highslide" onclick="return hs.expand(this, { captionText:'The hledger-web web user interface.' })"><img src="images/web-bcexample.png"    height="190"></a>

## Get started

[Install](install.html), then see [Getting Started](start.html).

This home page is purposely brief, but extensive documentation is  ready when you need it. All hledger docs are linked in the sidebar to your left, such as
the [hledger](hledger.md), [hledger-ui](hledger-ui.md), and [hledger-web](hledger-web.md) manuals, [Cookbook](cookbook.md), [FAQ](faq.md), [Videos](videos.md) and [Discussion/Support](support.md).
If no sidebar is visible, click/tap the horizontal-lines icon at top left. To search, use the magnifying-glass icon.

Some documentation and demos are also available at the command line: run `hledger` for details.

[Access keys](https://en.wikipedia.org/wiki/Access_key#Access_in_different_browsers) are available on this site: `s` toggle sidebar, `/` search, `t` theme, `1` home page, `2` recent changes, `<` previous page, `>` next page. 
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

code::first-line {
  font-weight:bold;
}
</style>
