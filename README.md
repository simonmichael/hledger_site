## hledger site repo

This is the repository for the hledger.org website.
(If you're looking for the main hledger code repo, see <https://github.com/simonmichael/hledger>.)
<!-- (Or the hledger project finance repo at <https://github.com/simonmichael/hledger_finance>.) -->

It contains the configuration and most of the content source files for the site.
(But most dev docs and the dev version of the manuals are symlinked from the main hledger repo.)

### History

This repo was created in 2019 by combining the site/ subfolder
previously in the main hledger repo, and the github wiki, preserving
the essential histories of both (though for the true original history
of site/ up to 2019/08, see the main hledger repo.)

In 2021, this site was converted from sphinx to mdbook.  

### Config 

This is intended to be cloned as the "site" subdirectory of the main hledger repo.
Currently this is done manually, not via git submodule or subtree.

mdbook configuration is in book.toml.  

Some static assets are kept in css/, theme/, js/ and highslide/. 

A few more assets and most of the site's content source is in src/. 

Some hledger docs are kept in the main hledger repo, and included in
the website via symbolic links in src/. These are:

- developer docs like CONTRIBUTING.md and README.md. (The latter is
  linked as src/dev-README.md so mdbook and github don't give it
  special treatment.)

- the hledger/hledger-ui/hledger-web user manuals (web versions).
  These should be generated/updated before rendering the website, by
  doing "make Shake && ./Shake" webmanuals in the main hledger repo.

To install the necessary tools on Debian or Ubuntu (assuming Rust is
installed):

    sudo apt update && make tools

To render the latest site content (in out/): 

    make

To render the latest content (in out/), and the old versions of the
user manuals, and the latest dev version of the manual (in out2/,
built separately due to mdbook limitations):

    make buildall

Depending on how the repository is cloned, it may be necessary to
delete the existing highslide symlink in the root directory with a new
symlink to src/highslide in order to prevent a build error about a
path not being a directory.
