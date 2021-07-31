# Render the current site and current release manuals, saving them in out.
build: build3-dev
	@echo "building site with current manuals in /"
	@mdbook build

# Install some required tools.
tools:
	cargo install mdbook mdbook-toc

# Render all versions of manuals. Current release manual will be in out, all others in out2.
# Slow, temporarily links old manuals in SUMMARY and renders the whole site, for each version.
# Temporary hack until mdbook can render things not in SUMMARY.md.
all buildall: \
	build7-1.0 \
	build7-1.1 \
	build7-1.2 \
	build7-1.3 \
	build7-1.4 \
	build7-1.5 \
	build7-1.9 \
	build7-1.10 \
	build7-1.11 \
	build7-1.12 \
	build7-1.13 \
	build7-1.14 \
	build7-1.15 \
	build7-1.16 \
	build7-1.17 \
	build7-1.18 \
	build7-1.19 \
	build7-1.20 \
	build3-1.21 \
	build3-1.22 \
	build3-dev \
	build

# Like buildall but just a few recent versions.
recent buildrecent: \
	build3-1.22 \
	build3-1.21 \
	build3-dev \
	build

# build7/build3 naming is to help avoid running the wrong rule for the version

# Render the 7 manuals for this hledger version <= 1.21, saving them in out2.
# The manuals source should exist in src/VER/.
# After this you should "make build" to rebuild the site with current manuals.
build7-%:
	@echo "building site with the seven $* manuals in /$*"
	@perl -i -p0e "s%- \[hledger\]\(hledger\.md\)\n- \[hledger-ui\]\(hledger-ui\.md\)\n- \[hledger-web\]\(hledger-web\.md\)\n%- [hledger]($*/hledger.md)\n- [hledger-ui]($*/hledger-ui.md)\n- [hledger-web]($*/hledger-web.md)\n- [journal]($*/journal.md)\n- [csv]($*/csv.md)\n- [timeclock]($*/timeclock.md)\n- [timedot]($*/timedot.md)\n%s" src/SUMMARY.md
	@mdbook build
	@mkdir -p out2
	@cp -r out/$* out2
	@git checkout -- src/SUMMARY.md

# Render the 3 manuals for this hledger version > 1.21 (or "dev"), saving them in out2.
# The manuals source should exist in src/VER/.
# After this you should "make build" to rebuild the site with current manuals.
build3-%:
	@echo "building site with the three $* manuals in /$*"
	@perl -i -pe "s%\((hledger(|-ui|-web).md)\)%($*/\1)%" src/SUMMARY.md
	@mdbook build
	@mkdir -p out2
	@cp -r out/$* out2
	@git checkout -- src/SUMMARY.md

clean:
	mdbook clean

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
	git add src/$* && git commit -m "snapshot of $* manuals" src/$*

