# Using `hledger roi` to compute return on investment

## Cash-only investments

Let's consider the easy case first, where your assets and your
investment is the same single commodity (in this case, USD), and
whenever value of your investment changes, you record the change
manually, balancing it against `equity:unrealized gains`.

Lets say that we found an investment in Snake Oil that is promising to give us 10% annually:
```hledger
2019-01-01 Investing in Snake Oil
  assets:cash  -$100
  investment:snake oil

2019-12-24 Recording the growth of Snake Oil
  investment:snake oil   = $110
  equity:unrealized gains
```

For now, basic computation of the rate of return, as well as IRR and TWR, gives us the expected 10%:

```
$ hledger roi -Y --inv investment --pnl "unrealized"
+---++------------+------------++---------------+----------+-------------+-----++--------+--------+
|   ||      Begin |        End || Value (begin) | Cashflow | Value (end) | PnL ||    IRR |    TWR |
+===++============+============++===============+==========+=============+=====++========+========+
| 1 || 2019-01-01 | 2019-12-31 ||             0 |     $100 |        $110 | $10 || 10.00% | 10.00% |
+---++------------+------------++---------------+----------+-------------+-----++--------+--------+
```

However, lets say that shorty after investing in the Snake Oil we
started to have second thoughts, so we prompty withdrew $90, leaving
only $10 in. Before Christmas, though, we started to get the "fear of
missing out", so we put the $90 back in. So for most of the year, our
investment was just $10 dollars, and it gave us just $1 in growth:

```hledger
2019-01-01 Investing in Snake Oil
  assets:cash  -$100
  investment:snake oil

2019-01-02 Buyers remorse
  assets:cash  $90
  investment:snake oil
       
2019-12-30 Fear of missing out
  assets:cash  -$90
  investment:snake oil

2019-12-31 Recording the growth of Snake Oil
  investment:snake oil   = $101
  equity:unrealized gains
```

Now IRR and TWR are drastically different:
```
$ hledger roi -Y --inv investment --pnl "unrealized"
+---++------------+------------++---------------+----------+-------------+-----++-------+-------+
|   ||      Begin |        End || Value (begin) | Cashflow | Value (end) | PnL ||   IRR |   TWR |
+===++============+============++===============+==========+=============+=====++=======+=======+
| 1 || 2019-01-01 | 2019-12-31 ||             0 |     $100 |        $101 |  $1 || 9.32% | 1.00% |
+---++------------+------------++---------------+----------+-------------+-----++-------+-------+
```

Here, IRR tells us that we made close to 10% on the $10 dollars that
we had in the account most of the time. And TWR is ... just 1%? Why?

Based on the transactions in our journal, TWR "thinks" that we are buying back $90 worth of Snake Oil
at the same price that it had at the beginning of the year, and then after that our $100 investment
gets $1 increase in value, or 1% of $100. Let's take a closer look at what is happening here by
asking for quarterly reports instead of annual:

```
$ hledger roi -Q --inv investment --pnl "unrealized"
+---++------------+------------++---------------+----------+-------------+-----++--------+-------+
|   ||      Begin |        End || Value (begin) | Cashflow | Value (end) | PnL ||    IRR |   TWR |
+===++============+============++===============+==========+=============+=====++========+=======+
| 1 || 2019-01-01 | 2019-03-31 ||             0 |      $10 |         $10 |   0 ||  0.00% | 0.00% |
| 2 || 2019-04-01 | 2019-06-30 ||           $10 |        0 |         $10 |   0 ||  0.00% | 0.00% |
| 3 || 2019-07-01 | 2019-09-30 ||           $10 |        0 |         $10 |   0 ||  0.00% | 0.00% |
| 4 || 2019-10-01 | 2019-12-31 ||           $10 |      $90 |        $101 |  $1 || 37.80% | 4.03% |
+---++------------+------------++---------------+----------+-------------+-----++--------+-------+
```

Now both IRR and TWR are thrown off by the fact that all of the growth
for our investment happens in Q4 2019. Reported rates are annualized,
that is IRR computation is still yielding 9.32% and TWR is still 1%,
but these rates are computed over three month period instead of
twelve, so in order to get an annual rate they should be multiplied by
four!

