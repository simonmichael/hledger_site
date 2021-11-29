# Currency conversion 2

<div class=pagetoc>
<!-- toc -->
</div>

More notes related to [currency conversion](currency-conversion.html).

In a currency conversion or a stock purchase/sale, one commodity is exchanged for another.
In plain text accounting, there are two ways to record such conversions:

## 1. Equity method

Balance both commodities against an Equity account. Eg:

<!-- 1a.j -->
```journal
2021-01-01
  assets:usd                -1.20 USD
  equity:conversion          1.20 USD
  equity:conversion         -1.00 EUR
  assets:eur                 1.00 EUR
```

or, equivalently:

<!-- 1b.j -->
```journal
2021-01-01
  assets:usd                -1.20 USD
  assets:eur                 1.00 EUR
  equity:conversion
```

## 2. Conversion price method

PTA tools provide the @ (or @@) notation for specifying a conversion price
(essentially; Ledger/Beancount also provide an alternate {} notation):

<!-- 2a.j -->
```journal
2021-01-01
  assets:usd                -1.20 USD
  assets:eur                 1.00 EUR @ 1.20 USD
```

@-priced amounts (the 1.00 EUR above) will be converted to their price's commodity (USD)

- internally for checking transaction balancedness, always
- and visibly in reports, when the `-B/--cost` flag is used.

Note the redundancy in this entry; the two amounts and the @ price must agree. 
This provides some extra error checking, but you can also write it non-redundantly, 
by omitting an amount:

<!-- 2b.j -->
```journal
2021-01-01
  assets:usd                           ; the -1.20 USD amount is inferred
  assets:eur                 1.00 EUR @ 1.20 USD
```

or the conversion price:

<!-- 2c.j -->
```journal
2021-01-01
  assets:usd                -1.20 USD
  assets:eur                 1.00 EUR  ; the @ 1.20 USD price is inferred
```

## Pros and Cons

### Cost reporting

The @ (conversion price) method allows "cost" reporting. By adding the
`-B/--cost` flag you can easily see what things cost (or were sold
for) in the other commodity. Eg:

```shell
$ hledger -f 2a.j bal --cost assets:eur
            1.20 USD  assets:eur
--------------------
            1.20 USD  
```

This kind of report is not possible with the equity method, currently.

### Gain/loss reporting

The equity method keeps a trace of all commodity exchanges in the equity account,
in effect properly recording the accumulated gain/loss from all commodity exchanges.

The @ method does not record the gain/loss from commodity exchanges.

### Balanced accounts

The equity method keeps accounts and the accounting equation (A+L+E=0)
balanced. See how it keeps the balance report's total as zero:

```shell
$ hledger -f 1a.j bal
            1.00 EUR  assets:eur
           -1.20 USD  assets:usd
           -1.00 EUR
            1.20 USD  equity:conversion
--------------------
                   0  
```

The @ method causes unbalanced accounts and a non-zero total
(because of the "magical" transformation from one commodity to the other):

```shell
$ hledger -f 2a.j bal
            1.00 EUR  assets:eur
           -1.20 USD  assets:usd
--------------------
            1.00 EUR
           -1.20 USD  
```

The zero total can be seen only if all amounts are converted to cost:

```shell
$ hledger -f 2a.j bal --cost
            1.20 USD  assets:eur
           -1.20 USD  assets:usd
--------------------
                   0  
```

### Summary

The equity method: 

- doesn't support cost reporting.

The @ method:

- doesn't support gain/loss reporting
- doesn't maintain balanced accounts.

---
The rest of this page is about future versions of hledger.

## Improvement proposals

There was much discussion of this issue at <https://github.com/simonmichael/hledger/issues/1177>.

### Xitian's #1554

<https://github.com/simonmichael/hledger/pull/1554>.
Here's an attempted summary:

#### Goals / problems tackled

1. Allow entries written with the @ style to be converted on the fly to equity
   style when appropriate.
