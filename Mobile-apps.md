Entering expenses on the spot using a mobile device can be convenient. One of the challenges is finding apps that focus on making this efficient. 

## Apps with CSV export

The general workflow here is that every so often you manually initiate a CSV export from the app.
Usually it runs a HTTP server and you can fetch the data to your main machine with curl.
Then, with suitable CSV rules, either run hledger reports directly from the CSV file,
or convert it/import the new transactions into a more permanent journal file.
A script or Makefile to automate this can be helpful.

Here are some apps I have tried, add any others that you find useful.

- [expense](http://ela.build/expense) (iOS).
Minimal interface for expense tracking only. CSV export supported.

- [XpenseTracker, BizXpenseTracker](http://www.silverwaresoftware.com/XpenseTracker.html) (iOS).
Comprehensive and serviceable money & time tracking apps.
[CSV rules](https://github.com/simonmichael/hledger/blob/master/examples/csv/xpensetracker.csv.rules),
[Makefile](https://gist.github.com/simonmichael/06eed26bcc85c76d1604373418bc6c58)

- [Eternity](http://www.komorian.com/eternity.html) (iOS).
Excellent time tracking app.
[CSV rules](https://github.com/simonmichael/hledger/blob/master/examples/csv/eternity.csv.rules)

## Apps that talk to a hledger-web or hledger-api server

- [MoLe](https://gitlab.com/fdroid/fdroiddata/merge_requests/4450#note_142213241) (Android).
A data entry app that talks to a hledger-web server.
Currently hledger-web 1.10 only.
![MoLe-1](https://i.imgur.com/DUUlv2H.png){width=30%}
![MoLe-2](https://i.imgur.com/QN66xpJ.png){width=30%}
