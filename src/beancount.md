# hledger and Beancount

Tips for co-using/converting/switching Beancount and hledger.

Beancount's journal format is different enough from hledger's
that one tool can't directly read the other's files, currently.

To convert between the formats, use
[beancount2ledger](https://github.com/beancount/beancount2ledger)
and
[ledger2beancount](https://github.com/beancount/ledger2beancount).

<!--
```
$ ledger print | hledger -f- CMD
```

The print command discards most of the Ledger-specific syntax,
and the output is usually hledger compatible journal entries. 
This is good enough for most reporting needs. Some examples:

```shell
$ ledger print | hledger -f- check       # check for problems
$ ledger print | hledger -f- stats       # show journal statistics
$ ledger print | hledger -f- is -MAS -2  # summarise monthly revenues/expenses
$ ledger print | hledger -f- web         # view journal in hledger-web WUI
$ hledger-ui -f <(ledger print)          # view journal in hledger-ui TUI (works in bash)
```
-->
