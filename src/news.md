# News

<div class="pagetoc" style="white-space:nowrap;">

<!-- toc -->
</div>

See also: [Release notes](release-notes.md)

## This Week In Hledger 2023-12-08

*Share your hledger/PTA user notes, dev news, achievements or experiences in the hledger matrix chat, every Friday morning (or any time, tagged with "TWIH").*

### sm

Fixed a number of issues with 1.32 and released 1.32.1.

Rewrote the hledger manual's "Budget report" section, and moved some
content to the website's Budgeting page.

Tried converting the `bake` bash scripts to `just` scripts.

Refactoring, issues, support.

### Robert Nielsen

On the hledger fan website, this I discuss one of the most useful ledger mode commands for Emacs. 
Also, a book recommendation for graphic design that you need to know about:
<https://hledgerfan.com/upgrading-to-hledger-1-32-a-book-on-graphic-design-and-ledger-mode-clean-buffer>

### Quotes of the week

*I’ve been researching the history of double entry bookkeeping
alongside learning the basics of accounting (which is how all this
started) and I think hledger and the whole universe of plain text
accounting software is super cool. Just a lovely evolution of the
method. Thanks for making it so welcoming and accessible*


## This Week In Hledger 2023-12-01

*Share your hledger/PTA user notes, dev news, achievements or experiences in the hledger matrix chat, every Friday morning (or any time, tagged with "TWIH").*

### sm
#### Dev

Added easy tagged time logging to timedot format, using letters instead of dots.

#### Ops

Update the stars.hledger.org redirect (we have reached the top 30 Haskell projects by github stars 🌟 🎉).

#### Docs

Use `cli` class instead of `shell` for all command-line examples in hledger docs.

hledger: Amount formatting, parseability

Ledger: interoperating tips updates, more about commodity directives and balance assertions.

Videos: reorder hledger fan videos.

REGRESSIONS: cleanups, discuss real names.

#### Other

Prepared change notes and released hledger 1.32 with the last quarter's changes.

I did a big cleanup on plaintextaccounting.org, which has absorbed the
wiki and now supports Obsidian-style wiki links and clickable headings.

### Robert Nielsen
Two things in this week's hledger fan blog. First, for beginners, some notes on reducing errors when reconciling accounts. Second, for the more advanced, a recommendation for an Awk programming book. See the details at [https://hledgerfan.com/fewer-errors-in-reconciling/](https://hledgerfan.com/fewer-errors-in-reconciling/).

### Quotes of the week

*It's the basis of my entire personal finance system.*

*once again, I was deeply impressed by how _useful_ hledger is, and how thoughtful it is.*


## This Week In Hledger 2023-11-24
*Share your hledger/PTA user notes, dev news, achievements or experiences 
in the hledger matrix chat, every Friday morning (or any time, tagged with "TWIH").*

### sm
#### Dev

Fixes:

