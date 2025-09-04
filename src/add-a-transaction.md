# Add a transaction: starting balances

<!--
We'll use hledger's `add` command to append a new transaction to the journal file,
auto-creating the file if it doesn't exist.
-->

The first transaction in a journal is usually a "starting balances" transaction,
which sets up the starting balances in one or more asset and liability accounts.
(*Assets* are things you own, like a bank checking account or the cash in your wallet.
*Liabilities* are things you owe, like a credit card balance.)

Let's start by recording one starting balance: how much cash is in your wallet today.
You can do it quickly with a text editor, or with more guidance using hledger's `add` command. We'll show both. (hledger-web is another way.)
## Using a text editor
If you're comfortable using text editors, open the journal file in your favourite editor.
(If you forgot where the journal file is, run `hledger files`.)
Then add an entry something like the below. Use today's date and the actual currency and amount.
Feel free to adapt the account names and description, too (more on account names later):
```journal
2025-07-01 starting balances
    assets:cash              $10
    equity:start            $-10
```
This means "on july 1st 2025, 10 dollars was transferred from equity:start to assets:cash".
This is how bookkeepers say "we'll start tracking the assets:cash balance from july 1st onward".
The next section steps through this entry in more detail.

## Using hledger add
Or, you can create the same entry using hledger's easy `add` command.
`add` will prompt you for the information needed.
And it provides useful defaults and completions (especially later when you have more data).

Run it like so (if you're on Windows, also write `--color=no`):

```
PS C:\Users\Simon> hledger add --color=no
```

<br>

It first prints some help (which is slightly wrong for Windows: the TAB key won't work there):
```
Adding transactions to journal file C:\Users\Simon\.hledger.journal
Any command line arguments will be used as defaults.
Use tab key to complete, readline keys to edit, enter to accept defaults.
An optional (CODE) may follow transaction dates.
An optional ; COMMENT may follow descriptions or amounts.
If you make a mistake, enter < at any prompt to go one step backward.
To end a transaction, enter . when prompted.
To quit, enter . at a date prompt or press control-d or control-c.
Date [2025-07-01]:
```
Then it prompts you for the transaction's date. Press RETURN to accept today's date.

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
You have recorded your first transaction!

<br>

(Part of [hledger by example](hledger-by-example.md).)
