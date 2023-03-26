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
If you have trouble making your journal readable by Ledger,
look for ideas at [Ledger](ledger.md).
