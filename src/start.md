# The hledger Getting Started Guide

<div class=pagetoc>
<!-- toc -->
</div>

Getting started with hledger or Plain Text Accounting,
not to mention setting up a new accounting system,
can involve research, learning, choices and decisions,
and can expand into a giant project if we're not careful.
It also touches on things which can be stressful.

This page aims to help,
eventually providing a number of opinionated guides to suit different needs.
It is work in progress; all feedback is welcome in [chat](support.html).

See also these similar but slightly more technical pages:

- [Home > How do I get started?](index.html#how-do-i-get-started)
- [Quick Start](quickstart.html)
- [hledger manual > COMMON TASKS](hledger.html#common-tasks)
- [Cookbook > Setups/workflows](cookbook.html#setupsworkflows)

and 

- [hledger fan's beginner videos](https://www.youtube.com/channel/UCZLxXTjOqLzq4z5Jy0AyWSQ/videos).


## Common workflows

After [installing](install.html) hledger,
here are some common ways of using it.
(And of course you can mix and match these if you'd like.):

### GUI workflow

Download and run `hledger-web`, eg by double-clicking on it.
It should open in your web browser.
Use the add form to add transactions.
It will store data in its default location.
(So you'll see your transactions next time you run it.)

[Tutorial: hledger-web](web.html) describes this in more detail.

In all of these workflows, remember to back up your computer
periodically to safeguard your hledger data.

### Command line workflow

At a terminal prompt, run `hledger add` and follow the interactive prompts to enter transactions.
It will store data in its default location.
Run `hledger` to list commands to try.
Eg, run
`hledger bs` to see your account balances (a [balance sheet]), and
`hledger is` to see your income and expenses (an [income statement]).

[Tutorial: hledger add](add.md) describes this process, and hledger's basic concepts and file format, step by step.
You might want to skim through this one even if you don't plan to use `hledger add`.

### Text editor workflow

Open your preferred text editor and create a journal file, `.hledger.journal` in your home directory.
(Or elsewhere, and set its path in the `LEDGER_FILE` environment variable.)
Create transactions by hand using [journal file](journal.html) format.
Once you have a few, you can copy/paste them to make more.
When you want more assistance, set up an [editor mode](editors.html).
Here's an example:

```journal
; $HOME/.hledger.journal

2020-01-01 opening balances
    assets:checking         $1234
    equity

2020-03-15 client payment
    assets:checking         $2000
    income:consulting

2020-03-20 Sprouts
    expenses:food:groceries  $100
    assets:cash               $40
    assets:checking
```

Run `hledger` in a terminal to see reports, as in the Command line workflow. Eg:

```shell
$ hledger bs
Balance Sheet 2020-03-20

             || 2020-03-20 
=============++============
 Assets      ||            
-------------++------------
 assets      ||      $3134 
   cash      ||        $40 
   checking  ||      $3094 
-------------++------------
             ||      $3134 
=============++============
 Liabilities ||            
-------------++------------
-------------++------------
             ||            
=============++============
 Net:        ||      $3134 

$ hledger is -M
Income Statement 2020-01-01-2020-03-20

                         || Jan  Feb    Mar 
=========================++=================
 Revenues                ||                 
-------------------------++-----------------
 income:consulting       ||   0    0  $2000 
-------------------------++-----------------
                         ||   0    0  $2000 
=========================++=================
 Expenses                ||                 
-------------------------++-----------------
 expenses:food:groceries ||   0    0   $100 
-------------------------++-----------------
                         ||   0    0   $100 
=========================++=================
 Net:                    ||   0    0  $1900 
```

### TUI workflow

Use `hledger add` once (see above) to create a journal file.
Now run `hledger-ui` to view account balances.
Use the onscreen help to get around.
Eg, press `a` to add a transaction, and follow the prompts (it uses `hledger add`).

[Tutorial: hledger-ui](ui.md) describes this setup in more detail.

### CSV import workflow

Download CSV files from banks and financial institutions, manually or
using tools/services that automate this (ledger_autosync, Plaid, plaid2qif, Tiller etc.)
Use hledger's import command to convert and import the new transactions,
and use any of the hledger UIs to see reports.

[Importing CSV data](import-csv.md) is a quick tutorial on the importing from CSV part.
Some downloading helpers can be found at
<https://plaintextaccounting.org/#data-importconversion> (search for "download").


## Some more advanced workflows

- Notes on [Simon's setup](simons-setup.html)

- Dmitry Astapov's Full-fledged Hledger workflow (tutorial):\
  <https://github.com/adept/full-fledged-hledger>

- Andreas Pauley's hledger-flow workflow (tutorial & slideshow):\
  <https://github.com/apauley/hledger-flow>

- rotorkunstkultur's setup for chaotic German freelancers:\
  <https://github.com/rotorkunstkultur/rtrledger>

- Michael Walker's personal finance setup:\
  <https://memo.barrucadu.co.uk/personal-finance.html>


[convert]:           convert-csv-files.html
[import]:            hledger.html#import
[balance sheet]:     https://en.wikipedia.org/wiki/Balance_sheet#Personal
[income statement]:  https://en.wikipedia.org/wiki/Income_statement

## How to learn Accounting

### Little and often

Remember that accounting is an ongoing activity, best done in regular small doses.

The more often you do it, the easier it is, because less has happened and you can remember it.
Ten minutes daily can achieve a lot. (Or less, once you get a routine going.)

### Small steps

Good news: you can start using hledger in very simple ways, and get immediate benefit.
A good way to prioritise is to think about your most pressing needs and what kind of report would help.
For example,

- Take inventory of your debts, loans and assets; write down the names and numbers.
- Record these as journal transactions ("opening balances" transactions - see example below).
- Make corrections until hledger shows your balances accurately.

Or:

- Start recording changes to the cash in your wallet, starting with today's balance.
- Then start reconciling daily (comparing the reported and actual balance, and troubleshooting any disagreements).
- Then start tracking the balance in your checking account.
- Then start tracking your other bank accounts.
- Then start categorising your incomes and expenses.
- Then find your bank transaction history and manually enter the transactions from the previous week.
- Then manually download your bank transactions as CSV and develop CSV rules so that you can print the CSV as journal entries.
- Then try downloading and importing this CSV into your journal daily for a while.
  (Only if you wish. Many people stick to manual data entry for the increased awareness it brings.)

If the task feels unclear or overwhelming, I recommend this small steps, verifiable reports approach.

If not, of course feel free to blaze away and do it all on day 1!
But I would still recommend establishing a frequent reconciling routine.
It is *surprising* how quickly small events can slip through the cracks and create chaos,
and it takes a little time to develop the troubleshooting skills.
Reconciling often will save you time.

### Imperfect

Your bookkeeping does not have to be perfect or even very accurate.
As you practice, you will naturally learn more about the tools and
about double-entry accounting,
such as how to organise your account categories,
and how to write effective journal entries for various real-world events (transactions).

Later you can come back and improve your old journal entries if you wish.
You can decide what level of accuracy you need.

(Though in all honesty, if you catch the PTA bug, you may find that
nothing less than perfection will do; you may want to know when your
banks and vendors are doing funny business with rounding..)

