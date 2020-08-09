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

hledger supports other [output formats], including HTML, JSON and SQL.
Not all formats are supported by all commands/reports though.
For a given report, you can check the --help or just try an output
format to see if it has been added.

```shell
$ hledger -f examples/sample.journal reg checking -O sql
hledger: Sorry, output format "sql" is unrecognised or not yet implemented for this report or report mode.
$ hledger -f examples/sample.journal print checking -O sql
create table if not exists postings(id serial,txnidx int,date1 date,date2 date,status text,code text,description text,comment text,account text,amount numeric,commodity text,credit numeric,debit numeric,posting_status text,posting_comment text);
insert into postings(txnidx,date1,date2,status,code,description,comment,account,amount,commodity,credit,debit,posting_status,posting_comment) values
('1','2008-01-01',NULL,NULL,NULL,'income',NULL,'assets:bank:checking','1','$',NULL,'1',NULL,NULL)
,('1','2008-01-01',NULL,NULL,NULL,'income',NULL,'income:salary','-1','$','1',NULL,NULL,NULL)
,('2','2008-06-01',NULL,NULL,NULL,'gift',NULL,'assets:bank:checking','1','$',NULL,'1',NULL,NULL)
,('2','2008-06-01',NULL,NULL,NULL,'gift',NULL,'income:gifts','-1','$','1',NULL,NULL,NULL)
,('3','2008-06-02',NULL,NULL,NULL,'save',NULL,'assets:bank:saving','1','$',NULL,'1',NULL,NULL)
,('3','2008-06-02',NULL,NULL,NULL,'save',NULL,'assets:bank:checking','-1','$','1',NULL,NULL,NULL)
,('5','2008-12-31',NULL,'*',NULL,'pay off',NULL,'liabilities:debts','1','$',NULL,'1',NULL,NULL)
,('5','2008-12-31',NULL,'*',NULL,'pay off',NULL,'assets:bank:checking','-1','$','1',NULL,NULL,NULL)
;
```

[register]: hledger.html#register
[aregister]: hledger.html#aregister
[output formats]: hledger.html#output-format
