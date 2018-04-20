Example hledger journal entries for various kinds of transaction.
 
## Shopping

```hledger
2017/1/26 market
  expenses:food    $10
  assets:cash
```

## Tracking a mortgage

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

## Invoicing

https://en.wikipedia.org/wiki/Basis_of_accounting

Accrual basis accounting:

    2016/2/1 * (201602ab) ab client  invoice
        revenues:business:consulting:ab              $-1000
        assets:business:accounts receivable:ab        $1000

Cash basis accounting. 
Invoices aren't normally tracked in cash basis, so using an unbalanced posting here:

    2016/2/1 * (201602ab) ab client  invoice
        (assets:business:accounts receivable:ab) $1000


Invoice (accrual basis), and estimate the corresponding increase in taxes due:

    2018-04-16 * (2018-001) SuperCompany Invoice
           Assets:Accounts Receivable:SuperCompany              $ 2420.00
           Income:Software Development                         $ -2420.00
           (Liabilities:Tax:2018)                              $  -420.00

Invoice (cash basis), then receive payment, estimating the corresponding tax and setting aside that amount in an "envelope" subaccount:

    2018-04-16 * (2018-001) SuperCompany Invoice
           (Assets:Accounts Receivable:SuperCompany)             $2420

    2018-04-26 * (2018-001) SuperCompany payment
           (Assets:Accounts Receivable:SuperCompany)            $-2420
           Revenue:Software Development                         $-2420
           (Liabilities:Tax:2018)                                $-420
           Assets:Checking:Estimated Tax Savings:2018             $420
           Assets:Checking                                       $2000
