# add: add transactions

<!--
We'll use hledger's `add` command to append a new transaction to the journal file,
auto-creating the file if it doesn't exist.
-->

Instead of using a text editor and writing journal entries yourself,
you can run `hledger add`, which will prompt you for the information needed,
and provide useful defaults and completions.

## Recording starting balances

So let's say we want to add this entry,
from [Set starting balances](set-starting-balances.md):

```journal
2025-07-01 starting balances
    assets:cash              $10
    equity:start            $-10
```

Run the `add` command:

```
$ hledger add
```

It first prints some help. (On Windows, this is slightly wrong: the TAB key won't work there.)
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
$
```
hledger starts to read another transaction.
Instead, press `.` and RETURN to end the `add` session and exit to the command line.


## Recording a purchase

Here's another example, in more detail: recording an imaginary purchase at the supermarket.

```cli
$ hledger add
Creating hledger journal file "/home/YOU/.hledger.journal".
Adding transactions to journal file /home/YOU/.hledger.journal
Any command line arguments will be used as defaults.
Use tab key to complete, readline keys to edit, enter to accept defaults.
An optional (CODE) may follow transaction dates.
An optional ; COMMENT may follow descriptions or amounts.
If you make a mistake, enter < at any prompt to restart the transaction.
To end a transaction, enter . when prompted.
To quit, enter . at a date prompt or press control-d or control-c.
Date [2023-05-25]:
```

`add` prompts for each transaction field. The first is the date.
The value in square brackets is the suggested default (today's date). Press enter to accept it.

```cli
Description: trip to the supermarket
```

Transactions have an optional description (a single line of text) to help you understand them.
You can describe the transaction here, or put a payee name, or leave it blank. 
Type `trip to the supermarket` and press enter.

```cli
Account 1: expenses
```

Transactions have two or more accounts. Keep it simple; just enter `expenses` for the first one.

If you're thinking "expenses sounds more like a category": it is, but double entry accounting calls those "accounts", too.
A purchase is a transfer of money from an asset account to an expense account.
An asset is something you own, like some money in a bank account or in your pocket.
Once the money has been "moved" to an expense, you no longer own it, but the increasing balance in the expense account reminds you where it went.

```cli
Amount  1: $10
```

The amount being "moved" to `expenses`. 
You can use any currency or commodity symbol here; for this example we'll assume 10 US dollars.

```cli
Account 2: assets
```

Next, specify which account the money comes from. Just say `assets`.

```cli
Amount  2 [$-10]: 
```

Now you're asked for the amount to "move" to or from the `assets` account.
As the default, hledger offers the amount required to "balance" the postings entered so far.
The minus sign indicates the money is moving from this account.
(hledger uses the positive and negative sign instead of accounting's traditional "debit" and "credit" terminology.)
In a balanced transaction, the sum of posted amounts is zero, in other words no money disappears into thin air.
Press enter to accept the default.

```cli
Account 3 (or . or enter to finish this transaction): .
```

Press enter to finish entering this transaction.

```cli
2023-05-25 trip to the supermarket
    expenses             $10
    assets              $-10

Save this transaction to the journal ? [y]:
```

You are given a chance to review the transaction just entered.
Here you see hledger's plain text data format for journal entries:
a non-indented YYYY-MM-DD date, space, and description,
followed by two or more indented posting lines, each containing an account name,
two or more spaces, and an amount. 
(Account names can contain spaces, so at least two spaces are needed to separate them from the amount.)
Press enter to save the journal entry.

```cli
Saved.
Starting the next transaction (. or ctrl-D/ctrl-C to quit)
Date [2023-05-25]: <CTRL-D>
```

hledger has saved it to the journal file and is ready for the next
entry.  Hold down the control key and press d once to exit.



<br>

(Part of [hledger by example](hledger-by-example.md).)
