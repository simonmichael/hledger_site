# More transactions

Now, to test some reports, let's make your journal look like the one below.

As usual, there two common ways to update the journal:
- You could delete the old file, then use `hledger add` to add each of the entries below.
- Or you can open the file in your text editor and replace the contents with the below.

```journal
2025-01-01 starting balances
    assets:cash               100 USD
    assets:bank:checking     1000 USD
    liabilities:credit card  -400 USD
    equity:start

2025-01-01 pay rent
    assets:bank:checking
    expenses:rent             800 USD

2025-01-02 salary
    revenues:salary
    assets:bank:checking     1000 USD

2025-01-03 pay half of credit card balance
    assets:bank:checking
    liabilities:credit card   200 USD

2025-01-04 shopping
    assets:bank:checking
    expenses:food             200 USD
    expenses:supplies          50 USD

```

A few differences from the previous example:

- The starting balances transaction now sets balances for three accounts, not just one.
- One of them is a liability (a credit card with a balance owed); so this one is negative.
- Currency symbols are using a different style: a three-letter currency code, on the right side.

These entries represent the following money flows:

|                                        |                                                       |
|----------------------------------------|-------------------------------------------------------|
| 1. **equity   -> assets, liabilities** | set starting balances                                 |
| 2. **checking -> rent**                | pay rent from checking account                        |
| 3. **revenues -> checking**            | receive salary to checking account                    |
| 4. **checking -> credit card**         | pay part of credit card balance from checking account |
| 5. **checking -> food, supplies**      | a mixed purchase from checking account                |

<br>

(Part of [hledger by example](hledger-by-example.md).)
