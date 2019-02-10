Welcome to the hledger Cookbook!
This complements the main hledger website and reference manuals ([hledger.org](http://hledger.org))
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
[[hledger accounting concepts tutorial]]   
[[Common journal entries]]  

### Managing data

[[Convert CSV files]]  
[[Customize default CSV accounts]]  
[[Track changes with version control]]  
[[Use another account separator character]]  
["Full-fledged Hledger" setup](https://github.com/adept/full-fledged-hledger)  
["hledger: Make It So" setup](https://github.com/apauley/hledger-makeitso)

### Reporting

[[Queries]]  
[[hledger tags tutorial]]  
[[Rewrite account names]]  

### Accounting tasks

[[hledger multicurrency tutorial]]  
[[Foreign trip expenses]]  
[[Budgeting and forecasting]]  
[[Project accounting]]  
[[Track investments]]  
[[Time planning]]

### Usage tips

[[Addons]]  
[[Mobile apps]]  
[[Save frequently used options]]  
[[Tab-completion of hledger commands]]  

### More..

[[FAQ]]  
[[More docs]]  
[plaintextaccounting.org](http://plaintextaccounting.org)  
([software](http://plaintextaccounting.org/#software),
[docs](http://plaintextaccounting.org/#docs),
[common&nbsp;tasks](http://plaintextaccounting.org/#common-tasks),
[discussion](http://plaintextaccounting.org/#discussion))  
[ledger-cli.org](http://ledger-cli.org)  
([docs](https://www.ledger-cli.org/docs.html),
[wiki](https://github.com/ledger/ledger/wiki))  
[Beancount's docs](http://furius.ca/beancount/doc/index)  
