# How price syntax works in Ledger and hledger

WIP

## In Ledger and hledger

- In the journal, a `P DATE COMMODITY AMOUNT` directive some commodity's market price in some other commodity on DATE.
  (A timestamp may be added, but is ignored.)

- In a posting, `AMT @ UNITPRICE` declares the per-unit price that was used to convert AMT into the price's commodity.
  Eg: `2A @ 3B` records that 2A was posted, in exchange for 6B.

- `@@ TOTALPRICE` is another form of `@`, sometimes more convenient.
  Eg: `2A @@ 5.99B` records that 2A was posted in exchange for 5.99B.

## In Ledger

- Any use of `@` also generates an implicit `P` directive.
  Eg:

      2019/1/1
        a  2A @ 3B
        b

  in the journal is equivalent to writing

      2019/1/1
        a  2A @ 3B
        b

      P 2019/1/1 A 1.5B

These need testing:

- `{UNITPRICE}` and `{{TOTALPRICE}}` are synonyms for `@` and `@@`

- `{`` UNITPRICE}` is like `@` but it also causes capital gains transactions to be generated

- a `@`/`@@` and a `{ }`/`{{ }}`/`{ `` }`/ may be combined; the first is used 

## In hledger

- `{ }`, `{{ }}`, and `{= }` are ignored, and if combined with `@`/`@@`, must be written last

