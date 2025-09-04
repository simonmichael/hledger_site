# Start a journal

hledger reads transactions from, and appends new transactions to, a *journal file*.
This is named after the *General Journal* in bookkeeping.
You can specify it with `-f FILE` in hledger commands.
But it's good to configure a default file, so that you don't have to write `-f FILE` every time.

`hledger setup` or `hledger files` will show if a default file is configured:

```
PS C:\Users\Simon> hledger files
hledger.exe: Error: data file "C:\Users\Simon\.hledger.journal" was not found.
Please create it first, eg with "hledger add" or a text editor.
Or, specify an existing data file with -f or $LEDGER_FILE.
```

<!-- <br> -->

If you know how to configure its path in the `LEDGER_FILE` environment variable,
you can keep this file wherever you like.
For example, you might have `LEDGER_FILE=~/finance/main.journal`,
where ~/finance is a version-controlled directory.

If not, just use the default location: `.hledger.journal` in your home directory.
You can move the file later if needed.


## Start the journal

You can start the journal by running
```
hledger add
```
and adding a transaction (see the next page for an example). This will create the file if needed. 

<!-- <br> -->

## Start the journal, another way

Or if you prefer, you can create the file yourself with your favourite text editor.

On unix systems, eg:
```
emacs ~/.hledger.journal
```
or:
```
touch ~/.hledger.journal
```

<br>

On Windows:
```
notepad $HOME/.hledger.journal
```
or:
```
mv -ErrorAction SilentlyContinue ~/.hledger.journal ~/.hledger.journal.old
Set-Content -Path $HOME/.hledger.journal -Value ""
```
<!-- 
(Warning, this erases any pre-existing .hledger.journal file.)
-->

Note these Windows commands create the file with the system's text encoding, which is necessary.
(You can see what your system text encoding is by running `[System.Text.Encoding]::Default.EncodingName`.
If you want your files to be compatible with non-Windows machines, the "Unicode (UTF-8)" encoding is best.
For that, you might need to set ["Language for non-Unicode programs > Use Unicode UTF-8 for worldwide language support"](install.md#text-encoding).)
<!--
See also: [Console]::OutputEncoding.EncodingName.
By default, GHC-compiled programs on Windows use the ANSI APIs ("Windows interprets these byte sequences based on the current system locale's ANSI code page"), and are affected by the above setting.
With +RTS --io-manager=native, they use the Unicode (Wide-Character) APIs ("These functions take wide character arguments, which are typically UTF-16 encoded strings ... Programs using these APIs are 'Unicode-aware'"). But currently (ghc 9.12) there is no support for networking with the native I/O manager.
-->

<!--
<br>

Now (or after completing `hledger add` on the next page), `hledger files` should list the file, with no error:
```
PS C:\Users\Simon> hledger files
C:\Users\Simon\.hledger.journal
```

<br>

Now, if you reran `hledger setup` you would see:

![hledger setup 2 in powershell](images/hledger-setup-2-powershell.png)
-->

<br>

(Part of [hledger by example](hledger-by-example.md).)
