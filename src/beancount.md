# hledger and Beancount

<div class=pagetoc>

<!-- toc -->
</div>

Tips for co-using or converting between [Beancount](https://beancount.github.io) and hledger.

## Differences

For some project and feature differences,
see the [PTA apps](https://plaintextaccounting.org/#pta-apps) overview
and [Feature matrix](https://plaintextaccounting.org/#feature-matrix).

See also:
- [hledger and Ledger](ledger.md)
- [Beancount documentation](https://beancount.github.io/docs)

Compared to hledger, Beancount has

- a more active mail list
- a best-in-class web app (Fava)
- more automated lot tracking for investment transactions
- extensible data format using plugins
- extensibility using Python

Compared to Beancount, hledger has

- more active chat rooms and beginner support
- regular quarterly releases
- good installability (a clear best version, a single binary to install, easy install on Windows)
- more speed
- up-to-date docs
- a single reference manual, viewable in multiple formats and offline, on all platforms
- easier, built in features: data entry, CSV import, reports, query syntax, multi-period reports, time logging
- multiple officially-supported user interfaces (CLI, TUI, web, HTTP-JSON), and export to Fava
- fully documented data formats not using third-party plugins
- extensibility using Haskell

[Beancount's journal syntax](https://beancount.github.io/docs/beancount_language_syntax.html) is similar to 
[hledger's](hledger.md#journal),
but different enough that neither can read the other's files directly.


## Beancount to hledger

(If you are a Beancount user trying to use your data with hledger,
please [let me know](support.md) your experience.)

The most reliable way to export Beancount data is with 
Beancount 2's [bean-report](https://beancount.github.io/docs/running_beancount_and_generating_reports.html#bean-report) tool.
It's not available with Beancount 3, you'll need to install Beancount 2:
```
$ pip3 install beancount==2.3.6
$ bean-report foo.beancount hledger > foo.hledger
```

Here are some things to watch out for:

### Total costs

bean-report converts `@@` total costs to `@` unit costs.
`@` costs are more standard and often more useful, eg when selling part of a lot.
But this conversion tends to create imprecise entries, causing hledger to complain that transactions are unbalanced.

There's an easy fix: declare a sensible display/balancing precision which hledger should use for each commodity.
To do that, in the converted file, add sample numbers to the [commodity directives](https://hledger.org/hledger.html#commodity-directive),
using two decimal places or however many is appropriate. Eg, change:
```journal
commodity USD
commodity EUR
```
to:
```journal
commodity 1.00 USD
commodity 1.00 EUR
```
This allows hledger to check the journal entries' balancedness more leniently.

## hledger to Beancount

The best way is with hledger's [print](hledger.md#print) command, which supports [Beancount output](hledger.md#beancount-output).

This can be useful for viewing hledger data in [Fava](https://beancount.github.io/fava/), eg.
In simple cases it can be:
```
$ pip3 install fava
$ hledger print -o tmp.beancount
$ fava tmp.beancount
```