Let's try to keep a better record of how Snake Oil grew in value:
```hledger
2019-01-01 Investing in Snake Oil
  assets:cash  -$100
  investment:snake oil

2019-01-02 Buyers remorse
  assets:cash  $90
  investment:snake oil

2019-02-28 Recording the growth of Snake Oil
  investment:snake oil  
  equity:unrealized gains  -$0.25

2019-06-30 Recording the growth of Snake Oil
  investment:snake oil  
  equity:unrealized gains  -$0.25

2019-09-30 Recording the growth of Snake Oil
  investment:snake oil  
  equity:unrealized gains  -$0.25

2019-12-30 Fear of missing out
  assets:cash  -$90
  investment:snake oil

2019-12-31 Recording the growth of Snake Oil
  investment:snake oil
  equity:unrealized gains  -$0.25
```

Would our quarterly report look better now? Almost:
```
$ hledger roi -Q --inv investment --pnl "unrealized"
+---++------------+------------++---------------+----------+-------------+-------++--------+--------+
|   ||      Begin |        End || Value (begin) | Cashflow | Value (end) |   PnL ||    IRR |    TWR |
+===++============+============++===============+==========+=============+=======++========+========+
| 1 || 2019-01-01 | 2019-03-31 ||             0 |   $10.00 |      $10.25 | $0.25 ||  9.53% | 10.53% |
| 2 || 2019-04-01 | 2019-06-30 ||        $10.25 |        0 |      $10.50 | $0.25 || 10.15% | 10.15% |
| 3 || 2019-07-01 | 2019-09-30 ||        $10.50 |        0 |      $10.75 | $0.25 ||  9.79% |  9.78% |
| 4 || 2019-10-01 | 2019-12-31 ||        $10.75 |   $90.00 |     $101.00 | $0.25 ||  8.05% |  1.00% |
+---++------------+------------++---------------+----------+-------------+-------++--------+--------+
```

Something is still wrong with TWR computation for Q4, and if you have been paying attention you know
what it is already: big $90 buy-back is recorded prior to the only transaction that captures the
change of value of Snake Oil that happened in this time period. Lets combine transactions from 30th
and 31st of Dec into one:

```hledger
2019-12-30 Fear of missing out and growth of Snake Oil
  assets:cash  -$90
  investment:snake oil
  equity:unrealized gains  -$0.25
```

Now growth of investment properly affects its price at the time of buy-back:
```
$ hledger roi -Q --inv investment --pnl "unrealized"
+---++------------+------------++---------------+----------+-------------+-------++--------+--------+
|   ||      Begin |        End || Value (begin) | Cashflow | Value (end) |   PnL ||    IRR |    TWR |
+===++============+============++===============+==========+=============+=======++========+========+
| 1 || 2019-01-01 | 2019-03-31 ||             0 |   $10.00 |      $10.25 | $0.25 ||  9.53% | 10.53% |
| 2 || 2019-04-01 | 2019-06-30 ||        $10.25 |        0 |      $10.50 | $0.25 || 10.15% | 10.15% |
| 3 || 2019-07-01 | 2019-09-30 ||        $10.50 |        0 |      $10.75 | $0.25 ||  9.79% |  9.78% |
| 4 || 2019-10-01 | 2019-12-31 ||        $10.75 |   $90.00 |     $101.00 | $0.25 ||  8.05% |  9.57% |
+---++------------+------------++---------------+----------+-------------+-------++--------+--------+
```

And for annual report, TWR now reports the exact profitability of our investment:
```
$ hledger roi -Y --inv investment --pnl "unrealized"
+---++------------+------------++---------------+----------+-------------+-------++-------+--------+
|   ||      Begin |        End || Value (begin) | Cashflow | Value (end) |   PnL ||   IRR |    TWR |
+===++============+============++===============+==========+=============+=======++=======+========+
| 1 || 2019-01-01 | 2019-12-31 ||             0 |  $100.00 |     $101.00 | $1.00 || 9.32% | 10.00% |
+---++------------+------------++---------------+----------+-------------+-------++-------+--------+
```
