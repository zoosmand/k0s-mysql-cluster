FROM debian:bookworm-slim

LABEL maintainer="zoosmand@gmail.com"
LABEL build_date="2024-09-27"
LABEL project="mysql-ndb-cluster"
LABEL app_name="mysql-cluster-manager"
LABEL app_version="0.0.2"
LABEL name="MySQL NDB Cluster Server"

ARG CPU_ARCH=amd64
ARG BUILD_VERSION=0.0.2

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
        libclass-methodmaker-perl \
        libncurses6 \
        libncurses-dev \
		; \
    apt-get clean; \
    apt-get -yf autoremove; \
	rm -rf /var/lib/apt/lists/*
    
ENV LD_LIBRARY_PATH=/usr/local/lib:/usr/lib:/usr/lib/mysql/private:/usr/lib/mysql

COPY --chmod=0755 docker-entrypoint.sh /usr/local/bin/
COPY ./src/ /usr/

RUN \
	set -eux; \
    groupadd --system --gid=802 mysql; \
    useradd --system --shell /sbin/nologin --home-dir=/var/lib/mysql --uid=802 --gid=mysql mysql; \
    mkdir -p /var/run/mysqld; \
    chown mysql:mysql /var/run/mysqld

    
USER mysql
WORKDIR /var/lib/mysql

ENTRYPOINT ["docker-entrypoint.sh"]

EXPOSE 3306 33060
CMD ["mysqld"]
