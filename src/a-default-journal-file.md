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

To start the journal file, just record a transaction with `hledger add`, which will create the file if needed. This works on all platforms and is simple.
We'll do this on the next page.

<br>

Or, on unix systems you can easily create the file yourself, with a text editor or by doing:
```
touch ~/.hledger.journal
```

<br>

On Windows we recommend using `hledger add` to get started, because of text encoding complications. But here's how to do it manually if you're interested:

1. Back up any pre-existing journal file (just in case):
    ```
    mv -ErrorAction SilentlyContinue ~/.hledger.journal ~/.hledger.journal.old
    ```

2. Find the system text encoding. This is affected by your region, Windows version, and/or whether you [changed the "Language for non-Unicode programs" setting to UTF-8](install.md#text-encoding). (UTF-8 is ideal, being the most compatible with non-Windows machines and hledger's example files):
    ```
    hledger setup | Select-String -Pattern encoding
    ```

3. Create the file, ensuring it uses the system text encoding. Replace ENCODING with the encoding name from step 2:
    ```
    Set-Content -Path ~/.hledger.journal -Value "" -Encoding ENCODING
    ```


(Part of [hledger by example](hledger-by-example.md).)
