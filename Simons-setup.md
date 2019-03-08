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

One journal file per year containing all transactions in date order.
Includes:

- forecast.journal containing periodic transaction rules
- YYYY.prices containing P records for the year

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
