# User Interfaces

Here is an overview of the [user interfaces](https://plaintextaccounting.org/#ui-terminal) available for hledger.
The official UIs, which are maintained within the hledger repo, are marked in bold.

**Terminal**

- **[hledger](hledger.md)** - the hledger command line tool
- **[hledger add](hledger.md#add)** - hledger's built-in prompting data entry UI
- **[hledger-ui](hledger-ui.md)** - a simple TUI
- [dravik](https://github.com/Yaser-Amiri/dravik) TUI for hledger viewing (python, 2025)
- [hledger-edit](https://pypi.org/project/hledger-utils/) open any subset of transactions in your editor (python, 2023)
- [hledger-iadd](https://github.com/hpdeifel/hledger-iadd) TUI for h/ledger transaction entry (haskell, 2015..)
- [hledger-textual](https://github.com/thesmokinator/hledger-textual) TUI for hledger viewing/entry/editing (python, 2026)
- [ldash](https://codeberg.org/md-weber/ldash) TUI for viewing portfolio, net worth and monthly budget (rust, 2026)
- [puffin](https://github.com/siddhantac/puffin) TUI for hledger viewing (go, 2023..)

**Graphical**

- [fruit-credits](https://codeberg.org/dz4k/fruit-credits) data entry/reporting GUI for hledger (vala+gnome, 2024)
- [hledger-macos](https://github.com/thesmokinator/hledger-macos) mac app for viewing/editing (swift, 2026)
- [Surebeans](https://surebeans.net) YNAB clone using hledger data format, providing data entry, budgeting, reports (closed source, cross platform, C#, 2026)

**Web**

- **[hledger-web](hledger-web.md)** - a simple web app. See also: [hledger-web tips](hledger-web-tips.md)
- [hledger-webuix](https://github.com/yga01/hledger-webuix) one-page local web app for hledger viewing, adding, editing (html+js, 2026)
- [muhasib-e-hledger](https://gitlab.com/shivjm/muhasib-e-hledger) web UI for hledger reports (rust, 2024)
- [Paisa](https://paisa.fyi) web UI or desktop app for ledger, hledger and beancount ([go/js/ts](https://github.com/ananthakumaran/paisa), 2022.., [demo](https://demo.paisa.fyi))
- [ledgeraccounting](https://github.com/thecount2a/ledgeraccounting) web UI for hledger: data entry, basic reports and budgets (python+js, 2018)
- [nextcloud-hledger](https://github.com/37Rb/nextcloud-hledger) hledger UI on the Nextcloud file-sharing/web-app platform (php, 2021)

**Mobile**

- [NanoLedger](https://f-droid.org/en/packages/be.chvp.nanoledger) data entry app for h/ledger (Android, kotlin, 2023..)
- [cashier](https://github.com/alensiljak/cashier) mobile or desktop client for ledger and hledger-web (Android/Desktop, [js](https://cashier.alensiljak.eu.org/#/home), 2019)
- [MoLe](https://fossdroid.com/a/mole.html) mobile client for hledger-web (Android, [java](https://git.ktnx.net/?p=mobile-ledger.git), 2020)

See also: [Mobile apps](mobile.md)

## Test matrix

Not all UIs are mature and robust.
Here is the start of a basic test matrix showing the status.

|                   | 1ktxns-100accts.journal |
|-------------------|-------------------------|
| **Terminal**      |                         |
| hledger           | Y                       |
| hledger add       | Y                       |
| hledger-ui        | Y                       |
| dravik            |                         |
| hledger-edit      |                         |
| hledger-iadd      |                         |
| hledger-textual   |                         |
| ldash             |                         |
| puffin            |                         |
| **Graphical**     |                         |
| fruit-credits     |                         |
| hledger-macos     |                         |
| Surebeans         |                         |
| **Web**           |                         |
| hledger-web       | Y                       |
| hledger-webuix    |                         |
| muhasib-e-hledger |                         |
| Paisa             |                         |
| ledgeraccounting  |                         |
| nextcloud-hledger |                         |
| **Mobile**        |                         |
| NanoLedger        |                         |
| cashier           |                         |
| MoLe              |                         |

Test notes:

Some files to test. Does the app handle these without trouble ?

- [bcexample.hledger](https://github.com/simonmichael/hledger/blob/main/examples/bcexample.hledger) - a simple but realistic journal with 1000 transactions, originally from the Beancount project.
- [1ktxns-100accts.journal](https://github.com/simonmichael/hledger/blob/main/examples/1ktxns-100accts.journal) - a synthetic journal with 1000 transactions, transacted prices, and market prices.
