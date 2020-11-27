# Budgeting

Here is a start at gathering budgeting-related resources.

- hledger's built-in budget report, [balance --budget](hledger.html#budget-report)
- [Budgeting and forecasting](budgeting-and-forecasting.html), a older introduction to these (written for hledger 1.5 in 2018)
- <https://github.com/simonmichael/hledger/tree/master/examples/budgeting> annotated examples of journals implementing budgets
- [Budgeting with hledger](https://gist.github.com/ony/bbec599c0893e676b772559909b81de6), ony's notes on budgeting with auto postings
- <https://plaintextaccounting.org/#budgeting> budgeting-related blogs posts and resources for all PTA tools


 <sm> two commands that are roughly equivalent: ledger budget --add-budget expenses, hledger balance --budget -E expenses
                                                                 [16:05]
 <sm> they show both budgeted and unbudgeted accounts            [16:06]


***** --budget has no effect on single-column reports, it requires a reporting interval
***** --budget INTERVAL enables all periodic transactions with that interval; these can be date-limited
***** --budget hides all non-budgeted subaccounts; can be depth-limited more
s

<sm> there's different ways to do budgeting                     [16:46]
<sm> let me try to count them                                   [16:50]
<sm> "envelope budgeting" is analogous to having a set of envelopes containing cash for different purposes. You can model the "envelopes" with a. real-world accounts (eg your bank lets you create arbitra\
ry savings accounts), b. virtual (imaginary) subaccounts of a real-world account (eg your checking account), c. virtual accounts "off to the side" (budget:*)
                                                                [16:51]
<sm> also you can do the transfers to and from these manually, or generate them with automated posting rules
                                                                [16:52]
<sm> "goal budgeting" (best name I can come up with) involves setting some inflow/outflow goals per account per period, and then measuring how the actual flows compare with the goals. balance --budget pr\
ovides this report
                                                                [16:54]
<sm> I think that's 7 ways



https://www.reddit.com/r/plaintextaccounting/comments/doq9p5/new_to_ledger_budgeting_question/

Also search for budgeting links at http://plaintextaccounting.org . You'll see two main approaches discussed:

1. "envelope budgeting" - sounds more like what you've been doing. Based around explicitly allocating money for each purpose. Good for managing cashflow. Requires more journal entries. Can be done entirely manually (1a) but many docs advise using automatic posting rules to assist (1b). Many different ways to handle the details. Requires more thinking.

2. the other kind ("report-based budgeting" ?). Based around a special budget report provided by Ledger/hledger, which uses periodic transaction rules to set budget goals. Automatic posting rules might be useful here too, I'm not sure. Provides less enforcement, requires less work. Fewer ways to do it, perhaps provides simpler/clearer reports.

[PS, I often find "budgeting" covers/touches on quite a lot of topics: setting earning/spending goals, reviewing performance against those goals, controlling earning/spending based on the goals, allocating funds for short term expenses, allocating funds towards savings goals, updating allocated funds as transactions occur, reallocating funds/balancing the budget, end of period actions (roll over ? reset ?), forecasting cash balances and managing cashflow, forecasting income/expenses... Note to self: OP has asked about budgeting upcoming expenses in ledger, and about virtual postings not showing up in balance reports.]



time tracking: summary of my 2018-2019 workflow https://news.ycombinator.com/item?id=19203521
I keep a hledger timedot file[1] open in a hot-key drop-down iTerm window. Each 15-minute chunk is logged with a dot. I group dots into hours for quick visual scanning.
    2019-01-08
    fos.hledger.sup  .
    adm.email  ..
    adm.finance  .... .... ..
    fos.plaintextaccounting  .
    fos.hledger.issues.941  .... .
    has-res  ...
    biz-res  ..
I've trained myself to update this often while at the computer, and before walking away. Delayed retroactive logging is also pretty easy. Working in quarter/half/whole hour chunks, and in rhythm with the clock, and having a pane showing recent sleep/wake/timelog-saved events, all help. Not every day is the same; this system has been quick and flexible enough to suit a range of conditions. I can set daily/weekly/monthly time budgets if I want. Some more details at [2].



*** marketing: https://github.com/Kickball/awesome-selfhosted#money-budgeting-and-management (parsnip)


******* [[http://alan.petitepomme.net/tips/ledger_and_org.html][Using Org for Ledger Reports and Budget]], schmitt


*** doc: how to age your money YNAB style
    https://www.youneedabudget.com/guides/age-your-money/#aging-your-money


*** blog post: world carbon budget



**** how to budget time
***** if not using journal format for time logging, create a time.journal which includes the timelog file
 include time.timedot
***** choose a budget interval, eg daily, weekly or monthly
***** if you have some historical timelog data, review average spending on that interval to get a baseline
 $ hledger -f time.journal date:thisyear bal -WA
***** in time.journal add a periodic transaction rule to allocate budget amounts, similar to baseline, on that interval
 include time.journal

 ~ weekly
     (adm:time)       1h
     (ser:some:proj)  4h
***** run a budget report with the same interval:
 $ hledger -f time.journal bal --budget -W
 Balance changes in 2017/11/27w48:

                ||     2017/11/27w48 
 ===============++===================
  adm:time      || 0.25h [25% of 1h] 
  ser:some:proj || 0.75h [19% of 4h] 
 ---------------++-------------------
                ||             1.00h 
