# hledger and Beancount

Tips for co-using/converting/switching [Beancount](https://beancount.github.io) and hledger.

See also:
- <https://plaintextaccounting.org/#feature-matrix>
- <https://www.reddit.com/r/plaintextaccounting/comments/um1xy0/beancount_and_hledger/>
- <https://www.libhunt.com/compare-hledger-vs-beancount>

Beancount's journal format is similar to hledger's,
but different enough that neither can read the other's files.

## hledger to Beancount

Use hledger's [print](hledger.md#print) command, which supports [Beancount output](hledger.md#beancount-output).

## Beancount to hledger

Use Beancount 2's [bean-report](https://beancount.github.io/docs/running_beancount_and_generating_reports.html#bean-report) tool.
(It's not available with Beancount 3):
```cli
$ bean-report foo.beancount hledger > foo.hledger
```

This will convert `@@` total costs to `@` unit costs, which tends to create precision problems,
causing hledger to complain that transactions are unbalanced.
To fix it, declare a sensible display/balancing precision for each commodity, like this:
```journal
commodity 1.00 USD
commodity 1.00 EUR
...
```
(bean-report generates the commodity directives; just add the numbers, with two decimal places or however many is appropriate.)
