# Save frequently used options

You can save frequently used options and arguments in an
[argument file](hledger.html#argument-files), one per
line, then reuse them via a @FILE argument on the command line.

Here's an example.
I keep frequently-used options for quick daily reports in a file
called `simple.args`. The name can be anything; I use a `.args` suffix
so I can find these easily. Here's the content of `simple.args`:
```
--alias=/:(business|personal):/=:
--alias=/:(bank|cash|online):/=:
--alias=/:bofi:/=:b
--alias=/:unify:/=:u
--alias=/:wf:/=:w
-2
cur:.
```
The format is one command-line flag or command-line argument per line.
Special characters should have one less level of quoting than at the command prompt
(so no quotes around those (|) characters),
and spaces should be avoided except inside quotes (so = is used between flags and arguments).

Now if I write `@simple.args` in a hledger command line, it will be replaced
by all of the above options/flags.

(In case you're wondering about this example: it removes some detail, giving simplified reports which were easier for me to read at a glance):

- the [aliases](journal.html#rewriting-accounts) simplify the chart of accounts, hiding some distinctions (e.g. business vs. personal) and flattening some bank account names
- the `-2` [depth flag](hledger.html#depth-limiting) limits account depth to 2, hiding deeper subaccounts
- the `cur:.` [query argument](hledger.html#queries) shows only single-character currencies, hiding a bunch of cluttersome commodities I don't want to see

## Usage

Generate a balance report showing the simplified accounts:
```shell
$ hledger bal @simple.args
```
Start a live-updating hledger-ui showing the simplified asset accounts only:
```shell
$ hledger-ui --watch @simple.args assets
```

Options in the arguments file can be overridden by similar options later on
the command line, in the [usual way](hledger.html#options).
E.g., to show just a little more account detail:
```shell
$ hledger bal @simple.args -3
```

## Suppressing this feature

If you actually need to write an argument beginning with @,
e.g., let's say you have an account pattern beginning with that character,
you'll want a way to disable this feature.  On unix systems at least,
you can do that by inserting a `--` (double hyphen) argument first. E.g.,
```
$ hledger bal @somewhere.com       # looks for additional arguments in the ./somewhere.com file
$ hledger bal -- @somewhere.com    # matches account names containing "@somewhere.com"
```

On windows, this double hyphen trick [might](https://ghc.haskell.org/trac/ghc/ticket/13287) require a hledger built with GHC 8.2+.
