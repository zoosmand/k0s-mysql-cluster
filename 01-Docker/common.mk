# Mysql NDB Cluster Common Makefile

SHELL := /usr/bin/bash
VERSION := $$(cat ../.version)
CPU_ARCH := $$(dpkg --print-architecture)


.PHONY: all
all:
	@ echo "It works!"


.PHONY: check
check:
	@ image_built=false; \
	source ../.requisites; \
	while read tag; do \
		if [[ ${VERSION} == $${tag//[\",\[\]]} ]]; then \
			image_built=true; \
		fi; \
	done <<< "$$(curl -s https://$$REGISTRY/v2/$$PROJECT-$(SERVICE)/tags/list | jq -r .tags)"; \
	if [[ $$image_built == true ]]; then \
		printf "\n---\nImage version ${VERSION} alredy in the repository.\n---\n\n"; \
		exit -1; \
	fi


.PHONY: build
build:
	@ echo "Building the image."


.PHONY: push
push:
	@ echo "Pushing the image."
	@ $(MAKE) check
	@ source ../.requisites; \
	docker push $$REGISTRY/$$PROJECT-$(SERVICE):${VERSION}
	$(MAKE) cleanup


.PHONY: cleanup
cleanup:
	rm -rf ./src


# Supress output like this "Makefile:9: warning: overriding recipe for target 'build'"
# foo:
# 	echo 'bar' > foo

# %: force
# 	@$(MAKE) -f base.mk $@
# force: ;