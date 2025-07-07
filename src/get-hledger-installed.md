# Getting hledger installed

[Install](install.md) shows the ways to get hledger installed on your computer.
Each new hledger version is better than the preceding ones, so using the latest is ideal.
"hledger by example" assumes you are using the latest hledger version.

It's important that hledger is installed somewhere in your system's PATH, so that you can just type "hledger" and it runs.
How exactly to do this depends on your system and install method.
Here's a simple method, using the official release binaries.
Copy and paste the appropriate line(s) into a terminal window to run them:

On a mac with an ARM processor:
```
curl -sL https://github.com/simonmichael/hledger/releases/download/1.43.2/hledger-mac-arm64.tar.gz | tar -xzv -f- -C/usr/local/bin hledger hledger-ui hledger-web
```
or on an older mac with an intel processor:
```
curl -sL https://github.com/simonmichael/hledger/releases/download/1.43.2/hledger-mac-x64.tar.gz | tar -xzv -f- -C/usr/local/bin hledger hledger-ui hledger-web
```
or on a GNU/linux machine (intel):
```
curl -sL https://github.com/simonmichael/hledger/releases/download/1.43.2/hledger-linux-x64.tar.gz | tar -xzv -f- -C/usr/local/bin hledger hledger-ui hledger-web
```
or on a Windows machine (intel or ARM), in a powershell window:
```
cd ~
curl https://github.com/simonmichael/hledger/releases/download/1.43.2/hledger-windows-x64.zip -OutFile hledger-windows-x64.zip
Expand-Archive hledger-windows-x64.zip -Force -DestinationPath AppData\Roaming\local\bin
```

The end result should be that you can run `hledger --version` and see a recent version:
```
$ hledger --version
hledger 1.43.2 ...
```

<br>

(Part of [hledger by example](hledger-by-example.md).)
