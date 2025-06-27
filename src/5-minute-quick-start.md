# 5 minute quick start

<div class=pagetoc>

<!-- toc -->
</div>

### 1. Record transactions

hledger reads transactions from a [journal file](hledger.md#input) -
usually `~/.hledger.journal`, or `C:\Users\USER\.hledger.journal`, or whatever you've set LEDGER_FILE to.
<!-- It uses [journal format](hledger.md#journal). -->

Transactions are recorded like this:

```journal
2025-04-10 MyGas
  Expenses:Automotive              $20
  Liabilities:Acme Credit Card
```

A date and description, followed by several indented account postings, 
with two or more spaces between each account name and its amount.
Colons indicate subaccounts.
Here are the parts in more detail:

[![a hledger transaction entry, showing names of parts](https://raw.githubusercontent.com/RobertNielsen1/hledger/master/hledger%20basic%20transaction%20--%20terms.png)](https://github.com/RobertNielsen1/hledger/blob/master/hledger%20basic%20transaction%20--%20terms.png)

A transaction is a movement of money between accounts.
So the amounts in a transaction must add up to zero.
If you leave one amount blank, it will be calculated automatically ($-20 in this case).

A positive amount means "added to this account", a negative amount means "removed from this account" ([debit and credit](https://plaintextaccounting.org/FAQ#where-are-debits-and-credits)).

Here's the start of a journal, with comments.
To follow along with these examples, save this as your journal file.
You can use a text editor; or you could run [hledger add](hledger.md#add) or [hledger web](hledger.md#web)
and enter these transactions interactively (no need to enter the comments).

```journal

2023-01-01 opening balances            ; <- First transaction sets starting balances.
    assets:bank:checking        $1000  ; <- Account names can be anything.
    assets:bank:savings         $2000  ; <- Colons indicate subaccounts.
    assets:cash                  $100  ; <- 2+ spaces are required before the amount.
    liabilities:credit card      $-50  ; <- A debt; these are negative.
    equity:opening/closing     $-3050  ; <- Starting balances come from equity.
                                       ;    Equity is also usually negative.
                                       ;    (Reports can show as positive when needed.)

2023-02-01 GOODWORKS CORP              ; <- Date order is recommended but optional.
    assets:bank:checking       $1000
    income:salary                      ; <- $-1000 is inferred here to balance the txn.
                                       ;    Income amounts are negative.

2023-02-15 market
    expenses:food             $50
    assets:cash                        ; <- $-50 is inferred here.
```
<!--
(It it looks verbose, note we often use auto-completion, or generate entries automatically from bank data.
You can also use shorter account names or aliases.)
-->

Some people record all transactions by hand in this way.
But you can also import them from bank data, as we'll see below.


### 2. Add declarations

Transaction entries like the above are all you need to get started, so feel free to skip this step till later.
But we usually add some declarations at the top of the file to enable more error checking.

First, declare your currencies/commodities, and their display style. In this case there's only one, `$`:

```journal

commodity $1000.00
```

or it could be:

```journal

commodity $ 1.000,00
```

Now, you can check that all amounts have a valid commodity symbol:
```cli
$ hledger check commodities
$
```

Next, declare your top level accounts and their [type](hledger.md#account-types),
eg like this
(or in other languages:
[ar](https://github.com/simonmichael/hledger/blob/master/examples/i18n/ar.journal)
[da](https://github.com/simonmichael/hledger/blob/master/examples/i18n/da.journal)
[de](https://github.com/simonmichael/hledger/blob/master/examples/i18n/de.journal)
[en](https://github.com/simonmichael/hledger/blob/master/examples/i18n/en.journal)
[es](https://github.com/simonmichael/hledger/blob/master/examples/i18n/es.journal)
[fr](https://github.com/simonmichael/hledger/blob/master/examples/i18n/fr.journal)
[ja](https://github.com/simonmichael/hledger/blob/master/examples/i18n/ja.journal)
[ko](https://github.com/simonmichael/hledger/blob/master/examples/i18n/ko.journal)
[no](https://github.com/simonmichael/hledger/blob/master/examples/i18n/no.journal)
[pt](https://github.com/simonmichael/hledger/blob/master/examples/i18n/pt.journal)
[se](https://github.com/simonmichael/hledger/blob/master/examples/i18n/se.journal)
[zh](https://github.com/simonmichael/hledger/blob/master/examples/i18n/zh.journal)
...):

```journal

account assets                   ; type:A
account liabilities              ; type:L
account equity                   ; type:E
account income                   ; type:R
account expenses                 ; type:X

account assets:bank              ; type:C
account assets:cash              ; type:C

account equity:conversion        ; type:V
```

This helps reports show the right accounts. 
It also sets their preferred [display order](hledger.md#account-display-order).

If you'd like more error checking, declare all account names, not just the top-level ones:

```journal

account assets                   ; type:A
account assets:bank              ; type:C
account assets:bank:checking
account assets:bank:savings
account assets:cash              ; type:C

account liabilities              ; type:L
account liabilities:credit card

account equity                   ; type:E
account equity:conversion        ; type:V
account equity:opening/closing

account income                   ; type:R
account income:salary
account income:gifts

account expenses                 ; type:X
account expenses:rent
account expenses:food
account expenses:gifts
```

Then you can check that all transactions use valid account names:
```cli
$ hledger check accounts
$
```

You can also use [strict mode](hledger.md#strict-mode),
which enables both of these checks, 
by adding `-s` to any command (or to your [config file](hledger.md#config-files)).

Here's the [above journal](https://raw.githubusercontent.com/simonmichael/hledger/refs/heads/master/examples/quickstart.journal) in full.

<!-- [quickstart.journa]: https://github.com/simonmichael/hledger/blob/master/examples/quickstart.journal -->

### 3. Run reports

Now you can see reports, such as...

A list of accounts, showing the hierarchy and types detected:
```cli
$ hledger accounts --tree --types
assets               ; type: A
  bank               ; type: C
    checking         ; type: C
    savings          ; type: C
  cash               ; type: C
liabilities          ; type: L
  credit card        ; type: L
equity               ; type: E
  conversion         ; type: V
  opening/closing    ; type: E
income               ; type: R
  salary             ; type: R
  gifts              ; type: R
expenses             ; type: X
  rent               ; type: X
  food               ; type: X
  gifts              ; type: X
```

A balance sheet, showing what you own and owe:
```cli
$ hledger bs
Balance Sheet 2023-02-15

                         || 2023-02-15 
=========================++============
 Assets                  ||            
-------------------------++------------
 assets:bank:checking    ||      $2000 
 assets:bank:savings     ||      $2000 
 assets:cash             ||        $50 
-------------------------++------------
                         ||      $4050 
=========================++============
 Liabilities             ||            
-------------------------++------------
 liabilities:credit card ||        $50 
-------------------------++------------
                         ||        $50 
=========================++============
 Net:                    ||      $4000 
```

An income statement (AKA profit and loss report), showing what you received and spent:
```cli
$ hledger is -MTA
Income Statement 2023-01-01..2023-02-28

               || Jan    Feb    Total  Average 
===============++==============================
 Revenues      ||                              
---------------++------------------------------
 income:salary ||   0  $1000    $1000     $500 
---------------++------------------------------
               ||   0  $1000    $1000     $500 
===============++==============================
 Expenses      ||                              
---------------++------------------------------
 expenses:food ||   0    $50      $50      $25 
---------------++------------------------------
               ||   0    $50      $50      $25 
===============++==============================
 Net:          ||   0   $950     $950     $475 
```

An account register, showing the transactions and running balance in a particular account:
```cli
$ hledger aregister checking
Transactions in assets:bank:checking and subaccounts:
2023-01-01 opening balances     as:ba:savings, as:..         $1000         $1000
2023-02-01 GOODWORKS CORP       in:salary                    $1000         $2000
```

Congratulations, you can now begin to track your daily finances with hledger!

[Docs](doc.md) has more detailed help.
