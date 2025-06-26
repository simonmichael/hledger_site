<!-- <img id="coins" src="images/coins2-248.png" style="width:120px; margin:2em 1em; float:left;" /> -->
<!-- <img id="coins" src="images/coins2-248.png" style="width:120px; margin:2em 1em; float:right;" /> -->
<link rel="stylesheet" href="https://fonts.googleapis.com/css2?family=Gabarito">
<style>
.content h1 { 
  font-family: Gabarito;
  font-size: 6em;
  white-space:normal;
  text-align:center;
  margin: 0.5em 0 0;
  display:block;
}
.responsive-image {
  width: 25%;
  margin: 1em 1em;
  float: right;
}
@media (max-width: 500px) {  /* typical breakpoint for tablets/phones */
  .content h1 { font-size:20vw; }  /* fit "hledger" within a small screen */
  .responsive-image {  /* put the image on its own line */
      float: none;
      display: block;
      width: 50%;
      margin: 1em auto;
  }
}
</style>


<img id="coins" class="responsive-image" src="images/coins2-248.png" />
<div id="heading">

# hledger

<div id="tagline" style="margin-bottom:1em;">
Robust, friendly, fast<br> plain text accounting software
</div>

</div>

<div id="quote" class="quote">
  <noscript>
    <span class="quote-text"></span>
    <span class="quote-author"></span>
  </noscript>
  <span id="quote-text"   class="quote-text"></span>
  <span id="quote-author" class="quote-author"></span>
</div>

## hledger is...

