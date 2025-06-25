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

I took the plunge into PTA with hledger to draft my company's books in 2023 and to escape the torture of QuickBooks in a multiple-currency world. I am pleased to report that I have succeeded in completing my fiscal year 2023 recordkeeping and my accountants have not fired me. Moreover, I feel like I will actually have a head-start on 2024 and will be able to do gasp tax planning, rather than feeling like I'm always playing catch-up.
Many thanks for the help I've received to get me to this point! I'm a believer. --jbrains

I was not very happy with YNAB recently (for various reasons), and by coincidence I came across an article on Hacker News where PTA was mentioned. So I ended up with hledger and I have to say: so far no regrets! Thanks a million for the great software! --kokomuck

Also, just wanted to take a moment to express my gratitude for this amazing tool, and the whole PTA ecosystem as well! Just saving my poor programmer brain from having to muddle through spreadsheets is already a huge bonus! --avrahamappel

Feels great to be able to track things in such details for free. And actually own all of the data. Great piece of software --maximrichter

The ledger didn’t work out for the first time - the manuals and HOWTOs were overcomplicated with examples of processing credit accounts, stock accounts, debts and so on. I’m almost never used all of these in my life (I’m living in one of CIS countires and usually we do not have enough money to use credits or stocks like financial instruments here).
Also, all of the guides assumed that I was budgeting on a rolling basis — without two-week periods, like I do.
--Eugene Andrienko

<!-- pending approval
--Martin Josefsson
-->

I'm loving what hledger can do with my data --ellane

Thank you for hledger. After front-loading the cli learning curve, I am recognizing it to be, for small business purposes, more practical than commercial products such as Quicken. That is saying a lot, considering the true development cost behind a program like Quicken with long-term corporate investment. --czerny2018

One nice feature of hledger is its csv rules system, which is very flexible. -- faustiast

Just going on record to say that plain text accounting is everything I hoped it would be. I'm keeping up to date with data entry, and finally seeing patterns that are helping me plan ahead. --ellane

I really like how I can complicate things at my own pace: import rules messing up some transactions but no spoons to fix it now? Just add them manually, and the journal is still fine. --rigrig

I have massively enjoyed using hledger and am incredibly impressed with how active the development and support for it are! --Pixelized

Hledger is not a "silver bullet" that automatically calculates all the necessary things for you. It is like a small database, that allows you to SELECT data from financial transactions, filter them by account name or by date. And with a nice ability to convert from one currency to another "on the fly". --Eugene Andrienko

New convert here. I’m a software developer with a cursory understanding of double-entry bookkeeping (and basically nothing else about accounting) from school, way back when. I’ve wanted more detailed tracking of my finances for a while now, found the whole PTA community about a week ago, and started using hledger a few days ago. It took some effort to enter the current state of my finances (and will require a lot more to fill in past years), but I’d really like to thank Simon Michael and everyone else involved with hledger, its forebears and inspirations, and the community at large. I always believed this sort of deep understanding of my finances was out of my reach without training and opaque software. Instead, you’ve made this vastly complicated subject accessible even to someone like me. --Shiv J. M.

hledger focuses on testing and correctness alongside comprehensive documentation, giving me a much better picture of its capabilities. I dove in and spent a week entering a year and a half of data, which was enough to convince me. hledger is truly an amazing tool. I can’t count how many times I’ve thought wouldn’t it be nice if… only to realize it can already do that, or how many times I’ve been disappointed at an apparent bug only to realize I was the one at fault. I don’t know how much is unique to hledger and how much comes from its precursors or contemporaries, but I’m also struck by all the thoughtful touches, like having both aregister and register, or having all of =, ==, =*, and ==* for balance assertions. The attention to detail is marvelous. I have to assume that, whatever the provenance, this flexible competence is born of real use and familiarity. I couldn’t help overflowing with praise in the very friendly Matrix room --Shiv J. M.

This week, I used hledger to help an overwhelmed relative decipher their bank activity. ... Even though there were a significant number of transactions we simply could not interpret thanks to the poor quality of the data itself, this was enough for register, aregister, and balance to answer any questions. I was able to account for almost every penny with a high degree of confidence, categorize expenses, and make projections for the future based on the patterns I saw. It took less than an hour from when I started entering the data to turn the terrifying unknown into the mundane, comprehensible known, and I can never put a price on the peace of mind it gave us all. --Shiv J. M.

Adopting hledger for plain text accounting has paid dividends in more ways than I can count. It’s brought order to my somewhat chaotic finances and allowed me to track details I was barely aware of, freeing me from the vague sense of unease that used to occasionally creep into my mind when I wondered, for instance, how much I was spending on food. --Shiv J. M.

I've been using hledger for managing my personal finances for a few years now, and I'm really happy with it! --guivho

Thanx for all time and effort you put in this and the whole hledger project, kudos to you all! --guivho

I'm glad I found this community and a eco system of PTA. I'm learning so much about this everyday as I'm in a process of learning accounting and also hledger. -- rickx34

I landed on hledger when researched open source and plain text options. It does everything we need it to:  journal entries and quarterly reports like balance sheet, income and expense reports. You do need to be somewhat comfortable with interfaces like your command line terminal and Emacs but the instructions and documentation for it are clear for beginners from my experience.
For day to day journal entries I use hledger-web. It’s pretty much perfect in terms of elegant simplicity and functionality. It’s well documented and the hledger community is active, generous, and kind. --bitsonchips

I discovered hledger last week and I hope it's not too early to describe it as life-changing. thank you for building this software --gnidan

can confirm after 3 months: so far hledger usage appears to be life changing --gnidan

over the past year I've become a daily user of hledger, my workflow has gotten quite sophisticated and I can get 99% of what I need. It's amazing, thanks so much for anyone/everyone involved. -- Peter Linsley

I originally had a question I wanted to ask but then I read through part of the manual and got most of it and a different angle I hadn't quite considered answered; so I'm just stopping by to say thanks for the effort of documenting this in so much detail. --j416

Thank you for maintaining the compendium. I love hledger docs. --Aaron Fiore

Thanks @simonmic for hledger, such a fantastic tool! 🥳 --Yann Büchau

Thanks for producing such a great tool -- I'm learning a lot, and am finding it really helpful. --Matt Maguire

I completed my first year of bookkeeping for both business and personal expenses with hledger last year.
I can honestly say that I observed zero bugs with the software. It has worked seamlessly. --csgagnon

I have found [hledger] to be completely free of output error throughout an entire year of bookkeeping for my small business. --Christopher Gagnon

hledger focuses on testing and correctness alongside comprehensive documentation, giving me a much better picture of its capabilities. I dove in and spent a week entering a year and a half of data, which was enough to convince me. hledger is truly an amazing tool. I can’t count how many times I’ve thought wouldn’t it be nice if… only to realize it can already do that, or how many times I’ve been disappointed at an apparent bug only to realize I was the one at fault. I don’t know how much is unique to hledger and how much comes from its precursors or contemporaries, but I’m also struck by all the thoughtful touches, like having both aregister and register, or having all of =, ==, =*, and ==* for balance assertions. The attention to detail is marvelous. I have to assume that, whatever the provenance, this flexible competence is born of real use and familiarity. I couldn’t help overflowing with praise in the very friendly Matrix room --Shiv J. M.


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
