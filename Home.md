Welcome to the hledger Cookbook!
This complements the main hledger website and reference manuals ([hledger.org](http://hledger.org))
with additional how-tos, tutorials, notes, etc.
You can find all content via the sidebar to the right. **&rarr;**

### How to edit

The cookbook is displayed on the hledger website, but unlike the other content,
it is stored in [hledger's Github wiki](https://github.com/simonmichael/hledger/wiki).
This means you can make quick edits via Github's web UI, without pull requests or tool setup.
Please edit freely! 

Tips:

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
- use the [_Sidebar](_Sidebar/_edit) to organize content.
  This page's content (from the "Cookbook" heading down)
  automatically appears on the [hledger.org home page](http://hledger.org) also.
- For the most accurate rendering, live updating etc., you may prefer
  to render the hledger website and cookbook locally, with live
  updating, etc. In your copy of the hledger repo, clone the wiki to
  `./wiki` and try `make help-site`, `make site-liverender`, `make
  site-livereload`, `./Shake help` etc.
