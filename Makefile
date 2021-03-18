build:
	mdbook build

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

# hledger 1.21 and up:
WEBMANUALS=../hledger/hledger.md ../hledger-ui/hledger-ui.md ../hledger-web/hledger-web.md

# hledger 1.x where x is 21 and up:
# Copy the specified hledger version's web manuals to the proper subdirectory.
# Leaves the hledger repo on master branch.
1%:
	git -C .. checkout $@ && \
	mkdir -p src/$@ && \
	cp $(WEBMANUALS) src/$@ && \
	git -C .. checkout master

# hledger 1.21 and up:
# Copy the current hledger repo's web manuals to the website's default manual pages.
copymanuals:
	echo "<!-- toc -->" >src/hledger.md;     cat ../hledger/hledger.md >>src/hledger.md
	echo "<!-- toc -->" >src/hledger-ui.md;  cat ../hledger-ui/hledger-ui.md >>src/hledger-ui.md
	echo "<!-- toc -->" >src/hledger-web.md; cat ../hledger-web/hledger-web.md >>src/hledger-web.md
#	for M in $(WEBMANUALS); do \

