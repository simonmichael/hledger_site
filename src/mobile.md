# Mobile apps

<div class=pagetoc>

<!-- toc -->
</div>

Entering expenses on the spot using a mobile device can be convenient. 
One of the challenges is finding apps that focus on making this efficient. 
Here are some options. See also:

<!-- not a list, to avoid sphinx TOC bug -->
<https://plaintextaccounting.org/#ui-mobile>

## Offline data entry apps
These apps saves a local *ledger file, which can be synced via Syncthing. For Adroid app there are two candidates: Cone and NanoLedger. Here is the difference between them:


|                          | Cone                                                                           | NanoLedger                                                                           |
| ------------------------ | ------------------------------------------------------------------------------ | ------------------------------------------------------------------------------------ |
| Journal view screen      | Transactions can be sorted by new to old or reversed, and elements are colored | Transactions can only be sorted by new to old, and elements aren't colored           |
| Transaction entry screen | The description field is a free form                                           | The description field is split into status field, payee field and note field         |
| Theme                    | Light, dark, auto                                                              | Always auto                                                                          |
| Modify old transaction   | No                                                                             | Yes. You can edit or delete old transaction, or use it as the template for a new one |
| License                  | GNU GPL v3                                                                     | MIT                                                                                  |
| Source                   | https://github.com/bradyt/cone                                                 | https://github.com/chvp/NanoLedger                                                   |
| F-Droid link             | https://f-droid.org/packages/info.tangential.cone/                             | https://f-droid.org/packages/be.chvp.nanoledger                                      |

Cone was born first, and it inspired NanoLedger. According to [NanoLedger's blog post](https://www.chvp.be/blog/nanoledger), it had some bugs when the journal file is synced with Nextcloud, and it's lagging if the file is pretty big.

A user on Reddit [reports](https://www.reddit.com/r/plaintextaccounting/comments/17sielr/nanoledger_android_app_for_data_entry_with) that Cone messed up their previous entry data on adding new entry.

### Ledger Expense Tracking 
Its last update was 2018, and you have to build the [source](https://github.com/jduepmeier/ledger-app) as there is no apk file available. 

## Apps that talk to hledger-web

### MoLe (Android, GNU GPL v3+)

<https://mole.ktnx.net>\
<https://git.ktnx.net/?p=mobile-ledger.git>\
A data entry app that talks to a hledger-web (1.14+) server.

<img src="https://camo.githubusercontent.com/7b3e91a4eca44a63091fb4dd3c969aa66bff9ded/68747470733a2f2f692e696d6775722e636f6d2f4455556c7632482e706e67" alt="MoLe-1" data-canonical-src="https://i.imgur.com/DUUlv2H.png" width="30%">
<img src="https://camo.githubusercontent.com/e38a7d08970fd0c024b52b28b26454761c705a9b/68747470733a2f2f692e696d6775722e636f6d2f514e363678704a2e706e67" alt="MoLe-2" data-canonical-src="https://i.imgur.com/QN66xpJ.png" width="30%">

## Apps with journal file export

### Cashier (PWA, GNU GPL v3)

<https://github.com/MisterY/cashier>\
[demo](https://cashier.alensiljak.eu.org)\
A progressive web application that can be used on desktop and
(offline!) on web-capable mobile devices for entering transactions
and viewing balances.
The transactions can be exported as a (h)ledger file. 
The future plans include data synchronization with an instance of hledger-web.

<img src="https://i.imgur.com/NdaUPtM.png" alt="Cashier options" width="30%" />
<img src="https://i.imgur.com/NMmmde3.png" alt="Cashier new transaction screen" width="30%" />

## Apps with CSV export

The general workflow here is that every so often you manually initiate a CSV export from the app.
Typically the app starts up a temporary HTTP server and you can fetch the data to your main machine with curl.
Then, with suitable CSV rules, either run hledger reports directly from the CSV file,
or convert it/import the new transactions into a more permanent journal file.
A script or Makefile to automate this can be helpful.

### GnuCash for Android

<https://github.com/codinguser/gnucash-android>\
[google play](https://play.google.com/store/apps/details?id=org.gnucash.android)\
Mobile UI for the mature GnuCash desktop accounting app.

<img src="https://lh3.googleusercontent.com/a3iiOacFjYfVIWuvfZ9mCgOgrlXwsFR_dsJEVfAXA6i1DaXWBCePrANMDQ-pdQQmaQ=w1280-h815" alt="GnuCash for Android accounts" width="30%" />
<img src="https://lh3.googleusercontent.com/du--h97sS01pb1w4vy05hvbCJWJinEqhNFtqn9g6NG94qch1Wd3d-2jTxVdBlrP1etQ=w1280-h815" alt="GnuCash for Android transactions" width="30%" />
<img src="https://lh3.googleusercontent.com/dobjDMrp2shRT6pc_UHxnQUhUdsG66XBKtadb71nLXkuJfbvca6MWUm4dC8KimnspA=w1280-h815" alt="GnuCash for Android reports" width="30%" />

### Eternity (IOS)

<http://www.komorian.com/eternity.html>\
Excellent time tracking app.
These [CSV rules](https://github.com/simonmichael/hledger/blob/master/examples/csv/eternity.csv.rules)
can be used to convert its CSV export to *ledger format.


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

Export to *ledger format: <https://github.com/ony/ledger-myexpenses> (2017)

Sync to/from Ledger: <https://gitlab.com/IanTwenty/ledgermyexpenses> (2023)
