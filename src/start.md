# Get Started

<div class=pagetoc>

<!-- toc -->
</div>

Starting out with hledger and Plain Text Accounting, not to mention setting up a new accounting system, can be a lot to take in. This page aims to help!
After [installing](install.md) hledger, reading some of the docs below should be helpful.

## Getting help

To ask questions or search past discussions, see:

- the [#hledger matrix chat](https://matrix.hledger.org/) (especially good for quick help)
- or the [#hledger IRC chat](https://irc.hledger.org/)
- or the [hledger mail list](https://list.hledger.org/)
- or the [PTA forum](https://forum.plaintextaccounting.org/)
- or other [Support](support.md) places, such as the issue tracker.

## Quick starts

We have several short introductions, which assume a little bit of command line know-how.
Here they are, simplest first - pick one that you like:

- [Home page quick start](index.md#quick-start)
- [2 minute quick start](2-minute-quick-start.md)
- [10 minute quick start](10-minute-quick-start.md)
- [hledger manual: Common tasks](hledger.md#common-tasks)
- [Workflows](workflows.md)

## Tutorials

Or, start with a more detailed step-by-step tutorial, with screenshots.

- [Tutorial: hledger-web](web.md)
- [Tutorial: hledger basics](basics.md)
- [Tutorial: hledger-ui](ui.md)
- [Accounting basics and further study](accounting.md)
- [Tutorial: Import CSV data](import-csv.md)

## Manuals

Or, read the manuals to know everything.
These are the authoritative and most up-to-date hledger docs.
You can also view them on your local machine with [`hledger help`](hledger.md#help), `hledger-ui --man`, `hledger-web --info`, etc.
The hledger manual's table of contents is a good overview.

- [hledger manual](hledger.md)
- [hledger-ui manual](hledger-ui.md)
- [hledger-web manual](hledger-web.md)

## Videos

- [hledger fan's beginner videos](https://www.youtube.com/channel/UCZLxXTjOqLzq4z5Jy0AyWSQ/videos) cover some hledger basics
- [Videos](videos.md) has some old talks and presentations

## More docs

- [FAQ](faq.md) - frequently asked questions
- [Cookbook](cookbook.md) - task-oriented tips and how-tos
- [examples/](https://github.com/simonmichael/hledger/tree/master/examples) - examples and snippets, old and new 
- [plaintextaccounting.org](https://plaintextaccounting.org) - general PTA docs, not hledger-specific

## Tips

Some ideas on how to approach hledger and accounting:

### Motivation

Find things that get you in the mood and energised. Maybe a book ?

- [The Richest Man in Babylon](https://forum.plaintextaccounting.org/t/the-richest-man-in-babylon/396)
- [Your Money or Your Life](https://yourmoneyoryourlife.com)

### Little and often

Accounting is an ongoing activity, best done in regular small doses.
The more often you do it, the easier it is, because less has happened and you can remember it.
Ten minutes daily can achieve a lot. (Or less, once you get a routine going.)

### Small steps

You can start using hledger in very simple ways, and get immediate benefit.
Prioritise your work: a good way is to think about your most pressing needs and what kind of report would help.
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

<!--
Notes

I'll throw out the obvious: read the docs at hledger.org. Particularly the reference manuals for hledger and hledger-web - these are also available as local man pages and info manuals - but hledger.org has them with useful hyperlinks, and has additional docs such as Get Started, FAQ, Cookbook and Developer docs. Clearly you shouldn't have to read this.. library.. up front, but at least survey everything, including the tables of contents, to get a sense of where things are.
There's also a Videos page; and at https://plaintextaccounting.org/#articles-blog-posts , many bite-sized blog posts. These can be a nice alternative when reading docs gets boring.
There's a lot of rabbit holes you can go down when learning PTA, so setting some goals and managing your focus is helpful. Lisp, Haskell and Emacs are also big topics and definitely not needed for hledger use, though very fun and worthwhile in themselves.
You can always browse the mail list archives for past discussions that look interesting. And I will always recommend joining the hledger chat - a little bit of a hoop but not much. Checking the discussion there once in a while, or asking when you get stuck, can save a lot of time.
(answer to:
 B: I am not a coder/programmer/software professional—just a numbers-inclined user who is old enough to remember pre-GUI computing, appreciates the philosophy of plain text accounting, and had dabbled with code (Processing, Arduino, and HTML/CSS once upon a time).
 ...
 Now, I’m wondering if anyone here could offer some guidance towards a strategic course of study that would help me get the most out of hledger? Should I learn Lisp? Haskell? Maybe focus on understanding how to use Emacs?
 I do believe that continued use of hledger will drive more learning (It already has!) but I can’t help but think that troubleshooting as questions and issues arise isn’t the only (or most effective) way. There’s a lot of lingo, terms—a whole universe truly—that is new to me and I’m curious now that I have arrived where others might recommend I start to get a better sense of the lay of the land so to speak.
)

-->

### Have fun, take breaks!

- [Accounting for Dragons](https://podcastle.org/2009/10/09/pc-miniature-38-accounting-for-dragons)
