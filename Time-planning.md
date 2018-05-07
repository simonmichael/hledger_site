Simon's hledger time logging setup 201805

I have four files:

1. time-2018.timedot is the current year's time log. It contains daily entries like:

       2018/5/7
       adm.email             20m
       inc.client1.enh.1342  .... .
       inc.client1.enh.1188  .
       inc.client1.enh.1335  ..
       fos.hledger.support
    
2. time.journal includes the timedot file(s) and provides an account alias allowing period instead of colon in account names:

       ; allow . as subaccount separator in timedot files
       alias /\./=:
       
       ;include time-2016.timedot
       ;include time-2017.timedot
       include time-2018.timedot

3. time-daily.budget defines some daily goals, optionally date-bounded:

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

1. a custom script showing latest laptop wake/sleep and timelog save times:

       tlogwatch  

2. a text-mode emacs for updating the time log:

       emacs -nw time-2018.timedot

3-5. updating time usage & budget reports for the current day/week/month. entr is from http://www.entrproject.org:

       ls time.journal time-2018.timedot time-daily.budget  | entr sh -c 'clear; hledger -f time.journal -f time-daily.budget  bal --budget -1 -D date:today-tomorrow'
       ls time.journal time-2018.timedot time-weekly.budget | entr sh -c 'clear; hledger -f time.journal -f time-weekly.budget bal --budget -1 -W date:thisweek-nextweek'
       ls time.journal time-2018.timedot time-weekly.budget | entr sh -c 'clear; hledger -f time.journal -f time-weekly.budget bal --budget -1 -M date:thismonth-nextmonth'

6. an updating hledger-ui for exploring time usage:

       hledger-ui --watch --change --flat -1 date:today time.journal

