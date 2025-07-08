# Account names

Account names can be whatever you like.
They can be capitalised or uncapitalised:
```
assets:cash
Assets:Cash
```

They can be in any language:
```
actifs:espèces
activos:caja
资产:现金
資産:現金
자산:현금
```

They can contain spaces
(this is the reason that two or more spaces are sometimes required
to end account names, in journal entries):
```
liabilities:credit card
Assets:Bank of the West
```

Spaces are good for readability, but can make command lines and scripting a little harder.
You can also use punctuation, or run words together:
```
Assets:Bank-of-the-West
Assets:Bank_of_the_West
Assets:BankOfTheWest
assets:bankofthewest
```

The best account names are easy to remember, easy to spell, and easy to type.

It can be helpful if the last part of account names is unique.
Eg say you have business and personal checking accounts:
```
assets:bank1:checking
assets:bank2:checking
```
you could instead name them something like:
```
assets:bank1:bchecking
assets:bank2:pchecking
```
making it easier to match the account you want (`hledger register pchecking`).

## Account hierarchy

Colons in account names indicate subaccounts, subsubaccounts and so on, to any depth.
The account name `assets:bank:checking` actually represents a hierarchy of three accounts:
```
assets                  ; top-level account    (depth 1)
assets:bank             ; second-level account (depth 2)
assets:bank:checking    ; third-level account  (depth 3)
```

Reports usually show accounts as a flat list, as above, for simplicity.
But they can also show accounts in hierarchical "tree mode":
```
assets
  bank
    checking
```

Hierarchy is optional. You could use simple account names with no subaccounts:
```
cash
checking
credit card
starting balances
gifts received
salary
food
health
recreation
rent
```

But it's common to use at least two levels of accounts, to keep them organised.
Eg:
```
assets:bank
assets:cash
liabilities:credit card
equity:start
income:gifts
income:salary
expenses:food
expenses:health
expenses:recreation
expenses:rent
expenses:utilities
```

<br>

(Part of [hledger by example](hledger-by-example.md).)
