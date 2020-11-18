# Rewrite commodity symbols

Three ways to temporarily change a commodity symbol, eg to show "$" as "USD" in a report:

1. postprocess

Simplest. Here, we use `sed`:

```shell
hledger bal | sed 's/\$/USD /g'
```

2. preprocess

Most powerful, eg you can merge multiple symbols into a single commodity this way:

```shell
cat $LEDGER_FILE | sed 's/\$/USD /g' | hledger -f- bal
```

3. value conversion

Most portable, requiring only hledger.
This assumes your other P directives, if any, don't interfere:

Create a dummy one-to-one conversion rate between the two commodity symbols,
in your main journal or in a separate file you can include only when needed:
```shell
echo 'P 2000-01-01 $ 1 USD' >> rewrite-symbols.j
```
```shell
hledger -f rewrite-symbols.j -f $LEDGER_FILE bal -V
```
