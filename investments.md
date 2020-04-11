# Track investments 2

*First draft (202004, WIP)*

Here's an updated exploration of tracking stock investments, cryptocurrencies and the like,
using the features available in hledger 1.17. 
(Older hledger versions may not match this doc.)

Let's say we start the year with $1000 for investment:
```journal
2020-01-01 opening balances
    assets:bank:checking             $1000
    equity:opening/closing balances
```

## A stock purchase

We'll use a cryptocurrency and fictitious prices here, but these examples apply equally well to stocks.
In february we see ADA is priced at $0.02, and decide to buy a little. 
We'll spend $40, which at 2 cents per ADA buys 2000 ADA.
Here's the most straightforward journal entry:

```journal
2020-02-01 buy ada
    assets:cc:ada          2000 ADA
    assets:bank:checking   -$40
```

We paid $40 (from one asset) and received 2000 ADA in exchange (another asset).
The exact account names don't matter; here we've used a `cc` subaccount to group all cryptocurrencies,
and an additional `ada` subaccount to distinguish ADA holdings from other cryptocurrencies
(this can be helpful in some reports.)

In real life there'll probably be another posting or two, for
transaction expenses. We'll omit those for now.

There are a few more things to say about this entry...

## How does that balance ?

As you may know, in hledger and other PTA tools the primary rule is:

- *"Each transaction must balance - its amounts must add up to zero"*.

Well, in hledger (and Ledger), there's another rule:

- *"When a transaction's unbalanced amounts involve exactly two
  commodities, assume one is converted to the other with a conversion
  rate that makes the transaction balance."*

We can use `hledger print -x` (x for explicit) to show the above with
all amounts and the inferred conversion price:

```shell
$ hledger print -x
2020-02-01
    assets:cc:ada           2000 ADA @@ $40
    assets:bank:checking    $-40
```

This @ notation has two forms: `@@ TOTALPRICE` or `@ UNITPRICE`. In
hledger we call it the "[transaction price]", because it records the
price/conversion rate that was used in this specific transaction:

Note this more explicit journal entry has some redundancy, but that's
no harm - it makes things clearer to the human reader, it provides an
extra test of the tool's rounding and precision, and it helps guard
against typos. So we'll use this one.

But here are two more ways of writing the above, just for completeness:

```journal
2020-02-01
    assets:cc:ada          2000 ADA @@ $40
    assets:bank:checking                   ; $-40 inferred here
```

```journal
2020-02-01
    assets:cc:ada          2000 ADA @ $0.02
    assets:bank:checking                    ; -(2000 x $0.02) = $-40 inferred here
```

## A more correct entry

