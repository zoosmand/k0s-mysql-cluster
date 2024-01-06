FROM ubuntu:22.04

LABEL maintainer="zoosmand@gmail.com"
LABEL build_date="2024-01-06"
LABEL app_name="mysql-cluster-sb-11"
LABEL app_version="0.0.1"
LABEL name="MySQL Exporter"

ARG VERSION_EXPORTER=0.15.0
ARG CPU_ARCH=amd64

ARG DOOWNLOAD_URL=https://github.com/prometheus/mysqld_exporter/releases/download/v${VERSION_EXPORTER}/mysqld_exporter-${VERSION_EXPORTER}.linux-${CPU_ARCH}.tar.gz

ARG BUILD_VERSION=0.0.1

RUN \
    set -eux; \
    apt-get update -y; \
    apt-get install -y --no-install-recommends \
        wget \
        ca-certificates \
        ; \
    apt-get clean; \
    apt-get -yf autoremove; \
    rm -rf /var/lib/apt/lists/*

RUN \
    set -eux; \
    groupadd --system mysqld_exporter; \
    useradd -s /sbin/nologin --system -g mysqld_exporter mysqld_exporter

WORKDIR /tmp
RUN wget ${DOOWNLOAD_URL} || true
# if the vendor sets a geo block for downloading, then copy file from the local machine 
COPY mysqld_exporter-${VERSION_EXPORTER}.linux-${CPU_ARCH}.tar.gz* .

RUN \
    set -eux; \
    tar xzvf mysqld_exporter-${VERSION_EXPORTER}.linux-amd64.tar.gz; \
    cd mysqld_exporter-${VERSION_EXPORTER}.linux-amd64; \
    mv mysqld_exporter /usr/local/bin; \
    chown mysqld_exporter:mysqld_exporter /usr/local/bin/mysqld_exporter; \
    mkdir -p /host; \
    chown -R mysqld_exporter:mysqld_exporter /host

USER mysqld_exporter
WORKDIR /opt/host

ARG MYSQLD_EXPORTER_PASSWORD
ENV MYSQLD_EXPORTER_PASSWORD=${MYSQLD_EXPORTER_PASSWORD}

EXPOSE 9104

ENTRYPOINT [ "/usr/bin/sh" ]
CMD [ "-c", "" ]

# ENTRYPOINT [ "/usr/local/bin/mysqld_exporter" ]
# CMD [ "" ]

# HEALTHCHECK --interval=60s --timeout=10s --start-period=10s CMD (curl --fail http://localhost:9094/-/healthy) || exit 1