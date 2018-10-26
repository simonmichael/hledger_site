From https://www.reddit.com/r/plaintextaccounting/comments/9r9cfj/beancount_price_and_cost :

> 1. Before going to vacation to Europe, I borrowed 350 EUR, cash.
> 2. I also took out of ATM 200 EUR, cash - now I know the price.
> 3. I spent 500 EUR in trip, and I have 50 left.
> 4. Now, after the trip, I exchanged some of my home currency to 300 EUR to give it back - and it's the different price from step two.
> So how do I write all this down?

My attempt:

```hledger
; a hledger example based on colindean's
; hledger doesn't currently support the {} syntax, just @ or @@

2018-10-25 * vacation loan
    Liabilities:Loans:Vacation
    Assets:Cash                             350 EUR

2018-10-26 * ATM withdrawal
    Assets:Cash                             200 EUR @@ 220 USD  ; conversion price written out for clarity; redundant due to -225 USD below
    Expenses:Fees:CurrencyConversion          5 USD
    Assets:Bank                            -225 USD

2018-10-27 * food
    Assets:Cash                            -190 EUR
    Expenses:Vacation:Food

2018-10-27 * hotel
    Assets:Cash                            -310 EUR = 50 EUR    ; assert that Cash's EUR balance is now 50
    Expenses:Vacation:Hotel

2018-10-28 * withdraw more euros to repay loan
    Assets:Cash                             300 EUR @@ 360 USD  ; conversion rate has gone up to 1.20
    Expenses:Fees:CurrencyConversion          5 USD
    Assets:Bank                            -365 USD

2018-10-28 * repay vacation loan
    Liabilities:Loans:Vacation              350 EUR = 0 EUR     ; assert that euro loan is repaid
    Assets:Cash

; Conversion rate to use in reports for the trip period.
; You could declare each time it changed, eg:
; P 2018-10-25 EUR 1.10 USD
; P 2018-10-28 EUR 1.20 USD
; but hledger currently picks just one,
; and for expense reporting a rough average price is usually fine:
P 2018-10-25  EUR  1.15 USD
```

- When transactions occur on such trips, I sometimes know the USD amount spent, and sometimes the EUR amount. I sometimes know the total converted amount, and sometimes the conversion rate. I record whichever of these is more convenient.
- After the trip, when reviewing expenses, I'll add a P market price directive covering the period of the trip, and use -V to see all expenses in home currency (USD).
