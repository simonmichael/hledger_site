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
