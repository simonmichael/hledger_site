# hledger accounting concepts

### Assets, Liabilities and Equity

Accounting describes the status of a business, person or other entity at any point in time in terms of three amounts:

- **Assets**      - Things owned
- **Liabilities** - Things owed
- **Equity**      - The amount invested by owners/shareholders

The foundation of double-entry accounting is the [accounting equation](http://en.wikipedia.org/wiki/accounting_equation), which says
Equity is always equal to Assets minus Liabilities (or, Net Assets).

This is also written as: Assets = Liabilities + Equity.
Another way to say it: what the entity owns is funded either by debt or by the capital provided by its owners.

These three are called the Balance Sheet accounts. Their balances summarise the overall financial status at some point in time.


### Revenue and Expenses

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


### Chart of Accounts

Five numbers do not give a lot of detail. If you want to know what
portion of expenses went to buy food, you could add up just the
transactions with (say) "supermarket" in their description. You know how to do this with hledger:

```shell
$ hledger register desc:supermarket expenses
2015/05/25 trip to the super..  expenses                       $10           $10
```

But descriptions are irregular, and as you can see we missed the $5 purchase on the following day.

Instead, the major "top-level" accounts above are subdivided into subaccounts which can be used
in transactions, thereby categorising them in a more structured way.
If needed, these subaccounts can be subdivided further.
This tree of accounts is called the Chart of Accounts. Here's a simple example
where `assets`, `revenue` and `expenses` each have a few subaccounts:

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

### Subaccounts in hledger

With hledger, tree structure is implied by writing account names like `ACCOUNT:SUBACCOUNT`.
Try it: edit your journal file and change the account names like so:

```shell
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
```shell
$ hledger accounts
assets:cash
assets:checking
expenses:food
expenses:supplies
```

and `accounts --tree` will show the tree structure, indenting subaccounts below their parents (and eliding the common part of their names):
```shell
assets
  cash
  checking
expenses
  food
  supplies
```

Conversely, the `balance` command shows the tree structure by default:
```shell
$ hledger balance
                $-15  assets
                 $-5    cash
                $-10    checking
                 $15  expenses
                  $5    food
                 $10    supplies
--------------------
                   0
```

As you can see, the balance reported for parent accounts includes the
balances of any subaccounts (it would also include any postings to the
parent account itself.)

To see full account names in a flat list, use `--flat`:

```shell
$ hledger balance --flat
                 $-5  assets:cash
                $-10  assets:checking
                  $5  expenses:food
                 $10  expenses:supplies
--------------------
                   0
```

hledger accepts whatever account names you choose, so you can use as much or as little account hierarchy as you need.
Most users have at least two levels of accounts.
You can limit the amount of detail in a balance report by hiding accounts below a certain depth:

```shell
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
