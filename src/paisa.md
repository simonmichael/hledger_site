# hledger and Paisa

https://github.com/ananthakumaran/paisa is a web app that reads a Ledger (or hledger) file and provides sophisticated reports and charts (read only). It is a slick modern app written in go and typescript and released under AGPL. It is focussed on Indian users but can be useful to others. In 2023 it the best reporting app available to hledger and Ledger users.

https://ananthakumaran.in/paisa/ docs
https://paisa-demo.ananthakumaran.in/ demo
https://www.reddit.com/r/plaintextaccounting/comments/121ka8m/how_do_you_visualize_drill_down_your_financial/ related discussion

Paisa uses Ledger to read the journal file (into its own SQLite database), so you must have Ledger installed. It doesn't use any Ledger-specific features however. So 