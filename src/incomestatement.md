# incomestatement: revenues and expenses

`incomestatement`, also known as `is`, shares many of the features of the `balance` command, but it is simpler: 
it shows changes in revenue (income) and expense accounts, each in their own section.
This and `balancesheet` are the two most important financial reports.
```
$ hledger is
Income Statement 2025-01-01..2025-01-04

                   || 2025-01-01..2025-01-04 
===================++========================
 Revenues          ||                        
-------------------++------------------------
 revenues:salary   ||               1000 USD 
-------------------++------------------------
                   ||               1000 USD 
===================++========================
 Expenses          ||                        
-------------------++------------------------
 expenses:food     ||                200 USD 
 expenses:rent     ||                800 USD 
 expenses:supplies ||                 50 USD 
-------------------++------------------------
                   ||               1050 USD 
===================++========================
 Net:              ||                -50 USD 
```

Daily revenues and expenses, largest first, and their totals and daily averages:
```
$ hledger is -DSTA
Daily Income Statement 2025-01-01..2025-01-04

                   || 2025-01-01  2025-01-02  2025-01-03  2025-01-04     Total  Average 
===================++===================================================================
 Revenues          ||                                                                   
-------------------++-------------------------------------------------------------------
 revenues:salary   ||          0    1000 USD           0           0  1000 USD  250 USD 
-------------------++-------------------------------------------------------------------
                   ||          0    1000 USD           0           0  1000 USD  250 USD 
===================++===================================================================
 Expenses          ||                                                                   
-------------------++-------------------------------------------------------------------
 expenses:rent     ||    800 USD           0           0           0   800 USD  200 USD 
 expenses:food     ||          0           0           0     200 USD   200 USD   50 USD 
 expenses:supplies ||          0           0           0      50 USD    50 USD   12 USD 
-------------------++-------------------------------------------------------------------
                   ||    800 USD           0           0     250 USD  1050 USD  262 USD 
===================++===================================================================
 Net:              ||   -800 USD    1000 USD           0    -250 USD   -50 USD  -12 USD 
```

<br>

(Part of [hledger by example](hledger-by-example.md).)
