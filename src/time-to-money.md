# Converting time to money

Perhaps you're a freelancer with an hourly rate.

If you log time in

## Journal files

If you might have a different rate for each job, 
and there aren't too many transactions per job:
you could record the rate as a cost (`2h @ $100`),
and run a [cost report](hledger.html#conversion--cost) with `-B/--cost`.

When the rate doesn't change much and there are many transactions,
it's more convenient to declare it with a P directive,
and run a [value report](hledger.html#valuation) with `-V`/`-X`.

## Timeclock files

You can't write P directives here, so include the timeclock file(s)
within a parent journal file, as follows...

## Timedot files

As above, and also timedot amounts have no currency symbol which can be priced,
so set a default one with the `D` directive. An example:

    # 2022-time.journal
    D 1.0 h
    P 2022-01-01 h $100
    include 2022.timedot

...

    # 2022.timedot
    2022-01-01
    a   ....

...

    $ hledger -f 2022-time.journal bal 
                   1.0 h  a
    --------------------
                   1.0 h  

    $ hledger -f 2022-time.journal bal -V
                    $100  a
    --------------------
                    $100  

If your rate changes, use a new timedot file:

    # 2022-time.journal
    D 1.0 h
    P 2022-01-01 h $100
    include 2022.timedot
    P 2022-03-01 h $120
    include 2022b.timedot

...

    $ hledger -f 2022-time.journal bal -MVTA
    Balance changes in 2022Q1, valued at period ends:
    
       ||  Jan  Feb   Mar    Total  Average 
    ===++===================================
     a || $100    0  $120     $220      $73 
    ---++-----------------------------------
       || $100    0  $120     $220      $73 

