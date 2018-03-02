_Robert Nielsen, 2018_

Don’t be scared away from using tags in your hledger accounting this Halloween, or any other time for that matter. This is a tutorial on using tags with hledger, so if the idea of using tags has been haunting you, but you are not really sure how to use them, read on.
Let’s start with a file showing someone’s Halloween hledger accounting:
 
```
; ================ Begin File ================

2016/09/25 ACME Costume
   Expenses:Entertainment     $45.99 ;Amoeba Man
   Liabilities:CreditCard

2016/10/31 Smiths
   Income:Treat   -1 candy
   Assets:Food

2016/10/31 Johnsons
   Income:Treat   -2 candy
   Assets:Food

2016/10/31 Ms. Miller
   Income:Treat   -1 candy
   Assets:Food

2016/10/31 Reids
   Income:Treat   -1 candy
   Assets:Food

2016/10/31 Mr. Freeman
   Income:Treat   -3 candy
   Assets:Food

2016/10/31 Potters
   Income:Treat   -1 candy
   Assets:Food

2016/11/01 Medical Associates
   Expenses:Medicial  $80.00 ;dyspepsia
   Liabilities:CreditCard

2016/12/15 West End Dentistry
   Expenses:Dental  $160.00 ;two fillings
   Liabilities:CreditCard

; ================ End File ================
```

We want to categorize all the above transactions as having to do with Halloween. One option would be to create a new category of expenses for Halloween, but what if we want to also keep the other categories, such as Entertainment, Medical, and Dental? For example, we want to have the visit to the dentist categorized both as a dental expense, but at the same time we should be able to find it under expenses related to Halloween. One solution is to add a tag for Halloween.

## Mechanics of Writing a Tag

One of the simplest tags is a word, which is inside a comment, immediately followed by a colon. In the file below, you will see all the transactions have a tag, which I named Halloween, added to them:

```
; ================ begin file ================

2016/09/25 ACME Costume ; Halloween:
   Expenses:Entertainment     $45.99 ;Amoeba Man
   Liabilities:CreditCard

2016/10/31 Smiths ; Halloween:
   Income:Treat   -1 candy
   Assets:Food

2016/10/31 Johnsons ; Halloween:
   Income:Treat   -2 candy
   Assets:Food

2016/10/31 Ms. Miller ; Halloween:
   Income:Treat   -1 candy
   Assets:Food
 
2016/10/31 Reids ; Halloween:
   Income:Treat   -1 candy
   Assets:Food
 
2016/10/31 Mr. Freeman ; Halloween:
   Income:Treat   -3 candy
   Assets:Food
 
2016/10/31 Potters ; Halloween:
   Income:Treat   -1 candy
   Assets:Food
 
2016/11/01 Medical Associates ; Halloween:
   Expenses:Medicial  $80.00 ;dyspepsia
   Liabilities:CreditCard
 
2016/12/15 West End Dentistry ; Halloween:
   Expenses:Dental  $160.00 ;two fillings
   Liabilities:CreditCard
 
; ================ end file ================
```

## Using Tags
 
Once we incorporate tags in our hledger file, we can use them in a variety of ways. Here, we will look at one way, which is to use the tags to filter a command. For example, assume that the above file is named Halloween2.hledger.
 
This command:
 
```
hledger -f Halloween2.hledger register Expenses tag:Halloween
```
 
Produces something like the following output (all the Expenses tagged “Halloween”):

```
2016/09/25     ACME Costume           Liabilities:CreditCard  -$45.99              -$45.99
2016/11/01     Medical Associates     Liabilities:CreditCard  -$80.00            -$125.99
2016/12/15     West End Dentistry     Liabilities:CreditCard  -$160.00          -$285.99
```

Of course, if you have only the contents of the above file, you will get the same output whether or not you specify a tag in the command, but in real life you will have a multitude of transactions, only a few of which will be tagged Halloween. At that point, it becomes highly useful to narrow the scope of a command such as register, to apply to just those transactions with a specific tag.
 
And because we chose to use a tag, as opposed to creating a new expense category, we can still find out what we spent on dentistry, doctor’s bills, and so on.
 
## Adding Values to Tags
 
Next, we will add values to the tags, so that we can narrow our reports to the actual value of the tag.
 
