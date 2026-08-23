# Accounting basics

An interlude: here is a quick intro to some useful accounting concepts,
for hledger (and plain text accounting) users.


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
Some hledger reports can show them as positive by default.

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

You may be accustomed to using the word Income instead of Revenue.
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

So we usually subdivide the top-level accounts into subaccounts, subsubaccounts, etc.
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

You don't have to use a hierarchy; you may prefer a flat list of account names.
But it helps keep things organised and precise.

With hledger, tree structure is implied by colons in account names.
Eg `assets:checking` or `revenues:business income`.


<br>

(Part of [hledger by example](hbe.md).)
