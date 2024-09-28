
REGISTRY := hub.askug.net
SERVICE := mysql-exporter
PROJECT := sb-11
VERSION := 0.0.1

all: build push

build:
	@ docker buildx build --no-cache -t ${REGISTRY}/${SERVICE}-${PROJECT}:${VERSION} . > .log 2>&1

push:
	docker push ${REGISTRY}/${SERVICE}-${PROJECT}:${VERSION}


# docker run --rm -it -e MYSQLD_EXPORTER_PASSWORD=password -p 9104:9104/tcp hub.askug.net/mysql-expoerter-sb-11:0.0.1 -c "mysqld_exporter --mysqld.address=10.216.80.14:3306 --mysqld.username=exporter --tls.insecure-skip-verify"