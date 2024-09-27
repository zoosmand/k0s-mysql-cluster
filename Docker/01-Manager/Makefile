# Mysql Cluster Management Server

SHELL := /usr/bin/bash
VERSION := $$(cat ../.version)
CPU_ARCH := $$(dpkg --print-architecture)


.PHONY: all
all:
	@ echo "It works!"


.PHONY: build
build:
	@ source ../.requisites; \
	DST_PATH=./src; \
	SRC_PATH=~/tmp/mysql-cluster-$$SOURCE_VERSIOIN-${CPU_ARCH}; \
	mkdir -p $$DST_PATH; \
	install -D -m 0755 $$SRC_PATH/bin/ndb_mgmd $$DST_PATH/sbin/ndb_mgmd; \
	docker buildx build --no-cache -t $$REGISTRY/$$PROJECT-$$SERVICE:${VERSION} . > .log 2>&1


.PHONY: push
push:
	@ source ../.requisites; \
	docker push $$REGISTRY/$$PROJECT-$$SERVICE:${VERSION}


.PHONY: cleanup
cleanup:
	rm -rf ./src
