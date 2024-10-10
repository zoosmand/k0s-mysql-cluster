FROM debian:bookworm-slim

LABEL maintainer="zoosmand@gmail.com"
LABEL build_date="2024-09-27"
LABEL project="mysql-ndb-cluster"
LABEL app_name="mysql-cluster-manager"
LABEL app_version="0.0.2"
LABEL version="8.4.2"
LABEL name="MySQL NDB Cluster Manager"

ARG CPU_ARCH=amd64
ARG BUILD_VERSION=0.0.2

RUN \
	set -eux; \
	apt-get update -y; \
	apt-get install -y --no-install-recommends \
        ca-certificates \
        libncurses6 \
        libncurses-dev \
		; \
    apt-get clean; \
    apt-get -yf autoremove; \
	rm -rf /var/lib/apt/lists/*

COPY --chmod=0755 docker-entrypoint.sh /usr/local/bin/
COPY ./src/ /usr/
    
RUN \
	set -eux; \
    groupadd --system --gid=802 mysql; \
    useradd --system --shell /sbin/nologin --home-dir=/var/lib/mysql --uid=802 --gid=mysql mysql; \
    mkdir -p /var/lib/mysql; \
    mkdir -p /var/lib/ndb-cluster; \
    chown mysql:mysql /var/lib/mysql; \
    chown mysql:mysql /var/lib/ndb-cluster


USER mysql
WORKDIR /var/lib/mysql

ENTRYPOINT ["docker-entrypoint.sh"]

EXPOSE 1186
CMD ["ndb_mgmd"]
