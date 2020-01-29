# Minimal makefile for Sphinx documentation
#

# You can set these variables from the command line, and also
# from the environment for the first two.
SPHINXOPTS    ?=
SPHINXBUILD   ?= sphinx-build
SOURCEDIR     = .
BUILDDIR      = _build

# Put it first so that "make" without argument is like "make help".
help:
	@$(SPHINXBUILD) -M help "$(SOURCEDIR)" "$(BUILDDIR)" $(SPHINXOPTS) $(O)

.PHONY: help Makefile

# Catch-all target: route all unknown targets to Sphinx using the new
# "make mode" option.  $(O) is meant as a shortcut for $(SPHINXOPTS).
%: Makefile
	@$(SPHINXBUILD) -M $@ "$(SOURCEDIR)" "$(BUILDDIR)" $(SPHINXOPTS) $(O)

# Auto-rebuild site when any source files change, except for old manuals.
# Avoid .gitignore so that generated manuals are included.
html-auto auto:
	fd --no-ignore-vcs -E _build -E '[0-9]*' -e .py -e .css -e .html -e .js -e .md -e .rst | entr make html

# Auto-rebuild site when any source files change, including old manuals.
html-auto-all:
	fd --no-ignore-vcs -E _build -e .py -e .css -e .html -e .js -e .md -e .rst | entr make html

BROWSE=open
LIVERELOADPORT=8001
LIVERELOAD=livereloadx -p $(LIVERELOADPORT) -s --exclude '*.html'
  # Exclude html files to avoid reloading browser as every page is generated.
  # A reload happens at the end when the css/js files get copied.

# Auto-rebuild site, and watch changes in a new browser window.
html-watch watch:
	make html-auto &
	(sleep 1; $(BROWSE) http://localhost:$(LIVERELOADPORT)/) &
	$(LIVERELOAD) _build/html/

# Copy CSS files, since sphinx-build doesn't seem to.
css:
	cp -r _static/css/* _build/html/_static/css

# Auto-re-copy CSS files when they change, since sphinx-build doesn't seem to.
css-auto:
	fd -e .css . _static/css | entr cp -r _static/css/* _build/html/_static/css

# Auto-update and watch changes in CSS files only, for speed.
css-watch:
	make css-auto &
	$(LIVERELOAD) _build/html/

install:
	pip3 install -U sphinx recommonmark sphinx-markdown-tables sphinx_rtd_theme
