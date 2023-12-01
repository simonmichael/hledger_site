# Reporting version control stats

You can export version control history as a journal, for analysis with hledger.
Here's an example: comparing the big 3 PTA apps' git commit counts.

Start a journal with some account declarations; this is just to set the projects' display order:
```cli
printf "account ledger\naccount hledger\naccount beancount\n" >project-commits.j
```

Export each git commit as a transaction. git log makes this easy; we include the commit date, short hash, and summary:
```cli
for P in ledger hledger beancount; do
  git -C ../$P log --reverse --format="%cd (%h) %s%n  ($P)  1%n" --date=short
done >> project-commits.j 
```

The resulting journal looks like:
```journal
account ledger
account hledger
account beancount

2003-09-29 (e95ea133) Initial revision
  (ledger)  1

2003-09-29 (faaed980) *** empty log message ***
  (ledger)  1
...
```

Now we can run reports:
```cli
$ hledger -f project-commits.j  stats
Main file                : /Users/simon/src/PTA/hledger/project-commits.j
Included files           : 
Transactions span        : 2003-09-29 to 2023-12-02 (7369 days)
Last transaction         : 2023-12-01 (0 days ago)
Transactions             : 24966 (3.4 per day)
Transactions last 30 days: 76 (2.5 per day)
Transactions last 7 days : 15 (2.1 per day)
Payees/descriptions      : 19997
Accounts                 : 3 (depth 1)
Commodities              : 1 ()
Market prices            : 0 ()

Run time (throughput)    : 0.70s (35759 txns/s)
```

```cli
$ hledger -f project-commits.j bal -YT
Balance changes in 2003-01-01..2023-12-31:

           || 2003  2004  2005  2006  2007  2008  2009  2010  2011  2012  2013  2014  2015  2016  2017  2018  2019  2020  2021  2022  2023    Total 
===========++=======================================================================================================================================
 ledger    ||   50   327     0     0     0  1248  1462   437   153   706   708   578   367   115    55    78   130    90    42    55   162     6763 
 hledger   ||    0     0     0     0   150   407   610   606   529   350   365   567   542   732   892  1155  1089  1313  1131   832   773    12043 
 beancount ||    0     0     0     0     0   190    86    15    25    18   433  1484  1160   686   240   393   189   773   299   112    57     6160 
-----------++---------------------------------------------------------------------------------------------------------------------------------------
           ||   50   327     0     0   150  1845  2158  1058   707  1074  1506  2629  2069  1533  1187  1626  1408  2176  1472   999   992    24966 
```

```cli
$ for P in ledger hledger beancount; do hledger -f project-commits.j reg -w80 ^$P | head -1; done
2003-09-29 Initial revision     (ledger)                         1             1
2007-01-27 start                (hledger)                        1             1
2008-04-23 Initial import.      (beancount)                      1             1
```

```cli
$ for P in ledger hledger beancount; do hledger -f project-commits.j print ^$P | hledger -f- bal -YATN --summary | tail -4; done

        ||   Total  Average 
========++==================
 ledger ||    6763      322 

         ||   Total  Average 
=========++==================
 hledger ||   12043      708 

           ||   Total  Average 
===========++==================
 beancount ||    6160      385 
```