For the example we will be using below, a person wishes to rate the quality of the candy they receive from their neighbors on Halloween. (A ghoulish idea, I know, even for Halloween.)
 
## The Mechanics
 
To add a value to a tag, you add one or more words to the tag. For example, the transaction below has the tag “quality” and the value is “very good”:
 
```
2016/10/31 Johnsons
   Income:Treat   -2 candy ; quality:very good
   Assets:Food
```
 
Note that you can optionally put a space after the colon, as shown immediately below:
 
```
2016/10/31 Johnsons
   Income:Treat   -2 candy ; quality: very good
   Assets:Food
```
 
Let’s show the file we will be working with, which was saved as Halloween3.hledger:
 
```
; ================ begin file ================
 
2016/09/25 ACME Costume ; Halloween:
   Expenses:Entertainment     $45.99 ;Amoeba Man
   Liabilities:CreditCard
 
2016/09/26 ACME Costume ; Thanksgiving:
  Expenses:Entertainment    $58.99 ; inflatable turkey
  Liabilities:CreditCard
 
2016/10/31 Smiths ; Halloween:
   Income:Treat   -1 candy ; quality: OK
   Assets:Food
 
2016/10/31 Johnsons ; Halloween:
   Income:Treat   -2 candy ; quality:very good
   Assets:Food
 
2016/10/31 Ms. Miller ; Halloween:
   Income:Treat   -1 candy ; quality: OK
   Assets:Food
 
2016/10/31 Reids ; Halloween:
   Income:Treat   -1 candy ; quality:excellent
   Assets:Food
 
2016/10/31 Mr. Freeman ; Halloween:
   Income:Treat   -3 candy ; quality:OK
   Assets:Food
 
2016/10/31 Potters ; Halloween:
   Income:Treat   -1 candy ; quality: very good
   Assets:Food
 
2016/11/01 Medical Associates ; Halloween:
   Expenses:Medicial  $80.00 ;dyspepsia
   Liabilities:CreditCard
 
2016/12/15 West End Dentistry ; Halloween:
   Expenses:Dental  $160.00 ;two fillings
   Liabilities:CreditCard
 
; ================ end file ================
```
 
In the above file, we have added values for the quality of each of the treats, specifically,
```
OK
very good
excellent
```
 
Let’s say we want to list all the treats that were rated “OK.”
 
We could use the command:
 
```
$ hledger -f Halloween3.hledger register tag:quality=OK
```
 
The above would output something like the following:
 
```
2016/10/31
Smiths
Income:Treat
-1 candy
-1 candy
2016/10/31
Ms. Miller
Income:Treat
-1 candy
-2 candy
2016/10/31
Mr. Freeman
Income:Treat
-3 candy
-5 candy
```
 
On the other hand, if we wanted to list only the treats that were rated as excellent, we could use the command:
 
```
$ hledger -f Halloween3.hledger register tag:quality=excellent
```
 
The above command, lists the following:
 
```
2016/10/31
Reids
Income:Treat
-1 candy
-1 candy
```
 
## Watch Out for the Spaces
 
Now, let’s look for every treat rated as “very good.” If we try,
 
```
$ hledger -f Halloween3.hledger register tag:quality=very good
```
 
We get exactly nothing. What happened? As you most likely guessed from the title of this section, the space between “very” and “good” is throwing things off.
 
Therefore, you will need something like the following, to find all the treats rated “very good”:
 
```
$ hledger -f Halloween3.hledger register tag:quality=”very good”
```
 
## Multiple Values per Tag
 
Sometimes, it’s useful to have more than one value per tag. For example, you have a budget category for travel, something that looks like:
``` 
Expenses:Travel
```

However, you would also like to be able to isolate expenses by:
 
-      The year of the trip (as opposed to the year the expense occurred, useful, for example, if you purchase airline tickets in December for a flight the following January)
-      The destination of the trip
-      Each individual trip (even if the trips are to the same destination)
 
## Tags and Values for Trip Tracking
 
In the examples we will be working with we will have one tag, “trip,” and the values will be in the form of DESTINATION-YEAR[one letter trip identifier]. For example, if one of your trips is to Atlanta, you traveled in 2017, and it was the first trip to Atlanta in 2017, the value of the tag would be:
```
Atlanta-2017a
```
 
