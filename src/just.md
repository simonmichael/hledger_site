# hledger and just

<https://github.com/casey/just> is a cross platform task runner -
like [make](https://en.wikipedia.org/wiki/Make_(software)),
but easier and more suitable for running commands (and more cross platform).
It is a nice tool for creating (and remembering!) financial reports and scripts.

[Scripts > justfile](scripts.md#justfile) is an example.
Of course you don't have to use these particular scripts; customise this
with your own reports, or start fresh with `just --init`.

## Interactive choosing

`just --choose` will let you choose a command (AKA "recipe") interactively,
by default using `fzf` and showing a preview of the commands that will be run.

You can configure a different chooser with --chooser or JUST_CHOOSER
([Just > Selecting Recipes to Run With an Interactive Chooser](https://just.systems/man/en/chapter_51.html)).
Eg on mac, this shows a GUI chooser:

```
$ brew install choose-gui
$ export JUST_CHOOSER=choose
$ just --choose
```

## Showing report output in the preview

This makes fzf show the command output in the preview pane.
Careful, it will run every command you select! 
So be sure your just commands are safe and reasonably quick to run, eg hledger reports.
This is great for selecting and viewing reports.

```
$ just --choose --chooser "fzf --preview 'just {}'"
```
