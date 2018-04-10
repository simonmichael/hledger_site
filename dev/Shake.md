`Shake.hs` in the top directory complements the Makefile; it is used for some more complex 
scripts relating to documentation.

### Tests

Run the package tests of all (or selected) packages.
Does not include hledger's functional tests.
```shell
$ stack test [PKG]
```

Run some hledger unit tests via a built-in hledger command:
```shell
$ [stack exec] hledger test
```

Run hledger's functional tests:
```shell
$ stack install shelltestrunner
$ make functest
```

Run both unit and functional tests:
```shell
$ make test
```

Test generation of haddock docs:
```shell
$ make haddocktest
```
