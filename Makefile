MATTERMOST_VER = 2.2.0

ASSETS = assets/runtime/config.json.tmpl

all: $(ASSETS)

assets/runtime/config.json.tmpl: scripts/config.json.awk assets/runtime/config.json.tmpl.tmp
	awk -f $^ > $@

assets/runtime/config.json.tmpl.tmp:
	curl -L https://raw.githubusercontent.com/mattermost/platform/v$(MATTERMOST_VER)/config/config.json \
		| sed -e 's/":8065"/":80"/g' -e 's/"DEBUG"/"INFO"/g' \
		> $@
