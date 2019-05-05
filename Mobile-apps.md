Entering expenses on the spot using a mobile device can be convenient. One of the challenges is finding apps that focus on making this efficient. 

## Apps that use the ledger format

### cone (Android)

<https://github.com/bradyt/cone>, [f-droid](https://f-droid.org/en/packages/info.tangential.cone)\
Currently implements offline data entry to local directory, and so can be synced with server via Syncthing.

### MoLe (Android)
<https://gitlab.com/fdroid/fdroiddata/merge_requests/4450#note_142213241>\
A data entry app that talks to a hledger-web server.
Only works with certain hledger-web versions, eg 1.10.

<img src="https://camo.githubusercontent.com/7b3e91a4eca44a63091fb4dd3c969aa66bff9ded/68747470733a2f2f692e696d6775722e636f6d2f4455556c7632482e706e67" alt="MoLe-1" data-canonical-src="https://i.imgur.com/DUUlv2H.png" width="30%">
<img src="https://camo.githubusercontent.com/e38a7d08970fd0c024b52b28b26454761c705a9b/68747470733a2f2f692e696d6775722e636f6d2f514e363678704a2e706e67" alt="MoLe-2" data-canonical-src="https://i.imgur.com/QN66xpJ.png" width="30%">

## Apps with CSV export

The general workflow here is that every so often you manually initiate a CSV export from the app.
Typically the app starts up a temporary HTTP server and you can fetch the data to your main machine with curl.
Then, with suitable CSV rules, either run hledger reports directly from the CSV file,
or convert it/import the new transactions into a more permanent journal file.
A script or Makefile to automate this can be helpful.

Here are some apps I have tried, add any others that you find useful.

### Eternity (IOS)
<http://www.komorian.com/eternity.html>\
Excellent time tracking app.
[CSV rules](https://github.com/simonmichael/hledger/blob/master/examples/csv/eternity.csv.rules)

### Expense (IOS)
<http://ela.build/expense>\
Minimal interface for expense tracking only. CSV export supported.

### XpenseTracker, BizXpenseTracker (IOS)
<http://www.silverwaresoftware.com/XpenseTracker.html>\
Comprehensive and serviceable money & time tracking apps.
[CSV rules](https://github.com/simonmichael/hledger/blob/master/examples/csv/xpensetracker.csv.rules),
[Makefile](https://gist.github.com/simonmichael/06eed26bcc85c76d1604373418bc6c58)

## Apps with other ways to export

### MyExpenses (Android)
<http://www.myexpenses.mobi>\
GPL personal finance manager for Android.
<https://github.com/ony/ledger-myexpenses> converts the exported sqlite db to *ledger format.

### MoneyManagerEx for Android
<http://android.moneymanagerex.org/>\
Currently exports Qif format. 
[MoneyManagerExLib](https://gitlab.com/alensiljak/moneymanagerexlib) is a Python library that reads MMEx database and can export CSV.