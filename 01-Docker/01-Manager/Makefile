# Mysql NDB Cluster Management Server

include ../common.mk
SERVICE := mysql-ndb-cluster-manager


.PHONY: build
build:
	@ $(MAKE) -f ../common.mk $@
	@ $(MAKE) check
	@ source ../.requisites; \
	DST_PATH=./src; \
	SRC_PATH=~/tmp/mysql-cluster-$$SOURCE_VERSION-${CPU_ARCH}; \
	mkdir -p $$DST_PATH; \
	install -D -m 0755 $$SRC_PATH/bin/ndb_mgmd $$DST_PATH/sbin/ndb_mgmd; \
	docker buildx build --no-cache -t $$REGISTRY/$$PROJECT-$(SERVICE):${VERSION} . > .log 2>&1
