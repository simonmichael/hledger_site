# balance: show account totals


`balance` shows total balance changes per account.
(In simple cases these are also the current account balances, but not always.)

```
PS C:\Users\Simon> hledger balance
                 $10  assets:cash
                $-10  equity:start
--------------------
                   0
```

```
PS C:\Users\Simon> hledger balance --tree --no-elide
                 $10  assets
                 $10    cash
                $-10  equity
                $-10    start
--------------------
                   0
```

(Part of [hledger by example](hledger-by-example.md).)
