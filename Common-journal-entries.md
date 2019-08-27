# Common journal entries

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

Invoicing entries are different for accrual basis or cash basis accounting.
Large companies use accrual basis, individuals and small companies typically use cash basis.
https://en.wikipedia.org/wiki/Basis_of_accounting

### Accrual basis

Send an invoice. This is the taxable event:

    2018-04-16 * (2018-001) SuperCompany invoice
        Revenue:Software Development                        $ -2420.00
        Assets:Accounts Receivable:SuperCompany              $ 2420.00

Receive payment:

    2018-04-26 * (2018-001) SuperCompany payment
        Assets:Accounts Receivable:SuperCompany             $ -2420.00 = $0
        Assets:Checking                                      $ 2420.00

### Cash basis

Invoices aren't normally tracked in cash basis, so we're using unbalanced postings to track them here.
Send an invoice:

    2018-04-16 * (2018-001) SuperCompany invoice
        (Assets:Accounts Receivable:SuperCompany)             $2420

Receive payment. This is the taxable event.
Also: estimate the corresponding tax, and save that amount in a subaccount so there'll be money to pay taxes:

    2018-04-26 * (2018-001) SuperCompany payment
        (Assets:Accounts Receivable:SuperCompany)            $-2420 = $0
        Revenue:Software Development                         $-2420
        (Liabilities:Tax:2018)                                $-420
        Assets:Checking:Estimated Tax Savings:2018             $420
        Assets:Checking                                       $2000
