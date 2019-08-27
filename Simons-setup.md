# Simons setup

Author:       Simon Michael  
Last updated: 201903  
Tested on:    mac mojave  
Tested with:  hledger 1.14  
Tools used: 
hledger, 
hledger-ui,
GNU make,
...

## Environment

The `LEDGER_FILE` environment variable is currently set to `/Users/simon/notes/2019.journal`.
This is done in some super secret way that I'll have to track down, or more likely several ways,
to ensure that it is consistent for:

- programs started from command line in iTerm/Terminal windows
- programs started from emacs shell buffers
- emacs modes such as ledger-mode
- for both text-mode and graphical emacs, whether started from command line or mac GUI (Dock/Finder/Spotlight)
- etc.

## Files

```
$ tree ~/notes
/Users/simon/notes
├── 2019.journal
├── 2019.prices
├── all.journal
├── current.journal -> 2019.journal
├── forecast.journal
...
```

Files are in `~/notes`.
There's one YEAR.journal file per year containing all transactions in date order.
It includes:

- YEAR.prices containing P records for the year
- forecast.journal containing periodic transaction rules

all.journal includes all the year journals. 
It provides all historical data, but is slow, and my old journals are inconsistent/broken, so it's currently rarely used.

current.journal is a symlink for scripts which don't know the year.
Symbolic links are a mixed blessing, causing file path confusion in emacs, eg.

## Data entry

Most journal entries are generated from downloaded CSV:

- Transactions from three banks are aggregated and cleaned in a Google sheet by Tiller ($5/mo).
  A command line tool downloads this sheet as CSV (via cron ? currently disabled).

- Paypal CSV is downloaded manually, then moved into place by a make rule.
  I use Paypal's CSV because Tiller doesn't handle multiple currencies and Paypal's extra metadata fields.

For troubleshooting: when downloading a CSV the previous copy is saved as FILE.csv.old.

```
$ make csv
```

Cash transactions are entered in emacs, using ledger-mode. 
Mostly by copying and pasting similar past transactions.

When rewriting account names, I use either 
ledger-mode completion (`TAB`) or dabbrev-expand completion (`M-/`),
which have different strengths. 

I fetch currency prices with barrucadu's market-prices.py script
([details](https://gist.github.com/simonmichael/9ca4d74b30567dcc3b93763ffe88abf9)).


## Version control

Journal file, included files, makefile and scripts in git.
A mixture of manual and cron-based automatic committing.

## Accounts

; Account hierarchy used, any organisational principles, how I maintain it..

## Reports

I have convenience aliases for hledger commands and reports in `~/notes/bashrc`,
which is automatically sourced by my bash profile.

More reports and file-generating scripts are defined in `~/notes/Makefile`.

Increasingly, I am moving reports and scripts in a (more powerful and robust) Shake file, `~/notes/do.hs`
([details](https://gist.github.com/simonmichael/74f82343b1f625b2861fcf27c3ddeb2f)).

## Workflows / Routines

; Recurring (daily, weekly, monthly, yearly..) workflows
