CURRENT_RELEASE=1.28

# Render the current site and current dev and release manuals, saving them in out.
# The sitemap files are restored afterward (mdbook removes them).
# The current release should be the last version rendered.
build:
	@echo "building site with current manuals in /"
	@make -s build3-dev
	@make -s sitemap

# Render most versions of manuals (excluding old versions not packaged anywhere). 
# We want to link only one version in the sidebar, but mdbook won't render (and will remove) unlinked versions.
# We work around this by, for each version,
# temporarily linking that version of the manuals in SUMMARY, rendering the whole site,
# and saving the rendered manuals in out2/VERSION/.
# Re-rendering the whole site is of course wasteful and slow, but ensures all manual versions
# include the up-to-date site sidebar.
# The sitemap files are restored afterward (mdbook removes them).
# The current release should be the last version rendered. Keep synced with site.js:
all buildall: \
	build7-1.0 \
	build7-1.2 \
	build7-1.9 \
	build7-1.10 \
	build7-1.12 \
	build7-1.18 \
	build7-1.19 \
	build3-1.21 \
	build3-dev \
	build3-1.22 \
	build3-1.23 \
	build3-1.24 \
	build3-1.25 \
	build3-1.26 \
	build3-1.27 \
	build3-1.28
	@make -s sitemap

# Install some required tools.
# --force rebuilds mdbook-toc even if only mdbook changed, avoiding a warning.
tools:
	cargo install mdbook mdbook-toc --force
	sudo apt install -y npm && npm install -g static-sitemap-cli   # sscli


# Render the seven manuals for this hledger version <= 1.21, saving them in out2.
# The manuals source should exist in src/VER/.
# After this you should "make build" to rebuild the site with current manuals.
# The perl command rewrites links to numeric manual versions but not links to the dev version.
# The noindex meta tag will be added.
build7-%:
	@echo "building site with the seven $* manuals in /$*"
	@perl -i -p0e "s/- +(.*?)]\([0-9].*?hledger\.md\)\n- +(.*?)]\([0-9].*?hledger-ui\.md\)\n- +(.*?)]\([0-9].*?hledger-web\.md\)/- \1 ($*)]($*\/hledger.md)\n- \2 ($*)]($*\/hledger-ui.md)\n- \3 ($*)]($*\/hledger-web.md)\n- [journal manual ($*)]($*\/journal.md)\n- [csv manual ($*)]($*\/csv.md)\n- [timeclock manual ($*)]($*\/timeclock.md)\n- [timedot manual ($*)]($*\/timedot.md)/m" src/SUMMARY.md
	@sed -i -e 's/<\/title>/<\/title>\n<meta name="robots" content="noindex" \/>/' theme/index.hbs
	@mdbook build
	@mkdir -p out2
	@cp -r out/$* out2
	@git checkout -- src/SUMMARY.md theme/index.hbs

# Render the three manuals for this hledger version > 1.21 (or "dev"), saving them in out2.
# The manuals source should exist in src/VER/.
# After this you should "make build" to rebuild the site with current manuals.
# The perl command rewrites links to numeric manual versions, but not links to the dev version.
# The default manual links should be to a numeric version for this reason,
# the exact number doesn't matter, though we typically keep it updated.
# The noindex meta tag will be added to all but the current release.
build3-%:
	@echo "building site with the three $* manuals in /$*"
	@perl -i -pe "s/^- +(.*?)]\([0-9].*?(hledger(|-ui|-web)\.md)\)/- \1 ($*)]($*\/\2)/" src/SUMMARY.md
	@if [ ! x"$*" = x"$(CURRENT_RELEASE)" ] ; then \
		sed -i -e 's/<\/title>/<\/title>\n<meta name="robots" content="noindex" \/>/' theme/index.hbs; \
	fi
	@mdbook build
	@mkdir -p out2
	@cp -r out/$* out2
	@git checkout -- src/SUMMARY.md theme/index.hbs

# Generate sitemap.xml, after copying the old manuals under out/ temporarily.
sitemap:
	@echo "building sitemap.xml"
	@for d in out2/*; do cp $$d/* out/`basename $$d`; done
	@sscli -b https://hledger.org -r out/

clean:
	mdbook clean

# The following rules run `mdbook build` in a loop, which does not render the site completely:
# - sidebar manual links will be without versions
# - page TOCs will not be hyperlinked
# Manually running `make build` after it starts will fix these.

# Run `mdbook serve` which renders the pages and serves them on http port 3000.
serve:
	mdbook serve

# Auto-rebuild site when source files change (mdbook watch/serve should but usually don't).
watch:
	find src | entr -d bash -c 'date; mdbook build'

keepwatching:
	while true; do make -s watch; done

# Auto-rebuild site and auto-reload browser, since mdbook serve doesn't seem to yet.
# XXX dies
# LIVERELOADPORT=3001
# LIVERELOAD=livereloadx -p $(LIVERELOADPORT) -s \
# 	--exclude '*.html'
#   # don't reload as every page is generated, wait till the static files get copied
# OUT=out
# BROWSE=open
# reload:
# 	make watch &
# 	(sleep 1; $(BROWSE) http://localhost:$(LIVERELOADPORT)/) &
# 	$(LIVERELOAD) $(OUT)

MANUALS=\
	../hledger/hledger.md \
	../hledger-ui/hledger-ui.md \
	../hledger-web/hledger-web.md \

# After a release (>= 1.22), commit a snapshot of the release manuals
# as src/VER/, copied from the parent directory, which should be a
# clean checkout of the main hledger repo's master branch. (Note
# Shake.hs there might get rebuilt or have its deps installed.)
snapshot-%:
	git -C .. checkout $*-branch && \
	(cd ..; ./Shake.hs webmanuals; git reset --hard) && \
	mkdir -p src/$* && \
	for f in $(MANUALS); do test -e $$f && cp $$f src/$*; done && \
	git -C .. checkout master && \
	git add src/$* && git commit -m "snapshot of $* manuals" src/$*

# Run this after mdbook build/serve to make old manuals visible via symlinks.
# These will be wiped by the next mdbook build/serve.
# (On production, webserver redirects are used instead.)
manualsymlinks:
	for d in out/1* out/dev; do (cd out; rm -rf `basename $$d`; ln -s ../out2/`basename $$d`); done

# Show which urls have been indexed for site search
searchurls:
	cat out/searchindex.json | jq .doc_urls
