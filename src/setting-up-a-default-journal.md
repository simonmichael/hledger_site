# Setting up a default journal

The output of `hledger setup` mentions a "default journal file". This is the file hledger will read from (and add transactions to) by default. It's good to configure a default journal, so that you don't have to write `-f FILE` in your hledger commands all the time.

If you know how to set the `LEDGER_FILE` environment variable, you can specify the file with that.

<!--
Eg, on unix:
```
touch ~/.hledger.journal
```
But on Windows, some fiddling is required to select the right text encoding.
-->
<!--
or in Windows powershell:
```
out-file -append -encoding ascii $HOME/.hledger.journal
```
(On Windows, creating the file with `-encoding ascii` seems needed for the moment. The `-append` is for safety, in case you already have data there; but it might defeat the `-encoding`..)
-->

Or, you can create a file at the default location. 
The most portable way to do that, is to use hledger's `add` command.
So let's record a transaction:
an "opening balances" transaction, declaring how much cash is in your wallet today. 
Run `hledger add`, answering the prompts as shown below.
Instead of "$10", enter whatever amount and currency symbol seems correct for you. 
(If you're on Windows, also use `--color=no` for now):

```
PS C:\Users\Simon> hledger add --color=no
Adding transactions to journal file C:\Users\Simon\.hledger.journal
Any command line arguments will be used as defaults.
Use tab key to complete, readline keys to edit, enter to accept defaults.
An optional (CODE) may follow transaction dates.
An optional ; COMMENT may follow descriptions or amounts.
If you make a mistake, enter < at any prompt to go one step backward.
To end a transaction, enter . when prompted.
To quit, enter . at a date prompt or press control-d or control-c.
Date [2025-07-01]:
Description: opening balances
Account 1: assets:cash
Amount  1: $10
Account 2: equity:start
Amount  2 [$-10]:
Account 3 (or . or enter to finish this transaction):
2025-07-01 opening balances
    assets:cash              $10
    equity:start            $-10

Save this transaction to the journal ? [y]:
Saved.
Starting the next transaction (. or ctrl-D/ctrl-C to quit)
Date [2025-07-01]: .
PS C:\Users\Simon>
```

Now `hledger setup` detects the file:

![hledger setup 2 in powershell](images/hledger-setup-2-powershell.png)


And we can see that `hledger files` lists the file:
```
PS C:\Users\Simon> hledger files
C:\Users\Simon\.hledger.journal
```


(Part of [hledger by example](hledger-by-example.md).)
