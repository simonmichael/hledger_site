# How to record journal entries

<div class=pagetoc>

<!-- toc -->
</div>

There are many ways to create hledger journal entries.
Here are some options:

## Interactively

### With a text UI

- [hledger add](hledger.md#add) (or `a` in hledger-ui)
- [hledger-iadd](https://hackage.haskell.org/package/hledger-iadd) (or `A` in hledger-ui)

### With a web UI

- [hledger-web](https://hledger.org/hledger-web.html) add form or edit form
- [Paisa](https://paisa.fyi) edit form

### On a phone or tablet

- With one of the [mobile apps](mobile.md)

## In a text editor

### From scratch
- Write the entry in full, using [journal format](hledger.md#journal).
- As above, but also use [editor addons](editors.md) to assist
  (like Emacs ledger-mode's TAB account completion and M-q alignment).

### From templates
- In Emacs with [yasnippet](https://www.emacswiki.org/emacs/Yasnippet) (or similar) configured, enter the name of a snippet and complete with TAB

### From past entries
- Find, copy and modify a past entry in the journal
- Or in Emacs [ledger-mode](editors.md#ledger-mode), enter a date and partial description and complete with C-c TAB

### From future entries
- Move the entry from a separate file where you prepared it ahead of time (eg future.journal) 

## At the command line

### From past entries
- Using Ledger, [`ledger xact DESC`](https://ledger-cli.org/doc/ledger3.html#xact) with arguments to adjust amounts

### From transaction/posting rules
- Convert a periodic transaction rule (eg in future.journal) to an entry with --forecast
- The above, plus generate extra postings from auto posting rules with --auto

### From timeclock, timedot or journal files
- [`hledger print`](hledger.md#print) or [`hledger import`](hledger.md#import)

### From CSV (or other character-separated data)
- `hledger print` or `import` plus hledger's [CSV conversion rules](hledger.md#csv) (and a pre-cleaning script if needed)

### From unsupported data formats
- Write a conversion script that prints hledger journal entries

### From other apps
- Look for conversion tools and tips at <https://hledger.org/cookbook.html#other-software>

### From custom scripts
- If you have custom scripts to help with tasks, make them print or append journal entries when appropriate.
  Eg have your [invoicing script](https://github.com/simonmichael/hledger/tree/master/examples/invoicing/invoice-script) add an invoice transaction to the journal.
  
