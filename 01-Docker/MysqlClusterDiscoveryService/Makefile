
REGISTRY := hub.askug.net
SERVICE := mysql-cluster-discovery-service
PROJECT := sb-11
VERSION := 0.0.5

all: build push

build:
	@ docker buildx build --no-cache -t ${REGISTRY}/${SERVICE}-${PROJECT}:${VERSION} . > .log 2>&1

push:
	docker push ${REGISTRY}/${SERVICE}-${PROJECT}:${VERSION}
