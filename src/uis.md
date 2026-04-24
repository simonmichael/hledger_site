# User Interfaces

Here is an overview of the [user interfaces](https://plaintextaccounting.org/#ui-terminal) available for hledger.
The official UIs are marked in bold.
Last updated: 2026-04

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

**Android**

- [NanoLedger](https://f-droid.org/en/packages/be.chvp.nanoledger) data entry app for h/ledger (kotlin, 2023..)
- [cashier](https://github.com/alensiljak/cashier) mobile or desktop client for ledger and hledger-web (Android/Desktop, [js](https://cashier.alensiljak.eu.org/#/home), 2019)
- [MoLe](https://fossdroid.com/a/mole.html) mobile client for hledger-web ([java](https://git.ktnx.net/?p=mobile-ledger.git), 2020)

See also: [Mobile apps](mobile.md)

## Test matrix

Here is the start of a test matrix for the main UIs.
Your help is welcome! Share updates in the chat room.

|                   | install | basic | synthetic | accounttypes |
|-------------------|---------|-------|-----------|--------------|
| **Terminal**      |         |       |           |              |
| hledger           | Y       | Y     | Y         | Y            |
| hledger-ui        | Y       | Y     | Y         | Y            |
| hledger-iadd      | Y       | Y     | Y         | Y            |
| hledger-textual   | Y       | Y     | Y         | Y            |
| dravik            | N*      |       |           |              |
| ldash             | Y       | N*    | N*        | N*           |
| puffin            | Y       | Y*    | Y         | Y            |
| **Graphical**     |         |       |           |              |
| fruit-credits     |         |       |           |              |
| hledger-macos     |         |       |           |              |
| Surebeans         |         |       |           |              |
| **Web**           |         |       |           |              |
| hledger-web       | Y       | Y     | Y         | Y            |
| hledger-webuix    |         |       |           |              |
| muhasib-e-hledger |         |       |           |              |
| ledgeraccounting  |         |       |           |              |
| nextcloud-hledger |         |       |           |              |
| Paisa             |         |       |           |              |
| **Android**       |         |       |           |              |
| NanoLedger        |         |       |           |              |
| cashier           |         |       |           |              |
| MoLe              |         |       |           |              |

Tests:

- **install** - did SM's latest install attempt succeed.
- **basic** - does it read [bcexample.hledger](https://raw.githubusercontent.com/simonmichael/hledger/refs/heads/main/examples/bcexample.hledger),
  a simple multicommodity journal with conventional english account names, 1000 realistic transactions.
- **synthetic** - does it read [1ktxns-100accts.journal](https://raw.githubusercontent.com/simonmichael/hledger/refs/heads/main/examples/1ktxns-100accts.journal),
  a synthetic journal with unconventional account names and no account types, 1000 transactions, transacted prices and market prices.
- **accounttypes** - does it work equally well with non-english/non-conventional account names which have types declared.

Notes:

- dravik: Failed to build `pydantic-core==2.33.2`
- ldash: attempt to divide by zero
- puffin: could not navigate to past years
