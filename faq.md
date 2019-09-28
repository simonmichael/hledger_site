# FAQ

## What can hledger do for me ?

hledger is a suite of reporting tools which can provide clarity and
insight into your personal or business finances, time logs, or other
dated quantitative data, with relatively little effort on your part.

You need only provide a list of transactions, as a plain text file in
a simple human-readable format. (Or a time log, or a CSV file with
conversion rules.) From this hledger can generate a variety of useful
reports and interactive views:

- list your transactions, payees, currencies/commodities, accounts, statistics
- show the hierarchy of accounts and subaccounts
- show the transactions affecting any account, and calculate its running balance
- make a balance sheet, showing your asset and liability account balances
- make a cashflow report, showing changes in your cash assets
- make an income statement, showing your revenues and expenses
- show a bar chart of transaction activity by period
- show purchase costs/selling prices
- show market values in any currency at any valuation date
- calculate the rate of return of a savings account or investment
- make reports from timeclock or timedot time logs
- make reports from any CSV file

It can slice, dice, and present your data in different ways:

- filter out just the items or time period you're interested in
- show multiple periods side by side
- summarise accounts to give the big picture
- rewrite or pivot account names to give different views
- output reports as plain text, HTML, or CSV
- run as a live-updating terminal UI, for fast interactive exploration
- run as a web app, allowing remote/multi-user browsing and data entry
- run as a JSON web API, for integrating with custom apps

If you add a few directives to the file, hledger can:

- include multiple data sets
- generate recurring transactions by rule
- add extra postings (splits) to transactions by rule
- show a forecast of future activity, eg to help with cashflow planning
- make a budget report, showing your budget goals and status by account and period

Also, it can:

- generate interest transactions by rule
- help you enter new transactions with prompts or a terminal UI
- help you convert and import new transactions from external sources, eg banks
- be used as a library in a quick Haskell script or compiled program

## How could that help me ?

- More clarity, transparency and accountability, for yourself or others
- Know what you owe, or who owes you
- Know where the money went; steer your spending
- Know how you spent your time; easy client invoicing
- More foresight and ability to plan; avoid overdrafts, late fees, cashflow crunches
- Know all the numbers you need for tax reporting; know how much to save for estimated taxes
- Less stress, fear or overwhelm
- More satisfaction, empowerment, and prosperity!

## Isn't manual data entry a pain ?

- Not if you spend a few minutes every day.
- Not if the benefits are worth it to you.
- Not if you use a comfortable editor and copy/paste a lot.
- Not if you use tools to help (editor modes, hledger add, hledger-iadd, hledger-web..)
- Not if you use rules to generate your recurring transactions.

## Isn't importing from banks a pain ?

Not once you have set up a manual or automated routine for it.
The possibilities vary by bank and country, but here are two simple
workflows that are almost always possible:

Manual CSV import:

1. Manually download CSV from your bank's website.
2. hledger import BANK.csv
3. Review/clean up the new journal entries.

Automated CSV import:

1. Review/clean up the new journal entries. (CSV was downloaded and imported overnight by a cron job.)

