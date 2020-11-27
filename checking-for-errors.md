# Checking for errors

hledger can check your data in various ways. 
Here are some checks/desirable properties, with short names for convenience:

These checks are run always (with all hledger commands):

- `parseable` - data files are well-formed and can be successfully parsed
- `autobalanced` - all transactions are balanced, possibly by converting commodities using [transaction prices] or automatically-inferred transaction prices
- `assertions` - all [balance assertions] are passing (except with `-I`/`--ignore-assertions`)

[transaction prices]: journal.html#transaction-prices
[balance assertions]: journal.html#balance-assertions
[strict mode]: hledger.html#strict-mode

These checks are run only in hledger-1.19.99's [strict mode] (with `-s`/`--strict`):

- `accounts` - all account names used by transactions have been declared

To perform the above checks, run any command, eg
(on Windows, omit the `>/dev/null` part):
```shell
$ hledger stats >/dev/null
```

These checks are run by special commands (for now):

- `dates` - transactions are ordered by date (command: `check-date`)
- `leafnames` - all account leaf names are unique (command: `check-dupes`)
- `tagfiles` - all tag values containing / (a forward slash) exist as file paths (addon command: `hledger-check-tag-files.hs`)
- `fancyassertions` - more complex balance assertions are passing (addon command: `hledger-check.hs`)

The addon commands are available in <https://github.com/simonmichael/hledger/tree/master/bin> (cf [Scripting](scripting.html)).

These are some checks we might add in future:

- `commodities` - all commodity symbols used have been declared
- `payees` - all payee names used have been declared
- `pricebalanced` - transactions are balanced, possibly using explicit transaction prices but not auto-inferred ones
- `fullybalanced` - transactions are balanced in each commodity, without needing any conversions
- `explicitamounts` - all transaction amounts have been recorded explicitly


## Other ways

Commit some hledger report output into your version control system.
Then you can detect any changes, eg:

```shell
$ hledger COMMAND > report.txt; git diff -- report.txt
```
