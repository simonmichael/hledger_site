# Setting up a default journal

The output of `hledger setup` mentions a "default journal file". This is the file hledger will use by default, if you don't specify one on the command line with `-f FILE`.

You can create that file yourself, at the path shown:

Eg on unix:
```
touch ~/.hledger.journal
```

or in Windows powershell. (On Windows, creating the file with `-encoding ascii` seems needed for the moment. The `-append` is for safety, in case you already have data there; but it might defeat the `-encoding`.)
```
out-file -append -encoding ascii $HOME/.hledger.journal
```

Another way to create the journal is to use hledger's `add` command. (On Windows, also use `--color no` for now). 

Let's record a first "opening balances" transaction, declaring how much cash is in your wallet today. Run `hledger add` as shown below, but instead of "$10", enter whatever amount and currency symbol seems correct for you. You can press enter at prompts to accept the default value.

```
PS C:\Users\Simon> hledger add --color n
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
