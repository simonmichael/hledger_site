# hledger and Beancount

<div class=pagetoc>

<!-- toc -->
</div>

Tips for co-using or converting between [Beancount](https://beancount.github.io) and hledger.

## Differences

For some project and feature differences,
see the [PTA apps](https://plaintextaccounting.org/#pta-apps) overview
and [Feature matrix](https://plaintextaccounting.org/#feature-matrix).

See also [hledger and Ledger](ledger.md); some of that applies here too.

Compared to Beancount, hledger has

- regular quarterly releases
- a single best version with all features (the latest)
- a single binary to install, rather than a python source package
- easy install on Windows
- up-to-date docs
- all reference info in a single manual, viewable in multiple formats and offline, on all platforms
- easy built in data entry and CSV/SSV/TSV import
- easy built in reports
- easy query syntax
- multi-period reports
- multiple officially-supported user interfaces (CLI, TUI, web, HTTP-JSON), and export to Fava
- extensibility using Haskell
- more active chat rooms and beginner support

Compared to hledger, Beancount has

- a best-in-class web app (Fava)
- more automated lot tracking for investment transactions
- more tightly integrated plugins
- extensibility using Python
- a more active mail list

## Interoperating / converting

Beancount's journal format is similar to hledger's,
but different enough that neither can read the other's files.


## Beancount to hledger

If you are a Beancount user trying to use your data with hledger,
please [let me know](support.md) your experience.

Here's the most reliable way to export Beancount data for hledger:
use Beancount 2's [bean-report](https://beancount.github.io/docs/running_beancount_and_generating_reports.html#bean-report) tool.
It's not available with Beancount 3, you'll need to install Beancount 2:
```
$ pip3 install beancount==2.3.6
$ bean-report foo.beancount hledger > foo.hledger
```

Things to watch out for:

### Total costs, unbalanced transactions 

bean-report converts `@@` total costs to `@` unit costs.
This tends to create imprecise entries, causing hledger to complain that transactions are unbalanced.

However, `@` costs are more standard and often more useful.
And there's an easy fix: declare a sensible display/balancing precision which hledger should use for each commodity.
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

Use hledger's [print](hledger.md#print) command, which supports [Beancount output](hledger.md#beancount-output).

This can be useful for viewing hledger data in [Fava](https://beancount.github.io/fava/), eg.
In simple cases it can be:
```
$ pip3 install fava
$ hledger print -o tmp.beancount
$ fava tmp.beancount
```

