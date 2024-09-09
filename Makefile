CURRENT_RELEASE=1.34

# Render the current site and current dev and release manuals, saving them in out.
# The sitemap files are restored afterward (mdbook removes them).
# The current release should be the last version rendered.
build:
	@echo "building site with current manuals in /"
	@make -s build3-dev
	@make -s build3-1.40
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
	build3-1.28 \
	build3-1.29 \
	build3-1.30 \
	build3-1.31 \
	build3-1.32 \
	build3-1.33 \
	build3-1.34 \
	build3-dev \
	build3-1.40
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
#	@echo "building sitemap.xml"
sitemap:
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
	@echo "this needs fixing, see RELEASING.md > Release prep"; exit 1
#	git -C .. checkout $*-branch && \
#	(cd ..; ./Shake.hs webmanuals; git reset --hard) && \
#	mkdir -p src/$* && \
#	for f in $(MANUALS); do test -e $$f && cp $$f src/$*; done && \
#	git -C .. checkout master && \
#	git add src/$* && git commit -m "snapshot of $* manuals" src/$*

# Run this after mdbook build/serve to make old manuals visible via symlinks.
# These will be wiped by the next mdbook build/serve.
# (On production, webserver redirects are used instead.)
manualsymlinks:
	for d in out/1* out/dev; do (cd out; rm -rf `basename $$d`; ln -s ../out2/`basename $$d`); done

# Show which urls have been indexed for site search
searchurls:
	cat out/searchindex.json | jq .doc_urls

# caddy reload has stopped working some time in 2023
caddy-reload: caddy-validate
	systemctl reload caddy

# XXX invalid config doesn't stop it stopping the service
caddy-restart: caddy-validate
	systemctl stop caddy; systemctl start caddy

caddy-check caddy-validate:
	caddy validate --config hledger.org.caddy --adapter caddyfile && echo ok || echo FAILED
	@echo "Please also check recent caddy log for successful tls certificate renewals."
#
# Example of failing tls renewal:
#
# Nov 12 06:37:45 localhost caddy[919721]: {"level":"info","ts":1699807065.9162648,"logger":"tls.renew","msg":"renewing certificate","identifier":"hledger.org","remaining":1854818.083736637}
#
# Nov 12 06:37:46 localhost caddy[919721]: {"level":"info","ts":1699807066.05752,"logger":"http.acme_client","msg":"trying to solve challenge","identifier":"hledger.org","challenge_type":"dns-01","ca":"https://acme-staging-v02.api.letsencrypt.org/directory"}
#
# Nov 12 06:37:46 localhost caddy[919721]: {"level":"error","ts":1699807066.128025,"logger":"http.acme_client","msg":"cleaning up solver","identifier":"hledger.org","challenge_type":"dns-01","error":"no memory of presenting a DNS record for \"_acme-challenge.hledger.org\" (usually OK if presenting also failed)"}
#
# Nov 12 06:37:46 localhost caddy[919721]: {"level":"error","ts":1699807066.1968174,"logger":"tls.renew","msg":"could not get certificate from issuer","identifier":"hledger.org","issuer":"acme-v02.api.letsencrypt.org-directory","error":"[hledger.org] solving challenges: presenting for challenge: adding temporary record for zone \"hledger.org.\": got error status: HTTP 400: [{Code:6003 Message:Invalid request headers}] (order=https://acme-staging-v02.api.letsencrypt.org/acme/order/122973774/12216261964) (ca=https://acme-staging-v02.api.letsencrypt.org/directory)"}
#
# Nov 12 06:37:47 localhost caddy[919721]: {"level":"info","ts":1699807067.8907216,"logger":"http.acme_client","msg":"trying to solve challenge","identifier":"hledger.org","challenge_type":"dns-01","ca":"https://acme.zerossl.com/v2/DV90"}
#
# Nov 12 06:37:47 localhost caddy[919721]: {"level":"error","ts":1699807067.9423175,"logger":"http.acme_client","msg":"cleaning up solver","identifier":"hledger.org","challenge_type":"dns-01","error":"no memory of presenting a DNS record for \"_acme-challenge.hledger.org\" (usually OK if presenting also failed)"}
#
# Nov 12 06:37:48 localhost caddy[919721]: {"level":"error","ts":1699807068.3094556,"logger":"tls.renew","msg":"could not get certificate from issuer","identifier":"hledger.org","issuer":"acme.zerossl.com-v2-DV90","error":"[hledger.org] solving challenges: presenting for challenge: adding temporary record for zone \"hledger.org.\": got error status: HTTP 400: [{Code:6003 Message:Invalid request headers}] (order=https://acme.zerossl.com/v2/DV90/order/QpS9X34NIJlYngioKkRKhw) (ca=https://acme.zerossl.com/v2/DV90)"}
#
# Nov 12 06:37:48 localhost caddy[919721]: {"level":"error","ts":1699807068.3095212,"logger":"tls.renew","msg":"will retry","error":"[hledger.org] Renew: [hledger.org] solving challenges: presenting for challenge: adding temporary record for zone \"hledger.org.\": got error status: HTTP 400: [{Code:6003 Message:Invalid request headers}] (order=https://acme.zerossl.com/v2/DV90/order/QpS9X34NIJlYngioKkRKhw) (ca=https://acme.zerossl.com/v2/DV90)","attempt":4,"retrying_in":300,"elapsed":313.10931297,"max_duration":2592000}

caddy-fmt:
	caddy fmt hledger.org.caddy

# hledger.org deploy webhook
WEBHOOK_MANAGE_URL=https://github.com/simonmichael/hledger_site/settings/hooks/134395816

webhook-settings:
	@echo $(WEBHOOK_MANAGE_URL)?tab=settings
	@open $(WEBHOOK_MANAGE_URL)?tab=settings

webhook-deliveries:
	@echo $(WEBHOOK_MANAGE_URL)?tab=deliveries
	@open $(WEBHOOK_MANAGE_URL)?tab=deliveries

