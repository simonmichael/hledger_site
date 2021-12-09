# hledger and Ledger

<div class=pagetoc>
<!-- toc -->
</div>

See also: 
[Why hledger ?](why.html)

## History

**Why did you start hledger ? How does it relate to Ledger ?**

I discovered John Wiegley's [Ledger](http://ledger-cli.org) in 2006,
and was very happy to find this efficient command-line reporting tool with a transparent data format.

Initially, I used it to generate time reports for my job.
Before long I wanted that to work differently - splitting sessions at day boundaries, reporting in hours, etc.
John had got busy elsewhere and the Ledger project now stalled, with unfixed bugs, wrong documentation and a confusing release situation persisting for a long time.
I did what I could to help build momentum, reporting bugs, supporting newcomers, and contributing a new domain and website.
But, I didn't want to spend time learning C++.

I was learning Haskell, which I did want to spend time in.
I felt Ledger could be implemented well and, in the long run, more efficiently in that language,
which has some compelling advantages such as lower maintenance costs.
I urgently needed a reliable accounting tool that I enjoyed using.
I also wanted to see what I could do to reduce roadbumps and confusion for newcomers.

I couldn't expect John to start over - at that time he was not the Haskell fan he is now!
So in 2007 I began experimenting.
I built a toy parser in a few different languages, and it was easiest in Haskell.
I kept tinkering.
Goals included:

- to get better at Haskell by building something useful to me,
- to learn how well Haskell could work for real-world applications,
- and eventually: to provide a new implementation focussing more on
  ease of use, absence of user-visible bugs, and high-quality documentation and web presence.
  Also to experiment with new user interfaces, APIs, etc.

Before too long I had a tool that was useful to me. With Ledger still installed,
and by maintaining high compatibility, I now had two tools  with different strengths,
each providing a comparison for the other in case of confusion or suspected bugs,
which was itself quite valuable.