Thus, with one tag value we track the destination (Atlanta), the year of the trip (2017, even if any of the expenses were in 2016), and the individual trip (Atlanta-2017a, meaning the first trip we took to Atlanta in 2017).
 
Therefore, a sample expense for the Atlanta trip could look like the following:
 
```
2017/01/12 My Gas Station  ; trip: Atlanta-2017a
   Expenses:Travel  $18.43
   Liabilities:CreditCard
```
 
## How Much Did It Cost to Go Where?
 
To see the total expenses sorted by each tag value, you use the --pivot option with the balance command. Note, though, the advice to limit the report to expenses, as follows:
 
```
hledger –f filename.hledger balance Expenses --pivot trip
```
 
If your tags are 100% limited to your expenses, that is, they all have the tag in the Expenses line as shown below:
 
```
2018/01/12 My Gas Station
   Expenses:Travel  $14.43 ; trip: Boise-2018a
   Liabilities:CreditCard
```
 
Then with the above, you can shorten the command to:
 
```
hledger –f filename.hledger balance --pivot trip
```
 
However, if the tag is applied to the whole transaction:
 
```
2018/01/12 My Gas Station  ; trip: Boise-2018a
   Expenses:Travel  $14.43
   Liabilities:CreditCard
```
 
Then for the above you need to use the command limiting the balance report to Expenses.
 
```
hledger –f filename.hledger balance Expenses --pivot trip
```
 
Otherwise, the liability will balance the expense to zero.
 
## Some Examples
 
Let’s add some sample data to work with, which will be in a file named TagsPart3.hledger:
 
```
; ================ begin file ================
 
2013/01/12 My Gas Station  ; trip: Boise-2013a
   Expenses:Travel  $14.43
   Liabilities:CreditCard
 
2014/01/12 My Gas Station  ; trip: Albany-2014a
   Expenses:Travel  $15.43
   Liabilities:CreditCard
 
2014/09/15 My Gas Station  ; trip: Albany-2014b
   Expenses:Travel  $16.43
   Liabilities:CreditCard
 
2016/01/12 My Gas Station  ; trip: Austin-2016a
   Expenses:Travel  $17.43
   Liabilities:CreditCard
 
2016/05/18 My Gas Station  ; trip: Fort Lauderdale-2016a
   Expenses:Travel  $18.43
   Liabilities:CreditCard
 
2016/11/21 My Gas Station  ; trip: Houston-2016a
   Expenses:Travel  $19.43
   Liabilities:CreditCard
 
; ================ end file ================
```
 
## Totaling Expenses per Trip
 
If we run the command:
 
```
hledger -f TagsPart3.hledger balance Expenses --pivot trip
```
 
Then we get:
```
$15.43  Albany-2014a
              $16.43  Albany-2014b
              $17.43  Austin-2016a
              $14.43  Boise-2013a
              $18.43  Fort Lauderdale-2016a
              $19.43  Houston-2016a
--------------------
             $101.58
```
 
We now have the totals for each trip, so we can see how much it costs to visit Aunt Anna in Albany. Hmm, not that much…. I will have to visit more often!
 
## Totaling Expenses per Year
 
To see totals for all trips in 2014, we could run the command:
 
```
hledger -f TagsPart3.hledger balance Expenses --pivot trip tag:trip=2014
```
 
Output:
```
              $15.43  Albany-2014a
              $16.43  Albany-2014b
--------------------
              $31.86
```
 
Here is one of the powers of using tags, that when we specify:
 
```
tag:trip=2014
```
 
…we are saying to match any tags whose values include “2014,” even if the values contain more than just “2014,” such as “Albany-2014a.”
 
Similarly, to see totals for all trips in 2016:
 
```
hledger -f TagsPart3.hledger balance Expenses --pivot trip tag:trip=2016
```
 
Output:
```
              $17.43  Austin-2016a
              $18.43  Fort Lauderdale-2016a
              $19.43  Houston-2016a
--------------------
              $55.29
```
 
## Trip Expenses by Destination
 
Finally, how much did we spend on trips to Albany, no matter what year the trip(s) took place in?
 
```
hledger -f TagsPart3.hledger balance Expenses --pivot trip tag:trip=Albany
```
 
Output:
```
              $15.43  Albany-2014a
              $16.43  Albany-2014b
--------------------
              $31.86
```
 
## More Complicated, Like Real Life
 
