# Reading timedot files

Or in [timedot](hledger.md#timedot) format:

```timedot

2023/2/1
biz:research  .... ..
fos:hledger   .... .... ....

2023/2/2
fos:ledger    .
fos:haskell   ..
biz:client1   .... ....
```
```
$ hledger -f 2023.timedot balance -tDTA  # tree, Daily, Total, Average
Balance changes in 2023-02-01..2023-02-02:

            || 2023-02-01  2023-02-02    Total  Average 
============++==========================================
 biz        ||       1.50        2.00     3.50     1.75 
   client1  ||          0        2.00     2.00     1.00 
   research ||       1.50           0     1.50     0.75 
 fos        ||       3.00        0.75     3.75     1.88 
   haskell  ||          0        0.50     0.50     0.25 
   hledger  ||       3.00           0     3.00     1.50 
   ledger   ||          0        0.25     0.25     0.12 
------------++------------------------------------------
            ||       4.50        2.75     7.25     3.62 
```

<br>

(Part of [hledger by example](hledger-by-example.md))
