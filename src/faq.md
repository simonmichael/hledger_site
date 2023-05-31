# Frequently Asked Questions

Welcome! This FAQ is for all hledger-related topics, for now.
If you have additions or improvements,
please click the "edit this page" link at the bottom,
or [chat](support) with us.

<!-- toc -->

<!--
FAQ answers should be useful and brief, linking to more detail if needed.
-->

## Accounting

### What's accounting ?

[Accounting](https://en.wikipedia.org/wiki/Accounting) means keeping track of the flow and whereabouts of things you value, 
such as money or time, and using this information for insight, planning and decision-making.
Here's hledger's [Accounting concepts](accounting.md) page
and [Accounting links](accounting.md#accounting-links).

### Why might I want to do accounting ?

For clarity, control, planning, accountability, compliance, tax reporting, tax audits. 
It clarifies activity, priorities, obligations, opportunities.

### What's double-entry accounting ?

[Double-entry bookkeeping](https://en.wikipedia.org/wiki/Double-entry_bookkeeping) is the traditional method for keeping accounting records reliably. 
For every movement of value (a transaction), both the source and destination are recorded.
These are labelled "Credit" and "Debit", to minimise working with negative numbers.
Simple arithmetic invariants help prevent errors.

### What's plain text accounting ?

You can read more about Plain Text Accounting (PTA) at <https://plaintextaccounting.org>.
In short, it is a way of doing Double Entry Bookkeeping (DEB) and accounting on a computer,
using simple text files and small flexible tools, rather than databases and big applications.
Minus and plus signs are usually used instead of Credit and Debit notation, making it easier to learn than traditional DEB.
The text files are human-readable and easy to convert or to manage with [version-control](https://en.wikipedia.org/wiki/Version_control) tools.

## The hledger project

### What's hledger ?

One of the best tools for doing Plain Text Accounting.
It's free and you can read all about it at the <https://hledger.org> home page.

### Why was hledger created ?

- to provide a more usable, robust, documented, cross-platform-installable version of the Ledger accounting tool for users
- to provide a more maintainable and hackable version of Ledger for developers 
- to provide a useful library and toolbox for finance-minded haskell programmers
- to explore the suitability of Haskell for such applications
- to experiment with building a successful time-and-money-solvent project in a thriving ecosystem of financial software projects

### What is the hledger project's current mission and plans ?

1. Help make plain text accounting more usable and useful for all.
2. Bring relief to people experiencing financial and financial technology stress,
   by providing dependable, empowering accounting tools, learning materials, and community.
3. Help people and communities in all countries increase their financial mastery and freedom.
4. Help grow a shared global culture of accountability and sustainability.
5. Starting with this project and ourselves.
<!-- see also: sponsor.md, ROADMAP.md -->

Here is the [ROADMAP](ROADMAP.md).

## hledger and Plain Text Accounting

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

hledger can provide clarity and insight into your personal or business
finances, time logs, or other dated quantitative data, with relatively
little effort on your part.  You need only provide a list of
transactions, as a plain text file in a simple human-readable
format. (Or a CSV file plus some conversion rules.) From this hledger
can generate a variety of useful reports and interactive views.  See
[Features](features.md).

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
The possibilities for automation vary by bank and country, 
but the following semi-manual workflow is almost always possible and quick:

1. Manually download recent CSVs from your bank's website
2. `hledger import ACCT1.csv ACCT2.csv ...`
3. review/clean up the new entries in your journal.

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
*"Accounting data is valuable; we want to know that it will be
accessible for ever - even without software. We want to know when it
changes, and revision-control it. We want to search and manipulate it
efficiently. So, we store it as human-readable plain text."*

### Isn't this too weird for my family, business partners, tax accountant to use ?

Maybe. You can ask them to enter data via hledger-web, 
or import from their mobile expenses app or a shared spreadsheet.
You can show them the hledger-web UI, or HTML reports, or give them CSV to open in a spreadsheet.

### Why are my revenue (income), liability, and equity balances negative ?

It's normal; it's because hledger and most other plain text accounting tools
use negative and positive numbers instead of credit and debit terminology.
Certain hledger reports (`balancesheet`, `incomestatement`, `cashflow`)
and flags (`--invert`) can show them as positive when needed.
See [Accounting > Debits and credits](accounting.md#debits-and-credits).


## hledger and other software

### How does hledger relate to Ledger ?

hledger (begun 2006) is inspired by, and a friendly coopetitor of, John Wiegley's Ledger (begun 2003). 
It is an attempt to rewrite Ledger in a more expressive programming language
and take it to the next level in usability and practicality.
See [hledger and Ledger](ledger.md).

### What is/was ledger4 ?

hledger has its own parser for a file format close to Ledger's.
In 2012 John Wiegley prototyped a more exact conversion of Ledger 3's parser to Haskell,
calling it [ledger4](https://github.com/ledger/ledger4). 
For a while I integrated this as an alternate file format within hledger,
hoping to improve our ability to read original Ledger files,
but the parser needed lots more work to become useful, so later I removed it again.

### How is hledger different from / interoperable with... ?

See [Cookbook > Other software](cookbook.md#other-software) for notes on 
Ledger, Beancount, GnuCash, Quickbooks, etc.
Also:

- [PTA apps](https://plaintextaccounting.org/#pta-apps), showing project stats
- [Syntax Quick Reference for the Ledger-Likes](https://plaintextaccounting.org/quickref), showing several file formats
- [PTA app comparisons](https://plaintextaccounting.org/#pta-app-comparisons), though mostly very out of date

### How could I import/migrate from...

- Look for a relevant page at [Cookbook > Other software](cookbook.md#other-software)
- Otherwise, try to export CSV representing transactions - one record per transaction - and then use [hledger's CSV reader](import-csv.md).
  Also look for [pre-existing CSV rules](https://github.com/simonmichael/hledger/tree/master/examples/csv) you can use.
- Or, make a custom script or workflow to convert the old data to hledger's simple [journal format](hledger.md#journal-format).

### How could I export/migrate to...

- Look for a relevant page at [Cookbook > Other software](cookbook.md#other-software)
- See also [Exporting from hledger](export.md).

## Using hledger

### How do I set environment variables like LEDGER_FILE (persistently) ?

See [hledger manual > Setting LEDGER_FILE](hledger.md#setting-ledger_file).

### Why does this entry give a "no amount" error even though I wrote an amount ?

```journal
2019-01-01
  a $1
  b
```
Because there's only a single space between `a` and `1`,
so this is parsed as an account named <span style="white-space:nowrap;">"a 1"</span>, with no amount.
There must be at least two spaces between account name and amount.

### Why does this journal fail strict account checking even though I declared all accounts ?

```journal
account assets:bank:checking ; my bank account
account equity               ; equity

2023-01-01
    equity
    assets:bank:checking   $1000
```

Because there's only a single space between `assets:bank:checking` and the `;` comment,
so the comment is parsed as part of the account name. (`hledger accounts` shows this.)
There must be at least two spaces between an account name and anything that follows it.

### Why do some directives not affect other files ? Why can't I include account aliases ?

Directives vary in their scope, ie which journal entries and which input files they affect. The differences are partly due to historical accident, and partly by design, so that reordering files, or adding another file, does not change their meaning. See [journal format > Directives and multiple files](hledger.md#directives-and-multiple-files).
Related discussion:
[#217](https://github.com/simonmichael/hledger/issues/217),
[#510](https://github.com/simonmichael/hledger/issues/510),
[#1007](https://github.com/simonmichael/hledger/issues/1007).

### Why am I seeing some amounts without an account name in reports ?

When an account has a multi-commodity balance, hledger's default `balance`, `print`, and `register` reports, like Ledger's, will show the balance on multiple lines, with each commodity on its own line, but with the account name appearing only once (either top- or bottom-aligned, depending on report). For a clearer report, try `balancesheet`, `incomestatement` or `cashflow`, and/or `--layout=bare`, or restrict the report to a single currency with `cur:SYMBOL`.

Another reason you might see amounts without an account name: dropping too many account name parts with [`--drop`](hledger.md#balance).


### How do I control the number of decimal places displayed ?

To set that temporarily, use the `-c/--commodity-style` option (one for each commodity, as needed).
Eg, this shows dollars with two decimal places, ADA with six, and EUR with none:
```shell
hledger -c '$1000.00' -c '1000.000000 ADA' -c 'EUR 1000.' bal
```

To make it permanent, use [commodity directives](hledger.md#commodity-directive).

### How do I display a decimal mark different from the one in the input file ?

Use `-c/--commodity-style` options (one for each commodity) to override the display style(s).
Eg `hledger bal -c '$1,00'` displays dollar amounts with comma decimal marks,
even if they use period decimal marks in the journal.

### How do I report by financial year, not calendar year ?

Use hledger 1.29+, and just specify the desired start date, eg `hledger is -Y -b 2020/4/15`
or `hledger is -p 'yearly from 2020/4/15'`.
With older hledger versions, you can approximate it with `-p 'every 12 months from 2020/4`
or `-p 'every 365 days from 2020/4/15'`.

### How can I show transactions from one account to another account ?

With hledger versions before 1.29, you can print the transactions with this trick:
```shell
hledger print checking not:not:expenses:tax
```

To get a register report, you can chain two hledger commands
(or [use an RDBMS](https://money.stackexchange.com/questions/154316/how-can-i-identify-all-transfers-from-account-a-to-account-b-in-ledger-cli/154322#154322>)):
```shell
hledger print checking | hledger -I -f- register expenses:tax
```

With hledger 1.29+, you can use print with a boolean query:
```shell
hledger print expr:'checking AND expenses:tax'
```
or aregister with two account name arguments:
```shell
hledger areg checking expenses:tax
```

To filter by direction, add `amt:'>0'` or  `amt:'<0'` to one of the register reports.


### With hledger-ui in iTerm2 on mac, why does Shift-Up/Shift-Down move the selection instead of adjusting the report period ?

iTerm2 by default doesn't recognise SHIFT-UP/SHIFT-DOWN keys correctly. (If this has changed in recent releases, please let us know.)
Here's one way to fix it: iTerm2 > CMD-i > Keys > Key Mappings > Presets -> select "xterm Defaults" (not "Terminal.app Compatibility").

## Customising hledger

### How do I install hledger CSV rules for my financial institutions ?

git clone the main hledger repo, and look in examples/csv/ for a rules file you can copy to your financial working directory.
If your financial institution is not there yet, please use these for inspiration,
ask the #hledger chat for help, and send a pull request contributing your working rules to the repo.

### How do I make new hledger CSV rules ?

See the [Importing CSV](csv.md) tutorial and the [hledger manual > CSV format](hledger.md#csv-format).
(After checking for a pre-existing rules file in examples/csv/ in the hledger repo.)
If possible, add your new rules file to that directory and send a pull request.

### How do I install more hledger scripts and add-on commands ?

git clone the hledger repo, and add the bin/ directory to your shell's PATH.
See [Scripts and add-ons](scripts.md).

### How do I make new hledger scripts ?

Install the example [Scripts and add-ons](scripts.md) and find a suitable one to copy and modify.
Also see [Scripting](scripting.md).
If your new script can be useful to others, consider contributing it with a pull request.
