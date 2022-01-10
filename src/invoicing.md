# Invoicing

<div class=pagetoc>
<!-- toc -->
</div>

Freelancers and businesses send invoices to clients to request payment.

See [common journal entries](common-journal-entries.html) and
<https://wiki.plaintextaccounting.org/Invoicing>

## Reports

With invoices and payments recorded as above, you can track unpaid invoices:

```shell
$ hledger bal receivable:supercompany
```

or list all invoices and payments:

```shell
$ hledger areg receivable:supercompany
```

or just invoices:

```shell
$ hledger areg receivable:supercompany amt:'>0'
```

or just payments:

```shell
$ hledger areg receivable:supercompany amt:'<0'
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

## See also

- [examples/invoicing/](https://github.com/simonmichael/hledger/tree/master/examples/invoicing)
- <https://plaintextaccounting.org/#invoicing>

