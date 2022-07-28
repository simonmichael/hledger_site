# hledger and Ledger
<div class=pagetoc>

<!-- toc -->
</div>

See also: 
- [Why hledger ?](why.html)
- <https://www.libhunt.com/compare-hledger-vs-ledger>

## Differences

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
- a battle-tested CSV/SSV/TSV system designed for easy bank data import
- and comes with multiple officially-supported user interfaces (CLI, data entry, terminal, web).

Compared to hledger, Ledger has

- assisted lot tracking for investment transactions
- more support for embedding small programs in your data to get custom behaviour 
  (value expressions, maybe python ?)
- ... ?

In the sections below we'll cover some of the known differences in more detail.

### Features

Over time, features have propagated both ways.
Here is a more detailed list (2022, updates welcome):
 
|                                                   | hledger | Ledger |
|---------------------------------------------------|---------|--------|
| **Common features:**                              |         |        |
| journal format                                    | ✅      | ✅     |
| csv format                                        | ✅      | ✅     |
| timeclock format                                  | ✅      | ✅     |
| multiple commodities                              | ✅      | ✅     |
| conversion prices and cost reporting              | ✅      | ✅     |
| market prices and value reporting                 | ✅      | ✅     |
| virtual (unbalanced) postings                     | ✅      | ✅     |
| automated postings                                | ✅      | ✅     |
| periodic transactions                             | ✅      | ✅     |
| budget reporting                                  | ✅      | ✅     |
| capital gains reporting                           | ✅      | ✅     |
| report filtering with flags and query arguments   | ✅      | ✅     |
| basic output format customisation                 | ✅      | ✅     |
| print, register, balance commands                 | ✅      | ✅     |
| **Features in Ledger only:**                      |         |        |
| value expression language                         |         | ✅     |
| automatic revaluation transactions (`--revalued`) |         | ✅     |
| lot reporting (`--lots`)                          |         | ✅     |
| **Features in hledger only:**                     |         |        |
| timedot format                                    | ✅      |        |
| multi-period balance reports                      | ✅      |        |
| account types                                     | ✅      |        |
| activity command                                  | ✅      |        |
| add command                                       | ✅      |        |
| balancesheet command                              | ✅      |        |
| cashflow command                                  | ✅      |        |
| check command                                     | ✅      |        |
| close command                                     | ✅      |        |
| descriptions command                              | ✅      |        |
| diff command                                      | ✅      |        |
| files command                                     | ✅      |        |
| iadd command                                      | ✅      |        |
| import command                                    | ✅      |        |
| incomestatement command                           | ✅      |        |
| irr command                                       | ✅      |        |
| interest command                                  | ✅      |        |
| notes command                                     | ✅      |        |
| prices command                                    | ✅      |        |
| rewrite command                                   | ✅      |        |
| ui command                                        | ✅      |        |
| web command                                       | ✅      |        |

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

### Commands

- hledger's print command always shows both the primary transaction date and any secondary date, in their usual positions.
  Ledger's print command with `--aux-date` replaces the primary date with any secondary date.

- hledger's [CSV/TSV/SSV-reading](hledger.html#csv-format) and [import](hledger.html#import) system is more mature and flexible than Ledger's [`convert` command](https://www.ledger-cli.org/3.0/doc/ledger3.html#The-convert-command).

### Journal format

hledger's journal file format is very similar to Ledger's.
Some syntactic forms 
(eg [hledger comments](journal.html#comments) 
vs [Ledger comments](https://www.ledger-cli.org/3.0/doc/ledger3.html#Commenting-on-your-Journal),
or [balance assertions](journal.html#assertions-and-ordering))
can be interpreted in slightly different ways.
A small number of Ledger's syntactic forms are ignored (`{ }` prices)
or rejected (value expressions). With some care, it's quite easy
to keep a journal file that works with both hledger and Ledger.
See also [#1752](https://github.com/simonmichael/hledger/issues/1752).

- hledger's input data formats (journal, timeclock, timedot, ...) are separate; you can't 
  mix them all in one file as in Ledger.
  (You can still combine them in one report, by reading from multiple files.)
  This simplifies implementation and helps ensure useful error messages.
  
- hledger supports international number formats, auto-detecting the
  decimal mark (comma or period), digit group mark (period, comma, or
  space) and digit group sizes to use for each commodity. Or, these can
  be declared explicitly with commodity directives.

- hledger applies [balance assignments](journal.html#balance-assignments) 
  and checks [balance assertions](journal.html#balance-assertions)
  in date order (and then by parse order, for postings on the same date).
  This ensures correct, deterministic behaviour, independent of the ordering of
  journal entries and files. 
  Ledger checks assertions in the order they are parsed (ignoring dates), which is fragile.

- hledger correctly handles multiple balance assignments/assertions within a single transaction.

- hledger's default commodity directive (D) sets the commodity to be
  used for subsequent commodityless amounts, and also sets that
  commodity's display settings if such an amount is the first
  seen. Ledger uses D only for commodity display settings and for the
  entry command.

- hledger accepts Ledger's virtual posting cost syntax  (`(@)`, `(@@)`), but ignores the parentheses.

- hledger accepts but ignores Ledger-style lot prices and lot dates
  (`{PRICE}`, `{{PRICE}}`, `{=PRICE}`, `{{=PRICE}}` and/or `[DATE]`,
  after the posting amount and before any balance assertion). 
  ([#1084](https://github.com/simonmichael/hledger/issues/1084))
  
- hledger does not automatically calculate capital gains
  when balancing a transaction selling a lot at a different price from
  its cost basis, as Ledger does. Eg:
  ```journal
  ; Ledger expects the 5 EUR capital gain income here because selling a 10 EUR lot at 15 EUR.
  ; hledger does not. Must leave that amount implicit to allow both to parse this.
  2019-03-01 Sell
    Assets:Shares           -1 ETF {10 EUR} @ 15 EUR
    Assets:Cash             15 EUR
    Income:Capital Gains   ;-5 EUR
  ```

- hledger does not currently support Ledger's `--lots` reporting.

- hledger [auto postings](hledger.html#auto-postings) allow only
  minimal customisation of the amount (just multiplying the matched
  amount by a constant), not a full embedded expression language like
  Ledger. (And we call them "auto" to avoid "automatic" vs "automated" confusion.)

### Timeclock format

- hledger always shows time balances (from timeclock or timedot data) in hours.

- hledger always splits multi-day time sessions at midnight, to show the per-day amounts.
  Ledger does this only with the `--day-break` flag.

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

## Interoperating

Tips for co-using/converting/migrating between Ledger and hledger.

Ledger's and hledger's journal formats are the same at the core,
so you can continue using both tools on the same files, 
if you are careful to avoid syntax that is specific to one or the other.

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
$ ledger print | hledger -f- check       # check for problems
$ ledger print | hledger -f- stats       # show journal statistics
$ ledger print | hledger -f- is -MAS -2  # summarise monthly revenues/expenses
$ ledger print | hledger -f- web         # view journal in hledger-web WUI
$ hledger-ui -f <(ledger print)          # view journal in hledger-ui TUI (works in bash)
```

Unfortunately, `ledger print` does not evaluate Ledger's value expressions.

A more powerful approach is to keep hledger- and Ledger-specific data in separate files,
which [include](journal.html#including-other-files) a shared common file containing all the
compatible data. Eg:
```shell
$ ls *.journal
common.journal   # included by hledger.journal and ledger.journal
hledger.journal
ledger.journal
$ hledger -f hledger.journal CMD
$ ledger -f ledger.journal CMD
```
