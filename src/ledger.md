# hledger and Ledger

<!-- toc -->

## How is hledger different from Ledger ?

### File format differences

hledger's journal file format is very similar to Ledger's.
Some syntactic forms can be interpreted in slightly different ways,
eg [hledger comments](journal.html#comments) 
vs [Ledger comments](https://www.ledger-cli.org/3.0/doc/ledger3.html#Commenting-on-your-Journal),
or [balance assertions](journal.html#assertions-and-ordering).

A small number of Ledger's syntactic forms are ignored (`{ }` prices)
or rejected (value expressions). If you avoid these, it's quite easy
to keep a journal file that works with both hledger and Ledger.

Or, you can keep the hledger- and Ledger-specific bits in separate files,
both [including](journal.html#including-other-files) a common file. Eg:
```shell
$ ls *.journal
common.journal   # included by hledger.journal and ledger.journal
hledger.journal
ledger.journal
$ hledger -f hledger.journal CMD
$ ledger -f ledger.journal CMD
```

hledger's timeclock format is also very similar to Ledger's.
hledger also provides a new timedot format, allowing a different style
of time logging.

### Feature differences

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
Also, Ledger uses less memory and is faster
(partly by providing fewer guarantees, eg its balance assertions/assignments are not date-aware).
This is most noticeable with larger-than-normal files, where it can run ~10x faster.

We currently support Ledger's main features:

- Ledger's journal format, mostly
- csv format
- timeclock format
- regular journal transactions
- multiple commodities
- fixed transaction prices
- varying market prices
- virtual postings
- some basic output formatting
- the print, register & balance commands
- report filtering, using flags and query arguments
- automated postings
- periodic transactions
- budget reports
- valuation
- capital gains reporting

We add some new commands, such as:

- activity
- add
- balancesheet
- cashflow
- check-dates
- check-dupes
- close
- descriptions
- diff
- files
- import
- incomestatement
- irr
- interest
- notes
- prices
- rewrite
- ui
- web

We do not yet support:

- revaluation transactions (`--revalued`)
- reporting lots (`--lots`)
- value expressions

### Functional differences

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

- hledger [period expressions](hledger.html#period-expressions) (up to 1.17) 
  don't understand `until`, use `to` instead.

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

### See also

- <https://github.com/simonmichael/hledger/issues/1752>

## Interoperating

Tips for co-using/converting/switching Ledger and hledger.

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
$ ledger print | hledger -f- check       # check for problems
$ ledger print | hledger -f- stats       # show journal statistics
$ ledger print | hledger -f- is -MAS -2  # summarise monthly revenues/expenses
$ ledger print | hledger -f- web         # view journal in hledger-web WUI
$ hledger-ui -f <(ledger print)          # view journal in hledger-ui TUI (works in bash)
```

