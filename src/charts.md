# Charts and Graphs

Tips and techniques for producing graphical charts. 

Generally we run a hledger report and select [CSV output](hledger.html#output-format)
(and disable unwanted features like the Total row):
Eg:
```
hledger bal assets liabilities --no-total -o report.csv
```

Then there are many ways to convert CSV to charts.

## Spreadsheet

Drag the CSV file into your favourite spreadsheet app and use its charting tools.

## ploterific

[ploterific](https://github.com/GregorySchwartz/ploterific) (`stack install hvega-theme ploterific`) produces simple charts,
in a HTML file that uses the [Vega-Lite](https://vega.github.io/vega-lite/) javascript library.
Charts can also be saved as SVG or PNG. An example:

![ploterific example](images/ploterific1.svg)

produced by:
```
hledger -f examples/bcexample.hledger bal -O csv -N expenses cur:USD -4 \
    | sed 's/ USD//' \
    | ploterific -m Bar -f account -f balance:Q -c account -o a.html \
    && open a.html
```

Let's break down this command line:

- `-f examples/bcexample.hledger` - use this example file in the hledger repo; omit this to use your default journal
- `bal` - run a [balance report](hledger.html#balance)
- `-O csv` - show it as [CSV](hledger.html#output-format) on stdout
- `-N` - disable the final Total row
- `expenses` - [limit](hledger.html#queries) to accounts whose name contains `expenses`
- `cur:USD` - limit to balances in `USD` currency
- `-4` - summarise accounts to [depth](hledger.html#depth) 4 and above
- `sed 's/ USD//'` - process the output with [sed](https://www.gnu.org/software/sed/), stripping the ` USD` symbols to leave bare numbers for ploterific
- `-m Bar` - use `Bar` as the Vega-Lite [mark type](https://hackage.haskell.org/package/hvega-0.11.0.1/docs/Graphics-Vega-VegaLite.html#t:Mark)
- `-f account` - use the `account` column as one of the features (axes), in default mode (values are treated as symbols)
- `-f balance:Q` - use the `balance` column as the second feature (axis), in Quantitative mode (values are treated as quantities)
- `-c account` - also use the `account` values to select colours
- `-o a.html` - save into a temporary HTML file
- `&& open a.html` - and view it in your web browser (on Mac - on other systems it might be `xdg-open` or `start`)

## gnuplot, R, other

Check out the tools at <https://plaintextaccounting.org/#reports>
(hreports, ledger-plot, ledger-plots, ludget, r-ledger..)
