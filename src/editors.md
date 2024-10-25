# Editor configuration

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

### Ledger-mode

<http://github.com/ledger/ledger-mode>
([manual](http://www.ledger-cli.org/3.0/doc/ledger-mode.html)), for
[Emacs](https://www.gnu.org/software/emacs/), is the most used and
maintained helper mode for hledger and Ledger files.

It has some hard-coded dependence on Ledger's command-line interface, so
does not work perfectly with hledger, whose CLI is similar but not
identical.

**1. Basic configuration:**

``` elisp
(setq ledger-binary-path "hledger"
      ledger-mode-should-check-version nil
      ledger-report-auto-width nil
      ledger-report-links-in-register nil
      ledger-report-native-highlighting-arguments '("--color=always"))
(add-to-list 'auto-mode-alist '("\\.hledger\\'" . ledger-mode))
```

Or, using use-package:

``` elisp
(use-package ledger-mode
  :custom
  ((ledger-binary-path "hledger")
   (ledger-mode-should-check-version nil)
   (ledger-report-auto-width nil)
   (ledger-report-links-in-register nil)
   (ledger-report-native-highlighting-arguments '("--color=always")))
  :mode ("\\.hledger\\'" "\\.ledger\\'"))
```

This configuration makes ledger-mode commands run hledger, configures
colored output correctly and turns off some incompatible functionality.
Most editing functions in the journal buffer work correctly and so do
most of the reports. Annoyingly, reconcilliation, quick balance display
and the add-transaction prompt fail due to hardcoded ledger-specific
options that hledger doesn't have. A way to get around this is outlined
under the feature compatibility list.

**Feature Compatibility Checklist:**

- [ ] **Ledger Buffer**
  - [x] Navigation
  - [x] Completion
  - [x] Set effective date (\<C-c\> \<C-t\>)
  - [ ] Quick balance display (\<C-c\> \<C-p\>) – **FAILS due to
    –date-format**
  - [x] Copy Transaction (\<C-c\> \<C-k\>)
  - [x] Clear Posting/Transaction
  - [x] Delete transaction
  - [x] Sorting transactions
  - [x] Narrowing (i.e. regex filtering)
  - [x] Transaction completion by payee (\<C-c\> \<TAB\>)
  - [ ] Add transaction (\<C-c\> \<C-a\>) – **FAILS due to
    –date-format**
- [ ] **Report Buffer** (\<C-c\> \<C-o\> \<C-r\>)
  - [x] balance
  - [x] register
  - [ ] payee – **FAILS, hledger uses @item syntax for argument files,
    ledger uses @payee to filter transactions**
  - [x] account
  - [x] custom  
    NOTE: custom report simply opens the minibuffer with the
    word ledger prefilled. It works if you input a valid hledger
    command, but it doesn't use the current buffer filename or anything.
    It does update on buffer changes however. Naming and saving custom
    reports works as well.
    - [ ] Expansion formats
      - [x] %(ledger-file)
      - [x] %(payee)
      - [x] %(account)
      - [ ] %(tag-name) – **TODO: Figure out what/why.**
      - [ ] %(tag-value) – **TODO: Figure out what/why.**
      - [x] %(month)
    - [ ] Jump to transaction from register report – **FAILS, line data
      is passed to emacs using ledger's –prepend-format**
    - [x] Reversing report order
- [ ] **Reconcile Buffer** – **FAILS due to –date-format**  
  NOTE: Opening
  the reconcile buffer uses Narrowing (\<C-c\> \<C-f\>) to filter
  transactions to only ones relevant to the selected account. After the
  reconcile buffer errors out filtering needs to be turned off with
  \<C-c\> \<C-f\>.
- [ ] **Scheduling Transactions** – **FAILS ledger/hledger UI
  incompatibility**  
  NOTE: ledger has a scheduler for periodic
  transactions which are written in a separate ledger file. Ledger-mode
  provides a way to view and copy those transactions into the main
  journal, making the process of updating the journal with periodic
  transactions somewhat easier. The closest corresponding functionality
  are hledger's periodic transactions and the –forecast option (how easy
  it would be to adapt ledger-mode to it remains to be seen).

**2. Compatibility scripts**

Example: ledger-display-balance-at-point (C-c C-p) runs \`ledger cleared
ACCT\`. Hledger doesn't have a cleared command, but the incantation
\`hledger balance -N -C ACCT\` is equivalent to it. Therefore, by
putting the following script in your PATH:

``` shell
#!/bin/sh
hledger balance -N -C "$@"
```

… and making ledger-display-balance-at-point run it, you get the correct
functionality. Some incompatibilities can be solved in this fashion, but
it's a hassle.

**TODO** – Make a list of commands ledger-mode runs  
**TODO** – Compile the set of scripts from links below

**TODO** – Add common hledger reports as custom reports

[#367 ledger-mode setup for hledger needs documenting](https://github.com/simonmichael/hledger/issues/367) has
more tips to be collected here.  
[hledger-related issues](https://github.com/ledger/ledger-mode/issues?q=label:hledger)

**Errors:**

1.  The –date-format error:  
    ledger-mode hardcodes this option into it's
    ledger incantations. It can be avoided in some, but not all cases.
    Generally the first and most common error you bump into.
2.  –columns: see [\#279](https://github.com/ledger/ledger-mode/issues/279)  
    This error is why (setq ledger-report-auto-width nil) is necessary.
3.  –prepend-format:  
    This is why (setq ledger-report-links-in-register
    nil) is necessary.  
    ledger-mode links register report entries to
    transactions by prepending line data to ledger's output, then
    stripping that data from the buffer and turning the output to links.
    Hledger doesn't have a –prepend-format CLI option.

### hledger-mode

<https://github.com/narendraj9/hledger-mode>\
An alternative to ledger-mode, written specifically for hledger. Has some different features. Less actively maintained.

### flycheck-hledger

<https://github.com/DamienCassou/flycheck-hledger> (2021)
provides realtime indication of problems in your journal.
It can be used with ledger-mode or hledger-mode.

``C-x ` `` steps to the next problem in the current file.\
``C-u C-x ` `` restarts the scan from the top.\
A description should appear in the  message area, 
but Emacs may hide it behind "...locus..." messages;
you can fix that by customising the `next-error-verbose` variable to off.

Sample config:
```elisp
(use-package flycheck-hledger
  :after (flycheck ledger-mode)  ; or hledger-mode
  :ensure t
  :demand t
  :custom
  (flycheck-hledger-strict t) 
  (flycheck-hledger-checks '("ordereddates" "recentassertions"))   ; extra checks from https://hledger.org/hledger.html#check: ordereddates, uniqueleafnames, payees, recentassertions, tags..
  ;(flycheck-hledger-executable "hledger")
  )
```

Currently flycheck-hledger always runs hledger with the `--auto` flag,
so be aware that any auto posting rules will be active.

### flymake-hledger

<https://github.com/DamienCassou/flymake-hledger/> (2023)
is a more recent alternative to flycheck-hledger, using the built-in Flymake
rather than the third-party Flycheck feature.

Here are some early configuration notes, using use-package:

```elisp
;; Enable verbose use-package debug info when starting with --debug-init
;; (when init-file-debug
;;   (setq use-package-verbose t
;;         use-package-expand-minimally nil
;;         use-package-compute-statistics t
;;         debug-on-error t))

;; Configure flycheck-like keybindings for flymake:
(use-package flymake
  :bind (
         :map flymake-mode-map
         ("C-c ! n" . flymake-goto-next-error)
         ("C-c ! p" . flymake-goto-prev-error)
         ("C-c ! l" . flymake-show-buffer-diagnostics)  ; a new list for each buffer, unlike flycheck
         ("C-c ! v" . flymake-switch-to-log-buffer)))

(use-package flymake-hledger
  :load-path "~/src/flymake-hledger"
  :after (ledger-mode flymake)

  :hook (
  (ledger-mode . flymake-hledger-enable)
  ;; Make C-x ` work ?
  ;; XXX Both of these work only in the first file opened; debugging needed.
  ;; (ledger-mode . (lambda () (setq next-error-function 'flymake-goto-next-error)))
  ;; (ledger-mode . (lambda () (setq next-error-function (lambda (num reset) (when reset (goto-char (point-min))) (flymake-goto-next-error num)))))
  )

  :custom
  (flymake-show-diagnostics-at-end-of-line t)  ; might require Emacs 30
  (flymake-suppress-zero-counters t)
  (flymake-hledger-checks '("accounts" "commodities" "balancednoautoconversion" "ordereddates")) ; "recentassertions" "payees" "tags" "uniqueleafnames" https://hledger.org/hledger.html#check
  )
```

To extra checks for a specific journal file, add a line like this near the top:
```elisp
; -*- eval:(add-to-list 'flymake-hledger-checks "recentassertions" t); -*-
```

### org babel

org babel (ob) is the system for evaluating code blocks embedded in org outlines.
hledger reports can be embedded within an org outline in this way, 
and easily evaluated inline or exported in various formats.
This is a nice way to save and organise and interactively update reports.

In 2021 this functionality was moved to an optional package, org-contrib. To enable it:

- `M-x list-packages`, install org-contrib
- In your emacs config, add: `(require 'ob-hledger)`\
  (and evaluate it with `C-M-x`, or a restart)
- In any org file, add hledger commands like this:

    ```
    #+begin_src hledger :cmdline -f ~/finance/2022.journal balance
    #+end_src
    ```
- To evaluate the command inline, press `C-c C-c` with point (cursor) inside the above line
- To update all such reports in the file, press `C-c C-v b`
- To export all reports:
  - as html, and open in browser:   `C-c C-e h o`
  - as html:                        `C-c C-e h h`
  - as UTF-8 text:                  `C-c C-e t U` 
  - as markdown (if configured):    `C-c C-e m o`
  - etc.
- To export only the reports in the current subtree:
  - configure it at top of org file: `# -*- org-export-initial-scope:subtree; -*-`)
  - put point in the desired subtree before exporting as above

See also
[Using Ledger for Accounting in Org-mode with Babel](https://orgmode.org/worg/org-contrib/babel/languages/ob-doc-ledger.html)

### calc

Calc can help perform arithmetic on amounts in the buffer during data entry.
Eg to split an amount by two: 

- put point at the start of the amount, after the currency symbol
- `C-x * w 2 / q`

### Misc

A helper to browse TODO tags in the journal:

    (defun journal-todos nil (interactive) (lgrep "TODO:" "current.journal" "~/finance" nil))



## Vim

### vim-ledger

<https://github.com/ledger/vim-ledger>

### hledger-vim

<https://github.com/anekos/hledger-vim>

### timedot-vim

<https://github.com/linuxcaffe/timedot-vim>

## Neovim

Run `:TSInstall ledger` to enable [nvim-treesitter](https://github.com/nvim-treesitter/nvim-treesitter#language-parsers) for hledger.

## VS Code

### hledger-vscode

<https://github.com/mhansen/hledger-vscode>

## Miscellaneous

From the mail list, a trick for aligning transaction amounts: 
"Space-indent the account, tab-indent the amount, set a large tab stop."

