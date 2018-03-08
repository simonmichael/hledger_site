hledger tags go inside a comment, but the tag should come at the end of the comment.

For example, you make a purchase of an _inflatable turkey_ and want to include that fact in a comment. However, in the same line you also want to tag it as _holiday:Thanksgiving_. The correct order to do this is:

```
2016/09/26 ACME Holiday Supplies ; 
  Expenses:Entertainment    $58.99 ; inflatable turkey holiday:Thanksgiving
  Liabilities:CreditCard
```

If you put the comments after the tag, they become part of the tag value, and this can cause unwanted results.