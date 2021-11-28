# Currency conversion 2

<div class=pagetoc>
<!-- toc -->
</div>

More notes related to [currency conversion](currency-conversion.html).

In a currency conversion or a stock purchase/sale, one commodity is exchanged for another.
In plain text accounting, there are two ways to record such conversions:

## 1. Equity method

Balance both commodities against an Equity account. Eg:

```journal
2021-01-01
  assets:usd                -1.20 USD
  equity:conversion          1.20 USD
  equity:conversion         -1.00 EUR
  assets:eur                 1.00 EUR
```

or, equivalently:

```journal
2021-01-01
  assets:usd                -1.20 USD
  assets:eur                 1.00 EUR
  equity:conversion
```

## 2. Conversion price method

PTA tools provide the @ (or @@) notation for specifying a conversion price
(essentially; Ledger/Beancount also provide an alternate {} notation):

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

```journal
2021-01-01
  assets:usd                           ; the -1.20 USD amount is inferred
  assets:eur                 1.00 EUR @ 1.20 USD
```

or the conversion price:

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

With this method, the zero total can be seen only if all amounts are converted to cost:

```shell
$ hledger -f 2a.j bal --cost
            1.20 USD  assets:eur
           -1.20 USD  assets:usd
--------------------
                   0  
```

