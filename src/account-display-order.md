# Account display order
    
hledger displays accounts in alphabetic order by default.
That's not always the conventional or preferred order, so here's how to customise it:
add some `account` directives to the journal, eg at the top, in the desired order.

For example, the following account names would display in this alphabetic order by default:
```
assets
equity
expenses
income
liabilities


```journal
account assets                     ; type:A
account assets:bank                ; type:C
account assets:cash                ; type:C
account liabilities                ; type:L
account equity                     ; type:E
account equity:conversion          ; type:V
account income                     ; type:R
account expenses                   ; type:X
```


## Accounting equation

These accounts combine in an interesting [equation](https://en.wikipedia.org/wiki/Accounting_equation),
which most hledger users don't need to care about (but we'll revisit it later).
<!--
There is an Accounting Equation that can prevent many bookkeeping errors.
It says that the total of Assets plus Liabilities is matched by Equity.
In shorthand: A+L=E.
(Or you may see it written with Revenues and Expenses mentioned separately,
and with different sign conventions; eg A+L+E+R+X=0.)
-->


| hledger name | short name | description                                      |
|--------------|------------|--------------------------------------------------|
| `Asset`      | `A`        | things you own                                   |
| `Cash`       | `C`        | liquid assets (part of Assets)                   |
| `Liability`  | `L`        | things you owe                                   |
| `Equity`     | `E`        | owners' investment and some other things         |
| `Revenue`    | `R`        | inflows (also known as `Income`; part of Equity) |
| `Expense`    | `X`        | outflows (part of Equity)                        |
| `Conversion` | `V`        | currency conversions (part of Equity)            |


```
```

Example:
```
```

Example:
```
```

<br>

(Part of [hledger by example](hledger-by-example.md).)


<!--

As a convenience, hledger will detect these types automatically from english account names.
But it's better to declare them explicitly by adding a `type:` [tag](#tags) in the account directives.
The tag's value can be any of the types or one-letter abbreviations above.

Here is a typical set of account type declarations.
Subaccounts will inherit their parent's type, or can override it:

```journal
account assets             ; type: A
account liabilities        ; type: L
account equity             ; type: E
account revenues           ; type: R
account expenses           ; type: X

account assets:bank        ; type: C
account assets:cash        ; type: C

account equity:conversion  ; type: V
```

This enables the easy [balancesheet], [balancesheetequity], [cashflow] and [incomestatement] reports, and querying by [type:](#queries).

Tips:

- You can list accounts and their types, for troubleshooting:
  ```cli
  $ hledger accounts --types [ACCTPAT] [type:TYPECODES] [-DEPTH] [--positions]
  ```

- It's a good idea to declare at least one account for each account type.
  Having some types declared and some inferred can disrupt certain reports.

- The rules for inferring types from account names are as follows (using [Regular expressions](#regular-expressions)). \
  If they don't work for you, just ignore them and declare your types with `type:` tags.
  <!-- monospace to work around https://github.com/simonmichael/hledger/issues/1573 -->
  ```
  If account's name contains this case insensitive regular expression | its type is
  --------------------------------------------------------------------|-------------
  ^assets?(:.+)?:(cash|bank|che(ck|que?)(ing)?|savings?|current)(:|$) | Cash
  ^assets?(:|$)                                                       | Asset
  ^(debts?|liabilit(y|ies))(:|$)                                      | Liability
  ^equity:(trad(e|ing)|conversion)s?(:|$)                             | Conversion
  ^equity(:|$)                                                        | Equity
  ^(income|revenue)s?(:|$)                                            | Revenue
  ^expenses?(:|$)                                                     | Expense
  ```

- As mentioned above, subaccounts will inherit a type from their parent account. 
  To be precise, an account's type is decided by the first of these that exists:

  1. A `type:` declaration for this account.
  2. A `type:` declaration in the parent accounts above it, preferring the nearest.
  3. An account type inferred from this account's name.
  4. An account type inferred from a parent account's name, preferring the nearest parent.
  5. Otherwise, it will have no type.

- [Account aliases](#alias-directive) can [disrupt](#aliases-and-account-types) account types.

-->
