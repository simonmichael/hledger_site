# hledger and Ledger
<div class=pagetoc>

<!-- toc -->
</div>

See also: 
- <https://www.libhunt.com/compare-hledger-vs-ledger>
- <https://www.reddit.com/r/plaintextaccounting/comments/ztdk0o/ledger_vs_hledger/>

## Differences

*2022-12: If you are a Ledger user trying to use hledger with your data,
I'd love to hear about your experience and make this page more helpful.
Please contact me (sm) in the #ledger, #hledger, or #plaintextaccounting chats,
<https://hledger.org/support>. ([#1962](https://github.com/simonmichael/hledger/issues/1962))*

### Summary

How is hledger different from Ledger ? First, the high-order differences:

- hledger is actively maintained (since 2008)
- hledger focusses strongly on UX, reliability, and real-world practicality
- hledger is written in Haskell, which helps with correctness and maintainability
- hledger tries to reimplement Ledger's best parts in more depth, with improved functionality and robustness.

Compared to Ledger, hledger has

- a complete and accurate manual
- standard "financial statement" reports
- multi-column reports
- an easier query syntax 
- better depth limiting
- a battle-tested CSV/SSV/TSV import system
- and comes with multiple officially-supported user interfaces (CLI, console, TUI, WUI).

Compared to hledger, Ledger has

- assisted lot tracking for investment transactions
- more support for embedding small programs in your data to get custom behaviour 
  (value expressions, maybe python ?)
- ... ?

