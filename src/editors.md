# Text editors

<div class=pagetoc>
<!-- toc -->
</div>

If you edit your journals (and other hledger data files) with a [text
editor](https://en.wikipedia.org/wiki/Text_editor), you want that
frequent task to be as pleasant and non-tedious as possible. So it's
worth using a powerful text editor - one with comfortable copy/paste, search
& replace, and perhaps more advanced features like macros.

For the popular text editors there are helper modes/extensions which can make editing
hledger journal files much more convenient. These provide things like
syntactic highlighting, auto indentation, and tab completion of
account names.  You can find a list of these extensions at \
<https://plaintextaccounting.org/#editor-support>.\
The ones with "hledger" in their name are designed specifically for working with hledger journals, while the ones with "ledger" in their name are not, but can often work well with hledger as well (eg: ledger-mode).

Here are more details and tips.

## Emacs

### ledger-mode

<https://github.com/ledger/ledger-mode>
([manual](http://www.ledger-cli.org/3.0/doc/ledger-mode.html)), for
[Emacs](https://www.gnu.org/software/emacs/), is the most used and
maintained helper mode for hledger and Ledger files. 

It has some hard-coded dependence on Ledger's command-line interface,  so does not work perfectly with hledger, whose CLI is similar but not identical. There are a few ways to get around this:

- Most common: configure ledger-mode to run `hledger`, and accept that some more advanced features (reports, reconcile-mode) will not work for now; help welcome. Configure ledger-mode this way:

  1. M-x customize-group, ledger-exec
  2. change `ledger-binary-path` to hledger

- Or: keep your hledger journal 100% Ledger-compatible, and let ledger-mode run `ledger` as it usually does. Unless you are a Ledger user who wants to run both tools, you may find this too limiting.

- Or: set up compatibility scripts emulating the ledger command set and CLI with hledger. For example: `ledger-display-balance-at-point` (C-c C-p) runs 
`ledger cleared ACCT`. hledger doesn't have a "cleared" command, but you could make one similar to Ledger's using an add-on script: `hledger-cleared.sh` in $PATH containing:
  ```shell
  #!/bin/sh
  hledger balance -N -C "$@"
  ```
  This approach can solve some of the incompatibilities, but it's a hassle.

More tips:

To toggle a transaction's cleared status: move point to it, C-c C-e.

To toggle just a posting's status: move point to it, C-c C-c.

[#367 ledger-mode setup for hledger needs documenting](https://github.com/simonmichael/hledger/issues/367) has more tips to be collected here.


### hledger-mode

<https://github.com/narendraj9/hledger-mode>\
An alternative to ledger-mode, written specifically for hledger. Has some different features. Less actively maintained.

### flycheck-hledger

<https://github.com/DamienCassou/flycheck-hledger>\
Provides realtime indication of problems in your journal.
Can be combined with ledger-mode or hledger-mode.

### org

Ledger entries can be embedded in a org outline and manipulated using Babel. See eg
[Using Ledger for Accounting in Org-mode with Babel](https://orgmode.org/worg/org-contrib/babel/languages/ob-doc-ledger.html)

### Misc

A helper to browse TODO tags in the journal:

    (defun journal-todos nil (interactive) (lgrep "TODO:" "current.journal" "~/finance" nil))



## Vim

### vim-ledger

<https://github.com/ledger/vim-ledger>

### hledger-vim

<https://github.com/anekos/hledger-vim>

## VS Code

### hledger-vscode

<https://github.com/mhansen/hledger-vscode>

## Miscellaneous

From the mail list, a trick for aligning transaction amounts: 
"Space-indent the account, tab-indent the amount, set a large tab stop."

