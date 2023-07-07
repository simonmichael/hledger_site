# hledger and just

<https://github.com/casey/just> is a cross platform task runner -
like [make](https://en.wikipedia.org/wiki/Make_(software)),
but easier and more suitable for running commands (and more cross platform).
It is a nice tool for creating (and remembering!) financial reports and scripts.

Define commands (AKA "recipes") in a `justfile` in your finance directory.
[Scripts > justfile](scripts.md#justfile) is an example.
Of course you don't have to use these particular scripts; customise this
with your own reports, or start fresh with `just --init`.
Then you can

```cli
$ just -lu         # list your commands, with descriptions, in original order
$ just CMD [ARGS]  # run a command, optionally with extra arguments
$ alias j=just     # use a shorter j alias, etc.
```

Note the example justfile will pass any additional command options/arguments to hledger,
but currently you must avoid arguments containing spaces.
So `just x -p '1/1 to tomorrow'` won't work (you could write `just x -p1/1totomorrow` instead).

## Interactive choosing

`just --choose` will let you choose a command (AKA "recipe") interactively,
by default using `fzf` and showing a preview of the commands that will be run.

You can configure a different chooser with --chooser or JUST_CHOOSER
([Just > Selecting Recipes to Run With an Interactive Chooser](https://just.systems/man/en/chapter_51.html)).
Eg on mac, this shows a GUI chooser:

```cli
$ brew install choose-gui
$ export JUST_CHOOSER=choose
$ just --choose
```

## Showing report output in the preview pane

This is great for selecting and viewing reports.
Careful - it will run every command you select! 
So be sure your commands are safe and reasonably quick to run (eg hledger reports.
If you have other commands which should not be run so often, you could move them to a separate just file.)
Then:

```cli
$ export JUST_CHOOSER="fzf --preview='just {}'"
$ just --choose
```

With [bkt](https://github.com/dimo414/bkt),
you can cache these outputs, making slow reports display instantly
(here's more on [--ttl and --stale](https://github.com/dimo414/bkt#cache-lifespan) and [using bkt with fzf](https://github.com/dimo414/bkt/discussions/29)):

```cli
$ export JUST_CHOOSER="fzf --preview='bkt --ttl=15m --stale=15s -- just {}'"
$ just --choose
```
