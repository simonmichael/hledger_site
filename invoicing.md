# Invoicing

Freelancers and businesses send invoices to clients to request payment.
You can use hledger to track how much is due, and how much has been paid.

See also:
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

Send an invoice:
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

Or you can automate this somehow. There's no ready-made tool for this,
you will have to build it yourself.

### With pandoc

But here's a method I use to semi-automate the invoice generation.
It still requires some manual work, but much less than otherwise.
The workflow is: 

1. figure out the amount to be invoiced, eg from a timelog report
2. use the makefile below to help create the invoice
3. adjust the invoice transaction which it added to the journal.

This is based on 
[Generate PDF invoices from Markdown using Pandoc](https://martinbetz.eu/articles/pandoc-invoices) 
by Martin Betz, see that page for more background.
[Copy-pasted from a working setup, you may need to adapt this]:

```
# Makefile
# Generates HTML/PDF invoices from a markdown template

help:
	@echo "make copy     # copy last invoice to YYYYMMab.md, open in emacs"
	@echo "(edit)"
	@echo "make invoice  # make YYYYMMab.pdf and YYYYMMab.html, git commit, add invoice transaction to journal"

CSS=invoice.css
LAST=`ls -t 2*md | head -1`
# must end with "ab":
NEW=$(shell date +%Y%mab)

copy:
	@echo "copying invoice $(LAST) to $(strip $(NEW)).md"
	@cp $(LAST) $(strip $(NEW)).md
	emacsclient -s2 -n $(strip $(NEW)).md

invoice:
	@echo "making invoice $(NEW)"
	@make $(NEW)
	@git add $(NEW).{md,html,pdf}
	@git commit -m "invoice $(NEW)" -- $(NEW).{md,html,pdf}
	@printf "`date +%Y-%m-%d` * (`date +%Y%m`ab) AB Inc. | invoice\n    (assets:receivable:ab)                 \$$1000  ; TODO:adjust\n\n" >>$$LEDGER_FILE

%ab:
	@make $@.pdf $@.html

%.pdf: %.md $(CSS) #logo.jpg
	pandoc $< -t html5 --css $(CSS) -o $@ --metadata title=" "
# --metadata title to silence warning, space to avoid unwanted display

%.pdf-watch:
	ls | entr make -s $*.pdf

%.html: %.md $(CSS) #logo.jpg
	pandoc $< -t html5 -s --css $(CSS) -o $@ --metadata title=" "

%.html-watch:
	ls | entr make -s $*.html
```

```
/* invoice.css */

@charset "utf-8";

body {
/* font-size: 10.5pt; */
/* font-family:  */
/*     "Avenir Next", -apple-system, BlinkMacSystemFont, "Segoe UI", "Roboto", */
/*     "Oxygen", "Ubuntu", "Cantarell", "Fira Sans", "Droid Sans", "Helvetica Neue", sans-serif; */
hyphens: auto;
height: 250mm; /* 280 - 10 (top) - 20 (bottom) */
line-height: 140%;
margin: 0;
padding: 0;
}

code {
font-family: "Source Sans Code", Courier New, Courier, monospace;
margin-left: 1pt;
/* font-size:12pt; */
}

a {
color: black;
margin-left: 1pt;
}

h1 {
font-size: 20pt;
margin-top: 10mm;
padding-top:0;
/* margin-top: 6pt; */
/* margin-bottom: 0; */
}

h2 {
font-size: 16pt;
/* margin-top: 20pt; */
margin-top: 10mm;
/* font-weight: normal; */
/* margin-top: 0; */
/* margin-bottom: 20pt; */
}

p {
width: 100%;
}

p:first-of-type {
text-align: center;
font-size: 9pt;
word-spacing: 1pt;
}

p:nth-of-type(2) {
margin-top: 10mm;
}

p:nth-of-type(3) {
text-align: center;
font-weight:bold;
font-size:12pt;

}

/* p:nth-last-of-type(3) { */
/* margin-top: 10mm; */
/* } */

/* p:last-of-type { */
/* text-align: center; */
/* font-size: 9pt; */
/* position: absolute; */
/* bottom: 2mm; */
/* margin-bottom: 0; */
/* padding-bottom: 0; */
/* color: #444; */
/* } */

table {
width: 100%;
}

table:nth-of-type(1) {
border: 1px solid black;
padding: 5pt;
}

table:nth-of-type(1) td {
border-top: 1px solid #eee;
}

table:nth-of-type(1) tr:nth-last-of-type(1) {
font-weight: bold;
}
table:nth-of-type(1) tr:nth-last-of-type(1) td {
/* border-top: 1px solid black; */
padding-top: 1em;
}

/* table:nth-of-type(1) td:nth-of-type(2) { */
/* text-align: center; */
/* } */

hr {
border: 1px solid #eee;
}

hr:last-of-type {
position: absolute;
bottom: 14mm;
width: 100%;
}

figure {
margin: 0;
}  
```

A sample invoice source file, 202001ab.md:
```
---
papersize: letter
margin-left: 20mm
margin-right: 25mm
margin-top: 20mm
margin-bottom: 20mm
...

![](logo.jpg){ width=100mm }\
Joe Consultant | +1 (111) 111 1111 | joe@example.com | 500 Done Dr. #1, Work Ville, CA 10000, USA

Carl Client\
AB Inc.\
PO Box 11111\
CA 20000\

January 1, 2020

# Invoice 202001ab

<THIS LINE ADDED TO PREVENT SPHINX TABLE RENDERING; REMOVE IT>
| Description                                 |   Rate | Qty |  Total |
|:--------------------------------------------|-------:|----:|-------:|
| Custom software development & maintenance   | $  100 |  10 | $ 1000 |
| Systems reliability engineering             | $ 2000 |   - | $ 2000 |
| On-call monitoring & tech support           | $ 2000 |   - | $ 2000 |
| Contractor/vendor management                | $  500 |   - | $  500 |
| Expenses (service providers, tools, dues..) |        |     | $    0 |
| &nbsp;                                      |        |     |        |
| Total due                                   |        |     | $ 5500 |
|                                             |        |     |        |

## Terms

Now due. Your prompt payments are appreciated, thank you!
```

Your text editor probably can make editing markdown convenient.
For example in Emacs with markdown-mode:

- press TAB while in the table to realign it
- to sum the Totals, select them from top left to bottom right, C-x * :
- alternatively, you could probably make a nice yasnippet template for generating the markdown
