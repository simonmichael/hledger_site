Notes related to http://hledger.org/manual#queries.

https://github.com/simonmichael/hledger/issues/203#issuecomment-369972593  
When query expressions aren't expressive enough, it's common practice to pipe two hledger commands together in a pipe. First a `print` command to select a subset of transactions, then a second command operating on the first command's output. (The output of `print` is always valid journal format.)

Eg, which part of salary income went to checking ?
```
$ hledger print income:salary | hledger -f- balance assets:checking
```
