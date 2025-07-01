# Docs

<div class=pagetoc>

<!-- toc -->
</div>

<style>
h2 { margin-top:2em; }
h3 { margin-top:0; }
</style>

An overview of hledger user docs.
You don't need to read them all; pick the ones that fit your needs.
There are also some [Videos](videos.md).

## Quick intros

Short introductions, assuming a bit of command line know-how.
(These overlap.)

- [2 minute quick start](2-minute-quick-start.md)
- [5 minute quick start](5-minute-quick-start.md)
- [10 minute quick start](10-minute-quick-start.md)
- [hledger manual: Common tasks](hledger.md#common-tasks)
- [Workflows](workflows.md)

## Slow intros

Slower-paced tutorials.

- [Tutorial: hledger add](add.md)
- [Tutorial: hledger-ui](ui.md)
- [Tutorial: hledger-web](web.md)
- [Tutorial: Import CSV data](import-csv.md)
- [Accounting basics for PTA users](accounting-pta.md)
- [hledger fan's beginner videos](https://youtube.com/channel/UCZLxXTjOqLzq4z5Jy0AyWSQ)
- [Tips for learning hledger](learn.md)

## Thorough reference docs

The manuals are the authoritative hledger docs.
(You can also view them on your local machine with `hledger help`, eg).

- [hledger manual](hledger.md)
- [hledger-ui manual](hledger-ui.md)
- [hledger-web manual](hledger-web.md)

<!-- -->

- [Release notes](relnotes.md)
- [FAQ](faq.md)
- [Plain Text Accounting FAQ](https://plaintextaccounting.org/FAQ)
- [Accounting: further study](accounting.md)

## Cookbook: Using hledger
<!-- sections ordered roughly by need -->

Tips and how-tos that didn't fit in the manual. These vary in age and quality.

<!--
Documentor tips:
Big pages while practical, additional subpages when needed. 
Include minimal answers/inline examples when feasible, followed by links to longer answers/related resources. 
Check plaintextaccounting.org's and wiki.plaintextaccounting.org's categories.
-->


### Setups and workflows
- [Workflows](workflows.md)

### Data entry
- [Create a journal](create-a-journal.md)
- [How to record journal entries](how-to-record.md)
- [How to figure out journal entries](how-to-figure-out.md)
- [Importing CSV data](import-csv.md)
- [Cost notation](cost-notation.md)

### Examples

- [examples/](https://github.com/simonmichael/hledger/tree/master/examples) - examples and snippets, old and new 

### Preserving your data
- [Track changes with version control](track-changes-with-version-control.md)
- Keep backups - [3-2-1 rule](https://en.wikipedia.org/wiki/Backup#3-2-1_rule)

### Checking for errors
- [Checking for errors](checking-for-errors.md)
- [Balancing the accounting equation](balancing-the-accounting-equation.md)

### Reporting
- [Report examples](report-examples.md)
- [Reporting version control stats](reporting-version-control-stats.md)
- [Rewrite account names](rewrite-account-names.md)
- [Rewrite commodity symbols](rewrite-commodity-symbols.md)
- [Tags tutorial](tags-tutorial.md)

### Making charts
- [Charts and Graphs](charts.md)
- [Visualising discussion 2023](visualising2023.md)

### Customising
- [Change account name separator](change-account-name-separator.md)
- [Editor configuration](editors.md)
- [Save frequently used options](save-frequently-used-options.md)

### Other user interfaces
- [hledger-web tips](hledger-web-tips.md)
- [Mobile apps](mobile.md)
- See PTA UI tools starting at [UI, console](https://plaintextaccounting.org/#ui-console)

### Scripts and add-ons
- [Scripts and add-ons](scripts.md)
- [Scripting hledger](scripting.md)

### Other software
- [Exporting from hledger](export.md)
- [hledger and Beancount](beancount.md)
- [hledger and dsq / DataStation](dsq.md)
- [hledger and just](just.md)
- [hledger and GnuCash](gnucash.md)
- [hledger and Ledger](ledger.md)
- [hledger and Obsidian](obsidian.md)
- [hledger and Paisa](paisa.md)
- [hledger and Postgres](postgres.md)
- [hledger and Quicken/Quickbooks](quicken.md)
- [hledger and SQLite](sqlite.md)
- [hledger and Ultorg](ultorg.md)
- [hledger and YNAB](ynab.md)

## Cookbook: Accounting tasks
<!-- sections ordered mostly alphabetically -->

### Learning accounting and bookkeeping
- [Tips for learning hledger](learn.md)
- [Accounting basics for PTA users](accounting-pta.md)
- [Accounting: further study](accounting.md)
- [Common journal entries](common-journal-entries.md)
- [pta.o: Choosing cash or accrual](https://plaintextaccounting.org/#choosing-cash-vs-accrual)

### Borrowing and lending
- [Borrowing and lending](loans.md)

### Budgeting
- [Budgeting](budgeting.md)
<!-- ### Depreciation -->
<!-- [Depreciation](http://rantsideasstuff.com/posts/2018/07/08-depreciation-in-personal-finance-with-hledger) -->

### Eco accounting
- [PTA cookbook: Eco accounting](https://plaintextaccounting.org/Eco-accounting)

### Forecasting
- [Forecasting](forecasting.md)

### Inventory tracking
- [Tracking and selling inventory](inventory.md)
- [PTA wiki: Inventory](https://github.com/plaintextaccounting/plaintextaccounting/wiki/Inventory)

### Investing and trading
- [PTA Cookbook: Investing and trading](https://plaintextaccounting.org/Investing-and-trading)
- [hledger manual: Cost reporting](hledger.md#cost-reporting)
- [hledger manual: Value reporting](hledger.md#value-reporting)
- [hledger manual: balance features](hledger.md#balance-features)
- [Track investments (2017)](track-investments.md)
- [Track investments (2020)](investments.md)
- [Calculate unrealized gain](gain.md)
- [Calculate return on investment](roi.md)
- [hledger-lots](scripts.md#hledger-lots)
- [Average cost capital gains with hledger](https://curiousbicycle.com/post/hledger-capital-gains) 2023
- [Track foreign stock capital gains using hledger](https://curiousbicycle.com/post/hledger-foreign-stock) 2023
- [Full-fledged hledger: Manual lot tracking](https://github.com/adept/full-fledged-hledger/wiki/Manual-lot-tracking) 2024

### Invoicing
- [Invoicing](invoicing.md)
- [Project accounting](project-accounting.md)

### Multiple currencies
- [Multicurrency tutorial](multicurrency-tutorial.md) (2018)
- [Currency conversion](currency-conversion.md) (2021)
- [hledger manual: Cost reporting](hledger.md#cost-reporting)
- [hledger manual: Value reporting](hledger.md#value-reporting)

### Non-profit accounting

### Taxes
- [A tax reporting setup](tax-reporting-setup.md)

### Time tracking
- [Converting time to money](time-to-money.md)
- [Time planning](time-planning.md)

### Trip expenses
- [Foreign trip expenses](foreign-trip-expenses.md)

### Shared expenses

## Cookbook: Plain Text Accounting

The [Plain Text Accounting Cookbook](https://plaintextaccounting.org/Cookbook) collects similar but more generic advice for all PTA apps.
