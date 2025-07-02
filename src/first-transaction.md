# First transaction: starting balances

We'll use hledger's `add` command to append a new transaction to the journal file,
auto-creating the file if it doesn't exist.

The first transaction in a journal is usually a special "starting balances" transaction,
which sets up the starting balances in one or more asset and liability accounts.
(*Assets* are things you own, like a bank checking account or the cash in your wallet.
*Liabilities* are things you owe, like a credit card balance.)

Let's record just one starting balance: how much cash is in your wallet today.
Run `hledger add` (and if you're on Windows, add `--color=no` for now):

```
PS C:\Users\Simon> hledger add --color=no
Adding transactions to journal file C:\Users\Simon\.hledger.journal
Any command line arguments will be used as defaults.
Use tab key to complete, readline keys to edit, enter to accept defaults.
```
(On Windows, the tab key won't work.)

```
An optional (CODE) may follow transaction dates.
An optional ; COMMENT may follow descriptions or amounts.
If you make a mistake, enter < at any prompt to go one step backward.
To end a transaction, enter . when prompted.
To quit, enter . at a date prompt or press control-d or control-c.
Date [2025-07-01]:
```
Press enter to accept today's date.

```
Description: starting balances
```
Enter the optional description, such as "starting balances", and press enter.

```
Account 1: assets:cash
```
Enter an account name. I am calling the wallet "assets:cash".
You can use any account names that make sense to you.
But, more about account names later. 

```
Amount  1: $10
```
Instead of "$10", enter the amount currently in your wallet,
and whatever currency symbol or currency code is appropriate.
If you have multiple currencies, just record the main one for now.

```
Account 2: equity:start
```
Every transaction involves two or more accounts.
Since $10 has appeared in assets:cash, we must say where it came from.
Starting balances always come from a special equity account, which I have called "equity:start".
(*Equity* represents "ownership" and other things; if you're doing personal accounting, this might be the only time you'll use it.)

```
Amount  2 [$-10]:
```
Every transaction moves an amount between accounts, with none left over.
As the default value, hledger suggests the amount that will balance the transaction.
Press enter to accept it.

```
Account 3 (or . or enter to finish this transaction):
```
Transactions can involve any number of accounts, though two is the most common.
Press enter to complete this transaction.

```
2025-07-01 starting balances
    assets:cash              $10
    equity:start            $-10

Save this transaction to the journal ? [y]:
```
hledger shows a preview of the journal entry that will be appended to the journal file.
Press enter to accept it.

```
Saved.
Starting the next transaction (. or ctrl-D/ctrl-C to quit)
Date [2025-07-01]: .
PS C:\Users\Simon>
```
hledger starts to read another transaction.
Press `.` and enter to end the `add` session and return to the command line.

Now, if you reran `hledger setup` you would see:

![hledger setup 2 in powershell](images/hledger-setup-2-powershell.png)


And `hledger files` lists the file:
```
PS C:\Users\Simon> hledger files
C:\Users\Simon\.hledger.journal
```


(Part of [hledger by example](hledger-by-example.md).)
