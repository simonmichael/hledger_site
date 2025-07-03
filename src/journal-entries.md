# Journal entries

That `add` command will have created the journal file and one journal entry, something like this:

```
PS C:\Users\Simon> cat .hledger.journal
; journal created 2025-07-01 by hledger

2025-07-01 starting balances
    assets:cash              $10
    equity:start            $-10
```

The above means "on july 1st 2025, 10 dollars was transferred from equity:start to assets:cash".
(This is how bookkeepers say "we'll start tracking the assets:cash balance from july 1st onward".)

Below is another journal entry, with the parts labelled in red.
It's useful to know these names, so that you can look them up in the manual.
This one means "on april 10th 2018, there was a $9.19 car-related expense, paid with the Acme credit card".

[![a hledger transaction entry, with parts named](https://raw.githubusercontent.com/RobertNielsen1/hledger/master/hledger%20basic%20transaction%20--%20terms.png)](https://github.com/RobertNielsen1/hledger/blob/master/hledger%20basic%20transaction%20--%20terms.png)


In this entry, you can see one of the amounts was left blank.
The amounts in a transaction must add up to zero;
so you can leave one blank, to save typing, and it will be inferred automatically ($-9.19 in this case).

Also, you can see that Expenses:Automotive - a spending category - is treated
as another kind of account, like assets:cash or Liabilities:Acme Credit Card.
It's not a bank account (an asset) or a credit card account (a liability) -
it's an expense account.

This is Double Entry Bookkeeping, with a simplifying notation:
Credits are written as negative numbers, and Debits are written as positive numbers.

Thanks to this notation, you won't ever need to think about Credit and Debit, unless you want to.
Many users find it easier to think of the signs and the direction of flow between accounts.

(Part of [hledger by example](hledger-by-example.md).)
