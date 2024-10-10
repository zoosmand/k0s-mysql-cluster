# Mysql Cluster Management Server

SHELL := /usr/bin/bash
VERSION := $$(cat ../.version)
CPU_ARCH := $$(dpkg --print-architecture)
SERVICE := mysql-prometheus-exporter



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
	source ./.requisites; \
	SRC_PATH=./src; \
	mkdir -p $$SRC_PATH; \
	wget -O $$SRC_PATH/exporter.tgz $$DOWNLOAD_URL/v$$EXPORTER_VERSION/mysqld_exporter-$$EXPORTER_VERSION.linux-${CPU_ARCH}.tar.gz; \
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


# docker run --rm -it -e MYSQLD_EXPORTER_PASSWORD=password -p 9104:9104/tcp hub.askug.net/mysql-expoerter-sb-11:0.0.1 -c "mysqld_exporter --mysqld.address=10.216.80.14:3306 --mysqld.username=exporter --tls.insecure-skip-verify"