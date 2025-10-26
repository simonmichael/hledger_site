# hledger and SimpleFIN

<https://simplefin.org> is a small-developer-friendly aggregator of US bank data.
Like Plaid or Yodlee, but simpler and cheaper.

Ideally your banks would run their own simplefin servers, 
but in practice you'll be using [SimpleFIN's server](https://beta-bridge.simplefin.org).
You authenticate directly with your banks, operations are read only, SimpleFIN apparently sees only encrypted data
(you can optionally grant temporary unencrypted access for diagnosing problems).

SimpleFIN works well as an import source for hledger. An example workflow:

Set up scripts:

1. Make a local copy of the [bin/simplefinsetup,simplefinjson,simplefincsv](https://github.com/simonmichael/hledger/tree/master/bin#simplefinsetup) scripts.
2. Sign up with SimpleFIN, copy their setup token.
3. Paste the setup token into the `simplefinsetup` script, run that once, copy the access url it shows.
4. Paste the access url into the `simplefinjson` script.

Every day or as needed:

1. Download all accounts' recent transactions as JSON:\
  `simplefinjson >data/simplefin.json`
2. In a [rules file](https://hledger.org/hledger.html#csv) for each account, use a `source` rule to extract that account's CSV:\
  `source | simplefincsv data/simplefin.json 'my bank name.*checking'`\
  (requires hledger 1.50+)
3. `hledger import *.rules [--dry-run]`

There's also this older converter:

- <https://github.com/simplefin/sfin2ledger> (2016)
