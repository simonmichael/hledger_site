# Mobile apps

Entering expenses on the spot using a mobile device can be convenient. 
One of the challenges is finding apps that focus on making this efficient. 
Here are some options. See also:

- <https://github.com/bradyt/cone/wiki/Mobile-ledgers>
- <https://plaintextaccounting.org/#ui-mobile>


## Apps that use a plaintext accounting format


### Cashier (PWA, GNU GPL v3)

<https://gitlab.com/alensiljak/cashier>,
[demo](https://cashier.alensiljak.eu.org)\
A progressive web application that can be used on desktop and
(offline!) on web-capable mobile devices for entering transactions
and viewing balances.
The transactions can be exported as a (h)ledger file. 
The future plans include data synchronization with an instance of hledger-web.

<img src="https://i.imgur.com/NdaUPtM.png" alt="Cashier options" width="30%" />
<img src="https://i.imgur.com/NMmmde3.png" alt="Cashier new transaction screen" width="30%" />


### cone (Android, GNU GPL v3)

<https://github.com/bradyt/cone>\
Currently implements offline data entry, 
and saves a local *ledger file,
which can be synced with a server via Syncthing.


### Ledger Expense Tracking (Android)

<https://github.com/jduepmeier/ledger-app>, 
[google play](https://play.google.com/store/apps/details?id=com.mpease.ledger)\
Expense tracking app with *ledger export.


### MoLe (Android, GNU GPL v3+)

<https://mole.ktnx.net>,
<https://git.ktnx.net/?p=mobile-ledger.git>\
A data entry app that talks to a hledger-web (1.14+) server.

<img src="https://camo.githubusercontent.com/7b3e91a4eca44a63091fb4dd3c969aa66bff9ded/68747470733a2f2f692e696d6775722e636f6d2f4455556c7632482e706e67" alt="MoLe-1" data-canonical-src="https://i.imgur.com/DUUlv2H.png" width="30%">
<img src="https://camo.githubusercontent.com/e38a7d08970fd0c024b52b28b26454761c705a9b/68747470733a2f2f692e696d6775722e636f6d2f514e363678704a2e706e67" alt="MoLe-2" data-canonical-src="https://i.imgur.com/QN66xpJ.png" width="30%">



## Apps with CSV export

The general workflow here is that every so often you manually initiate a CSV export from the app.
Typically the app starts up a temporary HTTP server and you can fetch the data to your main machine with curl.
Then, with suitable CSV rules, either run hledger reports directly from the CSV file,
or convert it/import the new transactions into a more permanent journal file.
A script or Makefile to automate this can be helpful.


### Eternity (IOS)

<http://www.komorian.com/eternity.html>\
Excellent time tracking app.
These [CSV rules](https://github.com/simonmichael/hledger/blob/master/examples/csv/eternity.csv.rules)
can be used to convert its CSV export to *ledger format.


### Expense (IOS)

<http://ela.build/expense>\
Minimal interface for expense tracking only. CSV export supported.


### XpenseTracker, BizXpenseTracker (IOS)

<http://www.silverwaresoftware.com/XpenseTracker.html>\
Comprehensive and serviceable money & time tracking apps.
[CSV rules](https://github.com/simonmichael/hledger/blob/master/examples/csv/xpensetracker.csv.rules),
[Makefile](https://gist.github.com/simonmichael/06eed26bcc85c76d1604373418bc6c58)



## Apps with other ways to export


### Money Manager Ex for Android (Android, GNU GPL v3)

<http://android.moneymanagerex.org>,
<https://github.com/moneymanagerex/android-money-manager-ex>\
Android port of the [Money Manager Ex](https://www.moneymanagerex.org) cross platform finance application.
The [MoneyManagerExLib](https://gitlab.com/alensiljak/moneymanagerexlib) python library can be used to convert its db to *ledger format.


### MyExpenses (Android, GNU GPL v3+)

<http://www.myexpenses.mobi>,
<https://github.com/mtotschnig/MyExpenses>\
GPL personal finance manager for Android.
The <https://github.com/ony/ledger-myexpenses> tool converts its exported sqlite db to *ledger format.

