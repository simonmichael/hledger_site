# hledgermatic

<div class=pagetoc>

<!-- toc -->
</div>

This is my recommendation for a relatively simple, automated workflow using current hledger features. It is the kind of setup I use myself. It's described here, but not yet packaged for easy setup; use it for inspiration. Related scripts can be found at [Scripts and add-ons](scripts.md).

Here are the main files (grouped for clarity). Yours might be slightly different:

```
/home/USER/

 finance/                 home of finance files; wherever you wish
  .git/                   most files are tracked with git or other VCS
   hooks/
    pre-commit            runs hledger check -s ordereddates recentassertions

  bin/                    extra scripts/tools for finance work
   bashrc                 extra shell config
   gsheet-csv             get a Google sheet as CSV
   paypaljson             get recent Paypal transactions as JSON
   paypaljson2csv         convert Paypal JSON to CSV

  justfile                commands/scripts for common tasks

  2023.journal            main journal file for 2023 (current year)
  2023accounts.journal    account declarations, included by main journal
  2023prices.journal      market price declarations, included by main

  2022.journal            main journal file for 2022 (etc..)
  2022accounts.journal
  2022prices.journal

  future.journal          future transactions; not version-controlled

  bi-ichecking.csv.rules  CSV conversion rules for each bank account
  paypal.csv.rules
  wf-pchecking.csv.rules
  wf-bchecking.csv.rules
  wf.rules                common rules included for all wf accounts
  common.rules            common rules included by all

 Download/                hledger looks here for CSV files by default;
                          these file names are declared in *.csv.rules
  Checking1.csv           a bank account's recent transactions
  Checking1-1.csv         newer copies saved by web browser
  Checking1-2.csv         the newest; hledger will read this one
  Savings1.csv
  Transactions-2342.csv   


```



`justfile` is the starting place for scripts and automation; it contains named scripts which can be listed and invoked by the [`just` tool](just.md). (It is similar to a make file, but better for this purpose.) I alias `just` to `j`.

The `bin` directory is a place to keep additional scripts; it should be added to the shell's PATH.
