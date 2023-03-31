# Frequently Asked Questions

<!--
<div align=center>

  FAQ
| [Developer FAQ](devfaq.html)

</div>
-->

<!-- toc -->

Welcome! If you'd like to help improve these FAQs we'd sure appreciate it. 
Click the "edit this page" link at the bottom, or [chat](support) with us.

## Plain Text Accounting

### What's accounting ?

[Accounting](https://en.wikipedia.org/wiki/Accounting) means keeping track of the flow and whereabouts of things you value, 
such as money or time, and using this information for insight, planning and decision-making.
Here's hledger's [Accounting concepts](accounting.html) page
and [Accounting links](accounting.html#accounting-links).

### Why might I want to do accounting ?

For clarity, control, planning, accountability, compliance, tax reporting, tax audits. 
It clarifies activity, priorities, obligations, opportunities.

### What's double-entry accounting ?

[Double-entry bookkeeping](https://en.wikipedia.org/wiki/Double-entry_bookkeeping) is the traditional method for keeping accounting records reliably. 
For every movement of value (a transaction), both the source and destination are recorded.
These are labelled "Credit" and "Debit", to minimise working with negative numbers.
Simple arithmetic invariants help prevent errors.

### What's plain text accounting ?

Plain Text Accounting, or PTA, is a modern way of doing double entry accounting on a computer:
- It uses simple text files and "small" tools rather than databases and big applications.
- It substitutes minus and plus signs for Credit and Debit notation (usually), which many people find easier.
- It makes financial data easy to [version-control](https://en.wikipedia.org/wiki/Version_control), audit, and collaborate on.
- It is flexible, programmable, portable, durable, and private.

You can read more about it at <https://plaintextaccounting.org>.
Currently this FAQ overlaps a bit with that one.

## hledger and PTA

### What's hledger ?

One of the best tools for doing Plain Text Accounting.
It's free and you can read all about it at the <https://hledger.org> home page.

### Why was hledger created ?

- to provide a more usable, robust, documented, cross-platform-installable version of the Ledger accounting tool for users
- to provide a more maintainable and hackable version of Ledger for developers 
- to provide a useful library and toolbox for finance-minded haskell programmers
- to explore the suitability of Haskell for such applications
- to experiment with building a successful time-and-money-solvent project in a thriving ecosystem of financial software projects

### What is the hledger project's current mission ?

1. Bring relief and peace of mind to people managing money, 
   especially the overwhelmed, stressed and confused,
   by providing highly dependable, usable accounting tools, learning materials, and community.

2. Help people and communities in all countries
   increase their financial clarity, accountability, and mastery.

### We use another system, we don't need this ?

Every tool has strengths and weaknesses. 
hledger is lightweight, flexible and relatively easy to glue into other systems; 
it might be worth exploring as a complementary tool.

### How do you collaborate with accountants and the non-PTA world ?

Depending on their needs, you send them a few standard reports (balance sheet, income statement, itemized account registers or a full transaction journal)

- as plain text (optionally spruced up with your own templates)
- or as HTML
- or as PDF
- or as CSV they can import into Excel and elsewhere

### Must I enter data in a text editor ??

No. A good text editor can be a very efficient way to work on your data, but there are other ways:

- use a terminal-based data entry tool like hledger add or hledger-iadd
- use a web-based data entry tool like hledger-web
- use a phone-based data entry app like MoLe
- import CSV data, avoiding manual data entry.

### What account names do I use? Why isn't a default list provided ?

Any standard set of account names you're familiar with. Feel free to copy list from any other software. A default list is a good idea, but right now we don't really provide one because

- hledger aims to be useful for many needs and in many languages, so a single list won't do
- we are not that large and organised yet
- no-one has stepped up and worked on it.

### What can hledger do for me ?

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

### How could that help me ?

- More clarity, transparency and accountability, for yourself or others
- Know what you owe, or who owes you
- Know where the money went; steer your spending
- Know how you spent your time; easy client invoicing
- More foresight and ability to plan; avoid overdrafts, late fees, cashflow crunches
- Know all the numbers you need for tax reporting; know how much to save for estimated taxes
- Less stress, fear or overwhelm
- More satisfaction, empowerment, and prosperity!

### Isn't manual data entry a pain ?

- Not if you spend a few minutes every day.
- Not if the benefits are worth it to you.
- Not if you use a comfortable editor and copy/paste a lot.
- Not if you use tools to help (editor modes, hledger add, hledger-iadd, hledger-web..)
- Not if you use rules to generate your recurring transactions.

### Isn't importing from banks a pain ?

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

### Isn't plain text ugly and hard to use ?

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

### Isn't this too weird for my family, business partners, tax accountant to use ?

Maybe. You can ask them to enter data via hledger-web, 
or import from their mobile expenses app or a shared spreadsheet.
You can show them the hledger-web UI, or HTML reports, or give them CSV to open in a spreadsheet.

### Why are revenues, liabilities, equity negative ?

It's characterisic of plain text accounting tools that balances of
revenue, liability and equity accounts normally appear as negative
numbers. (And if they have a contra-balance, as with a temporarily
overpaid credit card, this would appear as a positive number.)

This is because we use negative and positive sign as an alternative 
to traditional [Credit/Debit notation](https://en.wikipedia.org/wiki/Debits_and_credits).
(Negative amounts are credits, positives are debits.)

Think of each transaction as a movement of money from one place to
another. The "from" amounts are negative (money removed from
somewhere) and the "to" amounts are positive (money added to
somewhere):

```journal
2021-01-01 receive salary
    revenues:salary    $-1000
    assets:checking     $1000
```

To ensure that no money is lost or created out of thin air, we simply
require that a transaction's amounts add up to zero.

See also [Ledger's discussion of this](https://www.ledger-cli.org/3.0/doc/ledger3.html#Stating-where-money-goes).

If you're new to plain text accounting, you'll get used to reading
these negative numbers pretty quickly. But when you want to see
revenues/liabilities/equity as positive numbers, you can use the
higher level reports like [`balancesheet`], [`cashflow`] and
[`incomestatement`]. Or, use `--invert` to flip all signs.

[`balancesheet`]:    hledger.html#balancesheet
[`cashflow`]:        hledger.html#cashflow
[`incomestatement`]: hledger.html#incomestatement

## hledger and other things

### How does hledger relate to Ledger ? What's the history ?

See [hledger and Ledger](ledger.html).

### What is ledger4 ?

In 2012 John Wiegley made a start at rewriting parts of Ledger 3, eg the parser, in Haskell:
[ledger4](https://github.com/ledger/ledger4).
I included this in hledger for a while as an additional file format,
hoping to attract help to improve this "bridge" between the hledger and Ledger projects,
and improving our compatibility with Ledger's files.
This didn't happen, and would have required a ton of work, so I removed it.

### How is hledger different from / interoperable with... ?

See <https://hledger.org/cookbook.html#interoperating-with-other-software>.
Eg:

- [hledger and Ledger](ledger.html)
- [hledger and Beancount](beancount.html)
- [hledger and GnuCash](gnucash.html)
- [hledger and Quicken/Quickbooks](quicken.html)

See also:

- <https://plaintextaccounting.org/#plain-text-accounting-apps> project stats
- The [Syntax Quick Reference for the Ledger-Likes](https://plaintextaccounting.org/quickref)
- The out of date <https://plaintextaccounting.org/#comparisons>

### How could I import/migrate from...

#### Mint.com ?

1. download [examples/csv/mint.csv.rules](https://github.com/simonmichael/hledger/blob/master/examples/csv/mint.csv.rules), and adjust the `account1` & `account2` rules
2. `touch ~/.hledger.journal`
3. log in to Mint, go to TRANSACTIONS, scroll to the bottom of the page, click on the "Export all N transactions" link, save it as `mint.csv` on your computer
4. `cd ~/Downloads` (or wherever you saved it)
5. `hledger import mint.csv`

Now `hledger stats` and `hledger bal` should show lots of data. That's your past data migrated. 

Then, if you want to leave Mint, you'll need to replace their automatic
import from banks with 
[your own import process](faq.html#isnt-importing-from-banks-a-pain-).

Or if you want to keep using Mint for that, because you like how they
aggregate and clean the data: just periodically re-export from Mint,
repeating steps 3-5 above.


## Using hledger
### How do I report by financial year, not calendar year ?

[`-Y/--yearly`](hledger.html#report-intervals), [`-p/--period 'every year'`](hledger.html##period-expressions), etc. 
show Gregorian calendar years, starting on January 1st. 
To show years starting with a different month, use `every 12 months from DATE`.
Eg, to show years starting on April 1st (the register command is good for testing this):
```
hledger reg -p 'every 12 months from 2019-04-01'
```

To show years not starting on a month boundary, approximate it with `every 365 days from DATE`
(this won't be exact for leap years):
```
hledger reg -p 'every 365 days from 2019-04-06'
```

### Why does this entry give a "no amount" error even though I wrote an amount ?

```journal
2019-01-01
  a 1
  b
```
Because there's only a single space between `a` and `1`,
so this is parsed as an account named <span style="white-space:nowrap;">"a 1"</span>, with no amount.
There must be at least two spaces between account name and amount.


### Why do some directives not affect other files ? Why can't I put account aliases in an included file ?

This is documented at [journal format: directives](hledger.html#directives).
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

### Why am I seeing some amounts without an account name in reports ?

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


### With hledger-ui in iTerm2/3, why does Shift-Up/Shift-Down move the cursor instead of adjusting the period ?

One way to fix: in iTerm2 do Preferences -> Profiles -> your current profile -> Keys -> Load Preset -> xterm Defaults 
(not Terminal.app Compatibility). And perhaps open a new tab with this profile. 

### How do I set the LEDGER_FILE environment variable on Windows?

Maybe using SETX: https://hledger.org/1.26/hledger.html#environment

or in settings: https://www.java.com/en/download/help/path.html

### How do I display a decimal separator different from the one in the input file ?

It's not yet easy to do this with hledger:\
<https://github.com/simonmichael/hledger/issues/793#issuecomment-603994809>

There's just one special case where it works, by a quirk of the implementation: 
if in the journal you use space as thousands separator, comma as decimal separator, 
and no commodity directive, hledger will print numbers with period as decimal separator:
```journal
; journal
2020-01-01
    (a)       $1 234,56
```
```shell
$ hledger print
2020-01-01
    (a)       $1 234.56

```

Here's a more general workaround, post-processing the output with sed.
Adjust if needed:
```journal
; journal
2020-01-01
    (a)       $1.234,56
```
```shell
$ hledger print
2020-01-01
    (a)       $1.234,56

$ hledger print | sed 's/\./~/g; s/,/./g; s/~/,/g'
2020-01-01
    (a)       $1,234.56

```
### How do I control the number of decimal places displayed ?

With hledger < 1.23:
use a [commodity directive](hledger.html#commodities)
to set commodities' [display style](hledger.html#commodity-display-style).
Eg:
```journal
commodity $1000.00
commodity EUR 1.000,
commodity 1000.00000000 BTC
```

With hledger 1.23+, you can also use the `-c/--commodity-style` option. Eg:
```shell
hledger -c '$1000.00' -c 'EUR 1.000,' -c '1000.00000000 BTC' bal
```

### How can I match transactions from one account to another account ?

https://money.stackexchange.com/questions/154316/how-can-i-identify-all-transfers-from-account-a-to-account-b-in-ledger-cli/154322#154322

