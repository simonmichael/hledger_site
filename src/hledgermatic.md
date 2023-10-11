This is my recommendation for a relatively simple and automated workflow using current hledger features. It is the kind of setup I use myself.

Here are the main files, grouped for clarity. Yours might be slightly different:
```
/home/USER/

 finance/                 home of finance files; wherever you wish
  .git/                   most files are tracked with git or other VCS

  2022.journal            main journal file for 2022
  2022accounts.journal    account declarations, included by main jnl
  2022prices.journal      market price declarations, included by main

  2023.journal            main journal file for 2023
  2023accounts.journal
  2023prices.journal

  future.journal          future transactions; not version-controlled

  bi-ichecking.csv.rules  CSV conversion rules for each bank account
  paypal.csv.rules
  wf-pchecking.csv.rules
  wf-bchecking.csv.rules
  wf.rules                common rules included for all wf accounts
  common.rules            common rules included by all

  justfile                scripts automating common tasks

  bin/
   bashrc                 (or oshrc, etc) custom shell config
   paypaljson             get recent Paypal transactions as JSON
   
 Download/                hledger looks here for CSV files by default
  Checking1.csv           a bank account's recent transactions
  Checking1-1.csv         newer copies saved by web browser
  Checking1-2.csv         the newest; hledger will read this one
  Savings1.csv            these file names are declared in *.csv.rules
  Transactions-2342.csv   


```



`justfile` is the starting place for scripts and automation; it contains named scripts which can be listed and invoked by the `just` command (LINK). (It is similar to a make file, but better for this purpose.) `just` can be aliased as 

The `bin` directory is a place to keep additional scripts; it should be added to the shell's PATH.
