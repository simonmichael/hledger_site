# Exporting from hledger

Many finance apps have a way to import CSV files from financial institutions.
You can produce similar CSV with hledger's [register] command.
Export one account and one currency at a time. This helps keep the CSV
simple and importable. Eg:

```shell
$ hledger -f examples/sample.journal reg -O csv checking cur:'\$'
"txnidx","date","code","description","account","amount","total"
"1","2008-01-01","","income","assets:bank:checking","$1","$1"
"2","2008-06-01","","gift","assets:bank:checking","$1","$2"
"3","2008-06-02","","save","assets:bank:checking","$-1","$1"
"5","2008-12-31","","pay off","assets:bank:checking","$-1","0"
```

The new [aregister] command (currently in master) is best for this,
since it guarantees one record per transaction even with complex
multi-posting transactions, and provides the (abbreviated) other
account names, making categorisation easier when importing:

```shell
$ hledger -f examples/sample.journal areg checking -O csv cur:'\$'
"txnidx","date","code","description","otheraccounts","change","balance"
"1","2008-01-01","","income","in:salary","$1","$1"
"2","2008-06-01","","gift","in:gifts","$1","$2"
"3","2008-06-02","","save","as:ba:saving","$-1","$1"
"5","2008-12-31","","pay off","li:debts","$-1","0"
```


[register]: hledger.html#register
[aregister]: hledger.html#aregister
