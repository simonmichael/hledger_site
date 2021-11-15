# User FAQ

<div align=center>

  [Newcomer FAQ](faq.html)
| User FAQ
| [Developer FAQ](devfaq.html)

</div>

<!-- toc -->

## How do I report by financial year, not calendar year ?

[`-Y/--yearly`](hledger.html#report-intervals), [`-p/--period 'every year'`](hledger.html##period-expressions), etc. 
show Gregorian calendar years, starting on January 1st. 
To show years starting with a different month, use `every 12 months from DATE`.
Eg, to show years starting on April 1st (the register command is good for testing this):
```
hledger reg -p 'every 12 months from 2019-04-01'
```

To show years not starting on a month boundary, approximate it with `every 365 days from DATE`
(this won't be exact for leap years):
```
hledger reg -p 'every 365 days from 2019-04-06'
```

## Why does this entry give a "no amount" error even though I wrote an amount ?

```journal
2019-01-01
  a 1
  b
```
Because there's only a single space between `a` and `1`,
so this is parsed as an account named <span style="white-space:nowrap;">"a 1"</span>, with no amount.
There must be at least two spaces between account name and amount.


## Why do some directives not affect other files ? Why can't I put account aliases in an included file ?

This is documented at [journal format: directives](journal.html#directives).
(Also mentioned at [hledger: Input files](hledger.html#input-files).)
These docs could be improved.

Directives which affect parsing of data vary in their scope, 
ie the area of input data they affect. Eg, should they affect: 

- entries after the directive, in this file only ? 
  - Eg: 
    `alias`, 
    `apply account`, 
    `comment`, 
    `Y`
- entries before and after the directive, in this file only ?
- entries and included files after the directive, until this file's end ?
- all entries after the directive, in this and all included or subsequent files, including parent files ?
  - Eg: 
    the number notation specified by `D`
    or `commodity`
- all entries in all files ?
  - Eg: 
    the default commodity specified by `D`,
    and `account`

The differences are partly due to historical accident, and partly by design.
We would like to preserve these properties:

- Reordering files does not change their meaning.
- Adding a file does not change the meaning of the other files.

This is why some directives are designed to last only until the end of the current file.
This can be annoying, but it seems worthwhile to ensure reports are
robust, and not changed by simply moving `include` directives or `-f`
options around.

For `alias` directives, when you have multiple files, the workaround
is to put them inline in a top-level file, before including the other
files that the aliases should affect.
See [#1007](https://github.com/simonmichael/hledger/issues/1007).

See also:
[#510](https://github.com/simonmichael/hledger/issues/510),
[#217](https://github.com/simonmichael/hledger/issues/217)

## Why am I seeing some amounts without an account name in reports ?

Some of hledger's older commands (balance, print, register) show a
multi-commodity amount with each commodity on its own line, by default
(like Ledger).

Here are some examples. 
In the following journal entry, the implicit balancing amount drawn from the `b` account will be a multicommodity amount (a euro and a dollar):
```journal
2015/1/1
    a         EUR 1
    a         USD 1
    b
```
the `print` command shows the `b` posting's amount on two lines, bottom-aligned:
```shell
$ hledger -f t.j print
2015/01/01
    a         USD 1
    a         EUR 1
             EUR -1  ; <-
    b        USD -1  ; <- a euro and a dollar is drawn from b
```
the `balance` command shows that both `a` and `b` have a multi-commodity balance (again, bottom-aligned):
```shell
$ hledger -f t.j balance
               EUR 1     ; <-
               USD 1  a  ; <- a's balance is a euro and a dollar
              EUR -1     ; <-
              USD -1  b  ; <- b's balance is a negative euro and dollar
--------------------
                   0
```
while the `register` command shows (top-aligned, this time!) a multi-commodity running total after the second posting,
and a multi-commodity amount in the third posting:
```shell
$ hledger -f t.j register --width 50
2015/01/01       a             EUR 1         EUR 1
                 a             USD 1         EUR 1  ; <- the running total is now a euro and a dollar        
                                             USD 1  ;                                                        
                 b            EUR -1                ; <- the amount posted to b is a negative euro and dollar
                              USD -1             0  ;
```

Newer reports like [multi-column balance reports](hledger.html#multicolumn-balance-report) show multi-commodity amounts on one line instead, comma-separated.
Although wider, this seems clearer and we should probably use it more:
```shell
$ hledger -f t.j balance --yearly
Balance changes in 2015:

   ||           2015 
===++================
 a ||   EUR 1, USD 1 
 b || EUR -1, USD -1 
---++----------------
   ||              0 
```

You will also see amounts without a corresponding account name if you
remove too many account name segments with [`--drop`](hledger.html#balance)
(a bug, which we'd like to see fixed):
```shell
$ hledger -f t.j balance --drop 1
               EUR 1  
               USD 1  
              EUR -1  
              USD -1  
--------------------
                   0
```


## With hledger-ui in iTerm2/3, why does Shift-Up/Shift-Down move the cursor instead of adjusting the period ?

One way to fix: in iTerm2 do Preferences -> Profiles -> your current profile -> Keys -> Load Preset -> xterm Defaults 
(not Terminal.app Compatibility). And perhaps open a new tab with this profile. 

<!-- 

## How do I set the LEDGER_FILE environment variable on Windows?

https://www.reddit.com/r/plaintextaccounting/comments/cr5jjk/help_set_ledger_file_environment_variable_in/

-->
## How do I display a decimal separator different from the one in the input file ?

It's not yet easy to do this with hledger:\
<https://github.com/simonmichael/hledger/issues/793#issuecomment-603994809>

There's just one special case where it works, by a quirk of the implementation: 
if in the journal you use space as thousands separator, comma as decimal separator, 
and no commodity directive, hledger will print numbers with period as decimal separator:
```journal
; journal
2020-01-01
    (a)       $1 234,56
```
```shell
$ hledger print
2020-01-01
    (a)       $1 234.56

```

Here's a more general workaround, post-processing the output with sed.
Adjust if needed:
```journal
; journal
2020-01-01
    (a)       $1.234,56
```
```shell
$ hledger print
2020-01-01
    (a)       $1.234,56

$ hledger print | sed 's/\./~/g; s/,/./g; s/~/,/g'
2020-01-01
    (a)       $1,234.56

```
## How do I control the number of decimal places displayed ?

With hledger < 1.23:
use a [commodity directive](hledger.html#declaring-commodities)
to set commodities' [display styles](journal.html#commodity-display-style).
Eg:
```journal
commodity $1000.00
commodity EUR 1.000,
commodity 1000.00000000 BTC
```

With hledger 1.23+, you can also use the `-c/--commodity-style` option. Eg:
```shell
hledger -c '$1000.00' -c 'EUR 1.000,' -c '1000.00000000 BTC' bal
```

## How could I import/migrate from...

Some quick/rough migration recipes:

### Mint.com ?

1. download [examples/csv/mint.csv.rules](https://github.com/simonmichael/hledger/blob/master/examples/csv/mint.csv.rules), and adjust the `account1` & `account2` rules
2. `touch ~/.hledger.journal`
3. log in to Mint, go to TRANSACTIONS, scroll to the bottom of the page, click on the "Export all N transactions" link, save it as `mint.csv` on your computer
4. `cd ~/Downloads` (or wherever you saved it)
5. `hledger import mint.csv`

Now `hledger stats` and `hledger bal` should show lots of data. That's your past data migrated. 

Then, if you want to leave Mint, you'll need to replace their automatic
import from banks with 
[your own import process](#isn-t-importing-from-banks-a-pain).

Or if you want to keep using Mint for that, because you like how they
aggregate and clean the data: just periodically re-export from Mint,
repeating steps 3-5 above.