If you are most interested in trying out hledger on your Ledger data, 
you may want to skip ahead to [Interoperating tips](#interoperating-tips).
TLDR: if you rely heavily on lot notation, or amount expressions like ($10 / 3),
it may be difficult.

### Features

Over time, features have propagated both ways.
Here is 
[a presentation of hledger features](features.html)
and here is a feature comparison as of 2022 (updates welcome):
 
|                                                   | hledger | Ledger |
|---------------------------------------------------|---------|--------|
| **Common features:**                              |         |        |
| journal format                                    | Y       | Y      |
| csv format                                        | Y       | Y      |
| timeclock format                                  | Y       | Y      |
| multiple commodities                              | Y       | Y      |
| conversion prices and cost reporting              | Y       | Y      |
| market prices and value reporting                 | Y       | Y      |
| virtual (unbalanced) postings                     | Y       | Y      |
| automated postings                                | Y       | Y      |
| periodic transactions                             | Y       | Y      |
| budget reporting                                  | Y       | Y      |
| capital gains reporting                           | Y       | Y      |
| report filtering with flags and query arguments   | Y       | Y      |
| basic output format customisation                 | Y       | Y      |
| print, register, balance commands                 | Y       | Y      |
| **Features in Ledger only:**                      |         |        |
| automatic revaluation transactions (`--revalued`) |         | Y      |
| lot reporting (`--lots`)                          |         | Y      |
| embedded programming language (value expressions) |         | Y      |
| embedded python snippets / python API             |         | Y      |
| probably miscellaneous other things...            |         | Y      |
| **Features in hledger only:**                     |         |        |
| international number formats                      | Y       |        |
| timedot format                                    | Y       |        |
| multi-period balance reports                      | Y       |        |
| account types                                     | Y       |        |
| activity command                                  | Y       |        |
| add command                                       | Y       |        |
| balancesheet command                              | Y       |        |
| cashflow command                                  | Y       |        |
| check command                                     | Y       |        |
| close command                                     | Y       |        |
| descriptions command                              | Y       |        |
| diff command                                      | Y       |        |
| files command                                     | Y       |        |
| iadd command                                      | Y       |        |
| import command                                    | Y       |        |
| incomestatement command                           | Y       |        |
| irr command                                       | Y       |        |
| interest command                                  | Y       |        |
| notes command                                     | Y       |        |
| prices command                                    | Y       |        |
| rewrite command                                   | Y       |        |
| ui command                                        | Y       |        |
| web command                                       | Y       |        |

### Performance

Traditionally, Ledger and hledger performance felt about the same on small files,
but Ledger used less memory and was faster with large files - with very large files,
up to ~10x faster. That extra speed came partly from providing fewer guarantees, 
eg Ledger's balance assertions/assignments are not date-aware.

Lately (2021) the performance gap seems to have closed, with hledger outperforming 
Ledger in some cases - more formal benchmarking needed, please see if you can reproduce.
\[This was an intel hledger binary running translated on a macbook m1 via Rosetta translation, ie slower than normal]:

```cli
$ uname -a
Darwin SMs-slate-mac.local 20.6.0 Darwin Kernel Version 20.6.0: Tue Oct 12 18:33:38 PDT 2021; root:xnu-7195.141.8~1/RELEASE_ARM64_T8101 arm64

$ brew info ledger
...
/opt/homebrew/Cellar/ledger/3.2.1_7 (126 files, 4.7MB) *
  Poured from bottle on 2021-11-18 at 16:04:23
...

$ ledger --version
Ledger 3.2.1-20200518, the command-line accounting tool
...

$ hledger-1.24 --version
hledger 1.24-0-gf0f830e06, mac-x86_64

$ cat bench-ledger.sh 
hledger -f examples/10000x1000x10.journal print
hledger -f examples/10000x1000x10.journal register
hledger -f examples/10000x1000x10.journal balance
hledger -f examples/100000x1000x10.journal balance
hledger -f examples/100000x1000x10.journal balance ff

$ quickbench -f bench-ledger.sh -w ledger,hledger-1.24
Running 5 tests 1 times with 2 executables at 2021-12-09 08:50:10 HST:

Best times:
+-----------------------------------------------++--------+--------------+
|                                               || ledger | hledger-1.24 |
+===============================================++========+==============+
| -f examples/10000x1000x10.journal print       ||   7.08 |         0.84 |
| -f examples/10000x1000x10.journal register    ||  18.16 |        16.65 |
| -f examples/10000x1000x10.journal balance     ||   0.38 |         0.80 |
| -f examples/100000x1000x10.journal balance    ||  29.14 |         6.78 |
| -f examples/100000x1000x10.journal balance ff ||   1.13 |         5.89 |
+-----------------------------------------------++--------+--------------+

$ file /opt/homebrew/bin/ledger /Users/simon/src/hledger/bin/hledger-1.24
/opt/homebrew/bin/ledger:                  Mach-O 64-bit executable arm64
/Users/simon/src/hledger/bin/hledger-1.24: Mach-O 64-bit executable x86_64
```

In 2022, hledger compiled natively on a macbook air m1 processes 25k transactions per second (which means reporting on a normal year's worth of transactions takes less than a tenth of a second):

```cli
$ hledger --version
hledger 1.24.99.2-gba5b0e93f-20220205, mac-aarch64
$ make throughput
date: Tue Feb 8 11:03:50 HST 2022
system: Darwin slate.local 21.3.0 Darwin Kernel Version 21.3.0: Wed Jan 5 21:37:58 PST 2022; root:xnu-8019.80.24~20/RELEASE_ARM64_T8101 arm64
executable: hledger
version: hledger 1.24.99.2-gba5b0e93f-20220205, mac-aarch64
  1000 txns: Run time (throughput)    : 0.07s (15308 txns/s)
  2000 txns: Run time (throughput)    : 0.09s (21121 txns/s)
  3000 txns: Run time (throughput)    : 0.13s (23648 txns/s)
  4000 txns: Run time (throughput)    : 0.17s (23226 txns/s)
  5000 txns: Run time (throughput)    : 0.21s (23647 txns/s)
  6000 txns: Run time (throughput)    : 0.24s (24784 txns/s)
  7000 txns: Run time (throughput)    : 0.29s (24166 txns/s)
  8000 txns: Run time (throughput)    : 0.33s (24450 txns/s)
  9000 txns: Run time (throughput)    : 0.35s (25516 txns/s)
 10000 txns: Run time (throughput)    : 0.41s (24226 txns/s)
100000 txns: Run time (throughput)    : 4.32s (23158 txns/s)
Tue Feb  8 11:03:57 HST 2022
```

### Command line interface

- hledger does not require a space between command-line flags and their values,
  eg `-fFILE` works as well as `-f FILE`

- hledger uses `--ignore-assertions`/`-I` to disable balance assertions. 
  Ledger uses `--permissive` for that, and uses `-I` as the short form of `--prices`.

- hledger's `-x`/`--explicit` flag makes print show all amounts;
  Ledger's `--explicit` flag does something else.

- hledger's and Ledger's `-H`/`--historical` flags are unrelated.
  hledger's `-H` makes register and balance-like commands include
  balances from before the report start date, instead of starting at
  zero:

      hledger register --help:
      -H --historical           show historical running total/balance
                                (includes postings before report start date)

      hledger balance --help:
      -H --historical           show historical ending balance in each period
                                (includes postings before report start date)

  Whereas Ledger's `-H` changes the valuation date used by `-V`/`-X`:

      ledger --help:
      --historical (-H)
                                Value commodities at the time of their acquisition.

- hledger's [query language](hledger.html#queries) is a little less
  powerful than Ledger's, simpler, and easier to remember.
  It uses google-like prefixes, such as `desc:`, `payee:`, `amt:`, and `not:`.
  Multiple query terms are combined using fixed AND/OR rules.
  We don't yet support full boolean expressions, so some more advanced
  queries require two invocations of hledger in a pipe, eg: 
  `hledger print QUERY1 | hledger -f- reg QUERY2`

- hledger provides more short flags (`-b`, `-e`, `-p`, `-D`, `-W`, `-M`, `-Q`, `-Y`) and the `date:` query argument for setting report period and interval, and all of these combine nicely.

- hledger cleans up some old [semantic confusion](https://github.com/simonmichael/hledger/issues/564) around what "uncleared" means:

  - hledger renames Ledger's "uncleared" status (ie, when the status field
    is empty) to "unmarked", and the `--uncleared`/`-U` flag to `--unmarked`/`-U`
  - hledger uses `-P` as the short form of `--pending`. Ledger uses `-P` for grouping by payee. 
  - each of hledger's `--unmarked`/`-U`, `--pending`/`-P`, `--cleared`/`-C` flags match only that single status. To match more than one status, the flags can be combined.
     
   So the hledger equivalent of Ledger's `-U` flag ("match uncleared") is `-UP` ("match unmarked or pending").

### Journal format

hledger's journal file format is very similar to Ledger's.
Some syntactic forms 
(eg [hledger comments](hledger.html#file-comments) 
vs [Ledger comments](https://www.ledger-cli.org/3.0/doc/ledger3.html#Commenting-on-your-Journal),
or [balance assertions](hledger.html#assertions-and-ordering))
can be interpreted in slightly different ways.
A small number of Ledger's syntactic forms are ignored (lot notation)
or rejected (value expressions). With some care to restrict yourself to compatible features,
or to keep non-compatible features in separate files,
it's possible to keep a journal file that works with both hledger and Ledger simultaneously.
See also [#1752](https://github.com/simonmichael/hledger/issues/1752).

Here is a detailed list of Ledger's file format features,
from the [Ledger manual](https://www.ledger-cli.org/3.0/doc/ledger3.html) as of 2022-12,
and their status in hledger 1.28, hledger dev, and intended (Yes / Ignored / No).

| Supported in hledger ?                                                                                                                                | 1.28     | dev | Notes                                                                            | Goal |
|-------------------------------------------------------------------------------------------------------------------------------------------------------|----------|-----|:---------------------------------------------------------------------------------|------|
| **Transactions**                                                                                                                                      |          |     |                                                                                  |      |
| [5.1 Basic format](https://www.ledger-cli.org/3.0/doc/ledger3.html#Basic-format)                                                                      | Y        | Y   |                                                                                  |      |
| [5.2 Eliding amounts](https://www.ledger-cli.org/3.0/doc/ledger3.html#Eliding-amounts)                                                                | Y        | Y   |                                                                                  |      |
| [5.3 Auxiliary dates](https://www.ledger-cli.org/3.0/doc/ledger3.html#Auxiliary-dates)                                                                | Y        | Y   |                                                                                  |      |
| [5.4 Codes](https://www.ledger-cli.org/3.0/doc/ledger3.html#Codes)                                                                                    | Y        | Y   |                                                                                  |      |
| [5.5 Transaction state](https://www.ledger-cli.org/3.0/doc/ledger3.html#Transaction-state)                                                            | Y        | Y   |                                                                                  |      |
| [5.6 Transaction notes](https://www.ledger-cli.org/3.0/doc/ledger3.html#Transaction-notes)                                                            | Y        | Y   |                                                                                  |      |
| [5.7 Metadata](https://www.ledger-cli.org/3.0/doc/ledger3.html#Metadata)                                                                              | Y        | Y   |                                                                                  |      |
| [5.7.1 Metadata tags](https://www.ledger-cli.org/3.0/doc/ledger3.html#Metadata-tags)                                                                  | Y        | Y   | format is `TAG1:, TAG2:` not `:TAG1:TAG2:`                                       |      |
| [5.7.1.1 Payee metadata tag](https://www.ledger-cli.org/3.0/doc/ledger3.html#Payee-metadata-tag)                                                      | N        | N   |                                                                                  |      |
| [5.7.2 Metadata values](https://www.ledger-cli.org/3.0/doc/ledger3.html#Metadata-values)                                                              | Y        | Y   | values are terminated by comma, can have multiple tag/values on one line         |      |
| [5.7.3 Typed metadata](https://www.ledger-cli.org/3.0/doc/ledger3.html#Typed-metadata)                                                                | N        | N   | `date:`/`date2:` values are checked as dates, all other tag values are strings   |      |
| [5.8 Virtual postings](https://www.ledger-cli.org/3.0/doc/ledger3.html#Virtual-postings)                                                              | Y        | Y   |                                                                                  |      |
| [5.9 Expression amounts](https://www.ledger-cli.org/3.0/doc/ledger3.html#Expression-amounts)                                                          | N        | N   |                                                                                  |      |
| [5.10 Balance verification](https://www.ledger-cli.org/3.0/doc/ledger3.html#Balance-verification)                                                     | Y        | Y   |                                                                                  |      |
| [5.10.1 Balance assertions](https://www.ledger-cli.org/3.0/doc/ledger3.html#Balance-assertions)                                                       | Y        | Y   |                                                                                  |      |
| [5.10.1.1 Special assertion value 0](https://www.ledger-cli.org/3.0/doc/ledger3.html#Special-assertion-value-0)                                       | Y        | Y   |                                                                                  |      |
| [5.10.2 Balance assignments](https://www.ledger-cli.org/3.0/doc/ledger3.html#Balance-assignments)                                                     | Y        | Y   |                                                                                  |      |
| [5.10.3 Resetting a balance](https://www.ledger-cli.org/3.0/doc/ledger3.html#Resetting-a-balance)                                                     | Y        | Y   |                                                                                  |      |
| [5.10.4 Balancing transactions](https://www.ledger-cli.org/3.0/doc/ledger3.html#Balancing-transactions)                                               | Y        | Y   |                                                                                  |      |
| [5.11 Posting cost](https://www.ledger-cli.org/3.0/doc/ledger3.html#Posting-cost)                                                                     | Y        | Y   |                                                                                  |      |
| [5.12 Explicit posting costs](https://www.ledger-cli.org/3.0/doc/ledger3.html#Explicit-posting-costs)                                                 | Y        | Y   |                                                                                  |      |
| [5.12.1 Primary and secondary commodities](https://www.ledger-cli.org/3.0/doc/ledger3.html#Primary-and-secondary-commodities)                         | N        | N   |                                                                                  |      |
| [5.13 Posting cost expressions](https://www.ledger-cli.org/3.0/doc/ledger3.html#Posting-cost-expressions)                                             | N        | N   |                                                                                  |      |
| [5.14 Total posting costs](https://www.ledger-cli.org/3.0/doc/ledger3.html#Total-posting-costs)                                                       | Y        | Y   |                                                                                  |      |
| [5.15 Virtual posting costs](https://www.ledger-cli.org/3.0/doc/ledger3.html#Virtual-posting-costs)                                                   | I        | I   | the parentheses have no effect                                                   |      |
| [5.16 Commodity prices](https://www.ledger-cli.org/3.0/doc/ledger3.html#Commodity-prices)                                                             | I        | I   | cost basis is not tracked separately from cost                                   | Y    |
| [5.16.1 Total commodity prices](https://www.ledger-cli.org/3.0/doc/ledger3.html#Total-commodity-prices)                                               | I        | I   | Ledger lot notation is ignored, but transactions may fail to balance as a result | Y    |
| [5.17 Prices versus costs](https://www.ledger-cli.org/3.0/doc/ledger3.html#Prices-versus-costs)                                                       | N        | N   |                                                                                  |      |
| [5.18 Fixated prices and costs](https://www.ledger-cli.org/3.0/doc/ledger3.html#Fixated-prices-and-costs)                                             | I        | I   |                                                                                  |      |
| [5.19 Lot dates](https://www.ledger-cli.org/3.0/doc/ledger3.html#Lot-dates)                                                                           | I        | I   |                                                                                  | Y    |
| [5.20 Lot notes](https://www.ledger-cli.org/3.0/doc/ledger3.html#Lot-notes)                                                                           | N        | I   |                                                                                  | Y    |
| [5.21 Lot value expressions](https://www.ledger-cli.org/3.0/doc/ledger3.html#Lot-value-expressions)                                                   | N        | N   |                                                                                  |      |
| [5.22 Automated Transactions](https://www.ledger-cli.org/3.0/doc/ledger3.html#Automated-Transactions)                                                 | Y        | Y   |                                                                                  |      |
| [5.22.1 Amount multipliers](https://www.ledger-cli.org/3.0/doc/ledger3.html#Amount-multipliers)                                                       | Y        | Y   | different syntax                                                                 |      |
| [5.22.2 Accessing the matching posting’s amount](https://www.ledger-cli.org/3.0/doc/ledger3.html#Accessing-the-matching-posting_0027s-amount)         | N        | N   |                                                                                  |      |
| [5.22.3 Referring to the matching posting’s account](https://www.ledger-cli.org/3.0/doc/ledger3.html#Referring-to-the-matching-posting_0027s-account) | N        | N   |                                                                                  |      |
| [5.22.4 Applying metadata to every matched posting](https://www.ledger-cli.org/3.0/doc/ledger3.html#Applying-metadata-to-every-matched-posting)       | Y        | Y   |                                                                                  |      |
| [5.22.5 Applying metadata to the generated posting](https://www.ledger-cli.org/3.0/doc/ledger3.html#Applying-metadata-to-the-generated-posting)       | Y        | Y   |                                                                                  |      |
| [5.22.6 State flags](https://www.ledger-cli.org/3.0/doc/ledger3.html#State-flags)                                                                     | Y        | Y   |                                                                                  |      |
| [5.22.7 Effective Dates](https://www.ledger-cli.org/3.0/doc/ledger3.html#Effective-Dates)                                                             | Y        | Y   | same as Auxiliary Dates                                                          |      |
| [5.22.8 Periodic Transactions](https://www.ledger-cli.org/3.0/doc/ledger3.html#Periodic-Transactions)                                                 | Y        | Y   |                                                                                  |      |
| [((Amount valuation expressions))](https://www.ledger-cli.org/3.0/doc/ledger3.html#Complete-control-over-commodity-pricing)                           | N        | I   |                                                                                  |      |
| **Directives** [link](https://www.ledger-cli.org/3.0/doc/ledger3.html#Command-Directives)                                                             |          |     |                                                                                  |      |
| `P` historical (market) prices                                                                                                                        | Y        | Y   |                                                                                  |      |
| `=` An automated transaction.                                                                                                                         | Y        | Y   |                                                                                  |      |
| `~` A periodic transaction.                                                                                                                           | Y        | Y   | certain period expressions can only start on an interval boundary (fixed in dev) |      |
| `;` `#` `%` `*` &#124; comment lines                                                                                                                  | Y        | Y   | but not `%` or &#124;                                                            |      |
| `!` or `@` as a directive prefix                                                                                                                      | not `@`  | Y   |                                                                                  |      |
| `account` pre-declare account names                                                                                                                   | Y        | Y   |                                                                                  |      |
| `account` subdirectives                                                                                                                               | I        | I   |                                                                                  | I/Y  |
| `apply account` set a default parent account                                                                                                          | Y        | Y   |                                                                                  |      |
| `apply fixed` set fixated prices                                                                                                                      | N        | I   |                                                                                  |      |
| `apply tag` assign a tag to transactions                                                                                                              | N        | I   |                                                                                  |      |
| `alias` rewrite account names                                                                                                                         | Y        | Y   |                                                                                  |      |
| `assert` error if a value expression fails                                                                                                            | N        | I   | use hledger check or hledger-check-fancyassertions                               |      |
| `bucket`/`A` set a default balancing account                                                                                                          | N        | I   |                                                                                  |      |
| `capture` replace accounts matched by regex with another                                                                                              | N        | I   | can be emulated with regex `alias`                                               |      |
| `check` warn if a value expression fails                                                                                                              | N        | I   | use hledger check or hledger-check-fancyassertions                               |      |
| `comment` start multi-line comments                                                                                                                   | Y        | Y   |                                                                                  |      |
| `commodity` pre-declare commodities                                                                                                                   | Y        | Y   |                                                                                  |      |
| `commodity` subdirectives                                                                                                                             | N        | I   | all but `format` are ignored                                                     | I/Y  |
| `define` define value expressions for future use                                                                                                      | N        | I   |                                                                                  |      |
| `end`/`end apply` shorthand for ending most recent apply block                                                                                        | N        | N   |                                                                                  | Y    |
| `end apply account`                                                                                                                                   | Y        | Y   |                                                                                  |      |
| `end apply fixed`                                                                                                                                     | N        | I   |                                                                                  |      |
| `end apply tag`                                                                                                                                       | N        | I   |                                                                                  |      |
| `end apply year`                                                                                                                                      | N        | I   |                                                                                  | Y    |
| `end tag`                                                                                                                                             | N        | I   |                                                                                  |      |
| `eval`/`expr` evaluate a value expression                                                                                                             | N        | I   |                                                                                  |      |
| `include` include another file                                                                                                                        | Y        | Y   |                                                                                  |      |
| `payee` pre-declare payee names                                                                                                                       | Y        | Y   |                                                                                  |      |
| `payee` subdirectives                                                                                                                                 | N        | I   |                                                                                  | I/Y  |
| `python` embed python in journal                                                                                                                      | N        | I   |                                                                                  |      |
| `tag` pre-declare tag names                                                                                                                           | I        | I   |                                                                                  | Y    |
| `tag` subdirectives                                                                                                                                   | N        | I   |                                                                                  |      |
| `test`, a synonym for `comment`                                                                                                                       | N        | N   |                                                                                  |      |
| `value EXPR` set a default valuation function for all commodities                                                                                     | N        | I   |                                                                                  |      |
| `Y`/`year`/`apply year` set the year for year-less dates                                                                                              | only `Y` | Y   |                                                                                  |      |
| `N COMM` ignore pricing information for a commodity                                                                                                   | I        | I   |                                                                                  |      |
| `D AMT` set a default commodity and its format                                                                                                        | Y        | Y   |                                                                                  |      |
| `C AMT1 = AMT2` declare a commodity equivalency                                                                                                       | N        | I   |                                                                                  | I/Y  |
| `I, i, O, o, b, h` timeclock entries in journal                                                                                                       | N        | N   | timeclock data must be in a separate file (can be `include`d)                    |      |
| `--command-line-flags` in journal                                                                                                                     | N        | I   |                                                                                  |      |

### Decoding errors

hledger, like most Haskell programs, exits with a confusing error message
if it sees non-ascii data
and the system locale is not configured to decode UTF-8.
If your data contains non-ascii characters and hledger gives an error
such as "invalid byte sequence", "mkTextEncoding: invalid argument" or similar,
you must [configure your locale](https://hledger.org/install.html#check-your-locale).

### Tabs and spaces

In places which normally require two or more spaces (or tabs),
eg between account name and amount,
ledger will also accept a single tab character. 
But hledger always requires two or more spaces or tabs (ensuring a visually distinct gap).
So you might need to add a space in such cases.

### Decimal mark

In many countries, comma is used as decimal mark.
Without configuration, hledger tries to auto-detect this, to make things just work for everyone.
However, it can misparse numbers containing a single digit group mark and no decimal mark, 
eg parsing `1,000` as 1 when it should be 1000.
If you have such numbers in your data, or if you just want to be certain, you should declare the decimal mark being used.
The best way is to add a `decimal-mark .` or `decimal-mark ,` directive in each data file.
See [Decimal marks, digit group marks](/hledger.html#decimal-marks-digit-group-marks) for more on this.

### Balancing precision

Ledger and hledger can occasionally disagree on whether a transaction is balanced.
In this journal, $'s precision (number of decimal places) is 2 in txn1, 4 in txn2, and 4 globally:

```journal
2022-01-01 txn1
    expenses                                 AAA 989.02 @ $1.123456  ; $1111.12045312
    checking                                  $-1111.12

2022-01-02 txn2
    expenses                                      $0.1234
    checking
```

Ledger checks transaction balancedness using local precisions only,
so it balances with precision 2, and accepts txn1's $-0.00045312 imbalance.

hledger checks transaction balancedness using global precisions,
so it balances with precision 4, and rejects txn1's imbalance.
To read these entries with hledger, you have to limit \$'s global precision,
by adding `-c '\$0.00'` to the command (easiest when piping)
or `commodity $0.00` to the file (more permanent, when creating a new file).

More: [#1964](https://github.com/simonmichael/hledger/issues/1964)

### Balance assertions / assignments

Ledger calculates balance assignments and checks balance assertions simply in the order they were parsed.
hledger calculates balance assignments and checks balance assertions in date order
and then (for postings on the same date) parse order.
This ensures correct, reliable behaviour independent of the ordering of journal entries and files. 

hledger correctly handles multiple balance assignments/assertions within a single transaction.

hledger adds a restriction on balance assignments:
it does not allow balance assignments on accounts affected by auto posting rules
(since in general this can make balancing the journal impossible).

### Directive scope

The region affected by directives, and their behaviour with included files or sibling files,
is sometimes different in hledger. This is to ensure robust, predictable behaviour.
Here are hledger's [Directive effects](dev/hledger.html#directive-effects) and 
[Directives and multiple files](hledger.html#directives-and-multiple-files) behaviour.
You might need to move directives and/or rearrange your files.

### Lot handling

hledger accepts but ignores Ledger-style lot notation
(any of `{LOTUNITCOST}`, `{{LOTTOTALCOST}}`, `{=FIXEDLOTUNITCOST}`, `{{=FIXEDLOTTOTALCOST}}`, `[LOTDATE]`, `(LOTNOTE)` after a posting amount).
This notation currently does not participate in transaction balancing, which prevents reading some Ledger files.
([#1084](https://github.com/simonmichael/hledger/issues/1084))

hledger currently does not track lots automatically, or provide a `--lots` report; 
instead you must track them manually, 
recording cost basis with `@`
and using explicit per-lot subaccounts and gain/loss postings
(see <https://hledger.org/investments.html>).

<!--
hledger does not automatically calculate capital gains when selling
a lot at a different price from its cost basis, as Ledger does.
```journal
; Ledger expects the 5 EUR capital gain income here because selling a 10 EUR lot at 15 EUR.
; hledger does not. Must leave that amount implicit to allow both to parse this.
2019-03-01 Sell
  Assets:Shares           -1 ETF {10 EUR} @ 15 EUR
  Assets:Cash             15 EUR
  Income:Capital Gains   ;-5 EUR
```
-->

### Value expressions

hledger does not support value expressions, Ledger's embedded programming language.
In particular, parenthesised amount expressions like `($10 / 3)` are not supported;
these must be converted to explicit amounts (see ledger eval tip below).

### Periodic transactions

hledger understands most Ledger periodic transactions,
but if you find some variants that are not supported, please report.

hledger 1.28 tends to require periodic transactions to start on a natural period boundary,
unless you use one of [these syntaxes](/1.28/hledger.html#intervals-with-custom-start-date).
This will be fixed in 1.29.

When you do specify a custom start date, hledger will start the transactions on that date.
Ledger seems to always generate them on the period boundaries.

### Other differences

- hledger's input data formats (journal, timeclock, timedot, ...) are separate;
  you can't mix timeclock entries and journal entries in one file as in Ledger.
  (Though a journal file can `include` a timeclock file.)
  This helps implement more useful error messages.
  
- hledger supports international number formats, auto-detecting the
  decimal mark (comma or period), digit group mark (period, comma, or
  space) and digit group sizes to use for each commodity. Or, these can
  be declared explicitly with commodity directives.

- hledger's default commodity directive (D) sets the commodity to be
  used for subsequent commodityless amounts, and also sets that
  commodity's display settings if such an amount is the first
  seen. Ledger uses D only for commodity display settings and for the
  entry command.

- hledger [auto postings](hledger.html#auto-postings) allow only
  minimal customisation of the amount (just multiplying the matched
  amount by a constant), not a full embedded expression language like
  Ledger. (And we call them "auto" to avoid "automatic" vs "automated" confusion.)

- In multi-period reports, hledger expands the report start/end dates
  to span whole periods.

- hledger's print command always shows both the primary transaction date and any secondary date, in their usual positions.
  Ledger's print command with `--aux-date` replaces the primary date with any secondary date.

- hledger always shows time balances (from timeclock or timedot data) in hours.

- hledger always splits multi-day time sessions at midnight, to show the per-day amounts.
  Ledger does this only with the `--day-break` flag.

- hledger's [CSV/TSV/SSV-reading](hledger.html#csv-format) and [import](hledger.html#import) system is more mature and flexible than Ledger's [`convert` command](https://www.ledger-cli.org/3.0/doc/ledger3.html#The-convert-command).

- Ledger can report multiple errors at once; hledger reports only one error at a time.

- Ledger can also output warnings. hledger does not print warnings; it either succeeds or fails.

- hledger will complain if transaction or posting comments contain `date:` or `date2:`
  not followed by a valid [date tag value](/hledger.html#posting-dates).

## Interoperating tips

The core of hledger's and Ledger's journal formats is the same,
so you can use both tools on the same files, 
if you avoid syntax that is specific to one or the other.

However if you are a long-time Ledger user, you will certainly have
Ledger-specific syntax, so for most Ledger users the quickest way 
to tap into hledger reports is some variant of

```
$ ledger print --raw | hledger -f- CMD
```

The print command omits directives.
--raw prevents decimal zeroes being added to amounts and disrupting transaction balancing.
The output may be journal entries readable by hledger.
If so you can do quick reporting like so:

```shell
$ ledger print --raw | hledger -f- check       # check for problems
$ ledger print --raw | hledger -f- stats       # show journal statistics
$ ledger print --raw | hledger -f- is -MAS -2  # summarise monthly revenues/expenses
$ ledger print --raw | hledger -f- web         # view journal in hledger-web WUI
$ hledger-ui -f <(ledger print --raw)          # view journal in hledger-ui TUI (works in bash)
```

Unfortunately, there are two common notations this does not help with:

1. Lot notation, like `-5 AAPL {$50.00} [2012/04/10] (Oh my!) @@ $375.00`.
   hledger will ignore this, but that tends to break transaction balancing.
   We want to improve hledger's support for this.

2. Amount expressions, like `($10 / 3)`.
   Currently the only known workaround is to replace these with explicit values.
   Here is one way: in emacs, select the parenthesised expression and enter `C-u M-| xargs ledger eval`
   (and remove the newline).

A looser kind of setup is to segregate all tool-specific data into
separate tool-specific files, while keeping compatible data in a
shared common file.  Then appropriate files can be selected for a tool
by using multiple `-f` options, or
[include](hledger.html#including-files) directives.

Another way is to do a one-way conversion to hledger format, perhaps periodically,
doing whatever edits and transformations are necessary and feasible.
sed, perl and/or a powerful editor with macros, like Emacs, can be a big help.
Try to automate the steps as a script so you can easily redo the conversion when needed.

## History

I (Simon) discovered John Wiegley's [Ledger](http://ledger-cli.org) in 2006,
and was very happy to find this efficient command-line reporting tool with a transparent data format. Initially, I used it to generate time reports for my job. Before long I wanted some improvements - splitting sessions at day boundaries, reporting in hours, etc.

Meanwhile, John was now busy elsewhere. For a long time the Ledger project remained stalled, with unfixed functionality/documentation bugs and an ever-looming v3 release making life hard for new users and creating friction for community growth.
I did what I could to help - reporting bugs, providing support, contributing a [domain and website](https://ledger-cli.org) - but I didn't want to invest in learning C++.

I was learning and investing time in [Haskell](https://haskell.org), and I felt Ledger could be perhaps implemented well, and perhaps more effectively in the long run, in this language.
I urgently needed a rock solid, hassle-free and enjoyable accounting tool.
Also, I wanted a more active project and some way to make progress on the roadbumps and confusion facing other newcomers.

Of course I tried a little shiny-tech salesmanship on John, but couldn't expect him to start over. (At that time he was deeply in the C++ world; nowadays he is a Haskell expert!)

So in 2007 I began experimenting.
I built a toy parser in a few different languages, and it was easiest in Haskell.
I kept tinkering.
Goals included:

1. to get better at Haskell by building something useful to me
2. to implement at least the basic core of Ledger, adapted for my needs
3. to learn how well Haskell could work for real-world applications

And later:

4. to provide a new highly-compatible implementation of at least the basics of Ledger, useful to others, with a greater focus on ease of use, reliability, documentation and web presence
5. to experiment with new user interfaces, APIs, etc.

Before too long I had a tool that was useful to me. With Ledger still installed,
and by maintaining high compatibility, I now had two implementations which could be compared at times of confusion about functionality or suspected bugs/bookkeeping errors, which was quite valuable.

Later, John returned for a while and finished Ledger version 3, the Ledger project attracted new contributors and maintainers, and incremental improvements resumed. I continued sharing discoveries and design discussions, and we have seen many ideas propagating in both directions. I think having independent but compatible implementations has been
quite helpful for troubleshooting, exploring the design space, and growing the community.
For a while I ran [LedgerTips](http://twitter.com/LedgerTips) on twitter.

hledger shared #ledger's IRC channel until 2014, when I created 
the [#hledger](http://irc.hledger.org) channel (now accessible on Libera IRC and Matrix).

In 2016 I set up https://plaintextaccounting.org as a common entry point and information hub.

The further adventures in hledger's development are not yet told, other than in the commit log, issue tracker and mail list, but other contributors joined the project and [CREDITS](CREDITS.html) notes some of their work.