The above examples were highly simplified, with just one expense per trip. Just to show that we can work with something more complicated, let’s create some new data, assumed to be in a file TagsPart3b.hledger:
 
```
; ================ begin file ================
 
2013/12/01 Ariline  ; trip: Boise-2014a
    Expenses:Travel                          $200.00 ;round trip tickets
    Liabilities:CreditCard
 
2014/01/10 ACME Rideshare ; trip: Boise 2014a
    Expenses:Travel                           $30.00 ; to airport
    Liabilities:CreditCard
 
2014/01/12 Hotel  ; trip: Boise-2014a
    Expenses:Travel                          $300.00 
    Liabilities:CreditCard
 
2014/01/12 ACME Rideshare  ; trip: Boise 2014a
    Expenses:Travel                           $16.43  ; airport to home
    Liabilities:CreditCard
 
2014/09/12 My Gas Station  ; trip: Austin-2014a
    Expenses:Travel                         $17.43
    Liabilities:CreditCard
 
2014/10/18 My Gas Station  ; trip: Austin-2014b
    Expenses:Travel                      $18.43
    Liabilities:CreditCard
 
2014/12/01 Airline  ; trip:Boise-2015a
    Expenses:Travel                          $212.00  ; round trip tickets
    Liabilities:CreditCard
 
; ================ end file ================
```
 
In the above, we purchase airline tickets in 2013 for travel to Boise in 2014. We also take two trips by car to Austin in 2014. Finally, in December of 2014 we buy tickets for travel in 2015.
 
How much did each trip cost?
 
```
 hledger -f TagsPart3b.hledger balance Expenses --pivot trip
```
 
Output:
``` 
              $17.43  Austin-2014a
              $18.43  Austin-2014b
             $546.43  Boise-2014a
             $212.00  Boise-2015a
--------------------
             $794.29
```
 
How much did the 2014 trips cost?
 
```
hledger -f TagsPart3b.hledger balance Expenses --pivot trip tag:trip=2014
```
 
Output:
```
              $17.43  Austin-2014a
              $18.43  Austin-2014b
             $546.43  Boise-2014a
--------------------
             $582.29
```
 
## Summary
 
This tutorial has shown how to:
 
-      Add a tag to an hledger transaction
-      Use tags with the register command to list only those expenses with a given tag
-      Add values to tags
-      Use tag values with the register command to list only those expenses a given tag with a given value
-      Use tag values in such a way that it works as if you had multiple values for one tag
-      Use the --pivot option to total expenses by tag value
 
## Hledger Tag Summary with Examples
 
### Add a tag to an hledger transaction
 
Inside a comment write a word immediately followed by a colon:
 
```
2016/09/25 ACME Costume ; Halloween:
   Expenses:Entertainment     $45.99
   Liabilities:CreditCard
```
 
A tag can apply to a whole transaction, as in the above, or just one of the lines as in:
 
```
2016/09/25 ACME Costume
   Expenses:Entertainment     $45.99 ; Halloween:
   Liabilities:CreditCard
```
 
### Use tags with the register command to list only the expenses for a given tag
 
```
hledger -f Halloween2.hledger register Expenses tag:Halloween
```
 
### Add values to tags
 
To add a value to a tag, add one or more words to the tag:
 
```
2016/10/31 Johnsons
   Income:Treat   -2 candy ; quality: very good
   Assets:Food
```
 
### Limit a command to tags with specified values
 
```
$ hledger -f Halloween3.hledger register tag:quality=”very good”
```
 
Note that if your tag value has a space in it, you must do something such as put quotation marks around the entire tag value. If there are no spaces in your tag value, the quotation marks are optional.
 
### Trick: Tag values can include multiple pieces of information
 
```
2016/11/21 My Gas Station  ; trip: Houston-2016a
   Expenses:Travel  $19.43
   Liabilities:CreditCard
```
 
In the above, the tag includes information for the destination, the year of the trip, and which number trip it was to this location in this year.
 
### Use the --pivot option to total expenses by tag value
 
```
hledger -f TagsPart3.hledger balance Expenses --pivot trip tag:trip=Houston
```
 
or
 
```
hledger -f TagsPart3.hledger balance Expenses --pivot trip tag:trip=2016
```
 
## Conclusion
 
Tag, you’re it.
