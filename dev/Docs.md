https://github.com/simonmichael/hledger/tree/master/doc

Project documentation lives in a number of places:

- `site/*.md` is the hledger.org website content, which is generated with hakyll[-std] and pandoc
- haddock documentation in the code appears on Hackage
- short blurbs: cabal files, module headers, HCAR, GSOC project, ..
- `doc/notes.org` has some old developer notes
- developer reports (profiles, benchmarks, coverage..) in doc/profs, sometimes published at hledger.org/profs

How to prepare changelogs & release notes

Draft:

- `make changelog-draft >> doc/CHANGES.draft.org` (or `>` if this is the first draft)
- open this org file and sort the nodes (`C-c ^ a`)
- categorisation pass 1: go through and add topic prefixes where missing
- sort the nodes again
- categorisation pass 2: move significant items to the appropriate package subnode as appropriate; keep "soft" items that might appear in release notes; delete the rest
- cleanup pass: combine/rewrite items for clarity

Changelogs:

- choose release version and date
- add new sections at top of {doc,hledger*}/CHANGES
- move the items from CHANGES.draft.org to these CHANGES files
- remove CHANGES.draft.org

Release notes:

- add a new TOC entry and section in site/release-notes.md
- copy/rewrite/summarise package changelogs 
- note any other items of interest
- list release contributors
- write release summary
