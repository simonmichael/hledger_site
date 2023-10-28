# hledger and GnuCash

Tips for co-using/converting/switching GnuCash and hledger.

Relevant [data conversion tools](https://plaintextaccounting.org/#data-importconversion) include:

- Old 2.x versions of Ledger had some ability to read one of GnuCash's data formats
- [gnucash2ledger.py](https://github.com/MatzeB/pygnucash/blob/master/gnucash2ledger.py) (2014, python, reads SQLite)
- [piecash](https://github.com/sdementen/piecash) (2015, python, reads SQLite/MySQL/Postgres)
- [gnucash-to-beancount](https://github.com/henriquebastos/gnucash-to-beancount) (2017, python, reads SQLite) (then use [beancount2ledger](https://github.com/beancount/beancount2ledger))
- [gcash2ledger.py](https://gist.github.com/nonducor/ddc97e787810d52d067206a592a35ea7/) (2018, python, reads uncompressed XML)
- [gnucash2ledger](https://github.com/lodenrogue/gnucash2ledger) (2023, python, reads compressed/uncompressed XML)

Related discussion:

- [Import Gnucash Files #332](https://github.com/simonmichael/hledger/issues/332)
- [GnuCash and ledger combination](https://www.reddit.com/r/plaintextaccounting/comments/m721d7/gnucash_and_ledger_combination/)
- [Current working gnucash exporter?](https://www.reddit.com/r/plaintextaccounting/comments/r64oye/current_working_gnucash_exporter/)
- <https://www.reddit.com/r/plaintextaccounting/comments/16xhjm5/command_line_vs_gui> how to export from hledger to gnucash
- <https://news.ycombinator.com/item?id=37954925> using gnucash and hledger
