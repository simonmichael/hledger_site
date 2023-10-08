# How to record journal entries

<div class=pagetoc>

<!-- toc -->
</div>

There are many ways to create hledger journal entries. Here are some:

## Interactively

### With a text UI

- [hledger add](hledger.md#add)
- [hledger-iadd](https://hackage.haskell.org/package/hledger-iadd)

### With a web UI

- [hledger-web](https://hledger.org/hledger-web.html) add or edit form
- [Paisa](https://paisa.fyi) edit form

### On a phone or tablet

- With one of the [mobile apps](mobile.md)

## In a text editor

### From scratch
- Write the entry in full

### From templates
- In emacs with [yasnippet](https://www.emacswiki.org/emacs/Yasnippet) (or similar) configured, enter the name of a snippet and complete with TAB

### From past entries
- Find, copy and modify a past entry in the journal
- In emacs [ledger-mode](https://ledger-cli.org/doc/ledger-mode.html), enter a date and partial description and complete with C-c TAB

### From future entries
- Move the entry from a separate file where you prepared it ahead of time (eg future.journal) 

## At the command line

### From past entries
- Using Ledger, [`ledger xact DESC`](https://ledger-cli.org/doc/ledger3.html#xact) with arguments to adjust amounts

### From partial entries/rules
- Convert a periodic transaction rule (eg in future.journal) to an entry with --forecast
- The above, plus generate extra postings from auto posting rules with --auto

### From timeclock, timedot or journal files
- `hledger print` or `hledger import`

### From CSV (or other character-separated data)
- `hledger print` or `import`, using hledger's CSV conversion rules (and a pre-cleaning script if needed)

### From other apps
- Look for conversion tools and tips at <https://hledger.org/cookbook.html#other-software>

### From unsupported data formats
- Write a custom conversion script that outputs hledger journal entries
