# balancesheet: assets and liabilities

`balancesheet`, also known as `bs`, shares many of the features of the `balance` command, but it is simpler: 
it shows historical balances of asset and liability accounts, each in their own section.
This and the next command we'll show are the two most important accounting reports.


```
$ hledger bs
Balance Sheet 2025-01-04

                         || 2025-01-04 
=========================++============
 Assets                  ||            
-------------------------++------------
 assets:bank:checking    ||    750 USD 
 assets:cash             ||    100 USD 
-------------------------++------------
                         ||    850 USD 
=========================++============
 Liabilities             ||            
-------------------------++------------
 liabilities:credit card ||    200 USD 
-------------------------++------------
                         ||    200 USD 
=========================++============
 Net:                    ||    650 USD 
```

Balances at end of each day, in tree mode, down to account depth 2:
```
$ hledger bs -Dt -2
Daily Balance Sheet 2025-01-01..2025-01-04

                         || 2025-01-01  2025-01-02  2025-01-03  2025-01-04 
=========================++================================================
 Assets                  ||                                                
-------------------------++------------------------------------------------
 assets                  ||    300 USD    1300 USD    1100 USD     850 USD 
   bank                  ||    200 USD    1200 USD    1000 USD     750 USD 
   cash                  ||    100 USD     100 USD     100 USD     100 USD 
-------------------------++------------------------------------------------
                         ||    300 USD    1300 USD    1100 USD     850 USD 
=========================++================================================
 Liabilities             ||                                                
-------------------------++------------------------------------------------
 liabilities:credit card ||    400 USD     400 USD     200 USD     200 USD 
-------------------------++------------------------------------------------
                         ||    400 USD     400 USD     200 USD     200 USD 
=========================++================================================
 Net:                    ||   -100 USD     900 USD     900 USD     650 USD 
```

There's a variant of this report which also shows equity balances: `balancesheetequity` / `bse`.

<br>

(Part of [hledger by example](hledger-by-example.md).)
