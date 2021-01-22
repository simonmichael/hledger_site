# Mockups

Mockups, draft docs and notes exploring possible future features.

## Price syntax

### In Ledger and hledger

- In the journal, a `P DATE COMMODITY AMOUNT` directive some commodity's market price in some other commodity on DATE.
  (A timestamp may be added, but is ignored.)

- In a posting, `AMT @ UNITPRICE` declares the per-unit price that was used to convert AMT into the price's commodity.
  Eg: `2A @ 3B` records that 2A was posted, in exchange for 6B.

- `@@ TOTALPRICE` is another form of `@`, sometimes more convenient.
  Eg: `2A @@ 5.99B` records that 2A was posted in exchange for 5.99B.

### In Ledger

- `@ UNITPRICE`
  Any use of `@` also generates an implicit `P` directive.
  Eg:

      2019/1/1
        a  2A @ 3B
        b

  in the journal is equivalent to writing

      2019/1/1
        a  2A @ 3B
        b

      P 2019/1/1 A 1.5B

- `{UNITPRICE}`

- `{=FIXEDUNITPRICE}`

The following are variants of the above; they work the same way except
that you write the total instead of the unit price:

- `@@ TOTALPRICE`
- `{{TOTALPRICE}}`
- `{{=FIXEDTOTALPRICE}}`

### In hledger

- `@` does not generate a market price
- `{}` and `{=}` are ignored

## Capital gains

### A model for capital gains

Capital gain/loss (when the value of assets you hold increases/decreases
due to market price fluctuations) - is an important topic, since it can
generate tax liability.

