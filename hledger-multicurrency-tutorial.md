<!-- not supported on github wiki
---
title: hledger multicurrency tutorial
---

<style>
code mark {
  background-color: transparent;
  /*color: white;*/
  font-weight:bold;
}
</style>
-->

Anya begins using hledger without any currency symbols. She adds some [journal entries](http://hledger.org/manual.html#journal-format) like this (not bothering with descriptions, either):

```{.hledger emphasize=1-7}
2018/11/01
  income:gifts
  assets:bank          1000
    
2018/11/02
  assets:bank
  expenses:food         500
```

She knows hledger is filling in the missing amounts, which can be seen with [print's -x/--explicit](http://hledger.org/manual.html#print) flag:

```
$ hledger print -x
2018/11/01
    income:gifts            -1000
    assets:bank              1000

2018/11/02
    assets:bank              -500
    expenses:food             500

```

The [balance](http://hledger.org/manual.html#balance) command with no arguments shows all balance changes. The total is zero, as Anya expects - each transaction sums to zero, and all transactions are included in this report, so the report also sums to zero:

```
$ hledger bal
                 500  assets:bank
                 500  expenses:food
               -1000  income:gifts
--------------------
                   0
```

Unlike partial balance reports (omitting some accounts), which typically do not have a zero total:

```
$ hledger bal food
                 500  expenses:food
--------------------
                 500
```

Anya maintains a popular free software project. She remembers that she added a Liberapay button to the project website yesterday, allowing donations. Her native currency is rubles, but Liberapay pays out US dollars or euros. 

She realises she had better start tracking currencies in her journal or things will get confusing. So she adds currency symbols throughout her journal:

```{.hledger emphasize=3:22-3:23,7:23-7:24}
2018/11/01
  income:gifts
  assets:bank         ₽1000
    
2018/11/02
  assets:bank
  expenses:food        ₽500
```

Thinking ahead, she sees that entering euro symbols will be a bit unergonomic on her keyboard. She thinks perhaps she'll use standard alphabetic currency codes instead, and on the right-hand side:

```{.hledger emphasize=3:28-3:31,7:28-7:31}
2018/11/01
  income:gifts
  assets:bank          1000 RUB
    
2018/11/02
  assets:bank
  expenses:food         500 RUB
```

But she finds this a bit verbose. She decides to use single letters - R for rubles:

```{.hledger emphasize=3:28-3:29,7:28-7:29}
2018/11/01
  income:gifts
  assets:bank          1000 R
    
2018/11/02
  assets:bank
  expenses:food         500 R
```

Now her reports show the currency symbol:

```
$ hledger bal 
               500 R  assets:bank
               500 R  expenses:food
             -1000 R  income:gifts
--------------------
                   0
```

And she is ready for multicurrency accounting. Just in time, because next day a donation of 10 euros arrives! She records it, using E for euros:

```{.hledger emphasize=9-11}
2018/11/01
  income:gifts
  assets:bank          1000 R
    
2018/11/02
  assets:bank
  expenses:food         500 R

2018/11/03
  income:foss
  assets:liberapay       10 E
```

Now she has a multicurrency journal, and the balance report shows both currencies:

```
$ hledger bal 
                10 E        
               500 R  assets
               500 R    bank
                10 E    liberapay
               500 R  expenses:food
               -10 E        
             -1000 R  income
               -10 E    foss
             -1000 R    gifts
--------------------
                   0
```

However, it's a bit confusing. The `assets` and `income` parent accounts now have multicurrency balances, and each currency is displayed on its own line. She tries [flat mode](http://hledger.org/manual.html#flat-mode), and finds it clearer:

```
$ hledger bal --flat
               500 R  assets:bank
                10 E  assets:liberapay
               500 R  expenses:food
               -10 E  income:foss
             -1000 R  income:gifts
--------------------
                   0
```

But she has heard that hledger's [tabular output](http://hledger.org/manual.html#multicolumn-balance-report) is best for multicurrency reports, always showing amounts on one line. She starts using that, adding one of the [report interval](http://hledger.org/manual.html#report-intervals) flags (-Y/--yearly) to activate it:

```
$ hledger bal -Y
Balance changes in 2018:

                  ||    2018 
==================++=========
 assets:bank      ||   500 R 
 assets:liberapay ||    10 E 
 expenses:food    ||   500 R 
 income:foss      ||   -10 E 
 income:gifts     || -1000 R 
------------------++---------
                  ||       0 
```

Anya requests a withdrawal of the Liberapay funds to her bank. Her bank holds rubles, so the euros will get converted. She's not sure of the exact exchange rate or fees, but next day, when the transaction clears, she can see that 10 euros left her liberapay account and 750 rubles arrived in her bank account. She decides to just record that:

```{.hledger emphasize=13-15}
2018/11/01
  income:gifts
  assets:bank          1000 R
    
2018/11/02
  assets:bank
  expenses:food         500 R

2018/11/03
  income:foss
  assets:liberapay       10 E

2018/11/04
  assets:liberapay      -10 E
  assets:bank           750 R
```

This is her first multicurrency transaction. She hasn't written the exchange rate explicitly, but the manual [says](http://hledger.org/manual.html#transaction-prices) hledger can figure it out. It seems to work:

```
$ hledger bal  -Y
Balance changes in 2018:

               ||         2018 
===============++==============
 assets:bank   ||       1250 R 
 expenses:food ||        500 R 
 income:foss   ||        -10 E 
 income:gifts  ||      -1000 R 
---------------++--------------
               || -10 E, 750 R 
```

However, two things surprise her. First, where has the liberapay account gone ? She remembers that balance reports hide zero-balance accounts by default, and adds -E/--empty to show it. (She also notes that no currency symbol is displayed for zero amounts):

```{emphasize=7-7,12-12}
$ hledger bal  -YE
Balance changes in 2018:

                  ||         2018 
==================++==============
 assets:bank      ||       1250 R 
 assets:liberapay ||            0 
 expenses:food    ||        500 R 
 income:foss      ||        -10 E 
 income:gifts     ||      -1000 R 
------------------++--------------
                  || -10 E, 750 R 
```

Second, the balance report is now showing a non-zero total. The individual euro and ruble totals look correct, but why isn't it zero ? Is the journal unbalanced ?

Anya asks for help on the #hledger IRC channel and is advised to add the -B/--cost flag. Sure enough, the total is now zero:

```{emphasize=7:21-7:33}
$ hledger bal -YEB
Balance changes in 2018:

                  ||         2018 
==================++==============
 assets:bank      ||       1250 R 
 assets:liberapay || 10 E, -750 R 
 expenses:food    ||        500 R 
 income:foss      ||        -10 E 
 income:gifts     ||      -1000 R 
------------------++--------------
                  ||            0 
```

But now the liberapay account, which should be empty, is showing a positive euro and negative ruble balance. As if one had not been converted into the other. Why is this ?

With a little help, Anya goes troubleshooting. Inspecting the multicurrency transaction with print -x (and a date filter to exclude the rest) shows how hledger has parsed it:

```{emphasize=3:24-3:38}
$ hledger print -x date:20181104
2018/11/04
    assets:liberapay    -10 E @@ 750 R
    assets:bank                  750 R
```

The manual makes this a bit clearer. Anya wrote the entry in [transaction prices](http://hledger.org/manual.html#transaction-prices) style 3 (*"let hledger infer the price that balances the transaction"*). hledger has converted this to style 2 (*"@@ TOTALPRICE after the amount"*), recording that the 10 euro were priced at 750 rubles in this transaction.

With -B added, the 10 euro is converted to its [cost](http://hledger.org/manual.html#cost) in rubles:

```{emphasize=3:30-3:36}
$ hledger print -xB date:20181104
2018/11/04
    assets:liberapay          -750 R
    assets:bank                750 R

```

The register command shows how the balance reports above calculate the liberapay balance. Without -B: 10 euro are added, 10 euro are removed, the liberapay account's end balance is zero:

```{emphasize=3:74-3:80}
$ hledger reg liberapay
2018/11/03                     assets:liberapay               10 E          10 E
2018/11/04                     assets:liberapay              -10 E             0
```

With -B: 10 euro are added, 750 rubles are removed, the liberapay account's end balance is "10 euro, -750 rubles". (With each currency on its own line, again. Also, it seems that register aligns the account name with the top amount, unlike the balance command):

```{emphasize=3:74-3:80,4:74-4:80}
$ hledger reg liberapay -B
2018/11/03                      assets:liberapay              10 E          10 E
2018/11/04                      assets:liberapay            -750 R          10 E
                                                                          -750 R
```

In summary, it seems that the balance report must sum either the primary posting amounts (`bal`), or the cost amounts (`bal -B`), consistently for both the account balances above the line, and the total below the line. Otherwise the total would be incorrect. Which means that one or the other of these will be displayed as an unconverted multicurrency amount.

Anya decides to find out more about the other currency-related flag: [-V](http://hledger.org/manual.html#market-value) (TBD...)