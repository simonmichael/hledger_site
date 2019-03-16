Welcome to the hledger Cookbook!
This complements the main [hledger website and reference docs](http://hledger.org)
with additional how-tos, tutorials, notes, etc.
Unlike the main content, it is stored in [hledger's Github wiki](https://github.com/simonmichael/hledger/wiki).
This means you can make quick edits via Github's web UI, without pull requests or tool setup.
Please edit freely! 

**Editing tips:**

- Use the links below to organise Cookbook content.
  They (everything from the "Cookbook" heading down)
  will automatically appear on the [hledger.org home page](http://hledger.org).
- [Github wikis help](https://help.github.com/categories/wiki)
- editing requires a github account
- edit by web, or by git clone, local edit, git push
- link between wiki pages: `[[Pagename]]` or `[[Other text|Pagename]]`. 
  Pagename is case insensitive and can have spaces.
- link to wiki pages from elsewhere: `https://github.com/simonmichael/hledger/wiki/Pagename`. 
  Pagename is case insensitive and can have spaces.
- link to hledger manual sections from the wiki: `http://hledger.org/manual#anchor`. 
  anchor is any manual heading's text, lowercased with punctuation removed and spaces replaced by hyphens.
- when renaming a page, try also to update the links to it
- For the most accurate rendering, live updating etc., you may prefer
  to render the hledger website and cookbook locally, with live
  updating, etc. In your copy of the hledger repo, clone the wiki to
  `./wiki` and try `make help-site`, `make site-liverender`, `make
  site-livereload`, `./Shake help` etc.

## [[Cookbook|Home]]

### Getting started

[[hledger basics tutorial]]  
[[hledger terminology]]  
[[Create a journal]]  
[[hledger accounting concepts]]   
[[Common journal entries]]  
[[FAQ]]  
[[Accounting links]]  

### Managing data

[[Convert CSV files]]  
[[Customize default CSV accounts]]  
[[Track changes with version control]]  
[[Use another account separator character]]  

### Reporting

[[Queries]]  
[[hledger tags tutorial]]  
[[Rewrite account names]]  

### Real world setups

[[About real world setup docs]]  
["Full-fledged Hledger" tutorial](https://github.com/adept/full-fledged-hledger)&nbsp;&rarr;  
["hledger: Make It So" tutorial & slideshow](https://github.com/apauley/hledger-makeitso)&nbsp;&rarr;  
[[Simons setup]]  

### Accounting tasks

[[hledger multicurrency tutorial]]  
[[Foreign trip expenses]]  
[[Budgeting and forecasting]]  
[[Project accounting]]  
[[Track investments]]  
[[Time planning]]

### Usage tips

[[Addons]]  
[[Command-line completion]]  
[[Editor configuration]]  
[[hledger-web tips]]  
[[Mobile apps]]  
[[Save frequently used options]]  
[[Scripting]]  

### See also...

[plaintextaccounting.org](http://plaintextaccounting.org)
([software](http://plaintextaccounting.org/#software),
[docs](http://plaintextaccounting.org/#docs),
[common&nbsp;tasks](http://plaintextaccounting.org/#common-tasks),
[discussion](http://plaintextaccounting.org/#discussion))
&nbsp;&rarr;  
[Ledger](http://ledger-cli.org)
([docs](https://www.ledger-cli.org/docs.html),
[wiki](https://github.com/ledger/ledger/wiki))
&nbsp;&rarr;  
[Beancount](http://furius.ca/beancount)
([docs](http://furius.ca/beancount/doc/index))
&nbsp;&rarr;  