Here is a description of how it works, intended for both users and
builders of accounting software (especially, plain text accounting
software). (I'm a software engineer, not an accountant. In places there
may be better accounting terms I'm not familiar with yet.)

- lots/units -
  A quantity of some commodity, acquired at a certain price on a certain date,
  is called a *lot*, or *unit*. (I'm not sure which is the most standard term. Using lot for now.)

- Since you might have purchased the lot on a stock exchange, received it as a gift,
  or something else, we'll call this event *lot acquisition*, on the *acquisition date*.

- Later you might sell the lot for cash, or exchange it for something else, or gift it.
  We'll call this *lot disposal*.

- You might have paid current market value for the lot, or you might have
  paid less or more than that. We'll call what you paid/exchanged the *acquisition amount*.
  
- I think the acquisition amount is also called the *basis* or *cost basis*.
  Or possibly the current market value is the basis, regardless of what you paid.
  Perhaps it depends. To be clarified. The basis at which you acquired a lot is important.

- After acquisition, while you are still holding the lot, if the market value of that commodity goes up (or down),
  your potential return from disposing of the lot increases (or decreases).
  This is known as *capital gain (or loss)* (we'll just call it "capital gain").
  At this stage, the gain is only "on paper", so it is called *unrealised capital gain* (URG).
  This is not considered revenue, or taxable.

- It's common to be holding multiple lots, perhaps many, even in a single account.
  Eg, say you buy a small amount of some stock or cryptocurrency each week.
  Each purchase adds a new lot to your assets. We'll call this a *multi-lot balance*, or *balance*.

- URG is calculated for a lot at a certain point in time.
  Likewise for a multi-lot balance.

- realised capital gain

- lot withdrawal strategies

- specific identification

### Capital gains in hledger

-  postings can have multiple commodities and multiple prices; each of
   these parts is a deposit or withdrawal to the account

- 
  ```haskell
  -- | Given a list of amounts all in the same commodity, interprets them
  -- as a sequence of lot deposits (the positive amounts) and withdrawals
  -- (the negative amounts), and applies them in order using the FIFO
  -- strategy for withdrawals, then returns the resulting lot balance (as
  -- another, shorter, list of amounts).
  sumLots :: [Amount] -> [Amount]
  ```
## Ease of getting started

What could make getting started substantially easier ?

- Official CI-generated binaries for all major platforms
- Builtin access to docs in web format

## CI-generated binaries for linux & mac

Provide official static linux/mac release binaries with CI, like windows.

## Web docs

Provide the embedded user manuals as HTML also. Eg:

- hledger help --html   # temporary static html files
- hledger help --web    # serve from local hledger-web instance if installed
- hledger help --site   # on hledger.org
- hledger-ui ? h/w/s    # same as above
- hledger-web -> help   # served from hledger-web

## Config file

Name: hledger.conf (and possibly ~/.hledger.conf as well).

- easy to say and spell
- good highlighting support in editors

Format: toml/ini-ish format, but customised for our needs (if necessary).

Example:
```
# hledger.conf

[defaults]
# Set options/arguments to be always used with hledger commands.
# Each line is: HLEDGERCMD ARGS, or: hledger ARGS
hledger -f hledger.journal
bal -M --flat -b lastmonth
ui --watch
web -V
help --html

[commands]
# Define aliases for custom hledger commands.
# Each line is: CMDALIAS = HLEDGERCMD ARGS
assets = bal -M ^assets\b
liab   = bal -M ^liabilities\b

# Or use colon, like make ?
bs2:   bs --no-total date:thisyear

# Or just whitespace, like hledger csv rules ?
smui   ui ^sm\b

# Allow arbitrary shell commands ?
2019:    hledger -f 2019.journal
jstatus: git status -sb -- *.journal

# Allow multi-command shell scripts, with optional help string ?
bsis:
  "Show monthly balance sheet and income statement"
  hledger bs -M
  echo
  hledger is -M
  echo
```

Loaded: 

- at startup
and ideally:
- hledger-web: on each page load if changed, like journals
- hledger-ui --watch: on change, like journals

Location: 

Search a number of locations in order.
Values from multiple files are combined, with later files taking precedence.

User config file: should it be "modern"  ~/.config/hledger.conf or "old/simple" ~/.hledger.conf ? 
One or the other may be preferred/easier/more portable.
If we support both, should it be one or the other, or both ?

Parent directory config files: we'd probably like to recognise config files in parent directories.
How far up should we look - 
to the root dir ? 
to the user's home dir ? and if not under the user's home dir, don't look up at all ?
to the nearest VCS working directory root ?

This would be the simplest comprehensive scheme: use all of

1. ~/.config/hledger.conf
2. ~/.hledger.conf
3. hledger.conf in all directories from / down to the current directory

Eg: running hledger in /home/simon/project/finance would combine any of the following which exist:

- ~/.config/hledger.conf
- ~/.hledger.conf
- /hledger.conf
- /home/hledger.conf
- /home/simon/hledger.conf
- /home/simon/project/hledger.conf
- /home/simon/project/finance/hledger.conf

## balance

*Mockup/outline for improved balance command docs, and notes for [#1353](https://github.com/simonmichael/hledger/issues/1353).*

hledger's `balance` command is a powerful and flexible reporting command.
There are some easier-to-user variants of it for producing standard financial reports, including
[`balancesheet`](hledger.html#balancesheet), 
[`balancesheetequity`](hledger.html#balancesheetequity), 
[`incomestatement`](hledger.html#incomestatement) and 
[`cashflow`](hledger.html#cashflow).
If you find those too limiting, you can use the `balance` command directly.
Most of the features described below are common to all of these commands.

This command supports the
[output destination](hledger.html#output-destination) and
[output format](hledger.html#output-format) options.
It supports output formats `txt`, `csv`, `json`, and (multi-period reports only:) `html`.

### Single-period balance reports

With no arguments, `balance` shows a list of all accounts and their
*change of balance* - the sum of posting amounts, both inflows and
outflows - during the entire period of the journal, by default.

You can see fewer accounts, a different time period, totals of cleared
transactions, etc. by using [query](#queries) arguments or options to
limit the postings being matched.

Note, to see current balances of real-world accounts, two things are needed:

1. the journal must include a transaction properly setting their initial balance on some date
2. the report must include all of their postings since then.

The reported balances' total is shown as the last line, unless `-N`/`--no-total` is used.

Accounts are sorted by [declaration order](https://hledger.org/hledger.html#declaring-accounts)
if any, and then by account name.

### List or tree mode

By default, or with `-l`/`--flat`, accounts are shown as a flat list, with their full names visible.

With `-t`/`--tree`, the account hierarchy is shown, with subaccounts'
"leaf" names indented below their parent. 
Also, "boring" accounts (with a single interesting subaccount and no
balance of their own) are elided into their subaccount's name for more
compact output, unless `--no-elide` is used.

Other features of tree mode:

"Inclusive" account balances are shown, meaning they always include
the balances of subaccounts. (And the report's final total will be the
sum of top-level balances, not of all the balances shown.)

Each group of sibling accounts is sorted by
[declaration order](https://hledger.org/hledger.html#declaring-accounts) 
and then by account name.

### "Empty" accounts

Accounts with a zero balance (and no non-zero subaccounts, in tree
mode) are not shown unless `-E/--empty` is used.
<!-- Note: a zero balance does not necessarily mean empty of postings. -->
 
### Multi-period balance reports

With a [report interval](#report-intervals) - usually set by a `-D`/`--daily`,
`-W`/`--weekly`, `-M`/`--monthly`, `-Q`/`--quarterly`, or `-Y`/`--yearly` flag - 
`balance` shows a tabular report with one or more columns representing successive time periods. 
<!-- This is a particular strength of hledger. -->
Commands like `balancesheet`, `incomestatement` etc. always use this report style.

Other features of multi-period balance reports:

Average and/or total columns can be added with the `-A`/`--average` or `-T`/`--row-total` flags.

The report's start/end dates will be expanded, if necessary, to fully
encompass the displayed subperiods (so that the first and last
subperiods have the same duration as the others).

Accounts which have no posting activity during the report period (rows
containing all zeroes) are not shown, unless `-E/--empty` is used.

Leading and trailing columns containing all zeroes are not shown,
unless `-E/--empty` is used.

The `--transpose` flag can be used to exchange the rows and columns.
     
Amounts with many commodities are elided, unless `--no-elide` is used
(since they can make the table very wide). 

Hiding the totals row with `-N/--no-total` can also help reduce the
table width. If the the report is still too wide, a good workaround is
to pipe it into `less -RS`. Eg: `hledger bal -D --color=yes | less -RS`.

### Balance report types

Balance reports offer several variants, each showing different
information. These are:

| Report mode               | Shows, for each account and period:                                                                                                                 |
|---------------------------|-----------------------------------------------------------------------------------------------------------------------------------------------------|
| `balance [--change]`      | "Balance changes": the change of balance (sum of amounts posted) in each period. This is the default.                                               |
| `balance --cumulative`    | "Relative end balances": the change accumulated from report start to each period's end.                                                             |
| `balance --historical/-H` | "Historical end balances": the change accumulated from journal start to each period's end. Ie, the real-world account balances at period end dates. |
| `balance --budget`        | "Actual and target changes": like --change, but also shows a predefined goal for each period. (See below.)                                          |
<br>

`--row-total/-T` is disabled with `--cumulative` or `--historical/-H` (since summing end balances generally does not make sense).

### Balance report valuation

Here is what the balance report types show, for each account and period, with each [valuation type](#valuation):

|                        | (no valuation)                          | `--value=cost`                         | `--value=then`                                                     | `--value=end`                                                                                                       | `--value=DATE`,<br>`--value=now`                      |
|------------------------|-----------------------------------------|----------------------------------------|--------------------------------------------------------------------|---------------------------------------------------------------------------------------------------------------------|-------------------------------------------------------|
| `balance [--change]`   | change in period                        | costs in period                        | sum of posting-date market values in period                        | **1.20.3:** period-end value of change in period <br>**master:** change of period-end values                        | DATE-value of change in period                        |
| `balance --cumulative` | change from report start to period end  | costs from report start to period end  | sum of posting-date market values from report start to period end  | **1.20.3:** period-end value of change from report start to period end  <br>**master:** change of period-end values | DATE-value of change from report start to period end  |
| `balance --historical` | change from journal start to period end | costs from journal start to period end | sum of posting-date market values from journal start to period end | **1.20.3:** period-end value of change from journal start to period end <br>**master:** change of period-end values | DATE-value of change from journal start to period end |
| `balance --budget`     | like --change, plus budget goals        | "                                      | "                                                                  | "                                                                                                                   | "                                                     |
<br>

### Depth limiting

With a `depth:N` query, or `--depth N` option, or just `-N`, 
balance reports will show accounts only to the specified depth,
hiding the deeper subaccounts. This can be useful for getting an overview.
<!--
Eg, limiting to depth 1 shows the top-level accounts:
```shell
$ hledger balance -N -1
                 $-1  assets
                  $2  expenses
                 $-2  income
                  $1  liabilities
```
-->

Accounts at the depth limit will include the balances of any hidden subaccounts
(even in flat mode, which normally shows exclusive balances).

You can also hide account name components at the start of account
names, using `--drop N`. This can be useful for hiding uninteresting
top-level account name parts.

### Colour support

In terminal output, when colour is enabled, `balance` shows negative amounts in red.

### Sorting by amount

With `-S`/`--sort-amount`, accounts with the largest (most positive) balances are shown first.
Eg: `hledger bal expenses -MAS` shows your biggest averaged monthly expenses first.

Revenues and liability balances are typically negative, however, so `-S` shows these in reverse order.
To work around this, you can add `--invert` to flip the signs.
Or, use one of the sign-flipping reports like `balancesheet` or `incomestatement`, 
which also support `-S`. Eg: `hledger is -MAS`.

### Percentages

With `-%` or `--percent`, balance reports show each account's value expressed
as a percentage of the column's total. This is useful to get an overview of
the relative sizes of account balances. 
<!--
For example to obtain an overview of expenses:

```shell
$ hledger balance expenses -%
             100.0 %  expenses
              50.0 %    food
              50.0 %    supplies
--------------------
             100.0 %
```
-->

Tree mode does not change the percentages; they are always the
percentage of the the column total (not of the parent account).

It is not useful to calculate percentages if:

- the column's amounts sum to zero
- or the column's amounts have mixed signs
- or the column's amounts have mixed commodities.
  (You can use [valuation](hledger.html#valuation) to convert them to a single commodity.)

### Customising single-period balance reports

Single-period balance reports can be customised by using `--format FMT`
to set the format of each line. Eg:

```shell
$ hledger balance --format "%20(account) %12(total)"
              assets          $-1
         bank:saving           $1
                cash          $-2
            expenses           $2
                food           $1
            supplies           $1
              income          $-2
               gifts          $-1
              salary          $-1
   liabilities:debts           $1
---------------------------------
                                0
```

The FMT format string (plus a newline) specifies the formatting
applied to each account/balance pair. It may contain any suitable
text, with data fields interpolated like so:

`%[MIN][.MAX](FIELDNAME)`

- MIN pads with spaces to at least this width (optional)
- MAX truncates at this width (optional)
- FIELDNAME must be enclosed in parentheses, and can be one of:

    - `depth_spacer` - a number of spaces equal to the account's depth, or if MIN is specified, MIN * depth spaces.
    - `account`      - the account's name
    - `total`        - the account's balance/posted total, right justified

Also, FMT can begin with an optional prefix to control how
multi-commodity amounts are rendered:

- `%_` - render on multiple lines, bottom-aligned (the default)
- `%^` - render on multiple lines, top-aligned
- `%,` - render on one line, comma-separated

There are some quirks. Eg in one-line mode, `%(depth_spacer)` has no
effect, instead `%(account)` has indentation built in.
<!-- XXX retest:
Consistent column widths are not well enforced, causing ragged edges unless you set suitable widths.
Beware of specifying a maximum width; it will clip account names and amounts that are too wide, with no visible indication.
-->
Experimentation may be needed to get pleasing results.

Some example formats:

- `%(total)`         - the account's total
- `%-20.20(account)` - the account's name, left justified, padded to 20 characters and clipped at 20 characters
- `%,%-50(account)  %25(total)` - account name padded to 50 characters, total padded to 20 characters, with multiple commodities rendered on one line
- `%20(total)  %2(depth_spacer)%-(account)` - the default format for the single-column balance report

### Budget report

There is also a special balance report mode for showing budget performance.
The `--budget` flag activates extra columns showing the budget goals for each account and period, if any.
For this report, budget goals are defined by [periodic transactions](journal.html#periodic-transactions).
This is very useful for comparing planned and actual income, expenses, time usage, etc.

For example, you can take average monthly expenses in the common expense categories to construct a minimal monthly budget:
```journal
;; Budget
~ monthly
  income  $2000
  expenses:food    $400
  expenses:bus     $50
  expenses:movies  $30
  assets:bank:checking

;; Two months worth of expenses
2017-11-01
  income  $1950
  expenses:food    $396
  expenses:bus     $49
  expenses:movies  $30
  expenses:supplies  $20
  assets:bank:checking

2017-12-01
  income  $2100
  expenses:food    $412
  expenses:bus     $53
  expenses:gifts   $100
  assets:bank:checking
```

You can now see a monthly budget report:
```shell
$ hledger balance -M --budget
Budget performance in 2017/11/01-2017/12/31:

                      ||                      Nov                       Dec 
======================++====================================================
 assets               || $-2445 [  99% of $-2480]  $-2665 [ 107% of $-2480] 
 assets:bank          || $-2445 [  99% of $-2480]  $-2665 [ 107% of $-2480] 
 assets:bank:checking || $-2445 [  99% of $-2480]  $-2665 [ 107% of $-2480] 
 expenses             ||   $495 [ 103% of   $480]    $565 [ 118% of   $480] 
 expenses:bus         ||    $49 [  98% of    $50]     $53 [ 106% of    $50] 
 expenses:food        ||   $396 [  99% of   $400]    $412 [ 103% of   $400] 
 expenses:movies      ||    $30 [ 100% of    $30]       0 [   0% of    $30] 
 income               ||  $1950 [  98% of  $2000]   $2100 [ 105% of  $2000] 
----------------------++----------------------------------------------------
                      ||      0 [              0]       0 [              0] 
```

This is different from a normal balance report in several ways:

- Only accounts with budget goals during the report period are shown, by default.

- In each column, in square brackets after the actual amount, 
  budget goal amounts are shown, and the actual/goal percentage.
  (Note: budget goals should be in the same commodity as the actual amount.)

- All parent accounts are always shown, even in flat mode. 
  Eg assets, assets:bank, and expenses above.

- Amounts always include all subaccounts, budgeted or unbudgeted, even in flat mode.

This means that the numbers displayed will not always add up!
Eg above, the `expenses`  actual amount includes the gifts and supplies transactions,
but the `expenses:gifts` and `expenses:supplies` accounts are not
shown, as they have no budget amounts declared.

This can be confusing. When you need to make things clearer, use the `-E/--empty` flag, 
which will reveal all accounts including unbudgeted ones, giving the full picture. Eg:

```shell
$ hledger balance -M --budget --empty
Budget performance in 2017/11/01-2017/12/31:

                      ||                      Nov                       Dec 
======================++====================================================
 assets               || $-2445 [  99% of $-2480]  $-2665 [ 107% of $-2480] 
 assets:bank          || $-2445 [  99% of $-2480]  $-2665 [ 107% of $-2480] 
 assets:bank:checking || $-2445 [  99% of $-2480]  $-2665 [ 107% of $-2480] 
 expenses             ||   $495 [ 103% of   $480]    $565 [ 118% of   $480] 
 expenses:bus         ||    $49 [  98% of    $50]     $53 [ 106% of    $50] 
 expenses:food        ||   $396 [  99% of   $400]    $412 [ 103% of   $400] 
 expenses:gifts       ||      0                      $100                   
 expenses:movies      ||    $30 [ 100% of    $30]       0 [   0% of    $30] 
 expenses:supplies    ||    $20                         0                   
 income               ||  $1950 [  98% of  $2000]   $2100 [ 105% of  $2000] 
----------------------++----------------------------------------------------
                      ||      0 [              0]       0 [              0] 
```


You can roll over unspent budgets to next period with `--cumulative`:
```shell
$ hledger balance -M --budget --cumulative
Budget performance in 2017/11/01-2017/12/31:

                      ||                      Nov                       Dec 
======================++====================================================
 assets               || $-2445 [  99% of $-2480]  $-5110 [ 103% of $-4960] 
 assets:bank          || $-2445 [  99% of $-2480]  $-5110 [ 103% of $-4960] 
 assets:bank:checking || $-2445 [  99% of $-2480]  $-5110 [ 103% of $-4960] 
 expenses             ||   $495 [ 103% of   $480]   $1060 [ 110% of   $960] 
 expenses:bus         ||    $49 [  98% of    $50]    $102 [ 102% of   $100] 
 expenses:food        ||   $396 [  99% of   $400]    $808 [ 101% of   $800] 
 expenses:movies      ||    $30 [ 100% of    $30]     $30 [  50% of    $60] 
 income               ||  $1950 [  98% of  $2000]   $4050 [ 101% of  $4000] 
----------------------++----------------------------------------------------
                      ||      0 [              0]       0 [              0] 
```

For more examples and notes, see [Budgeting](budgeting.html).

#### Budget report start date

This might be a bug, but for now:
when making budget reports, it's a good idea to explicitly set the
report's start date to the first day of a reporting period, because
a periodic rule like `~ monthly` generates its transactions on the 1st
of each month, and if your journal has no regular transactions on the 1st,
the default report start date could exclude that budget goal, which can
be a little surprising. Eg here the default report period is just the
day of 2020-01-15:

```journal
~ monthly in 2020
  (expenses:food)  $500

2020-01-15
  expenses:food    $400
  assets:checking
```
```shell
$ hledger bal expenses --budget
Budget performance in 2020-01-15:

              || 2020-01-15 
==============++============
 <unbudgeted> ||       $400 
--------------++------------
              ||       $400 
```

To avoid this, specify the budget report's period, or at least the start date,
with `-b`/`-e`/`-p`/`date:`, to ensure it includes the budget goal transactions
(periodic transactions) that you want. Eg, adding `-b 2020/1/1` to the above:

```shell
$ hledger bal expenses --budget -b 2020/1/1
Budget performance in 2020-01-01..2020-01-15:

               || 2020-01-01..2020-01-15 
===============++========================
 expenses:food ||     $400 [80% of $500] 
---------------++------------------------
               ||     $400 [80% of $500] 
```

#### Nested budgets

You can add budgets to any account in your account hierarchy. If you have budgets on both parent account and some of its children, then budget(s)
of the child account(s) would be added to the budget of their parent, much like account balances behave.

In the most simple case this means that once you add a budget to any account, all its parents would have budget as well. 

To illustrate this, consider the following budget:
```
~ monthly from 2019/01
    expenses:personal             $1,000.00
    expenses:personal:electronics    $100.00
    liabilities
```

With this, monthly budget for electronics is defined to be $100 and budget for personal expenses is an additional $1000, which implicitly means
that budget for both `expenses:personal` and `expenses` is $1100.

Transactions in `expenses:personal:electronics` will be counted both towards its $100 budget and $1100 of `expenses:personal` , and transactions in any other subaccount of `expenses:personal` would be
counted towards only towards the budget of `expenses:personal`.

For example, let's consider these transactions:
```journal
~ monthly from 2019/01
    expenses:personal             $1,000.00
    expenses:personal:electronics    $100.00
    liabilities

2019/01/01 Google home hub
    expenses:personal:electronics          $90.00
    liabilities                           $-90.00

2019/01/02 Phone screen protector
    expenses:personal:electronics:upgrades          $10.00
    liabilities

2019/01/02 Weekly train ticket
    expenses:personal:train tickets       $153.00
    liabilities

2019/01/03 Flowers
    expenses:personal          $30.00
    liabilities
```

As you can see, we have transactions in `expenses:personal:electronics:upgrades` and `expenses:personal:train tickets`, and since both of these accounts are without explicitly defined budget,
these transactions would be counted towards budgets of `expenses:personal:electronics` and `expenses:personal` accordingly:

```shell
$ hledger balance --budget -M
Budget performance in 2019/01:

                               ||                           Jan 
===============================++===============================
 expenses                      ||  $283.00 [  26% of  $1100.00] 
 expenses:personal             ||  $283.00 [  26% of  $1100.00] 
 expenses:personal:electronics ||  $100.00 [ 100% of   $100.00] 
 liabilities                   || $-283.00 [  26% of $-1100.00] 
-------------------------------++-------------------------------
                               ||        0 [                 0] 
```

And with `--empty`, we can get a better picture of budget allocation and consumption:
```shell
$ hledger balance --budget -M --empty
Budget performance in 2019/01:

                                        ||                           Jan 
========================================++===============================
 expenses                               ||  $283.00 [  26% of  $1100.00] 
 expenses:personal                      ||  $283.00 [  26% of  $1100.00] 
 expenses:personal:electronics          ||  $100.00 [ 100% of   $100.00] 
 expenses:personal:electronics:upgrades ||   $10.00                      
 expenses:personal:train tickets        ||  $153.00                      
 liabilities                            || $-283.00 [  26% of $-1100.00] 
----------------------------------------++-------------------------------
                                        ||        0 [                 0] 
```

