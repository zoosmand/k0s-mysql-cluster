FROM ubuntu:22.04

LABEL maintainer="zoosmand@gmail.com"
LABEL build_date="2024-01-06"
LABEL app_name="mysql-cluster-sb-11"
LABEL app_version="0.0.1"
LABEL name="MySQL Cluster Data Node"

ARG VERSION_RUNNER_OS=ubuntu22.04
ARG VERSION_MYSQL=8.1
ARG VERSION_MYSQL_CLUSTER_SERVER=8.1.0-1
ARG CPU_ARCH=amd64
ARG DEB_FILE=mysql-cluster-community-data-node_${VERSION_MYSQL_CLUSTER_SERVER}${VERSION_RUNNER_OS}_${CPU_ARCH}.deb 

ARG BUILD_VERSION=0.0.1

ARG DOOWNLOAD_URL=https://dev.mysql.com/get/Download/MySQL-Cluster-${VERSION_MYSQL}/${DEB_FILE}

RUN \
	set -eux; \
	apt-get update -y; \
	apt-get install -y --no-install-recommends \
		wget \
        ca-certificates \
        libclass-methodmaker-perl \
		; \
    apt-get clean; \
    apt-get -yf autoremove; \
	rm -rf /var/lib/apt/lists/*

RUN \
	set -eux; \
    groupadd --system mysql; \
    useradd -s /sbin/nologin --system -g mysql mysql; \
    mkdir -p /var/lib/mysql/data; \
    chown mysql:mysql /var/lib/mysql/data

WORKDIR /tmp
RUN wget ${DOOWNLOAD_URL} || true
# if a geo block exists, copy file from local fs 
COPY ${DEB_FILE}* .

RUN \
	set -eux; \
    dpkg -i ${DEB_FILE}

USER mysql
WORKDIR /var/lib/mysql/data

ENTRYPOINT [ "/usr/bin/sh" ]
CMD [ "-c", "" ]

# ENTRYPOINT [ "/usr/sbin/ndbd" ]
# CMD [ "--nodaemon", "--nostart" ]
