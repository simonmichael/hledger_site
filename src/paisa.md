# hledger and Paisa

<https://github.com/ananthakumaran/paisa> is a web app that reads a Ledger 
(or hledger) file, downloads market prices, and provides sophisticated (read-only) reports and charts (read only). 
It is a slick, modern, easy-to-install app written in go and typescript and released under AGPL. 
It is focussed on Indian users but can be useful to others. 
In 2023 it is the best reporting app available to hledger and Ledger users.

- <https://ananthakumaran.in/paisa> docs
- <https://paisa-demo.ananthakumaran.in> demo
- <https://www.reddit.com/r/plaintextaccounting/comments/121ka8m/how_do_you_visualize_drill_down_your_financial> related discussion

Paisa uses Ledger to read the journal file into its own SQLite database.
You must have Ledger installed at least to create the SQLite database initially.
After the database is created Paisa doesn't need Ledger, but it is
still useful to sync the latest changes from your journal to the db
periodically.

Paisa doesn't use any Ledger-specific features however,
so it's relatively easy to ensure either 
that Ledger can read your hledger journal,
or (more likely) that it can read a copy made with `hledger print`.

## Tips

If you have trouble making your journal readable by Ledger,
look for ideas at [Ledger](ledger.md). Eg
- some transactions that balance in hledger will not balance in Ledger and vice versa. You might need to add more decimal places in cost amounts, or you might need to preserve hledger's commodity declarations
- costs in balance assertion/assignment amounts can not be read by Ledger and will need to be removed or commented
- some hledger balance assertions can not be read by Ledger and will need to be modified or commented out.

Paisa will only see accounts whose top level is Assets, Liabilities, Equity, Income or Expense (case insensitive). If you don't use those, you can use `print --alias` to rewrite them. For other account names special to Paisa, see <https://ananthakumaran.in/paisa/accounts.html>.

### Installing hledger as a fake Ledger

Paisa runs Ledger like this:

```
ledger -f FILE csv --csv-format "%(quoted(date)),%(quoted(payee)),%(quoted(display_account)),%(quoted(commodity(scrub(display_amount)))),%(quoted(quantity(scrub(display_amount)))),%(quoted(to_int(scrub(market(amount,date) * 100000)))),%(quoted(xact.id))\n"
```
which prints
```
2014/01/01 Home purchase
    Assets:House                                1 APT @ 4000000 INR
    Liabilities:Homeloan
```
as
```
"2014/01/01","Home purchase","Assets:House","APT","1","400000000000","1"
"2014/01/01","Home purchase","Liabilities:Homeloan","INR","-4000000","-400000000000","1"
```

`hledger print -O csv` prints that entry as
```
"txnidx","date","date2","status","code","description","comment","account","amount","commodity","credit","debit","posting-status","posting-comment"
"1","2014-01-01","","","","Home purchase","","Assets:House","1","APT","","1","",""
"1","2014-01-01","","","","Home purchase","","Liabilities:Homeloan","-4000000.0000","INR","4000000.0000","","",""
```

Perhaps a "ledger" script could transform our CSV into Ledger's.

### Paisa support for hledger support

Paisa has added some hledger support: <https://github.com/ananthakumaran/paisa/discussions/12>.
FYI: There are quite a few restrictions, which may or may not be documented,
and we haven't yet heard from anyone successfully using paisa with hledger.
Please join the discussion and help with testing/improvements if you can.
