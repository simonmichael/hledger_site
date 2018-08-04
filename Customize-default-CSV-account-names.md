hledger uses some hard-coded default accounts when converting CSV: `income:unknown`, `expenses:unknown` etc. 

Normally when you see these, you would add some more CSV rules to assign more specific accounts. 
They should probably be configurable.
Here are some ways to customize them when they do appear. 

## By CSV rule

Given `a.csv`:
```
2018/07/01,dentist,-50
2018/07/02,cafe,-2
2018/07/03,some income,100
```

and `a.csv.rules`:
```
fields date, description, amount
currency $
account1 Assets:Checking

if cafe
  account2 Expenses:Coffee
```

You could add two rules like this, before any other account2 rules (eg the `if cafe` above):
```
# capitalise default income/expense accounts
account2 Income:Misc
if ,-[0-9]+(,|$)
 account2 Expenses:Misc
```

The first sets the account to Income:Misc, 
and the second changes it to Expenses:Misc if the amount field is negative.
The regular expression matching negative amounts works for the example above, but you may need to adapt it for your data.

## By account alias

```
$ hledger -f a.csv print | hledger -f- print --alias income:unknown=Income:Misc --alias expenses:unknown=Expenses:Misc
```

Note --alias doesn't affect CSV conversion as of hledger 1.10, so you have to pipe it through another hledger invocation.
