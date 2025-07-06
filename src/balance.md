# balance: show account totals


`balance` shows the total *balance change* per account, usually for multiple accounts at once:

```
$ hledger balance
             750 USD  assets:bank:checking
             100 USD  assets:cash
            -700 USD  equity:start
             200 USD  expenses:food
             800 USD  expenses:rent
              50 USD  expenses:supplies
            -200 USD  liabilities:credit card
           -1000 USD  revenues:salary
--------------------
                   0  
```

The `balance` command is quite flexible.
The above is its original output style (as in Ledger), with amounts on the left.
Specifying a *report interval*, like monthly, enables more modern tabular output, with a title.
Eg here are the changes broken down by month (there's only one month in this case):

```
$ hledger balance -M
Balance changes in 2025-01:

                         ||       Jan 
=========================++===========
 assets:bank:checking    ||   750 USD 
 assets:cash             ||   100 USD 
 equity:start            ||  -700 USD 
 expenses:food           ||   200 USD 
 expenses:rent           ||   800 USD 
 expenses:supplies       ||    50 USD 
 liabilities:credit card ||  -200 USD 
 revenues:salary         || -1000 USD 
-------------------------++-----------
                         ||         0 
```

or by day:
```
$ hledger balance -D
Balance changes in 2025-01-01..2025-01-04:

                         || 2025-01-01  2025-01-02  2025-01-03  2025-01-04 
=========================++================================================
 assets:bank:checking    ||    200 USD    1000 USD    -200 USD    -250 USD 
 assets:cash             ||    100 USD           0           0           0 
 equity:start            ||   -700 USD           0           0           0 
 expenses:food           ||          0           0           0     200 USD 
 expenses:rent           ||    800 USD           0           0           0 
 expenses:supplies       ||          0           0           0      50 USD 
 liabilities:credit card ||   -400 USD           0     200 USD           0 
 revenues:salary         ||          0   -1000 USD           0           0 
-------------------------++------------------------------------------------
                         ||          0           0           0           0 
```

`-D`/`--daily` is the smallest interval it can show.
If you need more detail than that, use a `register` report.
Eg, to see the detailed changes to checking on 2025-01-03:
```
$ hledger register checking date:2025-01-03
2025-01-03 pay half of credi..  assets:bank:checking      -200 USD      -200 USD
```

Usually we restrict `balance` to certain accounts:
```
$ hledger balance assets liabilities
             750 USD  assets:bank:checking
             100 USD  assets:cash
            -200 USD  liabilities:credit card
--------------------
             650 USD  
```

Here's a daily expenses report:
```
$ hledger balance expenses -D
Balance changes in 2025-01-01..2025-01-04:

                   || 2025-01-01  2025-01-02  2025-01-03  2025-01-04 
===================++================================================
n expenses:food     ||          0           0           0     200 USD 
 expenses:rent     ||    800 USD           0           0           0 
 expenses:supplies ||          0           0           0      50 USD 
-------------------++------------------------------------------------
                   ||    800 USD           0           0     250 USD 
```
We can add Total and Average columns:
<!-- with `-T`/`--row-total` and `-A`/`--average` flags: -->
```
$ hledger balance expenses -DTA
Balance changes in 2025-01-01..2025-01-04:

                   || 2025-01-01  2025-01-02  2025-01-03  2025-01-04     Total  Average 
===================++===================================================================
 expenses:food     ||          0           0           0     200 USD   200 USD   50 USD 
 expenses:rent     ||    800 USD           0           0           0   800 USD  200 USD 
 expenses:supplies ||          0           0           0      50 USD    50 USD   12 USD 
-------------------++-------------------------------------------------------------------
                   ||    800 USD           0           0     250 USD  1050 USD  262 USD 
```

Sort by amount, and show amounts as percentages of their column total:
<!--
with `-%`/`--percent`,
with `-S`/`--sort-amount`:
-->

```
$ hledger balance expenses -DTAS -%
Balance changes in 2025-01-01..2025-01-04:

                   || 2025-01-01  2025-01-02  2025-01-03  2025-01-04    Total  Average 
===================++==================================================================
 expenses:rent     ||    100.0 %           0           0           0   76.2 %   76.2 % 
 expenses:food     ||          0           0           0      80.0 %   19.0 %   19.0 % 
 expenses:supplies ||          0           0           0      20.0 %    4.8 %    4.8 % 
-------------------++------------------------------------------------------------------
                   ||    100.0 %           0           0     100.0 %  100.0 %  100.0 % 
```

Hide all but the Total/Average columns:
```
$ hledger balance expenses -DTAS --summary-only
Balance changes in 2025-01-01..2025-01-04:

                   ||    Total  Average 
===================++===================
 expenses:rent     ||  800 USD  200 USD 
 expenses:food     ||  200 USD   50 USD 
 expenses:supplies ||   50 USD   12 USD 
-------------------++-------------------
                   || 1050 USD  262 USD 
```

Show the daily changes in asset and liability accounts:
```
$ hledger balance assets liabilities -D
Balance changes in 2025-01-01..2025-01-04:

                         || 2025-01-01  2025-01-02  2025-01-03  2025-01-04 
=========================++================================================
 assets:bank:checking    ||    200 USD    1000 USD    -200 USD    -250 USD 
 assets:cash             ||    100 USD           0           0           0 
 liabilities:credit card ||   -400 USD           0     200 USD           0 
-------------------------++------------------------------------------------
                         ||   -100 USD    1000 USD           0    -250 USD 
```

It's important to note that despite its name, the "balance" command shows *balance changes* by default.
But it can also show the resulting *balances*, if you add the `-H`/`--historical` flag.
Notice the change of title:
```
$ hledger balance assets liabilities -DH
Ending balances (historical) in 2025-01-01..2025-01-04:

                         || 2025-01-01  2025-01-02  2025-01-03  2025-01-04 
=========================++================================================
 assets:bank:checking    ||    200 USD    1200 USD    1000 USD     750 USD 
 assets:cash             ||    100 USD     100 USD     100 USD     100 USD 
 liabilities:credit card ||   -400 USD    -400 USD    -200 USD    -200 USD 
-------------------------++------------------------------------------------
                         ||   -100 USD     900 USD     900 USD     650 USD 
```

This is especially important if you restrict the report by date;
it ensures that balances from earlier postings are included,
to show correct *historical balances* (as you would see in bank statements):
```
$ hledger balance assets liabilities -DH date:2025-01-03..
Ending balances (historical) in 2025-01-03..2025-01-04:

                         || 2025-01-03  2025-01-04 
=========================++========================
 assets:bank:checking    ||   1000 USD     750 USD 
 assets:cash             ||    100 USD     100 USD 
 liabilities:credit card ||   -200 USD    -200 USD 
-------------------------++------------------------
                         ||    900 USD     650 USD 
```

Colons in account names indicate *subaccounts*.
So we can show balances reports in *tree mode*, showing the account hierarchy.
In tree mode, the changes or balances of parent accounts include the
changes or balances of subaccounts:
```
$ hledger balance assets liabilities -DHt --no-elide
Ending balances (historical) in 2025-01-01..2025-01-04:

               || 2025-01-01  2025-01-02  2025-01-03  2025-01-04 
===============++================================================
 assets        ||    300 USD    1300 USD    1100 USD     850 USD 
   bank        ||    200 USD    1200 USD    1000 USD     750 USD 
     checking  ||    200 USD    1200 USD    1000 USD     750 USD 
   cash        ||    100 USD     100 USD     100 USD     100 USD 
 liabilities   ||   -400 USD    -400 USD    -200 USD    -200 USD 
   credit card ||   -400 USD    -400 USD    -200 USD    -200 USD 
---------------++------------------------------------------------
               ||   -100 USD     900 USD     900 USD     650 USD 
```

Usually we don't bother with `--no-elide`; then hledger will collapse
some identical lines to save space:
```
$ hledger balance assets liabilities -DHt
Ending balances (historical) in 2025-01-01..2025-01-04:

                         || 2025-01-01  2025-01-02  2025-01-03  2025-01-04 
=========================++================================================
 assets                  ||    300 USD    1300 USD    1100 USD     850 USD 
   bank:checking         ||    200 USD    1200 USD    1000 USD     750 USD 
   cash                  ||    100 USD     100 USD     100 USD     100 USD 
 liabilities:credit card ||   -400 USD    -400 USD    -200 USD    -200 USD 
-------------------------++------------------------------------------------
                         ||   -100 USD     900 USD     900 USD     650 USD 
```

We can use `--depth NUM` or just `-NUM` to summarise the report down to a certain account depth.
Depth 1 means just the top level accounts:
```
$ hledger balance assets liabilities -DHt -1
Ending balances (historical) in 2025-01-01..2025-01-04:

             || 2025-01-01  2025-01-02  2025-01-03  2025-01-04 
=============++================================================
 assets      ||    300 USD    1300 USD    1100 USD     850 USD 
 liabilities ||   -400 USD    -400 USD    -200 USD    -200 USD 
-------------++------------------------------------------------
             ||   -100 USD     900 USD     900 USD     650 USD 
```

`--transpose` exchanges the rows and columns, useful eg when reports are very wide.
And `-N` hides the usual totals row:

```
$ hledger balance assets liabilities -DHN -1 --transpose
Ending balances (historical) in 2025-01-01..2025-01-04:

            ||   assets  liabilities 
============++=======================
 2025-01-01 ||  300 USD     -400 USD 
 2025-01-02 || 1300 USD     -400 USD 
 2025-01-03 || 1100 USD     -200 USD 
 2025-01-04 ||  850 USD     -200 USD 
```

<br>

(Part of [hledger by example](hledger-by-example.md).)
