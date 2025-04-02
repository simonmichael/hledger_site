# hledger and Beancount

Tips for co-using/converting/switching [Beancount](https://beancount.github.io) and hledger.

See also:
- <https://plaintextaccounting.org/#feature-matrix>
- <https://www.reddit.com/r/plaintextaccounting/comments/um1xy0/beancount_and_hledger/>
- <https://www.libhunt.com/compare-hledger-vs-beancount>


Beancount's journal format is similar to hledger's,
but different enough that neither can read the other's files.

There are two old converters: [beancount2ledger](https://github.com/beancount/beancount2ledger)
and [ledger2beancount](https://github.com/beancount/ledger2beancount).
They are not actively maintained, and limited in what they support.
Since hledger 1.32, and especially since hledger 1.41,
the best option for exporting from hledger to Beancount is
hledger's [print](dev/hledger.md#print) command, which supports [beancount output](dev/hledger.md#beancount-output).
