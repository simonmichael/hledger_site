# Editor configuration

If you edit your journals (and other hledger data files) with a [text
editor](https://en.wikipedia.org/wiki/Text_editor), you want that
frequent task to be as pleasant and non-tedious as possible. So it's
worth using a powerful editor - one with comfortable copy/paste, search
& replace, and perhaps more advanced features like macros.

Also, for most editors there are helper modes which can make editing
hledger journal files much more convenient. These provide things like
syntactic highlighting, auto indentation, and tab completion of
account names. You can find the latest modes at:

<https://plaintextaccounting.org/#editor-support>

hledger-mode, hledger-vim, hledger-vscode etc. are designed specifically for hledger.
Modes with "ledger" in their name, such as
ledger-mode, vim-ledger etc., can also work well for hledger journals.

## ledger-mode tips

<https://github.com/ledger/ledger-mode>
([manual](http://www.ledger-cli.org/3.0/doc/ledger-mode.html)), for
[Emacs](https://www.gnu.org/software/emacs/), is the most used and
maintained helper mode for h/ledger files. Use M-x customize to browse
ledger-mode's settings and change them as seems wise.

Change `ledger-binary-path` to hledger
(unless your hledger journal is ledger-compatible and you also have ledger installed).

A typical cause of incompatibility is when ledger-mode tries to call the "ledger" binary
with a command or arguments that hledger doesn't support. In this case you can

- open an ledger-mode issue, asking, suggesting how, and/or
  providing a pull request to make it more hledger-compatible (best)
  
- do something locally to keep ledger-mode happy, eg define a
  small add-on command mimicking the required ledger command.

Eg: `ledger-display-balance-at-point` (C-c C-p) runs 
`ledger cleared ACCT`.
hledger doesn't have a "cleared" command, so you could make it by
creating `hledger-cleared.sh` in $PATH:

    #!/bin/sh
    hledger balance -N "$@"  # or add -C, or whatever you like

[#367 ledger-mode setup for hledger needs documenting](https://github.com/simonmichael/hledger/issues/367)
has more discussion and tips, which should be collected here.

To toggle a transaction's cleared status: move point to it, C-c C-e.
To toggle just a posting's status: move point to it, C-c C-c.

## Emacs tips

Ledger entries can be embedded in a org file and manipulated using Babel. See eg
[Using Ledger for Accounting in Org-mode with Babel](https://orgmode.org/worg/org-contrib/babel/languages/ob-doc-ledger.html)

A helper to browse TODO tags in the journal:

    (defun journal-todos nil (interactive) (lgrep "TODO:" "current.journal" "~/finance" nil))

## General editing tips

From the mail list, somebody's trick for alignment: "Space-indent the account, tab-indent the amount, set a large tab stop."

