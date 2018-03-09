Example hledger journal entries for various kinds of transaction.
 
A purchase:

```hledger
2017/1/26 market
  expenses:food    $10
  assets:cash
```

Tracking a mortgage:
```hledger
2019/01/01 Buy House
    Assets:House                                      500,000.00
    Liabilities:Mortgage

2019/02/01 Mortgage Payment
    Liabilities:Mortgage                                1,000.00
    Expenses:Interest:Real Estate                         833.33
    Assets:Cash                                         -1833.33

2019/03/01 Mortgage Payment
    Liabilities:Mortgage                                1,002.00
    Expenses:Interest:Real Estate                         831.33
    Assets:Cash                                         -1833.33

2019/03/01 Zillow Price Estimate
    Assets:House                                                 = 505,000.00
    Equity:Unrealized Gains
```