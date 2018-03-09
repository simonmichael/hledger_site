There are lots of ways to start a journal file:

## with echo

The simplest possible journal is just an empty file:
```shell
echo >2017.journal
```

The name doesn't matter much and can be changed later. 
One file per year is common, 
and so is a `.journal` or `.hledger` extension.

## with cat

```shell
$ cat >>2017.journal
2017/1/26
  expenses:food     $10
  assets:cash
<CTRL-D>
```

[Account names](/journal.html#account-names) can be anything 
and you can change them later by search and replace. 
If you don't know what to [choose](http://plaintextaccounting.org/#choosing-accounts), 
start with these five:\
`expenses`, `income`, `assets`, `liabilities`, and `equity`,\
perhaps with one extra subcategory as above.

## with a text editor

Write transactions in a [text editor](/journal.html#editor-support) and save the file.

## with hledger add

Use the [add](/hledger.html#add) command:\
`hledger add -f 2017.journal`\
enter one or more transactions

To avoid typing `-f FILE` every time, set the 
[`LEDGER_FILE` environment variable](/hledger.html#input-files). Eg:
```shell
`echo "export LEDGER_FILE=~/finance/2017.journal" >> ~/.bash_profile && source ~/.bash_profile`
```
The remaining examples assume you have done this. 

## with hledger-iadd

ensure $LEDGER_FILE exists\
`hledger iadd`\
enter one or more transactions

## with hledger-web

ensure $LEDGER_FILE exists\
`hledger web`\
wait for web browser to open\
click "add transaction" or press "a"\
enter a transaction, click ok or press enter
