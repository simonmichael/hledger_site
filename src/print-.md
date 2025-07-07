# print: show whole transactions

Now that we have data, let's explore some of hledger's reports.

The `print` command shows whole transactions (journal entries), much as they appear in the journal:
```
$ hledger print
2025-01-01 starting balances
    assets:cash                     100 USD
    assets:bank:checking           1000 USD
    liabilities:credit card        -400 USD
    equity:start

2025-01-01 pay rent
    assets:bank:checking
    expenses:rent                800 USD

2025-01-02 salary
    revenues:salary
    assets:bank:checking        1000 USD

2025-01-03 pay half of credit card balance
    assets:bank:checking
    liabilities:credit card         200 USD

2025-01-04 shopping
    assets:bank:checking
    expenses:food                200 USD
    expenses:supplies             50 USD

```

To see the missing amounts, add the `-x` or `--explicit` flag:
```
$ hledger print -x
2025-01-01 starting balances
    assets:cash                     100 USD
    assets:bank:checking           1000 USD
    liabilities:credit card        -400 USD
    equity:start                   -700 USD

2025-01-01 pay rent
    assets:bank:checking        -800 USD
    expenses:rent                800 USD

2025-01-02 salary
    revenues:salary            -1000 USD
    assets:bank:checking        1000 USD

2025-01-03 pay half of credit card balance
    assets:bank:checking           -200 USD
    liabilities:credit card         200 USD

2025-01-04 shopping
    assets:bank:checking        -250 USD
    expenses:food                200 USD
    expenses:supplies             50 USD

```

You can select transactions involving certain accounts:
```
$ hledger print expenses:food
2025-01-04 shopping
    assets:bank:checking
    expenses:food                200 USD
    expenses:supplies             50 USD

```

Or by description:
```
$ hledger print desc:'pay half'
2025-01-03 pay half of credit card balance
    assets:bank:checking
    liabilities:credit card         200 USD

 ```

Or by date. Eg, on january 1st:
```
$ hledger print date:2025-01-01
2025-01-01 starting balances
    assets:cash                     100 USD
    assets:bank:checking           1000 USD
    liabilities:credit card        -400 USD
    equity:start

2025-01-01 pay rent
    assets:bank:checking
    expenses:rent                800 USD

```

On or after january 3rd:
```
$ hledger print date:2025-01-03..
2025-01-03 pay half of credit card balance
    assets:bank:checking
    liabilities:credit card         200 USD

2025-01-04 shopping
    assets:bank:checking
    expenses:food                200 USD
    expenses:supplies             50 USD

```

<br>

(Part of [hledger by example](hledger-by-example.md).)
