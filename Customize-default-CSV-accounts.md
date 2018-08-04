When converting CSV, hledger uses the account names `income:unknown` and `expenses:unknown` as defaults for the second posting's account.

Normally when you see these, you will add CSV rules to set a more specific account name. 
But they should probably be configurable.
Here are some ways to customize them for now. 

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

Add two rules like this, before any other account2 rules (eg above the `if cafe` rule):
```
# default income/expense accounts
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
