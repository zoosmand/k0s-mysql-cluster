# Mysql Cluster Management Server

SHELL := /usr/bin/bash
VERSION := $$(cat ../.version)
CPU_ARCH := $$(dpkg --print-architecture)
SERVICE := mysql-ndb-cluster-manager


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
	@ $(MAKE) check
	@ source ../.requisites; \
	DST_PATH=./src; \
	SRC_PATH=~/tmp/mysql-cluster-$$SOURCE_VERSION-${CPU_ARCH}; \
	mkdir -p $$DST_PATH; \
	install -D -m 0755 $$SRC_PATH/bin/ndb_mgmd $$DST_PATH/sbin/ndb_mgmd; \
	docker buildx build --no-cache -t $$REGISTRY/$$PROJECT-$(SERVICE):${VERSION} . > .log 2>&1


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