The Ledger project later revived and has attracted new active contributors.
I have remained active in that community, sharing discoveries and
design discussions, and we have seen many ideas travelling in both directions.
hledger shared #ledger's IRC channel until 2014, when I added
[#hledger](http://irc.hledger.org) to allow us more space.

I think having independent but compatible implementations has been
quite helpful for troubleshooting, exploring the design space, and
growing the "Ledger-likes" community.
My other projects in that direction include
the [ledger-cli.org](http://ledger-cli.org) site,
[LedgerTips](http://twitter.com/LedgerTips),
IRC support on #ledger,
and now [plaintextaccounting.org](http://plaintextaccounting.org).

## Differences

**How is hledger different from Ledger ?**

Here are the highest-order differences, which lead to the others: 

- hledger is actively maintained (since 2008).
- hledger has a strong focus on usability, real-world utility, reliability and complete documentation.
- hledger tries to provide Ledger's (and others') best features at a higher level of quality (cleaner UX, more consistency, fewer bugs).
- hledger is written in the Haskell programming language, which is well suited to long-term maintainability and correctness.

Compared to Ledger, hledger builds quickly and has a complete and
accurate manual, an easier report query syntax, multi-column balance
reports, much better depth limiting, an interactive data entry
assistant, and optional web and terminal interfaces. hledger provides
a different system for converting CSV data, with rules files and
new-transaction detection which simplify the task of importing new
data from banks.

Compared to hledger, Ledger has some additional power-user features such as 
the embedded value expressions language, 
and some extra automation for tracking lots.

### Features

Here is an overview of the general differences (updates welcome):
 
|                                                   | hledger | Ledger |
|---------------------------------------------------|---------|--------|
| **hledger/Ledger common features**                |         |        |
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
| **Features in Ledger only**                       |         |        |
| value expression language                         |         | ✅     |
| automatic revaluation transactions (`--revalued`) |         | ✅     |
| lot reporting (`--lots`)                          |         | ✅     |
| **Features in hledger only**                      |         |        |
| timedot format                                    | ✅      |        |
| multi-period reports                              | ✅      |        |
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

```shell
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
```

### Data formats

hledger's journal file format is very similar to Ledger's.
Some syntactic forms can be interpreted in slightly different ways,
eg [hledger comments](journal.html#comments) 
vs [Ledger comments](https://www.ledger-cli.org/3.0/doc/ledger3.html#Commenting-on-your-Journal),
or [balance assertions](journal.html#assertions-and-ordering).

A small number of Ledger's syntactic forms are ignored (`{ }` prices)
or rejected (value expressions). If you avoid these, it's quite easy
to keep a journal file that works with both hledger and Ledger (see below).

hledger's timeclock format is also very similar to Ledger's.
hledger also provides a new timedot format, allowing a different style
of time logging.

Both hledger and Ledger can read CSV files; they each have their own system for 
defining conversion rules.

### Functional differences

Here is a more detailed list of differences in behaviour
(see also:
[#1752](https://github.com/simonmichael/hledger/issues/1752)
):

#### Command line interface

- hledger does not require a space between command-line flags and their values,
  eg `-fFILE` works as well as `-f FILE`

- hledger's `-b`, `-e`, `-D`, `-W`, `-M`, `-Q`, `-Y` and `-p` options combine nicely.
  You can also specify start and/or end dates with a query argument,
  eg `date:START-` or `date:START-END`.

- hledger's [query language](hledger.html#queries) is a little less
  powerful than Ledger's, simpler, and easier to remember.
  It uses google-like prefixes, eg `desc:`, `payee:`, `amt:`, `not:`.
  Multiple patterns are combined using fixed AND/OR rules.
  We don't yet support full boolean expressions, so some more advanced
  queries require two invocations of hledger in a pipe, eg: 
  `hledger print QUERY1 | hledger -f- reg QUERY2`

- hledger uses `--ignore-assertions`/`-I` to disable balance assertions. 
  Ledger uses `--permissive` for that, and uses `-I` as the short form of `--prices`.

- hledger cleans up some semantic confusion with status matching (#564):

  - hledger uses `-P` as the short form of `--pending`. Ledger uses it for grouping by payee. 
  - hledger renames Ledger's "uncleared" status (ie, when the status field
    is empty) to "unmarked", and the `--uncleared`/`-U` flag to `--unmarked`/`-U`
  - each of hledger's `--unmarked`/`-U`, `--pending`/`-P`, `--cleared`/`-C` flags match only that single status.
    To match more than one status, the flags can be combined.
    So the hledger equivalent of `ledger print -U` (ie: match all but
    cleared transactions) is `hledger print -UP`.

- hledger print shows both the primary date and the secondary date if any, always.
  ledger print shows both by default, but with `--aux-date` it hides the primary date.

- hledger's and Ledger's `-H`/`--historical` flags are unrelated:

  hledger's `-H` makes register and balance-like commands include
  balances from before the report start date, instead of starting at
  zero:

      hledger register --help:
      -H --historical           show historical running total/balance
                                (includes postings before report start date)

      hledger balance --help:
      -H --historical           show historical ending balance in each period
                                (includes postings before report start date)

  Ledger's `-H` changes the valuation date used by `-V`/`-X`:

      ledger --help:
      --historical (-H)
                                Value commodities at the time of their acquisition.

- hledger's `-x`/`--explicit` flag (makes print show all amounts) 
  and Ledger's `--explicit` flag (does something else) are unrelated.

#### journal format

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

  Also, hledger correctly handles multiple balance assignments/assertions in a single transaction.

- hledger's default commodity directive (D) sets the commodity to be
  used for subsequent commodityless amounts, and also sets that
  commodity's display settings if such an amount is the first
  seen. Ledger uses D only for commodity display settings and for the
  entry command.

- hledger up to 1.17.1 does not accept Ledger's virtual posting cost syntax (`(@)`, `(@@)`).
  hledger 1.17.99+ accepts it, and ignores the parentheses.

- hledger up to 1.17.1 does not accept Ledger's lot price or lot date syntax except
  in very limited circumstances (`{= }` at the end of the posting line).
  hledger 1.17.99+ accepts, but ignores, Ledger-style lot prices
  (`{PRICE}`, `{{PRICE}}`, `{=PRICE}`, `{{=PRICE}}`) and/or lot dates
  (`[DATE]`), after the posting amount and before the balance assertion if any.
  ([#1084](https://github.com/simonmichael/hledger/issues/1084))
  Relatedly, hledger will not automatically calculate capital gains
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

- hledger does not support Ledger's --lots reporting.

- hledger [auto postings](hledger.html#auto-postings) allow only
  minimal customisation of the amount (just multiplying the matched
  amount by a constant), not a full embedded expression language like
  Ledger.

#### timeclock & timedot formats

- hledger's journal, timeclock and timedot formats are separate; you can't 
  mix them all in one file as in Ledger.
  (Though you can specify all files on the command line, or have a parent journal file include them all.)
  This simplifies the implementation and helps ensure useful parse error messages.
  
- hledger always shows time balances (from the timeclock/timedot formats) in hours

#### timeclock format

- hledger always splits multi-day time sessions at midnight, showing accurate per-day amounts.
  Ledger does this only with the `--day-break` flag.

## Interoperating

Tips for co-using/converting/switching Ledger and hledger.

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
