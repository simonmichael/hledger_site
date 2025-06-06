# hledger and Beancount

<div class=pagetoc>

<!-- toc -->
</div>

Tips for co-using or converting between [Beancount](https://beancount.github.io) and hledger.
If you are a Beancount user trying to use your data with hledger, or vice-versa,
please [let me know](support.md) your experience so I can make this smoother.

See also:

- [Which PTA app should I choose ? (PTA FAQ)](https://plaintextaccounting.org/Getting-started-FAQ#which-pta-app-should-i-choose)
- [hledger and Ledger](ledger.md)
- [Beancount documentation](https://beancount.github.io/docs)

## Differences

For some project and feature differences,
see the [PTA apps](https://plaintextaccounting.org/#pta-apps) overview
and [Feature matrix](https://plaintextaccounting.org/#feature-matrix).

hledger focusses strongly on UX, reliability, and real-world practicality.
It aims to be somewhat useful to non-techies and accounting beginners, as well as experts.
It is written in Haskell, which helps with correctness and maintainability.

Compared to hledger, Beancount has

- a more active mail list
- a better web app (Fava)
- more automated lot tracking for investment transactions
- a data format extendable by plugins
- a Python API

Compared to Beancount, hledger has

- more active chat rooms
- more active maintenance and support. There's a new release every quarter.
- good installability (a clear best version, a single binary to install, easy install on Windows)
- more speed
- up-to-date docs
- more beginner resources
- a single reference manual, viewable in multiple formats and offline
- easier, built in features: data entry, CSV import, reports, query syntax, multi-period reports, time logging
- multiple officially-supported user interfaces (CLI, TUI, web, HTTP-JSON), and export to Fava
- fully documented future-proof data formats
- a Haskell API

[Beancount's journal syntax](https://beancount.github.io/docs/beancount_language_syntax.html) is similar to 
[hledger's](hledger.md#journal),
but different enough that neither can read the other's files directly.


## Beancount to hledger

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

To fix this, declare a display/balancing precision for each commodity.
In the converted file, add sample numbers to the [commodity directives](https://hledger.org/hledger.html#commodity-directive),
with the number of decimal places you'd like to see in reports.
This also allows hledger to check transactions' balancedness more leniently.
Eg, change:
```journal
commodity USD
commodity EUR
```
to:
```journal
commodity 1.00 USD
commodity 1.00 EUR
```

## hledger to Beancount

The best way to export from hledger to Beancount is with hledger's [print](hledger.md#print) command, which supports [Beancount output](hledger.md#beancount-output).

This can be useful for viewing hledger data in [Fava](https://beancount.github.io/fava/), eg.
In simple cases it can be:
```
$ pip3 install fava
$ hledger print -o tmp.beancount
$ fava tmp.beancount
```

