# Accounting basics for PTA users

<div class=pagetoc>

<!-- toc -->
</div>

Here we'll give a quick hledger-oriented intro to some useful accounting concepts,
using the journal file created in [Tutorial: hledger add](add.md).
Also we'll discuss account hierarchy in hledger.


## Debits and Credits

Double-entry bookkeeping traditionally names movements of money as
["debits" or "credits"](https://en.wikipedia.org/wiki/Debits_and_credits).
As an error-checking mechanism, the debits must exactly balance the credits,
both within each individual transaction and over all transactions.

## Signed numbers

hledger and most other plain text accounting tools use positive and negative sign
instead of the debit and credit labels.
This is essentially the same system, but most people find it easier to learn than the debit/credit terminology.
Positive numbers are debits, negative numbers are credits,
and within each transaction (and over all transactions) the sum of amounts must be zero.

As a consequence in hledger and similar PTA tools, it's common for reports to show
equity, liability, and revenue (income) balances as negative numbers.
(Some hledger reports/options can show them as positive for readability.)

Here is [Ledger's discussion of this](https://www.ledger-cli.org/3.0/doc/ledger3.html#Stating-where-money-goes).

## Assets, Liabilities and Equity

Accounting describes the status of a business, person or other entity at any point in time in terms of three amounts:

- **Assets**      - Things owned
- **Liabilities** - Things owed
- **Equity**      - The amount invested by owners/shareholders

The foundation of double-entry accounting is the [accounting equation](http://en.wikipedia.org/wiki/accounting_equation), which says
Equity is always equal to Assets minus Liabilities (or, Net Assets).

This is also written as: Assets = Liabilities + Equity.
Another way to say it: what the entity owns is funded either by debt or by the capital provided by its owners.

These three are called the Balance Sheet accounts. Their balances summarise the overall financial status at some point in time.


## Revenue and Expenses

Two more amounts are used to describe changes in the above during a given period:

- **Revenue**     - Money flowing in
- **Expenses**    - Money flowing out

You may be accustomed to using the word Income instead Revenue.
That's fine, just remember that Income is sometimes used to mean Net
Income, which is Revenue - Expenses.

These two are called the Income Statement accounts.  The balances they
accumulate during some period of time indicate the inflows and
outflows during that period (which will affect the Assets and
Liabilities balances).


## Chart of Accounts

Five numbers do not give a lot of detail. If you want to know what
portion of expenses went to buy food, you could add up just the
transactions with (say) "supermarket" in their description. You know how to do this with hledger:

```cli
$ hledger register desc:supermarket expenses
2015/05/25 trip to the super..  expenses                       $10           $10
```

But descriptions are irregular, so eg the report above misses
[the $5 purchase on the following day](add.md#record-a-transaction-by-editing).

Instead, bookkeepers usually subdivide the top-level accounts into subaccounts, subsubaccounts, etc.
which can be used in transactions to record more specific categories.
This forms a hierarchy or tree of accounts, called the Chart of Accounts. 
Here's a simple example where `assets`, `revenue` and `expenses` each have a few subaccounts:

```
assets
  checking
  cash
liabilities
equity
revenue
  business income
  gifts received
expenses
  food
  rent
  supplies
```

In some organisations and accounting systems (eg, QuickBooks), the
tree structure is de-emphasised, so the above is represented more
like:

```
 Account name      Account type
 ------------------------------- 
 checking          ASSET
 cash              ASSET
 business income   REVENUE
 gifts received    REVENUE
 food              EXPENSE
 rent              EXPENSE
 supplies          EXPENSE
```

In others, the tree structure is encoded as decimal account numbers, something like this:

```
1000 assets
1100   checking
1200   cash
2000 liabilities
3000 equity
4000 revenue
4100   business income
4200   gifts received
5000 expenses
5100   food
5200   rent
5300   supplies
```

## A digression: subaccounts in hledger

With hledger, tree structure is implied by writing account names like `ACCOUNT:SUBACCOUNT`.
Try it: edit your journal file and change the account names like so:

```cli
$ cat ~/.hledger.journal

2015/05/25 trip to the supermarket
    expenses:supplies           $10
    assets:checking            $-10

2015/05/26 forgot the bread
    expenses:food            $5
    assets:cash
```

hledger will infer the chart of accounts from these names.
The `accounts` command will list all accounts posted to:
```cli
$ hledger accounts
assets:cash
assets:checking
expenses:food
expenses:supplies
```

and `accounts --tree` will show the tree structure, indenting subaccounts below their parents (and eliding the common part of their names):
```cli
$ hledger accounts --tree
assets
  cash
  checking
expenses
  food
  supplies
```

Similarly, the `balance` command shows a flat list of accounts and their balance changes, by default:
```cli
$ hledger balance
                 $-5  assets:cash
                $-10  assets:checking
                  $5  expenses:food
                 $10  expenses:supplies
--------------------
                   0
```

And with `--tree`, it shows the account hierarchy:

```cli
$ hledger balance --tree
                $-15  assets
                 $-5    cash
                $-10    checking
                 $15  expenses
                  $5    food
                 $10    supplies
--------------------
                   0
```
In tree mode, the balance reported for parent accounts includes the balances of any subaccounts.
Eg above, the $15 expenses balance is the sum of the subaccount balances ($5 expenses:food and $10 expenses:supplies).

hledger accepts whatever account names you choose, so you can use as much or as little account hierarchy as you need.
Most users have at least two levels of accounts.
You can limit the amount of detail in a balance report by hiding accounts below a certain depth:

```cli
$ hledger balance --depth 1
                $-15  assets
                 $15  expenses
--------------------
                   0
```





<!--

### Transactions

A transaction is a movement of money from some account(s) to some
other account(s).  There are many common types of transaction.  A
purchase is where money moves from an asset account to an expense
account.  Eg, buying food.

-->

<!-- TODO make date-independent -->
