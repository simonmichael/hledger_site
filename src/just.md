<https://github.com/casey/just> is a cross platform task runner -
like [make](https://en.wikipedia.org/wiki/Make_(software)),
but easier and more suitable for running commands (and more cross platform).
It is a nice tool for creating (and remembering!) financial reports and scripts.

[Scripts > justfile](scripts.md#justfile) is an example.
Of course you don't have to use these particular scripts; customise this
with your own reports, or start fresh with `just --init`.

`just --choose` will let you choose a command (recipe) interactively,
by default using `fzf` and showing a preview of the commands that will be run.

You can configure a different chooser with --chooser or JUST_CHOOSER
([Just > Selecting Recipes to Run With an Interactive Chooser](https://just.systems/man/en/chapter_51.html)).

Eg on mac, this shows a graphical chooser for selecting 
```
$ brew install choose-gui
$ export JUST_CHOOSER=choose
$ just --choose
```

This makes fzf show the command output in the preview pane.
Careful, it will run every command you select - so be sure they are safe (and reasonably quick) to run!
This is great for selecting and viewing hledger reports:

```
$ just --choose --chooser "fzf --preview 'just {}'"
```
