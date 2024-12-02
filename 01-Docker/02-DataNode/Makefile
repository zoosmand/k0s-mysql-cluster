# Mysql NDB  Cluster Data Node Server

include ../common.mk
SERVICE := mysql-ndb-data-node



.PHONY: build
build:
	@ $(MAKE) -f ../common.mk $@
	@ $(MAKE) check
	@ source ../.requisites; \
	DST_PATH=./src; \
	SRC_PATH=~/tmp/mysql-cluster-$$SOURCE_VERSION-${CPU_ARCH}; \
	mkdir -p $$DST_PATH; \
	for item in ndbd ndbmtd; do \
		install -D -m 0755 $$SRC_PATH/bin/$$item $$DST_PATH/sbin/$$item; \
	done; \
	docker buildx build --no-cache -t $$REGISTRY/$$PROJECT-$(SERVICE):${VERSION} . > .log 2>&1
