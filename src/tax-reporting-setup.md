# A tax reporting setup

A new working directory is created for each tax year:

    tax2022/
      tax.journal
      reports.org[.gpg]

`tax.journal` includes 
  the tax year's journal
  the previous year's journal, for comparison and sanity checking
  the next (current) year's journal, since it may contain related transactions, like tax payments
  account aliases renaming the year's account names to corresponding tax form items

`reports.org` (optionally encrypted with gpg) contains a large number of hledger reports, embedded as org source blocks, normally using tax.journal, as needed to answer every tax-related question and fill out every tax form item. This provides a useful combination of manageability, tweakability, repeatability, and persistence.

Because tax.journal is multi-year, many reports will need `-p TAXYEAR` to limit their period.

Use whatever headings are useful. Eg: tax software being used, tax software sections, tax form names, tax form item labels.

Below item headings there will be a one or more relevant hledger reports in source blocks. Eg:

    *** <Tax form name> [human description]
    **** <Tax form's or software's item label>
    
    Balances in PREVYEAR and TAXYEAR:
    #+begin_src hledger :cmdline -f tax.journal bal -VYE -e NEXTYEAR REPORTARGS
    #+end_src
    
    Transactions in TAXYEAR:
    #+begin_src hledger :cmdline -f tax.journal reg -V -p TAXYEAR REPORTARGS
    #+end_src

With point (cursor) on a report block (eg the begin_src line),
  `C-c C-c` runs the report, inserting/updating results
  `C-c C-v k` erases the report results
With point anywhere,
  `C-u C-c C-v k` erases all reports' results
