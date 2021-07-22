# hledger and Ledger

Tips for converting/migrating between Ledger and hledger, 
or using them together.

Ledger's and hledger's journal formats are the same at the core,
so you can continue using both tools on the same files, 
if you are careful to avoid syntax that is specific to one or the other.
See [FAQ](faq.html) on differences.

However if you are a long-time Ledger user, you will certainly have
Ledger-specific syntax, so for most Ledger users the quickest way 
to tap into hledger reports is some variant of

```
$ ledger print | hledger -f- CMD
```

The print command discards most of the Ledger-specific syntax,
and the output is usually hledger compatible journal entries. 
This is good enough for most reporting needs. Some examples:

```shell
$ ledger print | hledger -f- check         # check for problems
$ ledger print | hledger -f- stats         # show journal statistics
$ ledger print | hledger -f- is -MAS -2    # show monthly revenues/expenses sorted by average amount
$ ledger print | hledger -f- web           # view journal in hledger-web WUI
$ hledger-ui -f <(ledger print)            # view journal in hledger-ui TUI (works in bash at least)
```

