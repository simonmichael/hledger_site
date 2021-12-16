# Budgeting

<!-- <div class=pagetoc>
<!-- toc -->
</div> -->

## All budgeting-related docs

- [hledger > balance > Budget report](hledger.html#budget-report), hledger's built-in periodic budget report

- [Budgeting and forecasting (2018)](budgeting-and-forecasting.html), a older introduction

- <https://github.com/simonmichael/hledger/tree/master/examples/budgeting>, annotated examples of journals implementing budgets

- [plaintextaccounting.org: Budgeting](https://plaintextaccounting.org/#budgeting), more budgeting-related docs, for all PTA tools

- [Age Your Money](https://www.youneedabudget.com/guides/age-your-money), the YNAB (YouNeedABudget) way

- <https://github.com/zombor/hledger-envelope-budget>

- <https://github.com/Kickball/awesome-selfhosted#money-budgeting--management>, some other budgeting software for comparison

- [Time planning](time-planning.html#how-to-set-up-a-time-budget) -> How to set up a time budget

## Notes

```
 <sm> two commands that are roughly equivalent: ledger budget --add-budget expenses, hledger balance --budget -E expenses
 <sm> they show both budgeted and unbudgeted accounts            
```

```
--budget has no effect on single-column reports, it requires a reporting interval
--budget INTERVAL enables all periodic transactions with that interval; these can be date-limited
--budget hides all non-budgeted subaccounts; can be depth-limited more
```

```
<sm> there's different ways to do budgeting                     [16:46]
<sm> let me try to count them                                   [16:50]
<sm> "envelope budgeting" is analogous to having a set of envelopes containing cash for different purposes. 
You can model the "envelopes" with 
a. real-world accounts (eg your bank lets you create arbitrary savings accounts), 
b. virtual (imaginary) subaccounts of a real-world account (eg your checking account), 
c. virtual accounts "off to the side" (budget:*)
<sm> also you can do the transfers to and from these manually, or generate them with automated posting rules
<sm> "goal budgeting" (best name I can come up with) involves setting some inflow/outflow goals per account per period, 
and then measuring how the actual flows compare with the goals. balance --budget provides this report
<sm> I think that's 7 ways
```

From <https://www.reddit.com/r/plaintextaccounting/comments/doq9p5/new_to_ledger_budgeting_question>:

> Also search for budgeting links at http://plaintextaccounting.org . You'll see two main approaches discussed:
> 
> 1. "envelope budgeting" - sounds more like what you've been doing. Based around explicitly allocating money for each purpose. Good for managing > cashflow. Requires more journal entries. Can be done entirely manually (1a) but many docs advise using automatic posting rules to assist (1b). Many > different ways to handle the details. Requires more thinking.
> 
> 2. the other kind ("report-based budgeting" ?). Based around a special budget report provided by Ledger/hledger, which uses periodic transaction > rules to set budget goals. Automatic posting rules might be useful here too, I'm not sure. Provides less enforcement, requires less work. Fewer ways > to do it, perhaps provides simpler/clearer reports.
> 
> I often find "budgeting" covers/touches on quite a lot of topics: 
> - setting earning/spending goals, 
> - reviewing performance against those goals, 
> - controlling earning/spending based on the goals, 
> - allocating funds for short term expenses, 
> - allocating funds towards savings goals, 
> - updating allocated funds as transactions occur, 
> - reallocating funds/balancing the budget, 
> - end of period actions (roll over ? reset ?), 
> - forecasting cash balances and managing cashflow, 
> - forecasting income/expenses... 


