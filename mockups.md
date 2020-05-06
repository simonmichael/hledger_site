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
## Ease of use
- CI-generated binaries for linux & mac too
- Web docs

## CI-generated binaries for linux & mac too

Provide official static linux/mac release binaries with CI, like windows.

## Web docs

Provide the seven embedded reference manuals as HTML also. Eg:

- hledger help --html   # temporary static html files
- hledger help --web    # serve from local hledger-web instance if installed
- hledger help --site   # on hledger.org
- hledger-ui ? h/w/s    # same as above
- hledger-web -> help   # served from hledger-web

## Config file

Name: hledger.conf. 

- easy to say and spell
- good highlighting support in editors

Format: toml/ini-ish format, but customised for our needs (if necessary ?)

Loaded: 

- at startup
and ideally:
- hledger-web: on each page load if changed, like journals
- hledger-ui --watch: on change, like journals

Location: search these locations in this order:

1. user config file: $HOME/.config/hledger.conf if it exists,
   otherwise $HOME/.hledger.conf if it exists.
   Some unix folk will want the former, sometimes the latter will be preferred/easier (windows ?)

2. parent directory config files: a hledger.conf in all directories from / down to the current parent directory

3. current directory config file: ./hledger.conf

Values from multiple files are combined, with later files taking precedence.

Eg if you run hledger in /home/simon/project/finance, the following files will be combined if they exist:





Example:
```
[defaults]
# options/arguments always prepended to commands' args
# (hledger|CMD) ARGS
hledger -f hledger.journal
bal -M --flat -b lastmonth
ui --watch
help --html

[commands]
# custom command aliases
# CMDNAME = CMD ARGS
assets = bal ^assets\b
liab = bal ^liabilities\b

# or with make-style colon:
bs2: bs --no-total date:thisyear
#2019: -f 2019.journal

# arbitrary shell commands
jstatus: git status -sb -- *.journal

# arbitrary shell scripts, perhaps with help text
bsis:
  "Show monthly balance sheet and income statement"
  hledger bs -M
  echo
  hledger is -M
  echo
```
