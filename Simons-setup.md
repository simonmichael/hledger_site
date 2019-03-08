Author:       Simon Michael  
Last updated: 201903  

## Requirements

Tested on:    mac  
Tested with:  hledger 1.14  
Tools used: 
hledger, 
hledger-ui,
GNU make,
...

## Files

Financial files are in `~/notes`.

One journal file per year containing all transactions in date order.
It includes:

- YYYY.prices containing P records for the year
- forecast.journal containing periodic transaction rules

A current.journal symlink for scripts which don't know the year.
Though symbolic links are a mixed blessing, causing file path confusion in emacs, eg.

## Environment

The `LEDGER_FILE` environment variable is currently set to `/Users/simon/notes/2019.journal`.
This is done in some super secret way that I'll have to track down, or more likely several ways,
to ensure that it is consistent for:

- programs started from command line in iTerm/Terminal windows
- programs started from emacs shell buffers
- emacs modes such as ledger-mode
- for both text-mode and graphical emacs, whether started from command line or mac GUI (Dock/Finder/Spotlight)
- etc.

```
~$ tree notes
notes
├── 2019.journal
├── 2019.prices
├── current.journal -> 2019.journal
├── forecast.journal
...
```

## Data entry / conversion

Two CSV files are imported:

Multiple banks' transactions are aggregated in a Google sheet by Tiller.
This is downloaded as CSV by a make rule (or via cron - currently disabled).

Paypal CSV is downloaded manually, then gathered/renamed by a make rule.
(Tiller doesn't handle paypal's multiple currencies and extra metadata fields.)

For troubleshooting: when downloading a CSV the previous copy is saved as FILE.csv.old.

```
$ make csv
```

Prices are fetched with barrucadu's market-prices.py script.
Some details: https://gist.github.com/simonmichael/9ca4d74b30567dcc3b93763ffe88abf9


## Version control

Journal file, included files, makefile and scripts in git.
A mixture of manual and cron-based automatic committing.

## Accounts

; Account hierarchy used, any organisational principles, how I maintain it..

## Reports

; The main reports used ?

## Tasks / Workflows

; How to do ..

## Routines

; Recurring (daily, weekly, monthly, yearly..) workflows
