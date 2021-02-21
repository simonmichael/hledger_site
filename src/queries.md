# Queries

From the hledger manual's [QUERIES](https://hledger.org/hledger.html#queries) section:

> *One of hledger’s strengths is being able to quickly report on precise
> subsets of your data. Most commands accept an optional query
> expression, written as arguments after the command name, to filter the
> data by date, account name or other criteria.*

Here are some more notes on this subject:

- <https://github.com/simonmichael/hledger/issues/203#issuecomment-369972593>  
  When query expressions aren't expressive enough, it's common practice to pipe two hledger commands together in a pipe. First a `print` command to select a subset of transactions, then a second command operating on the first command's output. (The output of `print` is always valid journal format.)

    Eg, which part of salary income went to checking ?
    ```shell
    $ hledger print income:salary | hledger -f- balance assets:checking
    ```
