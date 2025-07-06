# register: show detailed changes

`register` shows individual postings, and their running total:
```
$ hledger register
2025-01-01 starting balances    assets:cash                100 USD       100 USD
                                assets:bank:checking      1000 USD      1100 USD
                                li:credit card            -400 USD       700 USD
                                equity:start              -700 USD             0
2025-01-01 pay rent             assets:bank:checking      -800 USD      -800 USD
                                expenses:rent              800 USD             0
2025-01-02 salary               revenues:salary          -1000 USD     -1000 USD
                                assets:bank:checking      1000 USD             0
2025-01-03 pay half of credi..  assets:bank:checking      -200 USD      -200 USD
                                li:credit card             200 USD             0
2025-01-04 shopping             assets:bank:checking      -250 USD      -250 USD
                                expenses:food              200 USD       -50 USD
                                expenses:supplies           50 USD             0
```
Each line is a posting, part of some transaction. There are five columns:
```
date       description          account name         change amount   running total
```
It adapts to your terminal width, so descriptions and account names may be abbreviated.
As usual, a positive change amount means an increase to that account, negative means a decrease.

`register` is more useful when restricted to a particular account or set of accounts.
Here we can see the history of the assets:bank:checking account:
```
$ hledger register checking
2025-01-01 starting balances    assets:bank:checking      1000 USD      1000 USD
2025-01-01 pay rent             assets:bank:checking      -800 USD       200 USD
2025-01-02 salary               assets:bank:checking      1000 USD      1200 USD
2025-01-03 pay half of credi..  assets:bank:checking      -200 USD      1000 USD
2025-01-04 shopping             assets:bank:checking      -250 USD       750 USD
```
Or the activity in expense accounts:
```
$ hledger register expenses
2025-01-01 pay rent             expenses:rent              800 USD       800 USD
2025-01-04 shopping             expenses:food              200 USD      1000 USD
                                expenses:supplies           50 USD      1050 USD
```

<br>

(Part of [hledger by example](hledger-by-example.md).)