Do you find this still unsatisfactory ? 
Some amount of dollars seems to disappear, and some amount of ADA appears.
Doesn't this violate the [accounting equation], the foundation of
double entry bookkeeping, which essentially says "money is not created
out of thin air" ?
[#1177] agrees with you; in summary, it seems the most correct kind
of entry for this transaction is:

```journal
2020-02-01
    assets:cc:ada          2000 ADA
    equity:conversion     -2000 ADA
    equity:conversion       $40
    assets:bank:checking   -$40
```

The `equity:conversion` account name isn't special, but it's
considered to be an equity account.

This entry might look a little strange to you, but it does show more
clearly that the transaction is balanced; it gathers commodity
conversions into a single "conversion" account which can provide
useful information; and it preserves the [accounting equation].

However, for our needs, it has a problem: hledger (like other PTA
tools) will not recognise this more general form as a commodity
conversion, so will not be able to show cost reports. For that reason,
we're going to stick with the explicit `@`/`@@` notation here.
Also, in practice:

- The unbalanced accounting equation isn't noticeable in the kind of
  reports we're typically doing.

- Typos won't be a problem, because any kind of reconciliation will
  quickly lead us to find and fix the error.

## What about lots ?

If you know a little about investing, or have read Ledger or Beancount docs,
you'll know that it's important to track the date and cost of each stock purchase,
or *lot*. This information is needed:

- While holding investments, to calculate *unrealised [capital gains][investopedia:gain]/losses*,
  ie the change in their value "on paper" as market prices fluctuate.
  
- When selling an investment, so that:

  1. We can select the right lots to sell. Tax law may require, eg,
     selling the oldest lots first (the FIFO strategy - First In, First Out).

  2. We can calculate the *realised capital gain/loss* from this sale,
     by comparing the selling price with the original cost (AKA *cost
     basis*) of those lots.
  
Ledger and Beancount provide a special syntax and some builtin reports for tracking lots and calculating capital gains.
Currently, hledger does not (aside from [a little support for lot syntax][hledger lot support]).
So for now, how can we track lots in hledger ?

We can use the obvious categorisation feature: accounts.
We'll give every lot its own uniquely-named subaccount.
Since we already have an account just for ADA, 
we'll just name the lot subaccounts by the lots' purchase dates.
If doing multiple ADA purchases per day, we could add a sequence number.
We could also include the cost in the name, if we want extra clarity.

So, let's amend the above journal entry, adding the `20200201` subaccount to represent this first lot:

```journal
2020-02-01
    assets:cc:ada:20200201    2000 ADA @@ $40
    assets:bank:checking      $-40
```

## Review

So far, what have we got ? The journal is <!-- (after aligning with ledger-mode's M-q) -->:

```journal
2020-01-01 opening balances
    assets:bank:checking                       $1000
    equity:opening/closing balances

2020-02-01
    assets:cc:ada:20200201                      2000 ADA @@ $40
    assets:bank:checking                        $-40
```

The balance sheet (truncated for brevity) shows assets are $960 and 2000 ADA:
```shell
$ hledger bs --flat | head -10
Balance Sheet 2020-02-01

                        ||     2020-02-01 
========================++================
 Assets                 ||                
------------------------++----------------
 assets:bank:checking   ||           $960 
 assets:cc:ada:20200201 ||       2000 ADA 
------------------------++----------------
                        || $960, 2000 ADA 
```

(`| head -10` is used here just to hide the empty Liabilities section.
You can omit it if it doesn't work on your system.)


And with `-B/--cost` (B for cost basis) we see costs so far are:

```shell
$ hledger bs --flat -B |head -10
Balance Sheet 2020-02-01, valued at cost

                        || 2020-02-01 
========================++============
 Assets                 ||            
------------------------++------------
 assets:bank:checking   ||       $960 
 assets:cc:ada:20200201 ||        $40 
------------------------++------------
                        ||      $1000 
```

## Market prices

We'll also start recording the prevailing [market price] that was in
effect at each point in time. This will allow us to report on the
market value of our investments.

We don't need to know it every day or every hour; for this example,
we'll just record it at the start of each month. hledger will assume
that market price through the month, until the next one is declared.

Here's the P (market Price) directive declaring that the market price
of ADA, in dollars, on 2020-02-01, was $0.02:

```journal
P 2020-02-01 ADA $0.02
```

And let's say that ADA's price has doubled by march 1st; we'll record that too:
```journal
P 2020-03-01 ADA $0.04
```

We'll add these to the main journal for simplicity.
Or if you prefer you can keep them in a separate file, eg
`2020.prices`, adding `include 2020.prices` to the main journal.

Note that the initial $0.02 market price, and the $0.02 transaction
price we recorded above, are the same in this example. 
In real life they may not be exactly the same, but normally they will be quite similar.

## Value reports; some gotchas

Now we have enough data to do a little value reporting. 
This can be a little confusing at first, so here are a few examples.

Our journal so far is:

```journal
2020-01-01 opening balances
    assets:bank:checking                       $1000
    equity:opening/closing balances

2020-02-01
    assets:cc:ada:20200201                      2000 ADA @@ $40
    assets:bank:checking                        $-40

P 2020-02-01 ADA $0.02
P 2020-03-01 ADA $0.04
```

Let's check the current market value (AKA *mark to market*) of our holdings.
`-V` is a simple form of [the `--value` flag][valuation]:
```shell
$ hledger bs --flat -V |head -10
Balance Sheet 2020-02-01, current value

                        || 2020-02-01 
========================++============
 Assets                 ||            
------------------------++------------
 assets:bank:checking   ||    $960.00 
 assets:cc:ada:20200201 ||     $80.00 
------------------------++------------
                        ||   $1040.00 
```
But the ADA market value looks wrong - on 2020-02-01 it was $40, not $80.
So it's wise to check [the manual][valuation]. In particular, note:
*"For single period reports, the valuation date is today (equivalent to --value=now)"*.
So even though the report's end date is 2020-02-01 (the date of the last transaction),
hledger picked "now" as the valuation date, and therefore 
used our latest 2020-03-01 P directive. 

We can fix this by specifying an explicit report end date,
which also sets the valuation date. 
We'll use `-e` to specify 2020-02-01:

```shell
$ hledger bs --flat -V -e 2020-02-01 |head -10
Balance Sheet 2020-01-31, current value

                      || 2020-01-31 
======================++============
 Assets               ||            
----------------------++------------
 assets:bank:checking ||   $1000.00 
----------------------++------------
                      ||   $1000.00 
======================++============
```

Now there's no ADA balance at all - what gives ?
Remember that [end dates] are exclusive, 
so the ADA purchase on 2020-02-01 is excluded.
With a later end date, eg 2020-02-02, we see it:

```shell
$ hledger bs --flat -V -e 2020-02-02 |head -10
Balance Sheet 2020-02-01, current value

                        || 2020-02-01 
========================++============
 Assets                 ||            
------------------------++------------
 assets:bank:checking   ||    $960.00 
 assets:cc:ada:20200201 ||     $40.00 
------------------------++------------
                        ||   $1000.00 
```

And if we specify an end date after the second price directive,
we'll see the value at that date:

```shell
$ hledger bs --flat -V -e 2020-03-02 |head -10
Balance Sheet 2020-03-01, current value

                        || 2020-03-01 
========================++============
 Assets                 ||            
------------------------++------------
 assets:bank:checking   ||    $960.00 
 assets:cc:ada:20200201 ||     $80.00 
------------------------++------------
                        ||   $1040.00 
```

Often, a multiperiod, eg monthly, report makes things clearer.
For this case [the manual][valuation] says:
*"valuation date ... for multiperiod reports, it is the last day of each subperiod"*.
For this example we still need to specify the end date though, 
otherwise the report will stop at the end of the month containing
the last transaction (ie, 2020-02-29). 
This time we'll say `-e apr` (or `-e 202004`), which is less typing 
and includes all of march:

```shell
$ hledger bs --flat -M -V -e apr | head -10
Balance Sheet 2020-01-31,,2020-03-31, valued at period ends

                        || 2020-01-31  2020-02-29  2020-03-31 
========================++====================================
 Assets                 ||                                    
------------------------++------------------------------------
 assets:bank:checking   ||   $1000.00     $960.00     $960.00 
 assets:cc:ada:20200201 ||          0      $40.00      $80.00 
------------------------++------------------------------------
                        ||   $1000.00    $1000.00    $1040.00 
```

Finally, we can clearly see the value of our holdings over time. 
No ADA, just dollars, in january; ADA worth $40 when purchased, in february;
and worth $80, thanks to the increase in market price, in march.

Just for comparison, here's the same report but showing cost instead
of value. Of course cost is not affected by market prices:

```shell
$ hledger bs --flat -M -B -e apr | head -10
Balance Sheet 2020-01-31,,2020-03-31, valued at cost

                        || 2020-01-31  2020-02-29  2020-03-31 
========================++====================================
 Assets                 ||                                    
------------------------++------------------------------------
 assets:bank:checking   ||   $1000.00     $960.00     $960.00 
 assets:cc:ada:20200201 ||          0      $40.00      $40.00 
------------------------++------------------------------------
                        ||   $1000.00    $1000.00    $1000.00 
```

## Unrealised capital gain

The difference between the $40 purchase cost of the ADA, and its $80
value in march, is an unrealised capital gain. 
"Unrealised" (and therefore not yet taxable, typically) because we
haven't yet sold the ADA and captured the gain in our base currency.

<!--
In the value report above, it's easy enough to see that our capital
gain, as of end of march, is $40. In more complex real-world reports,
it will be helpful to show the changes in each period rather than end
balances. We can add `--change` to see that... Or can we ?

```shell
$ hledger bs --flat -M -V -e apr --change | head -10
Balance Sheet 2020q1 (Balance Changes), valued at period ends

                        ||      Jan      Feb  Mar 
========================++========================
 Assets                 ||                        
------------------------++------------------------
 assets:bank:checking   || $1000.00  $-40.00    0 
 assets:cc:ada:20200201 ||        0   $40.00    0 
------------------------++------------------------
                        || $1000.00        0    0 
```
-->

## A sale

The next day, we decide to sell all the ADA, just to test the process
and capture a little profit:

```journal
2020-03-02 sell all ada
    assets:cc:ada:20200201  -2000 ADA @ $0.04 = 0 ADA
    assets:bank:checking      $80
```

For a little extra error checking, this time we used the `@ UNITPRICE`
form, so we can visually check that the per-unit cost looks correct
(at or close to the market price). Also we've used a 
[balance assertion] (`= 0 ADA`) to show (and automatically check)
the balance remaining in that account. 

Here's the new balance sheet, with `-E` (empty) to make it show the
empty ada account:

```shell
$ hledger bs --flat -e apr -E | head -10
Balance Sheet 2020-03-31

                        || 2020-03-31 
========================++============
 Assets                 ||            
------------------------++------------
 assets:bank:checking   ||   $1040.00 
 assets:cc:ada:20200201 ||          0 
------------------------++------------
                        ||   $1040.00 
```

## Realised capital gain

Our dollar balance has increased, from $1000 to $1040,
but somewhat magically, with no record of it in the journal.
This seems like a bad sign.
And indeed a full balance sheet including equity shows a non-zero
total, confirming that the Accounting Equation has been disturbed:

```shell
$ hledger bse --flat
Balance Sheet With Equity 2020-03-02

                                 || 2020-03-02 
=================================++============
 Assets                          ||            
---------------------------------++------------
 assets:bank:checking            ||   $1040.00 
---------------------------------++------------
                                 ||   $1040.00 
=================================++============
 Liabilities                     ||            
---------------------------------++------------
---------------------------------++------------
                                 ||            
=================================++============
 Equity                          ||            
---------------------------------++------------
 equity:opening/closing balances ||   $1000.00 
---------------------------------++------------
                                 ||   $1000.00 
=================================++============
 Net:                            ||     $40.00 
```

$40 has appeared from somewhere. This increase is the realised capital
gain, which is considered a revenue. If we had sold at a lower price
than we paid, this number would be negative, representing a capital
loss, which is an expense.

We want this gain/loss to be recorded in the journal, to satisfy the
accounting equation and keep accurate records, and also because it is
typically a taxable event. We'll need to know all of these
revenues/expenses when filing taxes.

## Recording capital gain

As mentioned above, hledger currently doesn't know about lots or
capital gains; it is mystified by this new money. So if we try to add
a posting for it, like so, hledger thinks the transaction is
unbalanced:


```journal
2020-03-02 sell all ada
    assets:cc:ada:20200201                     -2000 ADA @ $0.04 = 0 ADA
    assets:bank:checking                         $80
    revenues:capital gain                       $-40
```
```shell
$ hledger print
...
could not balance this transaction (real postings are off by $-40.00)
...
```

Ledger does know about lots and gains, and will calculate them if you
use a special notation, identifying the lot being sold by its cost
and/or purchase date. It can look like this:

```journal
2020-03-02
    assets:cc:ada:20200201                     -2000 ADA {$0.02} @ $0.04 = 0 ADA
    assets:bank:checking                         $80
    revenues:capital gain                       $-40
```

Note the extra `{$0.02}`, which means "this is a lot, and was
purchased at $0.02 each". Based on this, Ledger calculates the
expected capital gain and considers the above transaction to be
balanced.

With hledger, we must instead ....

a. use an [unbalanced posting], by parenthesising the account name: ?

```journal
2020-03-02
    assets:cc:ada:20200201                     -2000 ADA @ $0.04 = 0 ADA
    assets:bank:checking                         $80
    (revenues:capital gain)                     $-40
```

bse is unchanged

b. balance it with an equity posting ?

```journal
2020-03-02
    assets:cc:ada:20200201                     -2000 ADA @ $0.04 = 0 ADA
    assets:bank:checking                         $80
    revenues:capital gain                       $-40
    equity:capital gain                          $40
```

bse looks worse, now the Net total is $80:

c. use an unbalanced equity posting ?

```journal
2020-03-02
    assets:cc:ada:20200201                     -2000 ADA @ $0.04 = 0 ADA
    assets:bank:checking                         $80
    revenues:capital gain                       $-40
    equity:capital gain                          $40
```

bse now shows a zero total, but reports will not show a revenue

d. 1. convert the lot to cash using its original cost, 2. balanced equity & assets postings for the gain
(related: <https://money.stackexchange.com/a/22266/1127>)

```journal
2020-03-02
    assets:cc:ada:20200201                     -2000 ADA @ $0.02  ; use the original cost here
    assets:bank:checking                         $40
    equity:capital gain                         $-40              ; and add the capital gain here
    assets:bank:checking                         $40              
```

Ie when selling stock, 

1. convert to cash at cost price
2. transfer the capital gain from/loss to equity
3. make sure that gets picked up as a sort of revenue/expense in tax reports


bse is now correct ?

```shell
$ hledger bse --flat 
Balance Sheet With Equity 2020-03-02

                                 || 2020-03-02 
=================================++============
 Assets                          ||            
---------------------------------++------------
 assets:bank:checking            ||   $1040.00 
---------------------------------++------------
                                 ||   $1040.00 
=================================++============
 Liabilities                     ||            
---------------------------------++------------
---------------------------------++------------
                                 ||            
=================================++============
 Equity                          ||            
---------------------------------++------------
 equity:capital gain             ||     $40.00 
 equity:opening/closing balances ||   $1000.00 
---------------------------------++------------
                                 ||   $1040.00 
=================================++============
 Net:                            ||          0 
```

or: has it been thrown off by not using the
[more correct entry](#a-more-correct-entry) for the purchase ?

<!--
(hledger 1.17.99+ will parse Ledger's lot notation; in this case it's
possible to make an entry that both tools will accept, though with different meaning):

```journal
2020-03-02
    assets:cc:ada:20200201                     -2000 ADA {$0.02} @ $0.04 = 0 ADA
    assets:bank:checking                         $80
    revenues:capital gain                             ; Ledger infers $-40, hledger infers 0
```
-->










<br><br><br><br>TBC<br><br><br><br><br>





## Related

- [Beancount: Command-line Accounting Cookbook][beancount_cookbook]: Account naming, basic trading transactions
  [Beancount: Trading with Beancount][beancount_trading]: More complicated trading transactions, discussion on tricky cost basis adjustments
- [Issue #624 Tracking investments in hledger](https://github.com/simonmichael/hledger/issues/624)
- [Discussion on investment modeling from the mailing list](https://groups.google.com/forum/#!topic/hledger/e8Ss7ZL4ADI)


[transaction price]:     journal.html#transaction-prices
[market price]:          journal.html#market-prices
[hledger lot support]:   faq.html#journal-format
[valuation]:             hledger.html#valuation
[end dates]:             hledger.html#report-start-end-date
[balance assertion]:     journal.html#balance-assertions
[unbalanced posting]:    journal.html#virtual-postings

[#1177]:                 https://github.com/simonmichael/hledger/issues/1177
[accounting equation]:   https://en.wikipedia.org/wiki/Accounting_equation
[beancount_cookbook]:    http://furius.ca/beancount/doc/cookbook
[beancount_trading]:     http://furius.ca/beancount/doc/trading
