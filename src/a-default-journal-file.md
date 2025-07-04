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

Otherwise, use the default location for now: `.hledger.journal` in your home directory.
You can move it later if needed.

On unix systems, it's easy to start this file yourself - eg you could do:
```
touch ~/.hledger.journal
```

On Windows, it's more complicated because of text encoding, so we recommend another method:
just record a transaction with `hledger add`. This works on all platforms and is simple.
We'll do that on the next page.

<br>
(But if you're interested in the details, here's how you would do it on Windows:)

First, back up any pre-existing journal file (just in case you have one):
```
mv -ErrorAction SilentlyContinue ~/.hledger.journal ~/.hledger.journal.old
```

Then check what is the system text encoding. This is affected by your region, Windows version, and/or whether you changed the "Language for non-Unicode programs" setting to UTF-8 (see [Install: Text encoding](https://hledger.org/install.html#text-encoding)). UTF-8 is ideal, as it will be the most compatible with non-Windows machines and hledger's example files.
```
hledger setup | Select-String -Pattern encoding
```

Then ensure the file is created with that encoding:
```
Set-Content -Path ~/.hledger.journal -Value "" -Encoding ENCODING   # change ENCODING appropriately
```



(Part of [hledger by example](hledger-by-example.md).)
