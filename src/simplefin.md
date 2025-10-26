# hledger and SimpleFIN

<https://simplefin.org> is a small-developer-friendly aggregator of US bank data -
like Plaid or Yodlee, but simpler and cheaper.
SimpleFIN works well as an import source for hledger.

Ideally your banks would run their own simplefin servers, 
but in practice you'll be using [SimpleFIN's server](https://beta-bridge.simplefin.org).
You authenticate directly with your banks, operations are read only, SimpleFIN apparently sees only encrypted data
(you can optionally grant temporary unencrypted access for diagnosing problems).

## An example workflow

Set up:

1. Make a local copy of the [bin/simplefinsetup,simplefinjson,simplefincsv](https://github.com/simonmichael/hledger/tree/master/bin#simplefinsetup) scripts.
2. Sign up with SimpleFIN, and copy the setup token.
3. Paste the setup token into your `simplefinsetup` script, and run it to get a custom access url.
4. Paste the access url into your `simplefinjson` script. Keep this url secret.
5. In a [rules file](https://hledger.org/hledger.html#csv) for each bank account, configure a `source` rule to read that account's data:
    ```rules
    source | simplefincsv data/simplefin.json 'my bank name.*checking'
    ```

Every day or as needed:

1. Download all accounts' recent transactions:\
  `simplefinjson >data/simplefin.json`
2. Import new transactions to your journal (or see a preview):\
  `hledger import *.rules [--dry-run]`

## See also

- <https://github.com/simplefin/sfin2ledger> an older converter (2016)
