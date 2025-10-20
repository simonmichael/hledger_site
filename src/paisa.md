# hledger and Paisa

<https://github.com/ananthakumaran/paisa> is a web app that reads a Ledger or hledger or Beancount file, 
downloads market prices, and provides sophisticated reports and charts.
It is a slick, modern, easy-to-install app written in go and typescript and released under AGPL. 
It is focussed on Indian users but can be useful to others. 

- <https://ananthakumaran.in/paisa> docs
- <https://paisa-demo.ananthakumaran.in> demo
- <https://www.reddit.com/r/plaintextaccounting/comments/121ka8m/how_do_you_visualize_drill_down_your_financial> related discussion

Paisa reads the journal file into its own SQLite database.
You must have one of the PTA apps installed to create the SQLite database initially.
After the database is created Paisa doesn't strictly need the PTA app,
but it is still useful to sync the latest changes from your journal to the db.

### Paisa's hledger support

Paisa added hledger support: see <https://github.com/ananthakumaran/paisa/discussions/12>.
There are quite a few restrictions, which may or may not be documented,
and we haven't yet heard from anyone successfully using paisa with hledger.
Please join the discussion and help with testing/improvements if you can.

## Tips

Paisa will only see accounts whose top level is Assets, Liabilities, Equity, Income or Expense (case sensitive).
If you don't use those, you can use [account aliases](hledger.md#alias-directive) to rewrite them.

For other account names special to Paisa, see <https://ananthakumaran.in/paisa/accounts.html>.

