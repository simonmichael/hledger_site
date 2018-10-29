Most contributed hledger code (and some of the project maintainer's code)
is submitted and reviewed via Github pull requests.
Here are some tips for contributing PRs to hledger.

## Code review is important

We aim to improve and sustain hledger's quality and maintainability over the long term.

Many PRs, especially small ones, can be merged quickly. We love those.

Some bigger or more risky PRs can require substantial review, discussion, changes, or re-submission. 
Much valuable design, quality control, and knowledge sharing happens at this time. 
Some PRs get rejected, but their discussion and exploration can still be a useful contribution.
We very much want to avoid wasted work, but it occasionally happens. 
Our process is evolving and imperfect.
All of this is normal. 
Please think of it as a golden opportunity to collaborate with experts,
share and receive knowledge, refine your design/documentation/code,
and practice your real-world development/communication skills.
Patience and persistence pays.

## The pull request

A PR should have a clear purpose, documented in its description. Mention any #ISSUENOs addressed.

Don't tackle too much at once. Smaller/more focussed PRs can be reviewed quicker and accepted (or rejected) quicker.

## The commit(s)

Commits should be easy to review.
Ideally each commit is complete, and has a single clear purpose,
which should be documented in the summary (and long description, if needed).
\#ISSUENOs can be mentioned in summary/description too when appropriate.

Within the above constraint, fewer, larger commits are preferred.

Keep in mind that commit messages are valuable documentation 
for future developers and troubleshooters. 
They are also the starting point for package changelogs and hledger release notes.
High-quality commit messages makes the release process quicker, and the resulting docs better. 

User-impacting commits should mention the user-visible changes, 
and be described in user-relevant language.
Library-user-impacting commits, eg API changes, ideally will also
be called out, and can described in more technical language.
Commits affecting hledger internals are less important, 
but you may notice some adhoc conventions if you browse the history.
In particular, you can optionally prefix the summary with short component codes (cf [[Issues]])
to facilitate history reading and changelog/release note production.

Rewrite and force-push your commits freely (rebase -i, push -f) to clean them up. 
Unless we decide to squash the PR into one commit, 
your commits will become part of hledger's history "for all time", 
so think about future developers trying to understand them, git bisect, etc.   

Rebase your commits against latest master for easiest review. Especially if they start to conflict.

## Documentation first

hledger follows documentation-driven design. 
All PRs introducing user-visible changes should include corresponding updates to reference docs.
Review can proceed more efficiently once these are provided, and may be delayed otherwise.

"Reference docs" typically means the manual source files, hledger*/hledger*.m4.md.
Updating the rendered manuals is not required, and probably best avoided to reduce conflicts.
Updating other docs such as tutorials, how-tos, examples, or screenshots is not required,  
though it's welcome (may be in a different repo).

It is in fact highly effective and recommended 
to draft and discuss the new user docs before writing code, 
to minimise wasted work and clarify design and consensus most economically.
This can be done by sharing pastes on IRC, on the mail list, in an issue comment,
or by starting a "WIP" PR with the proposed docs commit.