- free GPLv3+ accounting software that runs on unix, mac, windows, and the web
- based on readable, version-controllable, future-proof plain text files
- the most user friendly [plain text accounting](https://plaintextaccounting.org) app
- interoperable with [Ledger](ledger.md), [Beancount](beancount.md), [Fava](https://beancount.github.io/fava/), [Paisa](https://paisa.fyi), ...
- fast, lightweight, and dependable (we pay $50 for [regression reports/fixes](REGRESSIONS.md))
- local, not cloud-based (your private financial data remains under your control)
- free from vendor lock-in
- shipped with [command line](basics.md), [terminal](ui.md), and [web](web.md) UIs <!--, [JSON](hledger-web.md#json-api) and [Haskell](https://hackage.haskell.org/package/hledger-lib) -->
- good at importing CSV from banks and other financial institutions
- good for tracking money, investments, time, or any countable commodity
- good for learning  more about [double entry bookkeeping](accounting.md)
- comfortable for technical users, also usable by non-techies
  (command line skills are useful but not essential)
- automatable and [scripting-friendly](scripting.md)
- built with the powerful, high assurance [Haskell language](https://www.haskell.org/)
- actively used, developed and supported by [Simon Michael](https://joyful.com) and [contributors](CREDITS.md) since 2007
- strengthened by community feedback and [funding](sponsor.md)
<!--
  [command lines](https://tutorial.djangogirls.org/en/intro_to_command_line/), 
  [text editors](https://www.codementor.io/@kmcgillivray/introduction-to-text-editors-and-the-command-line-j0upqatas) and 
  [version control](https://betterexplained.com/articles/a-visual-guide-to-version-control/) 
-->

More about [Features](features.md).

Instead of using the command line, you can use the [`ui`](ui.md) or [`web`](web.md) interfaces
(or [`repl`](hledger.md#repl), [`add`](hledger.md#add), [`iadd`](scripts.md#iadd), ...)

<a href="/images/cli-green-bs-reg.png" class="highslide" onclick="return hs.expand(this, { captionText:'The hledger command line interface.' })"><img src="images/cli-green-bs-reg.png" height="190"></a>
<a href="/images/home-ui-3.png"        class="highslide" onclick="return hs.expand(this, { captionText:'The hledger-ui text user interface.' })"><img src="images/home-ui-3.png"        height="190"></a>
<a href="/images/web-bcexample.png"    class="highslide" onclick="return hs.expand(this, { captionText:'The hledger-web web user interface.' })"><img src="images/web-bcexample.png"    height="190"></a>

Some examples of doing other things with hledger:

- [Charts and Graphs](charts.md)
- [HTML reports](report-examples.md#income-statement-2012-01-012014-10-11)
- [Interop with other software](cookbook.md#other-software)
- [Investing and trading](cookbook#investing-and-trading)
- [Mobile apps](mobile.md)
- [Scripts and addons](scripts.md)
  <!-- and [Scripting](scripting.md) -->

Welcome!
This plain text accounting stuff is both useful and more fun than it sounds - care to give it a try ?
The [Install](install.md) page shows how to get an up-to-date version of hledger quickly.

Next, explore the [Docs](doc.md),
and don't hesitate to ask questions in the [Support](support.md) fora.


A few tips for using this website:

- If the site's left-side navigation bar is hidden, use the lines button at top left to show it.
- To change theme, use the paintbrush button.
- To search, use the magnifying-glass button.
- [Access keys](https://en.wikipedia.org/wiki/Access_key#Access_in_different_browsers) are also available:\
  `s` toggle sidebar, `t` theme, `/` search,\
  `1` home page, `2` recent changes, `<` previous page, `>` next page.


<style>

#grabber {
  text-align:center;
  padding:1em 1em 0 1em;
/*  border:2px solid limegreen; */
  border-radius:8px; 
  margin:1em;
}
#grabber .heading {
  /*font-style: italic; */
  font-size:x-large;
  font-weight:bold;
}

/* 
.content h2 { 
  text-align:center;
  font-size: 2em;
  margin-top:2em; 
}
*/

#tagline {
  font-size:xx-large;
  text-align:center;
  margin:0 0 0.5em;
}

div.quote {
  width: 80%;
  margin: auto;
  text-align:center;
  font-style:italic;
  font-size:90%;
}
.quote-text {}
.quote-author { white-space:nowrap; }

#leadingword {
  font-weight:bold;
  font-style:italic;
  font-size:x-large;
}

#screenshots td {
  border: 0 !important;
  padding: 0 2em 0 0;
}

code::first-line {
  font-weight:bold;
}
</style>


<script>
/* 
Quotes in markdown format. Each is one paragraph, ideally followed by --AUTHORNAME.
They are ordered roughly oldest first, though sometimes multiple quotes by the same author are grouped.
*/
const quotesmd = `

The primary reason Ledger was created was because it maintains the
double-entry accounting equation for you: all accounts must
balance. GUI tools never did this aggressively enough, all of them
having some kind of feature like "check accounts" that would end up
finding unaccountable pennies here or there. --John Wiegley

And thanks for the amazing tool. Migrating to hledger has been one of the most satisfying bits of digital homesteading I’ve done.

Overall very happy with hledger so far btw!

I learned one thing: if %FIELDNAME REGEX matches against FIELDNAME
in the CSV. I didn't know that! I always match against the whole line
and am annoyed if the order of columns makes this weird

I'm really happy how my hledger edit addon helps me quickly reconcile
transactions. After CSV-importing from all different sources (phone
notes, bank websites, etc.), I pile up the ridiculous amount of
invoices and receipts next to me, grab one after the other and execute
hledger edit amt:35.11 or hledger edit Checking desc:ALDI for example
to find and edit the transaction in my $EDITOR, no matter where that
txn was located originally.  The other way round (going through the
journal, then finding the physical invoice/receipt) turned out to be
much slower.

I spent some time trying to set up hledger so that I’d actually use
it.  With multiple accounts it really got tedious but I loved the
actual double entry accounting and level of detail.  My wife was blown
away by the year end summary I made with it. You can see early how
much went to taxes, fica etc etc.

Great software btw, I appreciate your work! Been poking around with
PTA and hledger since I was laid off, and it's been incredible for
managing/extending my runway 😁 I was a Mint/Personal Capital power
user before, but this takes it to the next level. Got a new job and
I've already forecasted out the whole next year, very handy and
something I could never do before

once again, I was deeply impressed by how *useful* hledger is, and how thoughtful it is.

It's the basis of my entire personal finance system.

I’ve been researching the history of double entry bookkeeping
alongside learning the basics of accounting (which is how all this started)
and I think hledger and the whole universe of plain text accounting software is super cool.
Just a lovely evolution of the method. Thanks for making it so welcoming and accessible.

I switched, blissfully, away from Quicken/Quickbook/Xero/all that heavy crap
to very simple and elegant textfile-based accounting (ledger/hledger)
and it's been the best and most flexible accounting experience I've ever had.
I finally feel completely in control of my companies' books.

I’ve been using hledger for a few years. ... Every service lets you download historical data as CSV,
which can be imported by hledger and turned into journal files and then into visual reports. ...
It’s a bespoke setup and super nerdy and is a bit of a pain, but it’s literally the only solution that works for us.

The main thing that made me switch to hledger was the ease of autogenerating transactions into a plain-text format. ...
GNUCash made recurring transactions easy but made it a lot harder to generate split transactions according to fixed splits that I regularly engage with my friends/family in.
With hledger I have a system of taking CSVs, classifying transactions using a stack of Python scripts and using them to generate hledger importable files. 
I go by hand and annotate transactions that my scripts couldn't classify/split, and then I import it into my main hledger file. 
I store all my inputs and intermediate imports in a git repository along with my main ledger file for auditability and to look at annotations. 
The ease of automation just can't be beat with PTA but it's definitely harder to use if you don't have a preference for TUI work.
Ease of writing importers was a huge driving factor when I switched to hledger from GNUCash.

Plain-text accounting is great. I choose hledger for the accounts of a small side business that doesn't warrant hiring an accountant.

hledger is so awesome. I just had to do my entire accounting for the last 1½yrs (because I'm a lazy slob) and thanks to hledger's rule files, it took just one evening.

each time I get the TWIH ping I get reminded to use hledger again :D But it only shows me how bad I am at managing my money 🙈😬😅

I love hledger and have a few scripts to convert downloaded CSVs from various institutions into the appropriate format and dedupe any overlap if necessary. Once a month I download a bunch of statements, run a script and have all of the data available to me.

Whoa this is amazing. And really easy!

With version control and deterministic reports, you can be late, slow, make mistakes, but still keep moving incrementally towards accuracy and clarity.

hledger has a decent front-end web UI, it runs as a local server on your machine by default.  The filter and searching on this view is quite good, and visualization is decent.

I’m not encountering hledger bugs. It’s just one of the most solid things I’ve ever used. --Aankhen

too.. many.. bugs.. --sm

If you know how to get your transactions downloaded from your bank and don't ever want to leave the command line, hledger is great for you -- I've been using hledger since 2019 and love every minute of it.

Work smoothly and steadily. Don't rush.

I just discovered hledger about a month ago after being fed up with YNAB's costs and issues. I love hledger. It's amazing. Thank you for all your hard work! --megagram

Use physical order to create mental order.

Thank you for writing hledger (and -ui and -web), it's wonderful work. --Michael Iles

The other nice part of hledger is the web UI (hledger-web), which is handy for checking out your transactions. --peterhajas

Quite happy with my switch from GnuCash to hledger: already automated importing the (broken) CSV my bank provides, and getting an overview of average monthly expenses is a one-liner. --rigrig

In summary for me: hledger has better csv importing system and ledger has support for lots. I use both. --faustlast

I started setting up hledger this year and I’m with you for a small business it is absolutely great. --abhiyerra

journal's greenyellow really makes it pop and I think it will make us rich! --sm

My favorite part of the (extensive) Haskell API is Hledger.Cli.Script. It re-exports all the most commonly used functions and data types, meaning you're just one import away from everything you need to get started. --wbadart

Way less painful than QuickBooks if you're also a programmer or adjacent. --dmoy

The reason I have hledger installed is for check ordereddates. --lvass

hledger can validate date order, that seems to eliminate copy-paste-fail-to-update-date for me. --yencabulator

A key advantage of hledger, and why I migrated from ledger, is that hledger internally orders transactions chronologically, whereas ledger inexplicably orders them in the order they appear in the file, irrespective of the date attached to them.--chromatin

The initial setup of the books is pretty time consuming especially if you have a lot of accounts. I recommend starting your most important accounts and adding as you go along. --abhiyerra

I use hledger and I love it. It has a learning curve (especially if you're new to double entry accounting) but it's rewarding.

Having hledger have all my accounts, personal and business and being able to filter out appropriate reports has been great for seeing things like is the business a money pit or am I actually growing wealth over time. --abhiyerra

I combine hledger csv output with Jupyter to generate the specific reports and charts I need. I.e. business specific versus combined for taxes. --abhiyerra

There are few things better than doing my taxes every year and being able to confirm every number on every form with simple #hledger queries (which lets me double check both my records and the forms themselves). --Michael Rees

I've been using hledger ... has more features like balance sheet,
income statement generation with a plain text file for the last 3 years
and it's been working out great. --rwbt

Been using ledger and hledger for about four years, love them dearly.
I find ledger + Emacs ledger-mode the most convenient for daily use.
hledger has a somewhat nicer way of formatting reports on the CLI,
making it useful for creating ad-hoc reports and digging into your data. --compns8-ng

Thank you for this remarkably beautiful and useful tool. --yse

Trust me, if you need to run some complicated analysis, (h)ledger has your back and you can find how to do it in the docs. --lvass

It's been a while since I've been in this room, but I've been using hledger all the while. It continues to be incredible. --daveakre

Just start with hledger-ui and like the article said: mess it up a bunch and keep fixing it or starting over. Pick one particular "zone" of finances (eg: monthly bills) and track only that part of it for a while. You'll figure it out! --ramses0

I use hledger for my solo-company. It is really great, and very easy to understand what is going on. Highly recommend. --koeng

Switched to beancount ... I really didn’t lose any of my reporting flows that I had with (h)ledger... I just made scripts that convert the beancount journal on the fly, run whatever I was used to with hledger, and then delete the temporary file.

After coming from hledger, I did try firefly, but, stuck with hledger due to how amazingly powerful it is with nothing but a text input.

A little daily-ish data-entry-and-reconciling ritual, with a pleasant tool setup, can be quite satisfying! I actually look forward to it. (That right there is part of my PTA success story. I used to suffer a lot of stress around all things finance.)

Thank you for creating such an awesome tool. I absolutely love hledger. I've been using it for more than a year, and I've become more responsible with my finances as a result. Before I started using hledger, I knew nothing about accounting. In fact, I was oblivious of my personal finances. Now, I've not only started keeping track of my finances, but I've also started investing and keeping a budget. --aaditmshah

Ledger and Hledger are some of my favourite tools.

I've switched all my accounting over to hledger (a Haskell-based and slightly more feature-filled version of the original) and I'm SUPER happy with it so far.

I switched away from Quickbooks, years ago, to plain text accounting. Couldn't be happier. I can do everything better using hledger/ledger, git, vim and make.

My primary consumption method is hledger-ui, a nice curses-based UI. It's got a watch mode so will update in real-time as you make edits to the source database, which is nice.

I liked that hledger had a few reports that ledger didn't have, like real balance sheets and income statements. Both integrate well with emacs, but their journal files differ in slightly incompatible ways, so they're not drop-in replacements. Both are very fast.

It just keeps getting better --glguy

Every time I think hledger is missing something I always find either the exact feature I was looking for or two things that coupled together accomplish what I need it to do. --vm

Now I use hledger, which has been fantastic. I back up the file to a shared drive that's sync'ed to my phone, so every time I get a message from the bank or pay with cash, I can immediately note it down (this would have been much less workable before I found the "cone" app) and track my spending across dozens of accounts.

+1 for plain text accounting. I'm using hledger to track my finances. I do use the web UI to submit information but I edit the plain text store extensively.

I have it running on my laptop at all times (a window in my tmux config displays various reports on my accounts like current balance, uncleared balance, uncleared transactions, etc.). I find it helps me to be mindful of my money if it's only a couple keypresses away.

It's hugely valuable to have all of your financial data in one, human-readable place. Not only to you, but to whomever might be executing your will ;)

I just moved my whole financial life over to hledger and oh my goodness I’m so much happier (I dumped both QuickBooks and Quicken, which I’d been using previously).

It is very satisfying to get a report of my last 10 years swiftly over the weekend. Thanks for the software :) -- droidoneone

I took the plunge into PTA with hledger to draft my company's books in 2023 and to escape the torture of QuickBooks in a multiple-currency world. I am pleased to report that I have succeeded in completing my fiscal year 2023 recordkeeping and my accountants have not fired me. Moreover, I feel like I will actually have a head-start on 2024 and will be able to do gasp tax planning, rather than feeling like I'm always playing catch-up.
Many thanks for the help I've received to get me to this point! I'm a believer. --jbrains

I periodically download bank csv and convert it to the hledger/ledger format, auto-assigning categories (accounts) based on a rules file that I update as needed (typically one or two new rules per month). At tax reporting time I use hledger to total up each income/expense account for the reporting period, and I plug those numbers into my accountant's tax form generating app. After a few iterations, my chart of accounts has clarified and the process has become pretty routine. --HN

I was not very happy with YNAB recently (for various reasons), and by coincidence I came across an article on Hacker News where PTA was mentioned. So I ended up with hledger and I have to say: so far no regrets! Thanks a million for the great software! --kokomuck

I use hledger for the nice web ui: [demo.hledger.org/register](http://demo.hledger.org/register) --HN

Also, just wanted to take a moment to express my gratitude for this amazing tool, and the whole PTA ecosystem as well! Just saving my poor programmer brain from having to muddle through spreadsheets is already a huge bonus! --avrahamappel

I can second that hledger is great. As a bonus, hledger-web makes it possible to also modify data, making it usable alternative to command line tools. --HN

Feels great to be able to track things in such details for free. And actually own all of the data. Great piece of software --maximrichter

Just use hledger, which offers hledger-web, put it online behind a nginx and you are done.
It uses ledger compatible transaction files which can you edit and inspect manually if needed, offers a bunch of additional functionality, and is a joy to use, both the web and command line version. --HN

The ledger didn’t work out for the first time - the manuals and HOWTOs were overcomplicated with examples of processing credit accounts, stock accounts, debts and so on. I’m almost never used all of these in my life (I’m living in one of CIS countires and usually we do not have enough money to use credits or stocks like financial instruments here).
Also, all of the guides assumed that I was budgeting on a rolling basis - without two-week periods, like I do.
--Eugene Andrienko

Maybe it's about the tools? I could never bother myself tracking my expenses in any application I tried until I started using plain old ledger (actually hledger) from the command line. Only then it started to feel almost effortless. --HN

I use hledger and hledger-web. It's mostly compatible with ledger with some nice features on top and a web interface. --HN

I'm loving what hledger can do with my data --ellane

The nicest thing about hledger and the original is the extremely simple file format. It allows you to write your own pretty easily (especially if you stick to the very simple format of a bunch of transactions). I wrote one for my use. --HN

Thank you for hledger. After front-loading the cli learning curve, I am recognizing it to be, for small business purposes, more practical than commercial products such as Quicken. That is saying a lot, considering the true development cost behind a program like Quicken with long-term corporate investment. --czerny2018

The other really big win is that you can put your accounting in source control. I can not express to you the amount of ass-saving this has brought me. ...  I can find out what the ledger said at any given date. And I have incredibly readable diffs. This last point is so incredibly important that I could not ever possibly think of using GnuCash again. --HN

One nice feature of hledger is its csv rules system, which is very flexible. -- faustiast

I'm an on-again, off-again contributor to GnuCash but I really like ledger too, and especially hledger because just knowing it's Haskell puts my mind at ease about several things. --HN

Just going on record to say that plain text accounting is everything I hoped it would be. I'm keeping up to date with data entry, and finally seeing patterns that are helping me plan ahead. --ellane

Wow, hledger looks impressive. I think I'll use it as an example for when people ask for a "real world haskell program" as it has a web interface, gui (I think I saw one), is cross platform, and only requires downloading the executable. --HN

I really like how I can complicate things at my own pace: import rules messing up some transactions but no spoons to fix it now? Just add them manually, and the journal is still fine. --rigrig

I just started using hledger for personal double-entry bookkeeping. So far it is pretty awesome. Some of the things I like over, say, Mint:
- I can keep arbitrary asset, liability, and expense categories in a tree-like structure.
- I can split up transactions between different accounts. This is useful because I can split a dinner bill between my credit card and cash. It is also useful because I can split items from a large Amazon order into their respective categories.
- The ledger file is a very simple text file, so I can keep it in version control.
- I haven't taken advantage of the report features yet, but they look very flexible. You can add up any accounts you want based on regular expressions.
- You can have "virtual" accounts that can be used for budgets. For example, you can set aside arbitrary chunks of your savings account for different purposes and keep track of them separately, even though they all actually reside in your savings account at your bank. --HN

I have massively enjoyed using hledger and am incredibly impressed with how active the development and support for it are! --Pixelized

I really enjoy the ease of plaintext accounting. (h)ledger rules! --HN

Hledger is not a "silver bullet" that automatically calculates all the necessary things for you. It is like a small database, that allows you to SELECT data from financial transactions, filter them by account name or by date. And with a nice ability to convert from one currency to another "on the fly". --Eugene Andrienko

I've been using hledger for almost 9 months now and I must say that it's been incredible. Never before have I been able to track and manage my personal finance this efficiently. --HN

New convert here. I’m a software developer with a cursory understanding of double-entry bookkeeping (and basically nothing else about accounting) from school, way back when. I’ve wanted more detailed tracking of my finances for a while now, found the whole PTA community about a week ago, and started using hledger a few days ago. It took some effort to enter the current state of my finances (and will require a lot more to fill in past years), but I’d really like to thank Simon Michael and everyone else involved with hledger, its forebears and inspirations, and the community at large. I always believed this sort of deep understanding of my finances was out of my reach without training and opaque software. Instead, you’ve made this vastly complicated subject accessible even to someone like me. --Shiv J. M.

As a programmer, I find ledger/hledger/beancount to be the most convenient way to do things. My text editor is already an extension of my hands. I can use any version control I want. I can write my own reports using any language I want. I can write code to automate transactions and I can do it in any language I like. --HN

hledger focuses on testing and correctness alongside comprehensive documentation, giving me a much better picture of its capabilities. I dove in and spent a week entering a year and a half of data, which was enough to convince me. hledger is truly an amazing tool. I can’t count how many times I’ve thought wouldn’t it be nice if… only to realize it can already do that, or how many times I’ve been disappointed at an apparent bug only to realize I was the one at fault. I don’t know how much is unique to hledger and how much comes from its precursors or contemporaries, but I’m also struck by all the thoughtful touches, like having both aregister and register, or having all of =, ==, =*, and ==* for balance assertions. The attention to detail is marvelous. I have to assume that, whatever the provenance, this flexible competence is born of real use and familiarity. I couldn’t help overflowing with praise in the very friendly Matrix room --Shiv J. M.

What you'll like about hledger and legerCLI is a) the undo function of your favourite text editor and b) separate files that you can include into a master c) awesome reports on the terminal. --HN

This week, I used hledger to help an overwhelmed relative decipher their bank activity. ... Even though there were a significant number of transactions we simply could not interpret thanks to the poor quality of the data itself, this was enough for register, aregister, and balance to answer any questions. I was able to account for almost every penny with a high degree of confidence, categorize expenses, and make projections for the future based on the patterns I saw. It took less than an hour from when I started entering the data to turn the terrifying unknown into the mundane, comprehensible known, and I can never put a price on the peace of mind it gave us all. --Shiv J. M.

With auto sync and hledger, I've gone from my budget taking 1 - 2 hours a week to 10 - 20mins. No more hunting for that one typo that meant my budget didn't balance with my bank balance.
hledger has also been fantastic as far as help. I've jumped on IRC a few times for help and bug reports. The lead dev has been amazing. Fixing bugs the same day and offering help on using hledger. --HN

Adopting hledger for plain text accounting has paid dividends in more ways than I can count. It’s brought order to my somewhat chaotic finances and allowed me to track details I was barely aware of, freeing me from the vague sense of unease that used to occasionally creep into my mind when I wondered, for instance, how much I was spending on food. --Shiv J. M.

My partner and I have been tracking all our spending for the last five years with hledger (ledger reimplemented in haskell) and some custom import and management scripts inspired by "Full-fledged hledger" [1]. More recently we added Plaid [2] for auto-importing from financial accounts. I love having a plain-text history and being able to ask complex queries.
One unexpectedly-sweet benefit is that your spending is a high-granularity record of where you have been and what you have been doing, encoding some signals you might not have thought to write in a diary. Things like "that was when we were saving for our down payment" or "I was going to coffee shops every day trying to finish my dissertation" or "that was when we had a pandemic." I enjoy looking back through our ledger the same way I enjoy going way back in my gmail history. --HN

I've been using hledger for managing my personal finances for a few years now, and I'm really happy with it! --guivho

+1 for full-fledged hledger! I just got it set up last week, and putting together the small scripts for parsing all of the CSVs was (to me) a fun programming exercise that reaped huge visibility into how I spend my money :) --HN

Thanx for all time and effort you put in this and the whole hledger project, kudos to you all! --guivho

highly recommend its tui [hledger-ui](https://hledger.org/hledger-ui.html) --HN

I'm glad I found this community and a eco system of PTA. I'm learning so much about this everyday as I'm in a process of learning accounting and also hledger. -- rickx34

I finally ditched QuickBooks / Quicken / all that crap and moved everything personally & for my consulting company over to hledger (which is just a slightly fancy version of ledger).
Turns out, everything I hated about QuickBooks for all these years centered around its inability to bulk-edit transactions or categorize/recategorize things en masse, leading to countless hours wasted clicking or, worse, those bulk journal entires to move things from one place to another (which forces you to follow a breadcrumb path of asset movements, which is a nightmare).
But when everything is just a list of things in a text file, you get the power of every great text editor on earth (vi, emacs, or whatever) and can make mass changes trivially. Life's much much much much better this way. --HN

I landed on hledger when researched open source and plain text options. It does everything we need it to:  journal entries and quarterly reports like balance sheet, income and expense reports. You do need to be somewhat comfortable with interfaces like your command line terminal and Emacs but the instructions and documentation for it are clear for beginners from my experience.
For day to day journal entries I use hledger-web. It’s pretty much perfect in terms of elegant simplicity and functionality. It’s well documented and the hledger community is active, generous, and kind. --bitsonchips

I started using hledger because of:
- tracking irregular payments from a bunch of sources, often outstanding for a while
- tracking how much somebody owes me / i owe them
- being pretty much cash-only for a long while (long story). with cash, if you don't track the expenses manually, you wake up at the end of the month with a whole bunch of money gone and no idea what happened to it
- not knowing how much money i actually have available because it's spread across my wallet / bank account / paypal / piggy bank
hledger really helped me not go crazy with all of this!
PS. another unexpected benefit - tracking expenses can also help with ambient worries like "ugh i spend too much on takeout food". 
like, if you track it, at the end of the month you can look at how much you spent on it and conclude that it's actually reasonable (within your budget) and stop feeling guilty about it!
--HN

I discovered hledger last week and I hope it's not too early to describe it as life-changing. thank you for building this software --gnidan

hledger is another open-source CLI tool for accounting that works amazingly well for me. You can add transactions editing in plain text too and there is a basic web UI on top of it. --HN

can confirm after 3 months: so far hledger usage appears to be life changing --gnidan

I used hledger for years it was great. --HN

over the past year I've become a daily user of hledger, my workflow has gotten quite sophisticated and I can get 99% of what I need. It's amazing, thanks so much for anyone/everyone involved. -- Peter Linsley

Many thanks to Simon Michael for not only that wonderful program but also being so responsive. --HN

I originally had a question I wanted to ask but then I read through part of the manual and got most of it and a different angle I hadn't quite considered answered; so I'm just stopping by to say thanks for the effort of documenting this in so much detail. --j416

Simon is an amazing project owner. He and his documentation are the reasons I like hledger over the alternatives. --HN

Thank you for maintaining the compendium. I love hledger docs. --Aaron Fiore

Emacs users should look into Flycheck integration, eg [flycheck-hledger](https://hledger.org/editors.html#flycheck-hledger) . Real time indication of parse and balance errors as you edit is nice! --HN

Thanks @simonmic for hledger, such a fantastic tool! 🥳 --Yann Büchau

Thanks for producing such a great tool - I'm learning a lot, and am finding it really helpful. --Matt Maguire

I completed my first year of bookkeeping for both business and personal expenses with hledger last year.
I can honestly say that I observed zero bugs with the software. It has worked seamlessly. --csgagnon

I have found [hledger] to be completely free of output error throughout an entire year of bookkeeping for my small business. --Christopher Gagnon

hledger focuses on testing and correctness alongside comprehensive documentation, giving me a much better picture of its capabilities. I dove in and spent a week entering a year and a half of data, which was enough to convince me. hledger is truly an amazing tool. I can’t count how many times I’ve thought wouldn’t it be nice if… only to realize it can already do that, or how many times I’ve been disappointed at an apparent bug only to realize I was the one at fault. I don’t know how much is unique to hledger and how much comes from its precursors or contemporaries, but I’m also struck by all the thoughtful touches, like having both aregister and register, or having all of =, ==, =*, and ==* for balance assertions. The attention to detail is marvelous. I have to assume that, whatever the provenance, this flexible competence is born of real use and familiarity. I couldn’t help overflowing with praise in the very friendly Matrix room --Shiv J. M.

hledger can do everything but make my red numbers green. --nenion

`;

const quotes = quotesmd.trim().split('\n\n').map(q => q.replace(/^\*|\*$/g, '').trim());

// Pick a quote based on the current date and time, changing it every N hours.
function getQuote(intervalinhours) {
  const now = new Date();
  const t = now.getTime();
  const n = Math.floor(t / (1000 * 60 * 60 * intervalinhours));
  const quote = quotes[n % quotes.length];
  const parts = quote.split(' --');
  return {
    text:   parts[0].trim(),
    author: parts[1] ? parts[1].trim() : ''
  };
}

// On page load, pick and show a quote.
document.addEventListener('DOMContentLoaded', () => {
  const quoteel       = document.querySelector('#quote');
  const quotetextel   = document.querySelector('#quote-text');
  const quoteauthorel = document.querySelector('#quote-author');
  if (quoteel && quotetextel && quoteauthorel) {
    const quote = getQuote(1);  // update hourly
    quotetextel.textContent   = quote.text;
    quoteauthorel.textContent = '-- ' + quote.author;
    quoteel.style.display     = 'block';
  }
});

</script>
