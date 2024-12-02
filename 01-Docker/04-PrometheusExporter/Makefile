# Mysql NDB Cluster Prometheus Exporter

include ../common.mk

SERVICE := mysql-prometheus-exporter


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


# docker run --rm -it -e MYSQLD_EXPORTER_PASSWORD=password -p 9104:9104/tcp hub.askug.net/mysql-expoerter-sb-11:0.0.1 -c "mysqld_exporter --mysqld.address=10.216.80.14:3306 --mysqld.username=exporter --tls.insecure-skip-verify"