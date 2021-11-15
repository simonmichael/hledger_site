# Newcomer FAQ

<div align=center>

  Newcomer FAQ
| [User FAQ](userfaq.html)
| [Developer FAQ](devfaq.html)

</div>

<!-- toc -->

Welcome! This FAQ is for you if you are hearing about hledger or Plain Text Accounting for the first time,
or if you are comparing hledger with other PTA tools.
If you're already using hledger, see the [User FAQ](userfaq.html),
and if you're contributing see the [Developer FAQ](devfaq.html).

(If you'd like to help improve these FAQs we'd sure appreciate it. 
Click the "edit this page" link at the bottom, or [chat](index.html#help) with us.)

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

## hledger and PTA
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

### Why did you start hledger ? How does it relate to Ledger ?

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
[#hledger](http://irc.hledger.org) to allow us more space.

I think having independent but compatible implementations has been
quite helpful for troubleshooting, exploring the design space, and
growing the "Ledger-likes" community.
My other projects in that direction include
the [ledger-cli.org](http://ledger-cli.org) site,
[LedgerTips](http://twitter.com/LedgerTips),
IRC support on #ledger,
and now [plaintextaccounting.org](http://plaintextaccounting.org).

### How is hledger different from / interoperable with... ?

Look for:

- Project stats at <https://plaintextaccounting.org/#plain-text-accounting-apps>

- A "hledger and X" page on this site (click the top-left icon to open the sidebar).
  Eg
  [hledger and Beancount](beancount.html),
  [hledger and GnuCash](gnucash.md),
  [hledger and Ledger](ledger.md),
  [hledger and Quicken/Quickbooks](quicken.md),
  ...

- The [Syntax Quick Reference for the Ledger-Likes](https://plaintextaccounting.org/quickref)

- The out of date <https://plaintextaccounting.org/#comparisons>

### What is ledger4 ?

In 2012 John Wiegley made a start at rewriting parts of Ledger 3, eg the parser, in Haskell:
[ledger4](https://github.com/ledger/ledger4).
I included this in hledger for a while as an additional file format,
hoping to attract help to improve this "bridge" between the hledger and Ledger projects,
and improving our compatibility with Ledger's files.
This didn't happen, and would have required a ton of work, so I removed it.

