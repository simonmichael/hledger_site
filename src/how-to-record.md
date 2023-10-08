# How to record journal entries

There are many ways to create hledger journal entries. Here are some:

## Interactively
- hledger add
- hledger-iadd
- hledger-web add form

## In a text editor

### From scratch
- write the entry in full

### From templates
- in emacs with yasnippet (or similar) configured, enter the name of a snippet and complete with TAB

### From past entries
- find, copy and modify a past entry
- in emacs ledger-mode, enter a date and partial description and complete with C-c TAB

### From previously prepared entries
- move a previously prepared entry from a separate file (eg future.journal) 

## At the command line

### From past entries
- using Ledger, [`ledger xact DESC`](https://ledger-cli.org/doc/ledger3.html#xact) with arguments to adjust amounts

### From partial entries/rules
- convert a periodic transaction rule (eg in future.journal) to an entry with --forecast
- the above, plus generate extra postings from auto posting rules with --auto

### From timeclock, timedot or journal files
- hledger print or import

### From CSV (or other character-separated data)
- hledger print or import, using hledger's CSV conversion rules (and a pre-cleaning script if needed)

### From other accounting apps
- Look for conversion tools and tips at https://hledger.org/cookbook.html#other-software

### From unsupported data formats
- Write a custom conversion script that outputs hledger journal entries
