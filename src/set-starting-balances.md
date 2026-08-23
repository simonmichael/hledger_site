# Set starting balances

The first transaction in a journal is usually a "starting balances" transaction,
which sets up the starting balances in one or more asset and liability accounts.
(*Assets* are things you own, like a bank checking account or the cash in your wallet.
*Liabilities* are things you owe, like a credit card balance.)

Let's start by recording one starting balance: how much cash is in your wallet today.

You can do it quickly with a text editor, which we'll show here.
If you don't have a familiar text editor, you can use hledger's `add`
or `web` commands instead; just skip ahead.

Open the journal file in your favourite editor.
(If you forgot where the journal file is, run `hledger files`.)

Then add an entry something like the below.
Use today's date and the actual currency and amount.
Feel free to adapt the account names and description, too.
(We'll say more about account names and the journal format soon.)

```journal
2025-07-01 starting balances
    assets:cash              $10
    equity:start            $-10
```
This means "on july 1st 2025, 10 dollars was transferred from equity:start to assets:cash".
This is how bookkeepers say "we'll start tracking the assets:cash balance from july 1st onward".

