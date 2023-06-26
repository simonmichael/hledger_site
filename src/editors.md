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

Here are ledger-mode's [hledger-related issues](https://github.com/ledger/ledger-mode/issues?q=label:hledger).


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

Here's how to add extra checks within a specific journal file:
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

## VS Code

### hledger-vscode

<https://github.com/mhansen/hledger-vscode>

## Miscellaneous

From the mail list, a trick for aligning transaction amounts: 
"Space-indent the account, tab-indent the amount, set a large tab stop."

