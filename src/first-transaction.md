# First transaction: starting balances

We'll use hledger's `add` command to append a new transaction to the journal file,
auto-creating the file if it doesn't exist.

The first transaction in a journal is usually a special "starting balances" transaction,
which sets up the starting balances in one or more asset and liability accounts.
(*Assets* are things you own, like a bank checking account or the cash in your wallet.
*Liabilities* are things you owe, like a credit card balance.)

Let's record just one starting balance: how much cash is in your wallet today.
Run `hledger add` (and if you're on Windows, add `--color=no` for now):

<br>

```
PS C:\Users\Simon> hledger add --color=no
Adding transactions to journal file C:\Users\Simon\.hledger.journal
Any command line arguments will be used as defaults.
Use tab key to complete, readline keys to edit, enter to accept defaults.
```
(Note: the TAB key won't complete input on Windows, contrary to what the help says.)

```
An optional (CODE) may follow transaction dates.
An optional ; COMMENT may follow descriptions or amounts.
If you make a mistake, enter < at any prompt to go one step backward.
To end a transaction, enter . when prompted.
To quit, enter . at a date prompt or press control-d or control-c.
Date [2025-07-01]:
```
`add` prompts you for the transaction's date. Press RETURN to accept today's date.

<br>

```
Description: starting balances
```
Type a description, such as "starting balances", and press RETURN.

<br>

```
Account 1: assets:cash
```
Type an account name. I am calling the wallet "assets:cash".
You can use any account names that make sense to you, in your preferred language.
But, more about account names later. 

<br>

```
Amount  1: $10
```
Instead of "$10", enter the amount currently in your wallet,
and whatever currency symbol or currency code is appropriate.
If you have multiple currencies, just record the main one for now.

<br>

```
Account 2: equity:start
```
Transactions involve two or more accounts.
Since $10 has appeared in assets:cash, we must say where it came from.
Starting balances always come from an equity account.
(*Equity* represents "ownership" and other things; if you're doing personal accounting, this might be the only time you'll use it.)

<br>

```
Amount  2 [$-10]:
```
Transactions move an amount between accounts, with none of it "left over".
The assets:cash account was increased by $10, so some other account must be decreased by the same amount.
hledger suggests this balancing amount as the default input: $-10.
Press RETURN to accept it.

<br>

```
Account 3 (or . or enter to finish this transaction):
```
Transactions can involve any number of accounts, though two is the most common.
Press RETURN to complete this transaction.

<br>

```
2025-07-01 starting balances
    assets:cash              $10
    equity:start            $-10

Save this transaction to the journal ? [y]:
```
hledger shows a preview of the journal entry that will be appended to the journal file.
Press RETURN to accept it.

<br>

```
Saved.
Starting the next transaction (. or ctrl-D/ctrl-C to quit)
Date [2025-07-01]: .
PS C:\Users\Simon>
```
hledger starts to read another transaction.
Press `.` and RETURN to end the `add` session and exit to the command line.

<br>

Now, if you reran `hledger setup` you would see:

![hledger setup 2 in powershell](images/hledger-setup-2-powershell.png)


And `hledger files` lists the file:
```
PS C:\Users\Simon> hledger files
C:\Users\Simon\.hledger.journal
```


(Part of [hledger by example](hledger-by-example.md).)
