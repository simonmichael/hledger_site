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

<style>
.wy-table-responsive { 
  overflow:visible;
}
</style>

## 1353-related upgrade notes

*Cf [#1353](https://github.com/simonmichael/hledger/issues/1353)*

User-visible changes when going from 1.20.4 to master:

|                            |                                                                                                                                                              |
|----------------------------|--------------------------------------------------------------------------------------------------------------------------------------------------------------|
| `-B/--cost`                | Now a primary flag.                                                                                                                                          |
| `--value=cost`             | Now an alias for `-B/--cost`, and deprecated.                                                                                                                |
| `--value=cost,COMM`        | No longer supported, suggests `-B --value=X,COMM`.                                                                                                           |
| `--value=end`              | With `--change`, shows change of end values instead of end value of change.<br>`--value=then` approximates and hopefully is preferable to the old behaviour. |

Meaning of the cost/valuation short flags in master:

| Short flag            | Equivalent to              |
|-----------------------|----------------------------|
| `-B`                  | `--cost`                   |
| `-V`                  | `--value=then` (soon)      |
| `-X/--exchange  COMM` | `--value=then,COMM` (soon) |

## Valuation examples

Minimal example for testing some valuation behaviours discussed in
[#1353](https://github.com/simonmichael/hledger/issues/1353).
See [Balance report valuation](#balance-report-valuation) above.

```journal
; every ~15 days: one A is purchased, and A's market price in B increases.

2020-01-01
  (a)  1 A

2020-01-15
  (a)  1 A

2020-02-01
  (a)  1 A

2020-02-15
  (a)  1 A

P 2020-01-01 A  1 B
P 2020-01-15 A  2 B
P 2020-02-01 A  3 B
P 2020-02-15 A  4 B
```

Old `balance --change --value=end` behaviour: shows period-end value of period's balance change:

```shell
$ hledger-1.20.4 bal -M --value=end  # --change is the default
Balance changes in 2020-01-01..2020-02-29, valued at period ends:

   || Jan  Feb 
===++==========
 a || 4 B  8 B 
---++----------
   || 4 B  8 B 
```

New `balance --change --value=end` behaviour in master: shows change between period-end-valued period-end balances:

```shell
$ hledger-master bal -M --value=end
Period-end value changes in 2020-01-01..2020-02-29:

   || Jan   Feb 
===++===========
 a || 4 B  12 B 
---++-----------
   || 4 B  12 B 
```

`balance --value=then` is also supported in master: shows sum of postings' then-values in each period:

```shell
$ hledger-master bal -M --value=then
Balance changes in 2020-01-01..2020-02-29, valued at posting date:

   || Jan  Feb 
===++==========
 a || 3 B  7 B 
---++----------
   || 3 B  7 B 
```