- Non-print-like reports no longer add trailing decimal marks (a regression in 1.31).
  Clarified the policy on number formatting adjustments made in certain reports/output formats. (#2115)
- `tag:` queries now work when reading CSV files. (#2114)
- `-o`/`--outputfile` with a .json or .sql extension now properly selects those formats.

Improvements/features:

- The `print` command has a new `beancount` output format for exporting to Beancount.
- Timedot format supports a new letters syntax for easier tagged time logging. (#2116)
- Journal format now accepts lot costs with spaces after `{`, improving Ledger compatibility.

#### Docs

hledger: added "Amount formatting, parseability",
updated "Decimal marks, digit group marks", "commodity directive", "CSV > if table", "Timedot".

Ledger: added more notes on commodity directives, from chat.

Checking for errors: added tips on enforcing account lifetimes, from reddit,
and on minimising diffs in reports, from mail list.

Cookbook: added "Reporting version control stats".

Over at https://plaintextaccounting.org/#articles-blog-posts I started
adding blog links for 2021-2023, including ~~10~~ 33 hledger-related posts
from Robert Nielsen, Jonathan Dowland, Arsen Arsenović, and Zoran Zaric.

#### Misc

Updated project finance scripts, regenerated the project ledger with
consistent precisions in assertions, updated it with the last few
months of data from Open Collective.

### Robert Nielsen

On the theme of the recent Thanksgiving Day, here are three ways you
can use hledger to be thankful:
https://hledgerfan.com/using-hledger-for-thanksgiving/.

### Quotes of the week

*Have been taking care of my (new) records for almost two years now
and this data is really valuable for me. Gives me very nice overview
over everything and confidence that everything is alright and so on.
Just looking at some graphs can make you feel really good - in terms
of "I know whats happening", not necessarily in "all is well",
depending on those actual numbers! 😆* --someone using Beancount

## This Week In Hledger 2023-11-17

Every Friday morning (or any time, tagged with "TWIH"):
share your hledger/plain text accounting user notes, dev news,
achievements or experiences in the hledger matrix chat.

### sm
#### Dev

A new hledger user pointed out in chat out that -s/--strict mode
didn't work with the import command. This exposed a bug (#2113) and
led to some reworking of the API in Hledger.Read. Until now, when
reading multiple files, -s/--strict checks were performed for each
individual file, causing spurious failures, with import and other
commands.  Now strict checks are done only once, for the overall
journal.  Also, the import command now only updates .latest files at
the end of a successful run (after successfully passing strict checks
and after updating the journal file).

Post-"Precisiongeddon" followup: updating hledger-ui and hledger-web
to show amounts with correct display precision.

#### Ops

Fixed a problem with cloudflare authentication that was preventing
automatic TLS certificate renewal on hledger.org.

Clarified and documented my cloudflare tokens, and moved them to env
vars so the latest caddy config could be committed.

Fixed the hledger.org webhook that was not updating the site on git push.

Enabled https for "code.hledger.org" and "site.hledger.org" short urls.

Fixed some caddy warnings, formatted the config file, added some
caddy/webhook management scripts to the site makefile.

#### Docs

Spent some time drafting alternate hledger manual structures and
thinking about adding a user guide.

#### Misc

Time breakdown this week: 52% enhancement, 35% cleanup, 13% support.

### Robert Nielsen

On the hledger fan website, I discuss using the aregister and print
commands to get narrow and wider views of your data:
<https://hledgerfan.com/zooming-out-and-in>

### Quotes of the week

*Great software btw, I appreciate your work! Been poking around with
PTA and hledger since I was laid off, and it's been incredible for
managing/extending my runway 😁 I was a Mint/Personal Capital power
user before, but this takes it to the next level. Got a new job and
I've already forecasted out the whole next year, very handy and
something I could never do before"*

*I spent some time trying to set up hledger so that I’d actually use
it.  With multiple accounts it really got tedious but I loved the
actual double entry accounting and level of detail.  My wife was blown
away by the year end summary I made with it. You can see early how
much went to taxes, fica etc etc.*

*I'm really happy how my hledger edit addon helps me quickly reconcile
transactions. After CSV-importing from all different sources (phone
notes, bank websites, etc.), I pile up the ridiculous amount of
invoices and receipts next to me, grab one after the other and execute
hledger edit amt:35.11 or hledger edit Checking desc:ALDI for example
to find and edit the transaction in my $EDITOR, no matter where that
txn was located originally.  The other way round (going through the
journal, then finding the physical invoice/receipt) turned out to be
much slower.*

*I learned one thing: `if %FIELDBAME REGEX` matches against FIELDNAME
in the CSV. I didn't know that! I always match against the whole line
and am annoyed if the order of columns makes this weird*



## This Week In Hledger 2023-11-10

It's time for This Week In Hledger!
Every Friday morning (or any time, tagged with "TWIH"), share your hledger/PTA user notes, 
dev news, achievements or experiences in the hledger matrix chat.

### sm
#### Dev

This week I completed the months-long yak shave that became Precisiongeddon, and it has landed in master;
see <https://github.com/simonmichael/hledger/pull/2111> for details.
Heads up: this can change default precisions shown especially by cost and value reports - 
all for the better hopefully, but any pre-release testing is welcome. 
There's a linux binary at <https://github.com/simonmichael/hledger/actions/runs/6804488282>.

CI (continuous integration) workflows on github have been optimised a bit:
- Scheduled weekly builds have been disabled, as they were propagating
  to forks and running wastefully there in some cases.
- Some repeated rebuilding of the hledger-lib and hledger packages
  that seems unnecessary has been stopped.
- hledger-ui no longer builds its modules twice.
- Haddock testing has been moved to the release workflows to save time.

Fixed:
- amounts in value reports can sometimes be shown unstyled / with zero decimal digits,
  <https://github.com/simonmichael/hledger/issues/2105>
- auto postings break redundant equity/cost detection and transaction balancing,
  <https://github.com/simonmichael/hledger/issues/2110>
  
My time log for the week shows 69% enhancement, 27% cleanup, 5% support.

#### Docs

As part of Precisiongeddon, I started expanding hledger's "code docs", in the Hledger module's haddock.
I spent time learning how to navigate Haddock and producing a fast-feedback authoring workflow (`make haddock-watch`).
And documented a bunch of "jargon" terms, and how we handle precision and display styles.

The "Regular expressions" manual section has been rewritten and now has examples:
<https://hledger.org/dev/hledger.html#regular-expressions>.

Unmentioned last week: I added a News page on hledger.org as a stable home
for This Week In Hledger and other news updates.

#### Misc

Some notable commits:
- feat: cli: Add tsv output (#869) (Peter Sagerson)
- feat: import: interpolate regex matches in field templates (#2009) (Jonathan Dowland)

There's new interest and design discussion for referencing the matched account name
in auto postings, and I have added to lukasbestle's $20 bounty to make it $100:
<https://github.com/simonmichael/hledger/issues/1975>

### Robert Nielsen

For more advanced hledger aficionados, here is a diagram showing just
about every possible part of an hledger transaction:
<https://hledgerfan.com/almost-everything-you-wanted-to-know-about-hledger-transactions>.

### Quotes of the week

*Overall very happy with hledger so far btw!*

*And thanks for the amazing tool. Migrating to hledger has been one of the most satisfying bits of digital homesteading I’ve done.*



## This Week In Hledger 2023-11-03

### sm
#### Dev
- tests: add outshine headings for folding/readability (in Emacs),
  readme updates, include .test files in TAGS, clean up ledger-compat tests
- tools: bake dbgstrs - print a bunch of hledger debug messages for review
- tools: ghci :rmain - like :main, but reloads first, useful eg when changing --debug level
- WIP: imp: prices: fixes, clarify/improve semantics
- WIP: precisiongeddon: precision/rounding cleanups/fixes/tests/docs, too intricate to describe

Continuing heavy work on consistent and optimal precision handling,
and all the related yaks which keep showing up.

#### Seen
- https://www.chvp.be/blog/nanoledger/ nice blog post introducing nanoledger android app

### Robert Nielsen

- Beginner's corner: What are the parts of a basic hledger transaction? Two resources for learners:
  https://hledgerfan.com/beginners-corner-a-basic-hledger-transaction


## This Week In Hledger 2023-10-27

### sm

#### Dev

- demo: avoid a bug in asciinema 2.3.0, and improve the error message when asciinema fails (#2094)
- web: fix broken "File format help" link in the edit form (#2103)
- web: access control UX cleanups: replace --capabilities and --capabilities-header with --allow, and validate it before starting the app (#834)
- web: refactor permission checking
- web: sandstorm web app cleanups; rename/reorder roles & permissions
- WIP: testing and improving amount style and precision handling in cost/value reports

#### Ops

- Set up a self-hosted Sandstorm server and learned how to configure it.
- Set up a public hledger-web instance in it: sandbox.hledger.org.
  Unlike <https://demo.hledger.org>, and until the spammers find it,
  sandbox is fully writable - use it as a pastebin for examples, eg.

#### Docs

- Contemplating: merging cookbook and examples/*; something more custom to replace mdbook

#### Examples

- hledger-report1: a custom compound report script, haskell and bash versions

#### Misc

- exploring latest Paisa, and how to use it with existing setups

#### Seen

- <https://www.reddit.com/r/plaintextaccounting/comments/17g0026/average_cost_capital_gains_with_hledger>
  very clear tutorial posts on (one way of) tracking investments

- *The primary reason Ledger was created was because it maintains the
  double-entry accounting equation for you: all accounts must
  balance. GUI tools never did this aggressively enough, all of them
  having some kind of feature like "check accounts" that would end up
  finding unaccountable pennies here or there.* --John Wiegley,
  <https://www.reddit.com/r/plaintextaccounting/comments/17fg4oi/why_plain_text_accounting_over_tools_like_excel/>


### chvp

- A new Android app, NanoLedger,  was added to F-droid to facilitate adding transactions on the fly. 
  Payees, notes and accounts can all be autocompleted. 
  Give it a try at <https://f-droid.org/en/packages/be.chvp.nanoledger/>


### Robert Nielsen

- Why I created the hledger fan YouTube channel:
  <https://hledgerfan.com/why-i-created-the-hledger-fan-youtube-channel>



## This Week In Hledger 2023-10-20

G'day @room. It's time for This Week In Hledger ! 
Every Friday morning, if you have any user or dev news or experiences you'd like to share, post them in the hledger matrix chat  (<https://matrix.to/#/#hledger:matrix.org>) as a message prefixed by "TWIH:". Markdown formatting and edits are welcome. On Saturday I'll publish on the hledger mail list and on mastodon.
  
### sm

Changes merged this week include:

#### Dev

- print: add --round option for more control of precisions (#2085)
- balance-assigned amounts affect commodity styles again (#2091, regression in 1.30)
- timedot: parse unitful quantities more accurately (#2096)
- Jacob Weisz has updated the hledger-web app on Sandstorm 
  (The amazing [https://sandstorm.io](https://sandstorm.io/) cloud app platform that lets you set up free private hledger-web instances with a few clicks, check it out!)

#### Ops

- renamed main CI workflow and branch to "ci"
- updated and committed hledger.org's caddy config and short urls (redirects)
- there's now an easy short url for trying out the hledger-web app on Sandstorm: <https://sandstorm.hledger.org>.

#### Docs

- moved regression bounty info to <https://hledger.org/REGRESSIONS.html>
- hledger manual > Journal > Commodity display style: rewritten
- hledger manual > aregister, hledger-ui manual > Register screen: note how separately-dated postings get combined

#### Examples
- justfile: forecast-import: show but don't consume future-dated forecast transactions

### Robert Nielsen

<https://hledgerfan.com/a-not-so-capital-idea-for-saving-time/> describes a timesaving tip for command line users. Specifically, when typing one of your account names, hledger "forgives" you if you don't match the capitalization of an account name.


## This Week In Hledger 2023-10-13

[hey there @room - I'd like to get a regular This Week In Hledger started, along the lines of This Week in Matrix (TWIM) ... Having a regular news heartbeat like this, even a small one, will help build our community and momentum.]

Welcome to This Week In Hledger ! Every Friday morning, if you have
any user or dev news or experiences you'd like to share, post them in
the hledger matrix chat room as a message prefixed by
"TWIH:". Markdown formatting welcome, edits welcome. On Saturday I'll
publish on the hledger mail list and on mastodon. (Inspired by This
Week In Matrix).

### sm

#### Merged

- [feat: balance: Add only-summary flag (#1012) #2086](https://github.com/simonmichael/hledger/pull/2086) (Stephen Morgan)
- [feat: CSV rule negation #2088](https://github.com/simonmichael/hledger/pull/2088) (bobobo1618)
- [imp: web: include account declaration info in accounts JSON #2097](https://github.com/simonmichael/hledger/pull/2097) (S. Zeid)

#### WIP

- more control of display precision with `print`
- more consistent precision handling in general
- displaying zeros with consistent commodity symbol, precision etc. when possible
- bug wrangling

#### Docs

- [How to record journal entries](https://hledger.org/how-to-record.html#how-to-record-journal-entries)
- [hledgermatic](https://hledger.org/hledgermatic.html#hledgermatic) , a simple up-to-date workflow
- Cleanups: Common workflows, Simon's old setup

### danielchappell

#### What I like about the data format
- Double Entry accounting in human readable files, the journal files.
- Balance assignments (to check in on my cash-wallet occasionally)
- Virtual transactions (to track funds)

#### What I like about HLedger specifically
- static analysis cf. [https://hledger.org/hledgermatic.html](https://hledger.org/hledgermatic.html)

#### What I need to do my homework on
- The limitations of balance assertions in HLedger
- study haskell

#### What makes me cry about HLedger
- A lack of amount expressions - github issue #183, [https://hledger.org/ledger.html?highlight=expression#amount-expressions](https://hledger.org/ledger.html?highlight=expression#amount-expressions)



<!--
Snippets

## TWIH

Schedule: Every Friday. Use each post  news as template for next.
Post to:
<https://hledger.org/news.html>
<https://mail.hledger.org>
<https://fosstodon.org/@simonmic> tags `#hledger #PlainTextAccounting`

Old template:

hledger news, posted most Fridays. Share content submissions in the #hledger chat.

### News
Recent developments.

### Tips
User tips, contributor tips.

### Jobs
Five ways you could help the project !
1. ...
2. ...
3. ...
4. ...
5. ...

### Quote of the week

-->
