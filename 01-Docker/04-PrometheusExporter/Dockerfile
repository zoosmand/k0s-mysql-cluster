FROM debian:bookworm-slim

LABEL maintainer="zoosmand@gmail.com"
LABEL build_date="2024-12-01"
LABEL project="mysql-ndb-cluster"
LABEL app_name="mysql-cluster-prometheus-exporter"
LABEL app_version="0.0.3"
LABEL version="0.15.1"
LABEL name="MySQL NDB Cluster Prometheus Exporter"

ARG CPU_ARCH=amd64
ARG BUILD_VERSION=0.0.1

RUN \
    set -eux; \
    apt-get update -y; \
    apt-get install -y --no-install-recommends \
        ca-certificates \
        ; \
    apt-get clean; \
    apt-get -yf autoremove; \
    rm -rf /var/lib/apt/lists/*

RUN \
	set -eux; \
    groupadd --system --gid=902 mysqld_exporter; \
    useradd --system --shell /sbin/nologin --home-dir=/var/lib/mysqld_exporter --uid=902 --gid=mysqld_exporter mysqld_exporter

COPY --chmod=0755 docker-entrypoint.sh /usr/local/bin/
COPY ./src/exporter.tgz .

RUN \
    set -eux; \
    DST=./exporter; \
    mkdir $DST; \
    tar xzvf exporter.tgz -C $DST; \
    find $DST -name 'mysqld_exporter' | xargs -I '{}' mv '{}' /usr/local/bin; \
    chown mysqld_exporter:mysqld_exporter /usr/local/bin/mysqld_exporter; \
    chmod +x /usr/local/bin/mysqld_exporter; \
    rm -rf $DST

USER mysqld_exporter
WORKDIR /var/lib/mysqld_exporter

EXPOSE 9104
STOPSIGNAL SIGUSR1
# HEALTHCHECK --interval=60s --timeout=10s --start-period=10s CMD (curl --fail http://localhost:9094/-/healthy) || exit 1

# ENTRYPOINT ["tail"]

# CMD ["-f", "/dev/null"]
ENTRYPOINT ["docker-entrypoint.sh"]

CMD ["mysqld_exporter"]

