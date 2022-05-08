CURRENT_RELEASE=1.25

# Render the current site and current release and dev manuals, saving them in out (and restoring the sitemap files).
build:
	@echo "building site with current manuals in /"
	@make -s build3-dev
	@make -s build3-1.25
	@git checkout -- out/sitemap.xml out/sitemap.txt

sitemap: copy-old-manuals
	@echo "building sitemap.xml"
	@sscli -b https://hledger.org -r out/ -v

# copy the old manuals under out, for long enough to build sitemap.xml
copy-old-manuals:
	for d in out2/*; do cp $$d/* out/`basename $$d`; done

# Install some required tools.
tools:
	cargo install mdbook mdbook-toc

# Render "all" versions of manuals (excluding old versions not packaged anywhere). 
# We want to link only one version in the sidebar, but mdbook won't render (and will remove) unlinked versions.
# We work around this by, for each version,
# temporarily linking that version of the manuals in SUMMARY, rendering the whole site,
# and saving the rendered manuals in out2/VERSION/.
# Re-rendering the whole site is of course wasteful and slow, but ensures all manual versions
# include the up-to-date site sidebar.
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

# build7/build3 naming is to help avoid running the wrong rule for the version

# Render the 7 manuals for this hledger version <= 1.21, saving them in out2.
# The manuals source should exist in src/VER/.
# After this you should "make build" to rebuild the site with current manuals.
# The noindex meta tag will be added.
build7-%:
	@echo "building site with the seven $* manuals in /$*"
	@perl -i -p0e "s/- +(.*?)]\(hledger\.md\)\n- +(.*?)]\(hledger-ui\.md\)\n- +(.*?)]\(hledger-web\.md\)/- \1 ($*)]($*\/hledger.md)\n- \2 ($*)]($*\/hledger-ui.md)\n- \3 ($*)]($*\/hledger-web.md)\n- [journal manual ($*)]($*\/journal.md)\n- [csv manual ($*)]($*\/csv.md)\n- [timeclock manual ($*)]($*\/timeclock.md)\n- [timedot manual ($*)]($*\/timedot.md)/m" src/SUMMARY.md
	@sed -i -e 's/<\/title>/<\/title>\n<meta name="robots" content="noindex" \/>/' theme/index.hbs
	@mdbook build
	@mkdir -p out2
	@cp -r out/$* out2
	@git checkout -- src/SUMMARY.md theme/index.hbs

# Render the 3 manuals for this hledger version > 1.21 (or "dev"), saving them in out2.
# The manuals source should exist in src/VER/.
# After this you should "make build" to rebuild the site with current manuals.
# The noindex meta tag will be added to all but the current release.
build3-%:
	@echo "building site with the three $* manuals in /$*"
	@perl -i -pe "s/^- +(.*?)]\((hledger(|-ui|-web)\.md)\)/- \1 ($*)]($*\/\2)/" src/SUMMARY.md
	@if [ ! x"$*" = x"$(CURRENT_RELEASE)" ] ; then \
		sed -i -e 's/<\/title>/<\/title>\n<meta name="robots" content="noindex" \/>/' theme/index.hbs; \
	fi
	@mdbook build
	@mkdir -p out2
	@cp -r out/$* out2
	@git checkout -- src/SUMMARY.md theme/index.hbs

clean:
	mdbook clean

# This does a vanilla `mdbook build`, which renders sidebar manual links without versions.
# Can manually run `make build` after it starts to fix.
serve:
	mdbook serve

# Auto-rebuild site when source files change, since mdbook watch/serve usually don't.
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
	git -C .. checkout $* && \
	(cd ..; ./Shake.hs webmanuals; git reset --hard) && \
	mkdir -p src/$* && \
	for f in $(MANUALS); do test -e $$f && cp $$f src/$*; done && \
	git -C .. checkout master && \
	git add src/$* && git commit -m "snapshot of $* manuals" src/$* && \
	echo "remember to point the src/current symlink to the current release manuals"

# Run this after mdbook build/serve to make old manuals visible via symlinks.
# These will be wiped by the next mdbook build/serve.
# (On production, webserver redirects are used instead.)
manualsymlinks:
	for d in out/1* out/dev; do (cd out; rm -rf `basename $$d`; ln -s ../out2/`basename $$d`); done
