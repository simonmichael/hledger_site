# A default journal file

hledger reads transactions from, and appends new transactions to, a *journal file*.
This is named after the *General Journal* in bookkeeping.

The file can be specified with `-f FILE` on the command line.
But it's good to configure a default file, so that you don't have to write `-f FILE` in every command.

`hledger setup` or `hledger files` will show if a default file is configured:

```
PS C:\Users\Simon> hledger files
hledger.exe: Error: data file "C:\Users\Simon\.hledger.journal" was not found.
Please create it first, eg with "hledger add" or a text editor.
Or, specify an existing data file with -f or $LEDGER_FILE.
```

If you know how to configure the `LEDGER_FILE` environment variable on your system, feel free to do that.
This lets you keep the file wherever you choose,
such as a version-controlled directory like `~/finance` (eg: `LEDGER_FILE=~/finance/2025.journal`).

Otherwise, stick with the default location for simplicity: `.hledger.journal` in your home directory.
You can always move it later, if needed.

<!--
You can start this file yourself - eg with `touch ~/.hledger.journal` on unix,
or `out-file -encoding ascii ~/.hledger.journal` on Windows.
Warning - that Windows command would erase an existing file in that location.
( `-append` is for safety, in case you already have data there; but it might defeat the `-encoding`.)
-->

You can create this file yourself, but there's a reliable and portable way that we'll use here:
just record a transaction with `hledger add`.
We'll do that next.


(Part of [hledger by example](hledger-by-example.md).)
