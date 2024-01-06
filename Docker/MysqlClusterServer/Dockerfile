FROM ubuntu:22.04

LABEL maintainer="zoosmand@gmail.com"
LABEL build_date="2024-01-06"
LABEL app_name="mysql-cluster-sb-11"
LABEL app_version="0.0.1"
LABEL name="MySQL Cluster Server"

ARG VERSION_RUNNER_OS=ubuntu22.04
ARG VERSION_MYSQL=8.1
ARG VERSION_MYSQL_CLUSTER_VERSION=8.1.0-1
ARG CPU_ARCH=amd64

ARG BUILD_VERSION=0.0.1

ARG BUNDLE_FILE=mysql-cluster_${VERSION_MYSQL_CLUSTER_VERSION}${VERSION_RUNNER_OS}_${CPU_ARCH}.deb-bundle.tar

ARG DOOWNLOAD_URL=https://dev.mysql.com/get/Download/MySQL-Cluster-${VERSION_MYSQL}/${BUNDLE_FILE}

RUN \
	set -eux; \
	apt-get update -y; \
	apt-get install -y --no-install-recommends \
		wget \
        ca-certificates \
        libaio1 \
        libmecab2 \
        libsasl2-2 \
        libnuma1 \
        perl \
        psmisc \
		; \
    apt-get clean; \
    apt-get -yf autoremove; \
	rm -rf /var/lib/apt/lists/*

RUN \
	set -eux; \
    groupadd --system mysql; \
    useradd -s /sbin/nologin --system -g mysql mysql

WORKDIR /tmp

RUN \
	set -eux; \
    wget ${DOOWNLOAD_URL} || true
# if a geo block exists, copy file from local fs

COPY ${BUNDLE_FILE}* .

RUN \
	set -eux; \
    tar xvf ${BUNDLE_FILE}; \
    dpkg -i mysql-common_${VERSION_MYSQL_CLUSTER_VERSION}${VERSION_RUNNER_OS}_${CPU_ARCH}.deb; \
    dpkg -i mysql-cluster-community-client-plugins_${VERSION_MYSQL_CLUSTER_VERSION}${VERSION_RUNNER_OS}_${CPU_ARCH}.deb; \
    dpkg -i mysql-cluster-community-client-core_${VERSION_MYSQL_CLUSTER_VERSION}${VERSION_RUNNER_OS}_${CPU_ARCH}.deb; \
    dpkg -i mysql-cluster-community-client_${VERSION_MYSQL_CLUSTER_VERSION}${VERSION_RUNNER_OS}_${CPU_ARCH}.deb; \
    dpkg -i mysql-client_${VERSION_MYSQL_CLUSTER_VERSION}${VERSION_RUNNER_OS}_${CPU_ARCH}.deb; \
    dpkg -i mysql-cluster-community-server-core_${VERSION_MYSQL_CLUSTER_VERSION}${VERSION_RUNNER_OS}_${CPU_ARCH}.deb; \
    dpkg -i mysql-cluster-community-server_${VERSION_MYSQL_CLUSTER_VERSION}${VERSION_RUNNER_OS}_${CPU_ARCH}.deb; \
    dpkg -i mysql-cluster-community-server-debug_${VERSION_MYSQL_CLUSTER_VERSION}${VERSION_RUNNER_OS}_${CPU_ARCH}.deb; \
    dpkg -i mysql-server_${VERSION_MYSQL_CLUSTER_VERSION}${VERSION_RUNNER_OS}_${CPU_ARCH}.deb; \
    dpkg -i ndbclient_${VERSION_MYSQL_CLUSTER_VERSION}${VERSION_RUNNER_OS}_${CPU_ARCH}.deb; \
    rm -R -f /tmp/mysql* /tmp/lib* /tmp/ndb* /tmp/${BUNDLE_FILE}*; \
    ls -la /tmp

FROM scratch

COPY --from=0 / /

USER mysql
WORKDIR /var/lib/mysql

VOLUME [ "/var/lib/mysql" ]

EXPOSE 3306

ENTRYPOINT [ "/usr/bin/sh" ]
CMD [ "-c", "" ]

# ENTRYPOINT [ "/usr/sbin/ndb_mgmd" ]
# CMD [ "--config-file=/var/lib/mysql-cluster/config.ini", "--nodaemon" ]
