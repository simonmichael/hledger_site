## Simon's hledger time dashboard 2018/05

Here's how I have been logging time for a few years, and showing budget reports for a few weeks.

I have four files:

1. time-2018.timedot is the current year's time log. It contains daily entries in [timedot](http://hledger.org/timedot.html)-ish format, like:

       2018/5/7
       adm.email             20m
       inc.client1.enh.1342  .... .
       inc.client1.enh.1188  .
       inc.client1.enh.1335  ..
       fos.hledger.support
    
2. time.journal is in [journal](http://hledger.org/journal.html) format so it can [include](http://hledger.org/journal.html#including-other-files) multiple timedot file(s) and provide an [account alias](http://hledger.org/journal.html#rewriting-accounts) allowing period instead of colon in account names:

       ; allow . as subaccount separator in timedot files
       alias /\./=:
       
       ;include time-2016.timedot
       ;include time-2017.timedot
       include time-2018.timedot

3. time-daily.budget defines some daily goals, optionally date-bounded, using [periodic transaction(s)](http://hledger.org/journal.html#periodic-transactions):

       ~ daily  ; [from Y-M-D] [to Y-M-D]
           (adm)    1  ; your goals here
           (inc)    1
           (fos)    1
  
4. time-weekly.budget defines some weekly goals. I like to set these independently:

       ~ weekly  ; [from Y-M-D] [to Y-M-D]
           (adm)    1
           (biz)    1
           (inc)    1
           (fos)    1
  
The monthly budget reuses the weekly goals.

I have an iTerm2 Hotkey Window (a terminal that drops down on CMD-space) with six panes:

1. a custom script showing latest laptop wake/sleep and timelog save times, as a memory aid for time logging:

       tlogwatch  

2. a text-mode emacs for updating the time log:

       emacs -nw time-2018.timedot

3-5. updating (using [entr](http://www.entrproject.org)) time [budget reports](http://hledger.org/hledger.html#budget-report) for the current day/week/month:

       ls time.journal time-2018.timedot time-daily.budget  | entr sh -c 'clear; hledger -f time.journal -f time-daily.budget  bal --budget -1 -D date:today-tomorrow'
       ls time.journal time-2018.timedot time-weekly.budget | entr sh -c 'clear; hledger -f time.journal -f time-weekly.budget bal --budget -1 -W date:thisweek-nextweek'
       ls time.journal time-2018.timedot time-weekly.budget | entr sh -c 'clear; hledger -f time.journal -f time-weekly.budget bal --budget -1 -M date:thismonth-nextmonth'

6. an updating [hledger-ui](http://hledger.org/hledger-ui.html) for exploring time usage:

       hledger-ui --watch --change --flat -1 date:today time.journal
