# More transactions

Here's a journal with a few more transactions.
You could practice using `hledger add` to add similar transactions to your journal.
Or: open the file in a text editor and copy/paste these entries.

```
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
- One of them is a liability, a credit card with a balance owed; so this one is negative.
- Currency symbols are using a different style: a three-letter currency code, on the right side.
- These entries leave one of the amounts blank; those will be calculated automatically.
  (Eg for equity:start it is -700 USD.)

These entries represent the following money flows:

|                                        |                                                       |
|----------------------------------------|-------------------------------------------------------|
| 1. **equity   -> assets, liabilities** | set starting balances                                 |
| 2. **checking -> rent**                | pay rent from checking account                        |
| 3. **revenues -> checking**            | receive salary to checking account                    |
| 4. **checking -> credit card**         | pay part of credit card balance from checking account |
| 5. **checking -> food, supplies**      | a mixed purchase from checking account                |

(Part of [hledger by example](hledger-by-example.md).)