Ask us for help setting this up. See also [How could I import/migrate from...](#how-could-i-import-migrate-from).

## Isn't plain text ugly and hard to use ?

No way, it's great, honest.
We love it.
You'll love it.
It's fast.
It's cheap.
It's non-distracting.
It keeps you focussed on the content.
It's copy-pasteable.
It's accessible to screen readers.
It's resizable.
You can pick the font and colours.
You do not need "Plaintext Reader, Trial Version" to read it.
you do not need "Plaintext Studio Pro" to write it.
You can use your favorite editor and skills you already have. 
You can search in it! 
You can version control it. 
It works well over remote/slow connections.
It's future-proof.
It will be just as usable in 15 or 50 years.
You can still read it even without the right software or (if you print it) a working computer.

*Accounting data is valuable; we want to know that it will be
accessible for ever - even without software. We want to know when it
changes, and revision-control it. We want to search and manipulate it
efficiently. So, we store it as human-readable plain text.*
--<http://plaintextaccounting.org>

## Isn't this too weird for my family, business partners, tax accountant to use ?

Maybe. You can ask them to enter data via hledger-web, 
or import from their mobile expenses app or a shared spreadsheet.
You can show them the hledger-web UI, or HTML reports, or give them CSV to open in a spreadsheet.

## Why did you start hledger ? How does it relate to Ledger ?

I ([Simon Michael](http://joyful.com)) discovered John Wiegley's [Ledger](http://ledger-cli.org) in 2006,
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
[#hledger](irc://irc.freenode.net/#hledger) to allow us more space.

I think having independent but compatible implementations has been
quite helpful for troubleshooting, exploring the design space, and
growing the "Ledger-likes" community.
My other projects in that direction include
the [ledger-cli.org](http://ledger-cli.org) site,
[LedgerTips](http://twitter.com/LedgerTips),
IRC support on #ledger,
and now [plaintextaccounting.org](http://plaintextaccounting.org).

## How is hledger different from Ledger ?

### Feature differences ?

Compared to Ledger, hledger builds quickly and has a complete and
accurate manual, an easier report query syntax, multi-column balance
reports, better depth limiting, an interactive data entry assistant,
and optional web and terminal interfaces.

Compared to hledger, Ledger has additional power-user features such as
the built in value expressions language, 
and it remains faster and more memory efficient on large files (for now).

We currently support:

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
- report filtering, using a different query syntax
- automated postings
- periodic transactions
- budget reports
- -X/--exchange

We do not yet support:

- generation of revaluation transactions (--revalued)
- capital gain/loss reporting (--gain)
- value expressions

And we add some new commands, such as:

- add
- balancesheet
- cashflow
- close
- incomestatement
- irr
- interest
- ui
- web

### File format differences ?

hledger's journal file format is very close to Ledger's.
Some unsupported Ledger syntax is parsed but ignored; some is not parsed and will cause an error (eg value expressions).
There can also be subtle differences in parser behaviour, such as with
[hledger comments](journal.html#comments) vs [Ledger comments](http://ledger-cli.org/3.0/doc/ledger3.html#Commenting-on-your-Journal),
or [balance assertions](journal.html#assertions-and-ordering).

It's quite possible (and useful) to keep a journal file that works
with both hledger and Ledger, if you avoid the more exotic syntax. Or,
you can keep the hledger- and Ledger-specific bits in separate files,
which [include](journal.html#including-other-files)
a common file compatible with both:
```shell
$ ls *.journal
common.journal   # included by:
hledger.journal
ledger.journal
```

### Functional differences ?

- hledger recognises description and negative patterns by "desc:"
  and "not:" prefixes, unlike Ledger 3's free-form parser

- hledger does not require a space between command-line flags and their values,
  eg `-fFILE` works as well as `-f FILE`

- hledger's weekly reporting intervals always start on mondays

- hledger shows start and end dates of the intervals requested,
  not just the span containing data

- hledger always shows time balances (from the timeclock/timedot formats) in hours

- hledger splits multi-day time sessions at midnight by default (Ledger does this with an option)

- hledger's output follows the decimal mark, digit grouping, and digit
  group mark used in the journal (or specified with commodity
  directives)

- hledger print ignores the --date2 flag, always showing both dates.
  ledger print shows only the secondary date with --aux-date, but not
  vice versa.

- hledger's default commodity directive (D) sets the commodity to be
  used for subsequent commodityless amounts, and also sets that
  commodity's display settings if such an amount is the first
  seen. Ledger uses D only for commodity display settings and for the
  entry command.

- hledger's [include directive](journal.html#including-other-files) does not support
  shell glob patterns (eg `include *.journal` ), as Ledger's does.

- when checking [balance assertions](journal.html#balance-assertions)
  hledger sorts the account's postings first by date and then (for
  postings with the same date) by parse order. Ledger checks assertions 
  in parse order, ignoring dates.

- Ledger allows amounts to have a fixed lot price (the {} syntax ?)
  and a regular price in any order (and uses whichever appears
  first). hledger requires the fixed lot price to come last (and
  ignores it).

- hledger uses --ignore-assertions/-I to disable balance assertions. 
  Ledger uses --permissive, and -I means something else (--prices).  

- hledger's -p option doesn't combine nicely with -b/-e/-D/-W/-M/-Q/-Y.
  Basically if there's a -p, all those others are ignored.
  There's an open issue.
  With hledger you can also specify start and/or end dates with a query argument,
  like date:START-END

- in hledger version 1.3 onward, 
  the "uncleared" status has been renamed to "unmarked",
  it is matched by the -U/--unmarked flag.
  Also, the --unmarked/--pending/--cleared flags can be combined,
  so eg -UP matches unmarked and pending, similar to Ledger's --uncleared flag.
  (#564)

- hledger's -P flag is short for --pending. Ledger uses it for grouping by payee. 

- hledger's journal and timeclock formats are separate; you can't use 
  [both syntaxes in the same file](https://www.reddit.com/r/plaintextaccounting/comments/7buf8q/how_to_balance_working_hours/dpligsd/)
  unlike Ledger. ([Include](journal.html#including-other-files) a separate timeclock file instead.) 
  
- hledger's and Ledger's -H/--historical flags are completely unrelated.
  hledger's -H makes register and balance-like commands include balances from before the report start date, instead of starting at zero:

      hledger register --help:
      -H --historical           show historical running total/balance
                                (includes postings before report start date)

      hledger balance --help:
      -H --historical           show historical ending balance in each period
                                (includes postings before report start date)

  Ledger's -H changes the valuation date used by -V/-X:

      ledger --help:
      --historical (-H)
                                Value commodities at the time of their acquisition.

## What was ledger4 ?

[ledger4](https://github.com/ledger/ledger4) was John's 2012 start
at rewriting parts of Ledger 3, eg the parser, in Haskell.
We included this in hledger for a while, 
hoping to attract contributions to improve this "bridge" between the projects,
and improve our support for reading Ledger's files.
Neither happened, so it was removed again.

## How could I import/migrate from...

Some quick/rough migration recipes:

### Mint.com ?

1. download [examples/csv/mint.csv.rules](https://github.com/simonmichael/hledger/blob/master/examples/csv/mint.csv.rules), and adjust the `account1` & `account2` rules
2. `touch ~/.hledger.journal`
3. log in to Mint, go to TRANSACTIONS, scroll to the bottom of the page, click on the "Export all N transactions" link, save it as `mint.csv` on your computer
4. `cd ~/Downloads` (or wherever you saved it)
5. `hledger import mint.csv`

Now `hledger stats` and `hledger bal` should show lots of data. That's your past data migrated. 

Then, if you want to leave Mint, you'll need to replace their automatic
import from banks with 
[your own import process](#isn-t-importing-from-banks-a-pain).

Or if you want to keep using Mint for that, because you like how they
aggregate and clean the data: just periodically re-export from Mint,
repeating steps 3-5 above.


## Why does this entry give a "no amount" error even though I wrote an amount ?

```journal
2019-01-01
  a 1
  b
```
Because there's only a single space between `a` and `1`,
so this is parsed as an account named <span style="white-space:nowrap;">"a 1"</span>, with no amount.
There must be at least two spaces between account name and amount.


## Why do some directives not affect other files ? Why can't I put account aliases in an included file ?

This is documented at [journal format: directives](journal.html#directives).
(Also mentioned at [hledger: Input files](hledger.html#input-files).)
These docs could be improved.

Directives which affect parsing of data vary in their scope, 
ie the area of input data they affect. Eg, should they affect: 

- entries after the directive, in this file only ? 
  - Eg: 
    `alias`, 
    `apply account`, 
    `comment`, 
    `Y`
- entries before and after the directive, in this file only ?
- entries and included files after the directive, until this file's end ?
- all entries after the directive, in this and all included or subsequent files, including parent files ?
  - Eg: 
    the number notation specified by `D`
    or `commodity`
- all entries in all files ?
  - Eg: 
    the default commodity specified by `D`,
    and `account`

The differences are partly due to historical accident, and partly by design.
We would like to preserve these properties:

- Reordering files does not change their meaning.
- Adding a file does not change the meaning of the other files.

This is why some directives are designed to last only until the end of the current file.
This can be annoying, but it seems worthwhile to ensure reports are
robust, and not changed by simply moving `include` directives or `-f`
options around.

For `alias` directives, when you have multiple files, the workaround
is to put them inline in a top-level file, before including the other
files that the aliases should affect.
See [#1007](https://github.com/simonmichael/hledger/issues/1007).

See also:
[#510](https://github.com/simonmichael/hledger/issues/510),
[#217](https://github.com/simonmichael/hledger/issues/217)

## Why am I seeing some amounts without an account name in reports ?

Some of hledger's older commands (balance, print, register) show a
multi-commodity amount with each commodity on its own line, by default
(like Ledger).

Here are some examples. 
In the following journal entry, the implicit balancing amount drawn from the `b` account will be a multicommodity amount (a euro and a dollar):
```journal
2015/1/1
    a         EUR 1
    a         USD 1
    b
```
the `print` command shows the `b` posting's amount on two lines, bottom-aligned:
```shell
$ hledger -f t.j print
2015/01/01
    a         USD 1
    a         EUR 1
             EUR -1  ; <-
    b        USD -1  ; <- a euro and a dollar is drawn from b
```
the `balance` command shows that both `a` and `b` have a multi-commodity balance (again, bottom-aligned):
```shell
$ hledger -f t.j balance
               EUR 1     ; <-
               USD 1  a  ; <- a's balance is a euro and a dollar
              EUR -1     ; <-
              USD -1  b  ; <- b's balance is a negative euro and dollar
--------------------
                   0
```
while the `register` command shows (top-aligned, this time!) a multi-commodity running total after the second posting,
and a multi-commodity amount in the third posting:
```shell
$ hledger -f t.j register --width 50
2015/01/01       a             EUR 1         EUR 1
                 a             USD 1         EUR 1  ; <- the running total is now a euro and a dollar        
                                             USD 1  ;                                                        
                 b            EUR -1                ; <- the amount posted to b is a negative euro and dollar
                              USD -1             0  ;
```

Newer reports like [multi-column balance reports](hledger.html#multicolumn-balance-report) show multi-commodity amounts on one line instead, comma-separated.
Although wider, this seems clearer and we should probably use it more:
```shell
$ hledger -f t.j balance --yearly
Balance changes in 2015:

   ||           2015 
===++================
 a ||   EUR 1, USD 1 
 b || EUR -1, USD -1 
---++----------------
   ||              0 
```

You will also see amounts without a corresponding account name if you
remove too many account name segments with [`--drop`](hledger.html#balance)
(a bug, which we'd like to see fixed):
```shell
$ hledger -f t.j balance --drop 1
               EUR 1  
               USD 1  
              EUR -1  
              USD -1  
--------------------
                   0
```


## With hledger-ui in iTerm2/3, why does Shift-Up/Shift-Down move the cursor instead of adjusting the period ?

One way to fix: in iTerm2 do Preferences -> Profiles -> your current profile -> Keys -> Load Preset -> xterm Defaults 
(not Terminal.app Compatibility). And perhaps open a new tab with this profile. 
