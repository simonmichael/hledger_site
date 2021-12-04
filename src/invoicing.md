# Invoicing

<div class=pagetoc>
<!-- toc -->
</div>

Freelancers and businesses send invoices to clients to request payment.
You can use hledger to track how much is due, and how much has been paid.

See also:\
[examples/invoicing/](https://github.com/simonmichael/hledger/tree/master/examples/invoicing)\
<https://plaintextaccounting.org/#invoicing>

## Journal entries

### Accrual accounting

Businesses use accrual accounting, where you record revenue (and the tax event)
at the time of invoicing, and you keep track of what is receivable (awaiting payment).

```journal
; send an invoice:
2020-02-01 * (201602ab) AB Inc. | invoice
    revenues:consulting:ab     $-1000
    assets:receivable:ab        $1000

; receive payment:
2020-02-15 * AB Inc. | payment for 201602ab
    assets:receivable:ab       $-1000  ; = $0  ; assert this if fully paid (optional)
    assets:checking             $1000
```

### Cash accounting

Cash accounting is simpler; you record revenue at the time of receiving the money.
Invoices and receivables aren't part of cash accounting,
but we'll use unbalanced postings to track them anyway.

```journal
; send an invoice:
2020-02-01 * (201602ab) AB Inc. | invoice
    (assets:receivable:ab)      $1000

; receive payment:
2020-02-15 * AB Inc. | payment for 201602ab
    (assets:receivable:ab)     $-1000  ; = $0  ; assert this if fully paid (optional)
    revenues:consulting:ab     $-1000
    assets:checking             $1000
```

## Reports

What invoices have been sent and are not yet paid ?
Using either example above
(assuming the payment transaction is commented out):
```shell
$ hledger bal receivable
               $1000  assets:receivable:ab
--------------------
               $1000
```

## Creating Invoices

How to translate the data from your ledger into a professional-looking
invoice you can send to clients ?

You can create the invoice manually or semi-manually, eg using a tool
like Freshbooks, and copy-paste the numbers in.

Or you can automate this somehow. There are few ready-made tools for this,
because needs are so diverse.

But you'll find some useful starter scripts in hledger's 
[examples/invoicing](https://github.com/simonmichael/hledger/tree/master/examples/invoicing)
directory, such as

- this [makefile](https://github.com/simonmichael/hledger/tree/master/examples/invoicing/makefile)
- this ['invoice' bash script](https://github.com/simonmichael/hledger/tree/master/examples/invoicing/invoice-script)
