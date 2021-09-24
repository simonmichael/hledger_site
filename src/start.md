# The hledger Getting Started Guide

<div class=pagetoc>
<!-- toc -->
</div>

Getting started with hledger or Plain Text Accounting involves many choices and decisions, making it sometimes challenging.
This page aims to solve that, eventually providing a number of opinionated guides to suit different needs. 
This is work in progress. For now, I'm afraid we must still offer you.. choices!

## Common setups

You can start with hledger very simply, and get more sophisticated as
you learn more about double-entry accounting.
After [installing](download.html),
here are some common ways of using it (of course you can mix and match these if you wish):

### GUI

Download and run [hledger-web](web.html).
It will open in your web browser.
Use the add form to add transactions.
It will store store data in its default location.

[Tutorial: hledger-web](web.md) describes this setup in more detail.

### Command line

Run [`hledger add`](add.html) and follow the interactive prompts to enter transactions.
It will store store data in its default location.
Run `hledger` to list commands to try.
Eg, run
`hledger bs` to see your account balances (a [balance sheet]).
`hledger is` to see your income and expenses (an [income statement]).

For a detailed step by step description of this setup, see [Tutorial: hledger add](add.md).

### Text editor

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

Run `hledger` in a terminal to see reports, as above. Eg:

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

### TUI

Use `hledger add` once (see above) to create a journal file in the default location.
Now run [`hledger-ui`](ui.html) to view account balances.
Use the onscreen help to get around.
Eg, press `a` to add a transaction using `hledger add`.

[Tutorial: hledger-ui](ui.md) describes this setup in more detail.

### CSV import

Download CSV files from banks and financial institutions, manually or
using tools/services that automate this (ledger_autosync, Plaid, plaid2qif, Tiller etc.)
Use hledger's import command to convert and import the new transactions,
and use any of the hledger UIs to see reports.

[Importing CSV data](import-csv.md) is a quick tutorial on the importing from CSV part.
Some downloading tools can be found at https://plaintextaccounting.org/#data-importconversion.


### Other setups

- [Quick Start's setup](quickstart.html#set-up-a-journal)

- [hledger manual's setup](hledger.html#starting-a-journal-file)

- [Simon's setup](simons-setup.html)

- Dmitry Astapov's Full-fledged Hledger workflow (tutorial):
  <https://github.com/adept/full-fledged-hledger>

- Andreas Pauley's hledger-flow workflow (tutorial & slideshow):
  <https://github.com/apauley/hledger-flow>

- rotorkunstkultur's setup for chaotic German freelancers:
  <https://github.com/rotorkunstkultur/rtrledger>

- Michael Walker's personal finance setup:
  <https://memo.barrucadu.co.uk/personal-finance.html>


[convert]:           convert-csv-files.html
[import]:            hledger.html#import
[balance sheet]:     https://en.wikipedia.org/wiki/Balance_sheet#Personal
[income statement]:  https://en.wikipedia.org/wiki/Income_statement
