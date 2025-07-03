# register: show postings

`register` shows the detailed changes in one or more accounts.

Changes in all accounts:
```
PS C:\Users\Simon> hledger register
2025-07-01 opening balances     assets:cash                    $10           $10
                                equity:start                  $-10             0
```

Just the changes in assets:cash:
```
PS C:\Users\Simon> hledger register assets:cash
2025-07-01 opening balances     assets:cash                    $10           $10
```

(Part of [hledger by example](hledger-by-example.md).)
