# Overview of commands

To see an overview of hledger's commands, run `hledger commands` or just `hledger`.
If you have hledger and just the hledger-ui and hledger-web addons installed,
it will look something like this:
```
$ hledger
   __   __       __            
  / /  / /__ ___/ /__ ____ ____
 / _ \/ / -_) _  / _ `/ -_) __/
/_//_/_/\__/\_,_/\_, /\__/_/   
                /___/          
-------------------------------------------------------------------------------
hledger 1.43.2-gedbf4d4f3-20250613, mac-aarch64
Usage: hledger [COMMAND] [OPTIONS] [ARGS]
Commands:

HELP (docs, demos..)
 commands                 show the commands list (default)
 demo [DEMO]              show brief demos in the terminal
 help [-i|-m|-p] [TOPIC]  show the hledger manual with info/man/pager
 --tldr    [COMMAND]      show command examples   [for command] with tldr
 --help/-h [COMMAND]      show command line help  [for command]
 --info    [COMMAND]      show the hledger manual [for command] with info
 --man     [COMMAND]      show the hledger manual [for command] with man
                          more help: https://hledger.org

USER INTERFACES (alternate UIs)
 repl                     run commands from an interactive prompt
 run                      run command scripts from files or arguments
 ui                       run a terminal UI (hledger-ui)
 web                      run a web UI (hledger-web)

ENTERING DATA (add or edit transactions)
 add                      add transactions using interactive prompts
 import                   add new transactions from other files, eg CSV files

BASIC REPORTS (simple lists)
 accounts                 show account names
 codes                    show transaction codes
 commodities              show commodity/currency symbols
 descriptions             show transaction descriptions
 files                    show data files in use
 notes                    show note part of transaction descriptions
 payees                   show payee part of transaction descriptions
 prices                   show historical market prices
 stats                    show journal statistics
 tags                     show tag names

STANDARD REPORTS (the most useful financial reports)
 print                    show full transaction entries, or export journal data
 aregister (areg)         show transactions & running balance in one account
 register (reg)           show postings & running total in one or more accounts
 balancesheet (bs)        show assets and liabilities
 balancesheetequity (bse) show assets, liabilities and equity
 cashflow (cf)            show changes in liquid assets
 incomestatement (is)     show revenues and expenses

ADVANCED REPORTS (more versatile/advanced reports)
 balance (bal)            show balance changes, end balances, gains, budgets..
 roi                      show return on investments

CHARTS (bar charts, line graphs..)
 activity                 show posting counts as a bar chart

GENERATING DATA (generate or download journal entries; less common)
 close                    generate transactions to zero/restore/assert balances
 rewrite                  add postings to transactions, like print --auto

MAINTENANCE (error checking, data management..)
 check                    run any of hledger's built-in correctness checks
 diff                     compare an account's transactions in two journals
 setup                    check and show the status of the hledger installation
 test                     run some self tests

OTHER ADDONS (more hledger-* commands found in PATH):

```

A few of them are commands which change data.
But most are reports. They fall into these broad types:
- list reports, which list items of a particular type (accounts, commodities, payees...)
- print-like reports, which show whole transactions as journal entries (print, close...)
- register reports, which show transactions or postings compactly with a running total (register, aregister...)
- balance reports, which show totals for multiple accounts (balance, balancesheet, incomestatement...)
- other kinds of report (activity, roi...)

<br>

(Part of [hledger by example](hledger-by-example.md).)
