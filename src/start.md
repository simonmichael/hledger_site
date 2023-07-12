# Get Started

<div class=pagetoc>

<!-- toc -->
</div>

Starting out with hledger or Plain Text Accounting, not to mention setting up a new accounting system,
can be a lot. This page aims to help!
After [installing](install.md) hledger, reading one or more of the docs below should be helpful.

**Quick starts**

Quick introductions (may assume a bit of command line know-how):

- [Home page quick start](index.md#quick-start)
- [2 minute quick start](2-minute-quick-start.md)
- [5 minute quick start](5-minute-quick-start.md)
- [hledger manual: Common tasks](hledger.md#common-tasks)
- [Common workflows](common-workflows.md)

**Tutorials**

Detailed step by step tutorials, with screenshots:

- [Tutorial: hledger basics](basics.md)
- [Tutorial: hledger-web](web.md)
- [Tutorial: hledger-ui](ui.md)
- [Tutorial: Accounting basics and further study](accounting.md)
- [Importing CSV data](import-csv.md)

**Videos**

- [hledger fan's beginner videos](https://www.youtube.com/channel/UCZLxXTjOqLzq4z5Jy0AyWSQ/videos) cover some hledger basics
- [Videos](videos.md) has some talks and presentations of varied freshness

**Manuals**

hledger's manual is the authoritative documentation. 
For complete details, go straight here
(or view it in the terminal with [`hledger help`](hledger.md#help)):

- [hledger manual](hledger.md)
- [hledger-ui manual](hledger-ui.md)
- [hledger-web manual](hledger-web.md)

**How-tos**

Practical advice and examples for real-world tasks are collected at:

- [FAQ](faq.md)
- [Cookbook](cookbook.md)
- [wiki.plaintextaccounting.org](https://wiki.plaintextaccounting.org) (not hledger-specific)
- [plaintextaccounting reddit](https://www.reddit.com/r/plaintextaccounting/new/)
- [old blog posts](https://plaintextaccounting.org/#articles-blog-posts) (needs update)
- [hledger's examples/ directory](https://github.com/simonmichael/hledger/tree/master/examples) (possibly)

**See also**

- [Support](support.md), especially the #hledger chat and hledger mail list, open 24/7


## How to approach hledger and accounting

### Little and often

Remember that accounting is an ongoing activity, best done in regular small doses.

The more often you do it, the easier it is, because less has happened and you can remember it.
Ten minutes daily can achieve a lot. (Or less, once you get a routine going.)

### Small steps

Good news: you can start using hledger in very simple ways, and get immediate benefit.
A good way to prioritise is to think about your most pressing needs and what kind of report would help.
For example,

- Take inventory of your debts, loans and assets; write down the names and numbers.
- Record these as "opening balances" transactions (as in the quick start docs).
- Make corrections until hledger shows your balances accurately.

Or:

- Start recording changes to the cash in your wallet, starting with today's balance.
- Then start reconciling daily (comparing the reported and actual balance, and troubleshooting any disagreements).
- Then start tracking the balance in your checking account.
- Then start tracking your other bank accounts.
- Then start categorising your incomes and expenses.
- Then find your bank transaction history and manually enter the transactions from the previous week.
- Then manually download your bank transactions as CSV and develop CSV rules so that you can print the CSV as journal entries.
- Then try downloading and importing this CSV into your journal daily for a while.
  (Only if you wish. Many people stick to manual data entry for the increased awareness it brings.)

If the task feels unclear or overwhelming, I recommend this small steps, verifiable reports approach.

If not, of course feel free to blaze away and do it all on day one.
But I would still recommend establishing a frequent reconciling routine.
It is *surprising* how quickly small events can slip through the cracks and create chaos,
and it takes a little time to develop the troubleshooting skills.
Reconciling often will save you time.

### Imperfection

Your bookkeeping does not have to be perfect or even very accurate [1].
As you practice, you will naturally learn more about the tools and
about double-entry accounting,
such as how to organise your account categories,
and how to write effective journal entries for various real-world events (transactions).

Later you can come back and improve your old journal entries if you wish.
You can decide what level of accuracy you need.

[1] Though if you really catch the PTA bug, you may find that nothing less than perfection will do!

