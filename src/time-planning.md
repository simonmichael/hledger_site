# Time planning

## Simon's hledger time dashboard 2018/05

Here's how I have been logging time for a few years, and showing budget reports for a few weeks.

I have four files:

1. time-2018.timedot is the current year's time log. It contains daily entries in [timedot](timedot.html)-ish format, like:

       2018/5/7
       adm.email             20m
       inc.client1.enh.1342  .... .
       inc.client1.enh.1188  .
       inc.client1.enh.1335  ..
       fos.hledger.support
    
2. time.journal is in [journal](journal.html) format so it can [include](journal.html#including-other-files) multiple timedot file(s) and provide an [account alias](journal.html#rewriting-accounts) allowing period instead of colon in account names:

       ; allow . as subaccount separator in timedot files
       alias /\./=:
       
       ;include time-2016.timedot
       ;include time-2017.timedot
       include time-2018.timedot

3. time-daily.budget defines some daily goals, optionally date-bounded, using [periodic transaction(s)](journal.html#periodic-transactions):

       ~ daily  ; [from Y/M/D] [to Y/M/D]
           (adm)    1  ; your goals here
           (inc)    1
           (fos)    1
  
4. time-weekly.budget defines some weekly goals. I like to set these independently of the above, which in current hledger means they must be in a separate file:

       ~ weekly  ; [from Y/M/D] [to Y/M/D]
           (adm)    1
           (biz)    1
           (inc)    1
           (fos)    1
  
The monthly budget reuses the weekly goals.

I have an iTerm2 Hotkey Window (a terminal that drops down on ALT-space) with six panes:

1. a bash script showing latest laptop wake/sleep and timelog save times, as a memory aid for time logging:

       tlogwatch

    (Here's that script, useful only to mac users; please show me something better!):

        # record timelog update times
        export TIMELOG=$HOME/time-2018.timedot
        alias timelogsaved="ls -lT $TIMELOG | cut -d' ' -f8-11"
        alias timelogaccessed="ls -lTu $TIMELOG | cut -d' ' -f8-11"
        alias timelogcreated="ls -lTU $TIMELOG | cut -d' ' -f8-11"
        
        # show mac sleep/wake & display on/off  events
        alias wakelog="pmset -g log | egrep -E '((Sleep|Wake) +\t|Display is)' | sed -E \
              -e 's/(Notification|Sleep|Wake) *	//' \
              -e 's/is turned //' \
              -e 's/Entering Sleep state/Sleep/' \
              "
        
        # show recent wakeup/timelog save times to help with time logging, clipped to screen width
        # The width clipping is to help watch display this in dashboard.
        function tlog()
        {
          LINES=${1:-20}
          ( wakelog | tail -$LINES
            printf " \n"
            printf "$(timelogcreated) timelog created\n"
            printf "$(timelogsaved) timelog saved\n"
            printf "$(timelogaccessed) timelog accessed\n"
          ) | cut -c-$(expr $COLUMNS - 1)
        }
        
        # run a brief tlog report periodically, passing any args to watch
        function tlogwatch()
        {
          LINES=${1:-20}
          shift
          watch -t -n60 $@ "bash -ic 'tlog '$LINES"
        }
        # TODO why does "tlogwatch 10" give "sh: 10: command not found" ?


2. a text-mode emacs for updating the time log:

       emacs -nw time-2018.timedot

3. -5: updating (using [entr](http://www.entrproject.org)) time [budget reports](hledger.html#budget-report) for the current day/week/month, using [hledger 1.9.1+](download.html):

       ls time.journal time-2018.timedot time-daily.budget  | entr sh -c 'clear; hledger -f time.journal -f time-daily.budget  bal --budget -1 -D date:today-tomorrow'

   <!-- -->

       ls time.journal time-2018.timedot time-weekly.budget | entr sh -c 'clear; hledger -f time.journal -f time-weekly.budget bal --budget -1 -W date:thisweek-nextweek'

   <!-- -->

       ls time.journal time-2018.timedot time-weekly.budget | entr sh -c 'clear; hledger -f time.journal -f time-weekly.budget bal --budget -1 -M date:thismonth-nextmonth'

6. an updating [hledger-ui](hledger-ui.html) for exploring time usage (shift-up/down to resize period, shift-left/right to step through time, t to return to today):

       hledger-ui --watch --change date:today -f time.journal
