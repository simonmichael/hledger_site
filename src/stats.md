# stats: Inspecting the journal

You can see  the transactions in your journal with the `stats` command:
```
PS C:\Users\Simon> hledger stats
Main file           : .../.hledger.journal
Included files      : 0
Txns span           : 2025-07-01 to 2025-07-02 (1 days)
Last txn            : 2025-07-01 (3 days ago)
Txns                : 1 (1.0 per day)
Txns last 30 days   : 1 (0.0 per day)
Txns last 7 days    : 1 (0.1 per day)
Payees/descriptions : 1
Accounts            : 2 (depth 2)
Commodities         : 1
Market prices       : 0
Runtime stats       : 0.22 s elapsed, 5 txns/s, 3 MB live, 13 MB alloc
```

<br>

(Part of [hledger by example](hledger-by-example.md).)
