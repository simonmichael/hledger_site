# Reading CSV files

Most banks and financial institutions provide data in CSV (comma-separated values, or character-separated values) format.
hledger can read from any [CSV](hledger.md#csv) (or SSV, TSV, or other character-separated) file representing transactions. Eg:

```csv

"Date","Notes","Amount"
"2023/2/22","DEPOSIT","50.00"
"2023/2/23","TRANSFER TO SAVINGS","-10.00"
```
```rules

# bank.csv.rules  # this rules file tells hledger how to read bank.csv
skip 1
fields date, description, amount
currency $
account1 assets:bank:checking

if WHOLE FOODS
 account2 expenses:food

if (TO|FROM) SAVINGS
 account2 assets:bank:savings
```

```cli
$ hledger -f bank.csv print
2023-02-22 DEPOSIT
    assets:bank:checking          $50.00
    income:unknown               $-50.00

2023-02-23 TRANSFER TO SAVINGS
    assets:bank:checking         $-10.00
    assets:bank:savings           $10.00

```

See also: [Tutorial: Import CSV data](import-csv.md)

(Part of [hledger by example](hledger-by-example.md).)