2. Allow all three of cost reporting, gain/loss reporting, and balanced accounts.
3. Reduce required data entry effort.
   
#### Current draft docs

> \# COSTING
>
> The `--cost=TYPE` option and the `-B` flag control how hledger handles any
> [transaction prices](#transaction-prices) which are specified.
>
> `-B / --cost / --cost=cost`
> : Convert amounts to their cost or sale amount at transaction time.
>
> `--cost=conversion`
> : Generate conversion postings to balance the transactions.
>   This is the default for all reports except the `print` report.
>
> `--cost=nocost`
> : Do no conversion of transaction prices.
>   This is the default for the `print` report.
>
> When performing cost conversion and price valuation, hledger will always
> perform cost conversion first, and market price valuations afterwards.

#### Sample tests

```
# 3. --cost=conversion generates conversion postings
hledger -f- print --explicit --cost=conversion
<<<
2011/01/01
    expenses:foreign currency       €100 @ $1.35
    assets
>>>
2011-01-01
    expenses:foreign currency            €100
    equity:conversion:€:$               €-100  ; generated-posting:
    equity:conversion:$:€             $135.00  ; generated-posting:
    assets                           $-135.00

>>>=0

# 4. --cost=conversion with --show-costs continues to show transaction costs
hledger -f- print --explicit --cost=conversion --show-costs
<<<
2011/01/01
    expenses:foreign currency       €100 @ $1.35
    assets
>>>
2011-01-01
    expenses:foreign currency    €100 @ $1.35
    equity:conversion:€:$               €-100  ; generated-posting:
    equity:conversion:$:€             $135.00  ; generated-posting:
    assets                           $-135.00

>>>=0
```

#### User-visible changes

1. The `-B/--cost` flag becomes a flag `-B` which works as before, and an
optional-argument option `--cost[=nocost|cost|conversion]`:

  - `--cost` or `--cost=cost`: works like `-B` (@-priced amounts are converted to cost)
  - `--cost=conversion`: in each @-style entries with no equity postings, 
     adds two equity postings of the form:
     ```
     equity:conversion:FIRSTCOMM:SECONDCOMM    FIRSTCOMMAMT
     equity:conversion:FIRSTCOMM:SECONDCOMM   -SECONDCOMMAMT
     ```
     They are added dynamically (transiently), at report time.
     They are allowed to coexist with the @ price without unbalancing the transaction
     (which they would do if added explicitly by the user).
  - `--cost=nocost`: does neither of the above (ie, nothing)

2. `--cost=conversion` will be the default behaviour of all commands except
   `print`. 
   
#### Interactions / impact / compatibility

1. Commands using `-B` or `--cost` (with no argument) should work as before.

2. In `conversion` mode, all reports should work as they normally would with
   equity style entries.

3. To mimic previous hledger behaviour (don't add equity postings to commodity
   conversions), users will need to add `--cost=nocost` (or, `not:equity:conversion`)
   to commands. This can be seen in the many changes required to hledger's tests.

4. Except with `print`. `print` will have different default behaviour from all
   other commands.

#### Open questions

- Want to avoid hard-coded "equity:conversion"
- Why the :FIRSTCOMM:SECONDCOMM subaccounts, are they worth it ?
- What journal entry variations are handled ?

  - a commodity conversion with other unrelated postings in the transactions
  - one commodity conversion involving more than two postings ?
  - more than one commodity conversions in a transaction ?

- Why is the new feature (`conversion`) integrated with the existing `--cost`
  option ? 
  Because they are closely related, and the combination of cost reporting
  and equity postings is not supported (and not expected in future ?)

- What other names, or other changes, could make this more clear and mnemonic ?
- When should the new mode be made default behaviour ?
- Why is `print` different, and is it worth it ?

<!--
###

#### Goals / problems tackled

#### User-visible changes

#### Interactions

#### Impact / compatibility
-->
