# Currency conversion

<div class=pagetoc>
<!-- toc -->
</div>

Here are various ways of recording a conversion from one currency or commodity to another.

## Implicit conversion

For simplicity, let's assume we are just exchanging cash with a friend:

```journal
2021-07-27 give dollars, get euros
    assets:cash      USD -10.00
    assets:cash      EUR   8.50
```

hledger understands that 10 dollars were converted to 8.50 euros.
A conversion rate is inferred automatically so as to make the transaction balance.
(This can be seen with `hledger print -x`.)

<!--
```shell
$ hledger print -x
2021-07-27 give dollars, get euros
    assets:cash    USD -10.00 @@ EUR 8.50
    assets:cash                  EUR 8.50
```
-->

This is easy to write and to understand; it's fine for getting started.
However it is not a fully correct double-entry-bookkeeping journal entry,
since USD has magically transformed into EUR "in flight".
It is also somewhat error prone, since a typo in either amount may not be detected.
For example, we might forget the decimal point and write `USD -1000`.
Also, it is easy to create such entries accidentally.
For example, in one posting within a transaction we might mistype or omit the currency symbol.

hledger accepts these implicit conversions by default, for convenience and compatibility.
But you can disallow them by using 
[strict mode](hledger.html#strict-mode) 
or by running the [check](hledger.html#check) command
(eg: `hledger check balancednoautoconversion`).

## Declared conversion rate

We can declare the conversion rate,
which adds redundancy allowing hledger to catch errors,
and also makes the rate more explicit to human readers.
We can write the total amount with `@@` 
(convenient when entries are complex):

```journal
2021-07-27 give dollars, get euros
    assets:cash      USD -10.00 @@ EUR 8.50
    assets:cash      EUR   8.50
```

or the per-unit amount with `@` 
(makes the exchange rate, or an investment's cost basis, clearer):

```journal
2021-07-27 give dollars, get euros
    assets:cash      USD -10.00 @ EUR 0.85
    assets:cash      EUR   8.50
```

hledger calls these "[transaction prices](hledger.html#transaction-prices)".
They can also be used [generate market prices](hledger.html#--infer-market-price-market-prices-from-transactions)
for value reports.

This is probably the most frequently used style among hledger users.

## Fully balanced conversion

A fully correct double-entry-bookkeeping journal entry 
avoids the PTA-specific `@`/`@@` notation,
and is balanced in each commodity, using equity. Eg:

```journal
2021-07-27 give dollars, get euros
    assets:cash        USD -10.00
    equity:conversion  USD  10.00
    assets:cash        EUR   8.50
    equity:conversion  EUR  -8.50
```

or, letting hledger infer the above:

```journal
2021-07-27 give dollars, get euros
    assets:cash        USD -10.00
    assets:cash        EUR   8.50
    equity:conversion
```

This is discussed more [here](investments.html#a-more-correct-entry).

## Two entries

This comes up eg when [converting](import-csv.html) Paypal CSV, 
which provides two records for a currency conversion, one for each side.
For example, given some paypal CSV rules like:

```rules
account1 assets:paypal
...
if %type (T0200|General Currency Conversion)
 description %type for %referencetxnid %itemtitle
 account2 equity:conversion
```

we might see journal entries like:

```journal
2020-05-16 * Liberapay donation to simonmichael (team darcs-hub)
    assets:online:paypal                     C$24.56 =* C$24.56
    revenues:foss donations:darcshub        C$-26.00
    expenses:banking:paypal                   C$1.44

2020-05-16 * General Currency Conversion for 8Y4N723T948333034 Liberapay donation to simonmichael (team darcs-hub)
    assets:online:paypal                    C$-24.56 =* C$0.00
    equity:conversion                        C$24.56

2020-05-16 * General Currency Conversion for 8Y4N723T948333034 Liberapay donation to simonmichael (team darcs-hub)
    assets:online:paypal                      $16.88 =* $17.55
    equity:conversion                        $-16.88

```
Ie: some canadian dollars received, followed by two transactions converting that balance to US dollars.
This is equivalent to the "Fully balanced conversion" above, 
just with the conversion entry split into two.

## Balancing the books

If you are a fan of the accounting equation and like to check it by seeing
a zero total in the [`balancesheetequity`](hledger.html#balancesheetequity) report,
you will need to do something with these `equity:conversion` balances.
Such as, converting them to retained revenues/expenses in your local currency.
This can perhaps be done at transaction time,
or at the end of each accounting period,
or with report options.
Best practice is not yet clear, suggestions welcome.
<!-- 
Notes:

```shell
# Converting equity:conversion to revenue
$ hledger close equity:conversion --close -e 7/1 \
  --close-desc 'foreign exchange gains/losses' \
  --close-to='revenues:conversion'

2021-06-30 currency conversion expense/revenue
    equity:conversion        C$-24.56 = C$0.00
    equity:conversion          $16.88 = $0.00
    revenues:conversion

``` -->
