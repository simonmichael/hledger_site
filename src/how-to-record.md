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
- In Emacs with [yasnippet](https://www.emacswiki.org/emacs/Yasnippet) configured (eg), enter the name of a snippet and complete with TAB

### From past entries
- Find, copy and modify a past entry in the journal
- Or in Emacs [ledger-mode](editors.md#ledger-mode), enter a date and partial description and complete with C-c TAB

### From future entries
- Move the entry from a separate file where you prepared it ahead of time (eg future.journal) 

## At the command line

### From past entries
- Install Ledger and use [`ledger xact DESC`](https://ledger-cli.org/doc/ledger3.html#xact), with arguments to adjust amounts

### From periodic transaction / auto posting rules
- Convert a periodic transaction rule (eg in future.journal) to an entry with `--forecast[=DATEORPERIOD]`
- The above, plus generate extra postings from auto posting rules with `--auto`

### From custom scripts
- If you have custom scripts to help with tasks, make them print or append journal entries when appropriate.
  Eg have your [invoicing script](https://github.com/simonmichael/hledger/tree/master/examples/invoicing/invoice-script) add an invoice transaction to the journal.

## By converting data

### From timeclock, timedot or other journal files
- [`hledger import`](hledger.md#import)

### From CSV (or other character-separated values)
- `hledger import` plus [CSV conversion rules](hledger.md#csv) (and a pre-cleaning script if needed)

### From other apps and data formats
- Look for conversion tools and tips at <https://hledger.org/cookbook.html#other-software>
- Or at <https://plaintextaccounting.org/#data-importconversion>
- Or write a conversion script that prints hledger journal entries (or other supported format)
- As above, but save the output to a file and `import` from that to get only new entries
