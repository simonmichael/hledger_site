# hledger and Ultorg

[Ultorg](https://www.ultorg.com/) provides a slick visual UI for relational data.
It is an easy and powerful way to visualise and analyse your hledger data in a tabular GUI:

1. Export a hledger journal as CSV, eg:
```shell
$ hledger print -o main.csv
```
or
```shell
$ hledger -f examples/bcexample.hledger print -o examples/bcexample.csv
```

2. Run Ultorg.

3. Click Add Data Source in the left panel, and select the CSV file. Press enter to confirm the import settings.

4. The CSV file appears in the left panel, containing one table. Double-click on the table to open it in the main pane.

5. Select the txnidx, date, and description columns (by cmd/ctrl-clicking their headings). From the drop-down/right-click menu, choose Custom Group to group them.

6. Hide the txnidx and Row Number columns.

7. In the date column's menu, select Sort Ascending.

8. Click the amount column, then click the bar chart button in the toolbar and select Horizontal Bars or Color Range.

9. Click the button that looks like a table and select a different Auto-Layout Type, like Form (Multi-Column).

etc.

Ultorg goes farther than spreadsheets, with more powerful joins and layout.
https://www.ultorg.com/resources > 1st video demonstrates its key features,
and the 3rd video is a fascinating demo of analysing Quickbooks data.
