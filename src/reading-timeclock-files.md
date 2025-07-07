# Reading timeclock files

hledger can also read time logs, in [timeclock](hledger.md#timeclock) format:

```timeclock

i 2023/03/27 09:00:00 projects:a
o 2023/03/27 17:00:34
i 2023/03/31 22:21:45 personal:reading:online
o 2023/04/01 02:00:34
```
```
$ hledger -f 2023.timeclock register -D
2023-03-27   projects:a                         8.01h         8.01h
2023-03-31   personal:reading:online            1.64h         9.65h
2023-04-01   personal:reading:online            2.01h        11.66h
```

<br>

(Part of [hledger by example](hledger-by-example.md).)
