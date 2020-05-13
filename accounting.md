# Accounting concepts; hledger's account hierarchy

Here we'll give a quick hledger-oriented intro to some useful accounting concepts
(continuing with the journal file from [Easy workflow #1: hledger add](add.html)).
At the end, there's a collection of useful links to learn more.

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

## A digression: subaccounts in hledger

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

## Accounting links

### General

- Wikipedia:
 [Accounting](http://en.wikipedia.org/wiki/Accounting),
 [Bookkeeping](http://en.wikipedia.org/wiki/Bookkeeping),
 [Double-entry bookkeeping system](http://en.wikipedia.org/wiki/Double_entry_bookkeeping_system),
 [General journal](http://en.wikipedia.org/wiki/General_journal)
 etc.
- [Accounting For Dragons](http://podcastle.org/2009/10/09/pc-miniature-38-accounting-for-dragons) why you should know accounting
- Cliffs Notes:
  [Accounting Principles I](https://www.cliffsnotes.com/study-guides/accounting/accounting-principles-i),
  [Accounting Principles II](https://www.cliffsnotes.com/study-guides/accounting/accounting-principles-ii)
- [Bean Counter](http://www.dwmbeancounter.com/) - tutorials, such as
  [So, you want to learn Bookkeeping!](http://www.dwmbeancounter.com/tutorial/Tutorial.html).
  This has been recommended on the ledger list and [on HN](https://news.ycombinator.com/item?id=17245101).
- [Accounting Coach](https://www.accountingcoach.com/)
- [Accounting Basics](http://www.accountingverse.com/accounting-basics/)
- [Guru 99 Accounting Tutorials](http://www.guru99.com/accounting.html)
- [principlesofaccounting.com](http://www.principlesofaccounting.com)
- [Double Entry Bookkeeping](http://c2.com/cgi/wiki?DoubleEntryBookkeeping) discussion by software developers at the WikiWikiWeb
- [Winning Financially is Simple](http://directory.libsyn.com/episode/index/show/youneedabudget/id/2657122) and other good episodes from the [YNAB Podcast](http://directory.libsyn.com/shows/view/id/youneedabudget)
- [Back to the Stone Age: Low-Tech Expense Tracking](http://www.getrichslowly.org/blog/2011/02/28/back-to-the-stone-age-low-tech-expense-tracking/) Get Rich Slowly
- [Track Every Penny You Spend](http://www.getrichslowly.org/blog/2006/09/22/track-every-penny-you-spend/) Get Rich Slowly
- [I’ve Tracked My Expenses — Now What?](http://www.getrichslowly.org/blog/2011/04/08/ask-the-readers-ive-tracked-my-expenses-now-what/) Get Rich Slowly
- [A Slow-Tech Approach to Tracking Spending](http://mobile.nytimes.com/2014/05/12/your-money/household-budgeting/a-slow-tech-approach-to-tracking-spending.html)
- [Your Financial Network Map](http://www.bargaineering.com/articles/financial-network-map.html)
- [The Accountancy Model and The Accountancy Model Examples](https://www.google.com/search?hl=en&q=%2B%22The%20Accountancy%20Model%22%20%2B%22The%20Accountancy%20Model%20Examples%22) - two free books by Tim Riley
- [Gnucash and double entry accounting](http://www.austintek.com/gnucash/ncsa-gnucash-talk.html) - double entry accounting introduction with examples
- [Accounting for Computer Scientists](http://martin.kleppmann.com/2011/03/07/accounting-for-computer-scientists.html)
- [Tutorial on multiple currency accounting](http://www.mscs.dal.ca/~selinger/accounting/tutorial.html) by Peter Selinger

### Theory

- [Algebraic Models for Accounting Systems](https://www.amazon.com/Algebraic-Accounting-Systems-Salvador-Rambaud/dp/9814287113) - recommended [on twitter](https://twitter.com/meekaale/status/1000426850819170304)
- [On Double-Entry Bookkeeping: The Mathematical Treatment](https://arxiv.org/abs/1407.1898) David Ellerman 2014, <http://www.ellerman.org/double-entry-bookkeeping>
- [Essence of Accounting](http://xbrl.squarespace.com/journal/2020/5/12/essence-of-accounting.html?printerFriendly=true) 
  *"A logical description of the record to report process: accounting, reporting, auditing, analysis"*, Charles Hoffman 2020

### History

- <https://en.wikipedia.org/wiki/History_of_accounting>
- [The Vanished Grandeur of Accounting](http://www.bostonglobe.com/ideas/2014/06/07/the-vanished-grandeur-accounting/3zcbRBoPDNIryWyNYNMvbO/story.html) (Boston Globe) & [discussion](https://news.ycombinator.com/item?id=7933746)
- <https://www.bbc.com/news/business-39870485>
- <http://www.accountingin.com/accounting-historians-journal/volume-11-number-1/the-significance-of-ancient-mesopotamia-in-accounting-history/>
- [Mesopotamian Tablet Collection](https://www.spurlock.illinois.edu/collections/notable-collections/profiles/mesopotamian-tablet.html) (Spurlock Museum}
- [Ledger Art](https://www.mpm.edu/research-collections/anthropology/online-collections-research/ledger-art-collection)
