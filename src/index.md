<img id="coins" src="images/coins2-248.png" style="width:120px; margin:2em 1em; float:left;" />
<img id="coins" src="images/coins2-248.png" style="width:120px; margin:2em 1em; float:right;" />

# hledger!
<div id="tagline">
Fast, robust, user-friendly<br>plain text accounting
</div>

## hledger is...
- free GPLv3+ accounting software that runs on unix, mac, windows, and the web
- using [double entry accounting](accounting.md) (and great for learning that)
- based on readable, version-controllable, future-proof plain text files
- good for tracking money, investments, time, or any numeric commodity
- shipped with [web](web.md), [terminal](ui.md), [command line](add.md), [JSON](https://hledger.org/dev/hledger-web.html#json-api) and [Haskell](https://hackage.haskell.org/package/hledger-lib) interfaces
- the most user friendly [plain text accounting app](https://plaintextaccounting.org)
- comparable to [Ledger](ledger.md) and [Beancount](beancount.md)
- built with Haskell
- fast, lightweight, extremely reliable; pays [$100 regression bounties](http://hledger.org/regressionbounty)
- free from vendor lock-in
- local, not cloud-based; your private financial data remains under your control
- [scripting-friendly](scripting.md) and automatable
- comfortable for technical users; knowing about command lines, text editing and version control is helpful, though not required
- actively developed and supported by [Simon Michael](http://joyful.com) and [contributors](CREDITS.html) since 2007
- strengthened by your [work](CONTRIBUTING.md) or [money contributions](sponsor.html)
  [![github](https://img.shields.io/github/stars/simonmichael/hledger.svg?logo=GitHub&label=Github&color=brightgreen)](https://github.com/simonmichael/hledger)

Here's more about its [Features](features.md) and strengths.
<!--
[Plain text accounting for fun and profit](https://youtube.com/watch?v=lazZwTmAEHs) (30m, Glenn Ramsey @ Kiwi Pycon XI, 2022)  
-->

## Examples
Here are three transactions in [journal format](hledger.md#journal-format). 
Note that each transaction must balance, that is, its amounts must sum to zero.
One amount in each transaction can be omitted for convenience.
Accounts and currencies can be anything you like:

```journal
# ~/.hledger.journal

2023-01-01 opening balances
    assets:bank:checking                $1000
    assets:bank:savings                 $2000
    assets:cash                          $100
    liabilities:creditcard               $-50
    equity:opening/closing             $-3050

2023-02-01 GOODWORKS CORP
    assets:bank:checking           $1000
    income:salary                 $-1000

2023-02-15 market
    expenses:food             $50
    assets:cash
```

With no further setup, you can now run reports:
```shell
$ hledger cashflow -MTA
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

Though, it's useful to declare [account types](hledger.md#account-types) if you use non-english account names:
```journal
# ~/.hledger.journal
account actifs             ; type:Asset
account passifs            ; type:Liability
account capitaux propres   ; type:Equity
account revenus            ; type:Revenue
account dépenses           ; type:Expense

account actifs:banque:compte courant    ; type:Cash
account actifs:banque:compte d'épargne  ; type:Cash
```

Here's more complex data in the command line, terminal, and web interfaces:

<a href="/images/cli-green-bs-reg.png" class="highslide" onclick="return hs.expand(this, { captionText:'The hledger command line interface.' })"><img src="images/cli-green-bs-reg.png" height="190"></a>
<a href="/images/home-ui-3.png"        class="highslide" onclick="return hs.expand(this, { captionText:'The hledger-ui text user interface.' })"><img src="images/home-ui-3.png"        height="190"></a>
<a href="/images/web-bcexample.png"    class="highslide" onclick="return hs.expand(this, { captionText:'The hledger-web web user interface.' })"><img src="images/web-bcexample.png"    height="190"></a>

Here's a time log in  [timeclock format](hledger.md#timeclock-format):

```timeclock
# 2023.timeclock
i 2023/03/27 09:00:00 projects:a
o 2023/03/27 17:00:34
i 2023/03/31 22:21:45 personal:reading:online
o 2023/04/01 02:00:34
```
```
$ hledger -f 2023.timeclock register -D
2023-03-27   projects:a                         8.01h         8.01h
2023-03-31   personal:reading:online            1.64h         9.65h
2023-04-01   personal:reading:online            2.01h        11.66h
```

And one in [timedot format](hledger.md#timedot-format):

```timedot
# 2023.timedot
2023/2/1
biz:research  .... ..
fos:hledger   .... .... ....
2023/2/2
fos:ledger    0.25
fos:haskell   .5
biz:client1   2
```
```
$ hledger -f 2023.timedot balance -DTAS  # daily, total, average, sorted
Balance changes in 2023-02-01..2023-02-02:

              || 2023-02-01  2023-02-02    Total  Average 
==============++==========================================
 fos:hledger  ||       3.00           0     3.00     1.50 
 biz:client1  ||          0        2.00     2.00     1.00 
 biz:research ||       1.50           0     1.50     0.75 
 fos:haskell  ||          0        0.50     0.50     0.25 
 fos:ledger   ||          0        0.25     0.25     0.12 
--------------++------------------------------------------
              ||       4.50        2.75     7.25     3.62 
```

## Get started

[Install](install.html), then see [Get Started](start.html) ... or just run `hledger`, to see help and demos.

This home page is purposely brief, but extensive documentation is  ready when you need it, 
linked in the sidebar to the left; such as the\
[hledger](hledger.md), [hledger-ui](hledger-ui.md), [hledger-web](hledger-web.md) manuals,
[Cookbook](cookbook.md), [FAQ](faq.md), [Videos](videos.md) and [Discussion/Support](support.md).

Website tips: if the sidebar is not visible, scroll up and click/tap the horizontal-lines icon at top left. 
To search, use the magnifying-glass icon. 
[Access keys](https://en.wikipedia.org/wiki/Access_key#Access_in_different_browsers) are available:
`s` toggle sidebar, `/` search, `t` theme, `1` home page, `2` recent changes, `<` previous page, `>` next page. 


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
