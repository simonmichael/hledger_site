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

Mockup/outline for improved balance command docs, and notes for [#1353](https://github.com/simonmichael/hledger/issues/1353).

The balance command is hledger's most versatile command, with various modes and options.

### Single-period vs. multi-period balance reports

By default, the balance command shows a list of accounts, and the
amounts posted to them during a single time period, as in Ledger.

With a [report interval](#report-intervals) flag (`-D`/`--daily`,
`-W`/`--weekly`, `-M`/`--monthly`, `-Q`/`--quarterly`, or
`-Y`/`--yearly`), the balance command shows a tabular report,
with one or more columns representing successive time periods,
and perhaps Average and Total columns.
This is a hledger feature.

### List vs. tree mode

By default (or with `-l`/`--flat`), accounts' full names are shown, as a flat list.

With `-t`/`--tree`, the account hierarchy is shown, 
with subaccounts' short names indented below their parent.
"Boring" accounts (containing a single interesting subaccount and no
balance of their own) are elided into their subaccount's name to save
space, unless `--no-elide` is used.

In tree mode, "inclusive" account balances are shown,
meaning they always include the balances of subaccounts.
(And the report's final total will be the sum of top-level balances,
not of all the balances shown.)

### Balance report types

Balance reports offer several variants, each showing different information. These are:

| Report mode            | Shows, for each account and period:                                                                                                                 |
|------------------------|-----------------------------------------------------------------------------------------------------------------------------------------------------|
| `balance [--change]`   | "Balance changes": the change of balance (sum of amounts posted) in each period. This is the default.                                               |
| `balance --cumulative` | "Relative end balances": the change accumulated from report start to each period's end.                                                             |
| `balance --historical` | "Historical end balances": the change accumulated from journal start to each period's end. Ie, the real-world account balances at period end dates. |
| `balance --budget`     | "Actual and target changes": like --change, but also shows a budget goal for each period.                                                           |
<br>

### Balance report valuation

In hledger 1.20.3, here is what the balance report types show, for each account and period, with each [valuation type](#valuation):

|                        | (no valuation)                          | `--value=cost`                         | `--value=then`                                                     | `--value=end`                                               | `--value=DATE`,<br>`--value=now`                          |
|------------------------|-----------------------------------------|----------------------------------------|--------------------------------------------------------------------|-------------------------------------------------------------|-----------------------------------------------------------|
| `balance [--change]`   | change in period                        | costs in period                        | sum of posting-date market values in period                        | period-end value of change in period                        | DATE/now-value of change in period                        |
| `balance --cumulative` | change from report start to period end  | costs from report start to period end  | sum of posting-date market values from report start to period end  | period-end value of change from report start to period end  | DATE/now-value of change from report start to period end  |
| `balance --historical` | change from journal start to period end | costs from journal start to period end | sum of posting-date market values from journal start to period end | period-end value of change from journal start to period end | DATE/now-value of change from journal start to period end |
| `balance --budget`     | like --change, plus budget goals        | "                                      | "                                                                  | "                                                           | "                                                         |
<br>

<!--
Old doc: from on "Effect of valuation on reports":

| Report mode:                                        | `-V`, `-X`                                                        | `--value=then`                                                                                | `--value=end`                                                     | `--value=DATE`, `--value=now`           |
|-----------------------------------------------------|-------------------------------------------------------------------|-----------------------------------------------------------------------------------------------|-------------------------------------------------------------------|-----------------------------------------|
| starting balances (-H)                              | value at report start of sums of all postings before report start | sums of values of postings before report start at respective posting dates                    | value at report start of sums of all postings before report start | sums of postings before report start    |
| balance changes (bal, is, bs --change, cf --change) | same as --value=end                                               | sums of values of postings in period at respective posting dates                              | balance change in each period, valued at period ends              | value at DATE/today of sums of postings |
| end balances (bal -H, is --H, bs, cf)               | same as --value=end                                               | sums of values of postings from before period start to period end at respective posting dates | period end balances, valued at period ends                        | value at DATE/today of sums of postings |
| budget amounts (--budget)                           | like balance changes/end balances                                 | like balance changes/end balances                                                             | like balances                                                     | like balance changes/end balances       |
| row totals, row averages (-T, -A)                   | sums, averages of displayed values                                | sums, averages of displayed values                                                            | sums, averages of displayed values                                | sums, averages of displayed values      |
| column totals                                       | sums of displayed values                                          | sums of displayed values                                                                      | sums of displayed values                                          | sums of displayed values                |
| grand total, grand average                          | sum, average of column totals                                     | sum, average of column totals                                                                 | sum, average of column totals                                     | sum, average of column totals           |
<br>
-->
