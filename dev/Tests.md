Review test-related make rules:
```
$ make help-test
```

Run unit tests:
```
$ make unittest
```

Run doctests:
```
$ make doctest
```

Run functional tests (and unit tests, now):
```
$ stack install shelltestrunner
$ make functest
```

Run the package tests
(unit tests, maybe doctests, but not functional tests)
of all or selected packages.
```
$ stack test [PKG]
```

Run "default tests: package plus functional tests":
```
$ make test
```

Test generation of haddock docs:
```
$ make haddocktest
```

Thorough test for build issues with current GHC:
```
$ make buildtest
```

Thorough test for build issues with all supported GHC versions:
```
$ make buildtestall
```

Run built-in hledger/hledger-lib unit tests via hledger command:
```
$ hledger test  # test installed hledger
$ stack build hledger && stack exec -- hledger test  # test just-built hledger
$ hledger test --help
test [TESTPATTERN] [SEED]
  Run the unit tests built in to hledger-lib and hledger,
  printing results on stdout and exiting with success or failure.
  Tests are run in two batches: easytest-based and hunit-based tests.
  If any test fails or gives an error, the exit code will be non-zero.
  If a pattern argument (case sensitive) is provided, only easytests
  in that scope and only hunit tests whose name contains it are run.
  If a numeric second argument is provided, it will set the randomness
  seed for easytests.
```

Rebuild and rerun hledger unit tests via ghcid:
```
$ make ghcid-test
```
