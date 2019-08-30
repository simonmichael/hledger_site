# Command line completion

[Command-line completion](https://en.wikipedia.org/wiki/Command-line_completion)
is a feature in shells (Bash, Fish, Zsh, ...) to automatically complete a
command, argument, or option. Usually, the completion is triggered by
pressing the tab key once or twice after typing `hledger `.  (The
exact behavior may differ in shells other than Bash.)

[![asciicast](https://asciinema.org/a/227935.svg)](https://asciinema.org/a/227935)

The completions handle hledger's CLI:

- commands and generic options
- command-specific options
- filenames for options that take a filename as argument
- account names from journal files (but not yet for files named by `--file`)
- query filter keywords like `status:`, `tag:`, or `amt:`

## Installation for end users

Completions are currently only implemented for the Bash shell.

Please check first if the completions for hledger are already installed on your
distribution. Refer to the last paragraph of this section for how to test that.

To install the completions manually, follow this steps:

- [Download](https://raw.githubusercontent.com/simonmichael/hledger/master/shell-completion/hledger-completion.bash)
  or copy the file `shell-completion/hledger-completion.bash` and save
  it as `~/.hledger-completion.bash`.

- Add the command `'source ~/.hledger-completion.bash'` this to the end of your
  `~/.bashrc` file.

- Then, you have to start a new Bash, e.g. by typing `bash` on the current
  shell.

Example installation script:

```
curl https://raw.githubusercontent.com/simonmichael/hledger/master/shell-completion/hledger-completion.bash > ~/.hledger-completion.bash
echo 'source ~/.hledger-completion.bash' >> ~/.bashrc
bash  # open a new bash to try it
```

Now, try it by typing `hledger` (with a space after the command) and press the
tab key twice. You should see a list of appropriate completions for hledger. 
Then you can type a part of one of the suggestions and press tab again to
complete it.
If you only see filenames, the completions are not correctly installed.

## Completion scripts for other shells

You're welcome to add completion scripts for other shells (e.g. Fish or Zsh)! 
It should not be too hard. All available hledger options and commands
are already there. Only the shell hooks and logic is missing.

Please refer to the README in the [shell-completion](https://github.com/simonmichael/hledger/tree/master/shell-completion) folder.
