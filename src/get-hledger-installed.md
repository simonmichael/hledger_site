# Get hledger installed

Each new hledger version is better than the preceding ones, so using the latest is ideal.
And you'll want to have it installed somewhere in your system's PATH, so that you can just type "hledger" and it runs.

[Install](install.md) shows all the ways to get hledger installed on your computer.
But here's a quick way: install the official release binaries, 
by copy/pasting the appropriate command below into a terminal window.

On a Linux machine with an intel processor:
```
curl -sL https://github.com/simonmichael/hledger/releases/download/1.50/hledger-linux-x64.tar.gz | tar -xzv -f- -C/usr/local/bin hledger hledger-ui hledger-web
```

On a modern mac with an ARM ("M") processor:
```
curl -sL https://github.com/simonmichael/hledger/releases/download/1.50/hledger-mac-arm64.tar.gz | tar -xzv -f- -C/usr/local/bin hledger hledger-ui hledger-web
```

On an older mac with an intel processor:
```
curl -sL https://github.com/simonmichael/hledger/releases/download/1.50/hledger-mac-x64.tar.gz | tar -xzv -f- -C/usr/local/bin hledger hledger-ui hledger-web
```

On a Windows machine with an intel or ARM processor:\
(To get a terminal window, type: Windows-R, powershell, Return)
```
cd ~
curl https://github.com/simonmichael/hledger/releases/download/1.50/hledger-windows-x64.zip -OutFile hledger-windows-x64.zip
Expand-Archive hledger-windows-x64.zip -Force -DestinationPath AppData\Roaming\local\bin
```

The end result should be that you can run `hledger --version` and see a recent version:
```
$ hledger --version
hledger 1.50 ...
```

The examples in this book assume you are using this latest hledger version.
(And if you're on Windows, that you are using powershell, not CMD.EXE.)

<br>

(Part of [hledger by example](hledger-by-example.md).)
