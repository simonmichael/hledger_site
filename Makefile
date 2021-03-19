build:
	mdbook build

buildall:
	make renderoldmanuals build

serve:
	mdbook serve

clean:
	mdbook clean

# Auto-rebuild site when source files change, since mdbook watch/serve don't seem to.
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

# Copy the specified hledger version's web manuals to the proper subdirectory.
# Version must be 1.22 or greater.
# The hledger repo (..) should initially be a clean checkout of master.
# May install deps for and rebuild that hledger version's Shake.hs.
# Leaves the hledger repo on master branch.
WEBMANUALS=\
	../hledger/hledger.md \
	../hledger-ui/hledger-ui.md \
	../hledger-web/hledger-web.md \

copy-%:
	git -C .. checkout $* && \
	(cd ..; ./Shake.hs webmanuals; git reset --hard) && \
	mkdir -p src/$* && \
	for f in $(WEBMANUALS); do test -e $$f && cp $$f src/$*; done && \
	git -C .. checkout master

# Render old manuals, by temporarily linking them in SUMMARY.md.
# Slow, rerenders entire site for each version.
# Temporary hack until mdbook can do this.
renderoldmanuals: \
	renderolder-1.0 \
	renderolder-1.1 \
	renderolder-1.2 \
	renderolder-1.3 \
	renderolder-1.4 \
	renderolder-1.5 \
	renderolder-1.9 \
	renderolder-1.10 \
	renderolder-1.11 \
	renderolder-1.12 \
	renderolder-1.13 \
	renderolder-1.14 \
	renderolder-1.15 \
	renderolder-1.16 \
	renderolder-1.17 \
	renderolder-1.18 \
	renderolder-1.19 \
	renderolder-1.20 \
	renderold-1.21 \

# Render the 7 manuals for the specified hledger version <= 1.21, and save them in out2.
# The source files should exist in src/VER/.
renderolder-%:
	@perl -i -p0e "s%- \[hledger\]\(hledger\.md\)\n- \[hledger-ui\]\(hledger-ui\.md\)\n- \[hledger-web\]\(hledger-web\.md\)\n%- [hledger]($*/hledger.md)\n- [hledger-ui]($*/hledger-ui.md)\n- [hledger-web]($*/hledger-web.md)\n- [journal]($*/journal.md)\n- [csv]($*/csv.md)\n- [timeclock]($*/timeclock.md)\n- [timedot]($*/timedot.md)\n%s" src/SUMMARY.md
	@mdbook build
	@mkdir -p out2
	@cp -r out/$* out2
	@git checkout -- src/SUMMARY.md

# Render the 3 manuals for the specified hledger version > 1.21, and save them in out2.
# The source files should exist in src/VER/.
renderold-%:
	@perl -i -pe "s%\((hledger(|-ui|-web).md)\)%($*/\1)%" src/SUMMARY.md
	@mdbook build
	@mkdir -p out2
	@cp -r out/$* out2
	@git checkout -- src/SUMMARY.md

