# What problems does hledger solve ?

Here are some problems a plain text accounting app, and hledger specifically, can solve.
Do any of these apply to you ?

<style>
h3 { margin:0 0 -0.5em;}
</style>

<div class=pagetoc>

<!-- toc -->
</div>

### I am a technical person wanting to track finances with familiar tools and a minimum of fuss
You can learn hledger's syntax quickly, manage data with your favourite text processing tools,
and produce useful financial reports right away with a single executable requiring no configuration.

### I don't have an effective accounting system, and am experiencing financial chaos, loss, or worry
(This was my situation when I started writing hledger.)
I can tell you that having some kind of system to keep a record of financial activity and give clarity and insight is a huge help; it can be life-changing.
hledger is a free, highly dependable accounting tool, that scales smoothly from basic to advanced needs.
It provides structure, extensive documentation, and a supportive community.
It is lightweight and minimal, so you can start simply without feeling overwhelmed by complex software.

### I’m worried I may accidentally lose my financial records (paper or digital).
hledger data takes up no physical space.
Because the files are plain text and relatively small, it’s easy to copy them and to make redundant backups, and to use a version control system providing a clear history of changes.
Multiple independent software apps can read them, and you could relatively easily build a new one.
They are also human-readable and printable, useful even without software or computers.

### I do single entry accounting; sometimes reports are wrong, I can't rely on them
You can do single entry with hledger too, if you like.
But for centuries, the standard for serious accounting has been double entry, because it is so good at preventing errors.
hledger, like other plaintext accounting apps, is built around double entry accounting.
This provides great reassurance that your reports are rock solid, so you can confidently make decisions and take actions based on them.

### I am confused by accounting and bookkeeping, and I want to get better at it
Using a plain text accounting app like hledger,
you'll be working hands-on with double entry bookkeeping and general journal entries,
with a minimum of distracting software and jargon.
Also you'll have a supportive community of fellow learners and experts to answer questions.

### I want to try Plain Text Accounting, but I am finding it hard to get started
Perhaps you've struggled to get a productive Beancount setup.
Or you weren't able to figure out how to do some things with Ledger.
You are finding it too much work to produce basic financial reports at the command line.
Maybe you want a GUI or TUI, that's simple to install and use.
You want more up to date and complete documentation, or active chat rooms where you can get quick support.\
hledger aims to serve both techies and non-techies and to provide a smoother getting started experience,
with standard financial reports and simple UIs that work out of the box.

### My paper-based system is too much work and too hard to get insights from
hledger can optionally import bank data, reducing the work of manual data entry.
With a little programming you can automate many accounting tasks.
And hledger provides many useful and flexible reports.

### My accounting spreadsheet has grown too large, too error prone, or too limiting
hledger provides a simple, expressive, widely used syntax for describing any kind of financial transaction, using standard double entry bookkeeping.
It scales up to large files, provides extensive error checking, and provides very flexible reports.

### My accounting software is expensive, invasive, and hard to leave
As GPLv3-licensed Free Software, hledger both is free in price, and also works to preserve your personal freedoms.
It runs entirely under your control, on your private machine.
You can see all of its code, and you can improve it or fix it yourself, or you can hire someone to do that.
There's no lock-in, and there are multiple ways to export data, including to other plain text accounting apps like Ledger, Beancount, Fava, Paisa etc.

### My accounting software works only with an online connection
hledger is local software that works offline.
The user manuals are also built in and viewable on any machine.
The only time you might need the internet is to download bank data
or to run your own hledger-web server, and these are optional.

### My accounting software is opaque or unreliable, and I worry about messing up my data
Most hledger operations are read only and can't affect your data.
Commands that change your files are clearly identified, and often are append-only.
hledger provides extensive error checking to help you avoid data errors, and the app itself is heavily tested and written in a high assurance programming language.
Best of all, the plain text data files are ideal for version control. 
This means you can review and audit every change to your data, and undo or roll back history at any time.

### My accounting software is inefficient
Is it slow to start up ? Are certain operations tedious and time-consuming ?\
hledger is lightweight and fast, starting instantly and usually producing results in a fraction of a second even on old machines.
It stores data as human-readable plain text files, which means you can do even large-scale bulk edits quickly and easily.
The command line interface means you can turn complex operations into easy commands, or integrate it in automated scripts.

### My accounting software is not improving, and I would prefer a tool that's actively maintained and supported
hledger has delivered a new major release every quarter since 2017.
It's the only PTA app with active chat rooms (matrix and IRC).
It's the most-used PTA app in
[some](https://chaos.social/@scy/114663971347130842)
[circles](https://matrix.to/#/#plaintextaccounting:matrix.org/$YPqMTQy8ij5G3Jv7axvWcaFDYPipl940L-FhvdXQJ8s).

