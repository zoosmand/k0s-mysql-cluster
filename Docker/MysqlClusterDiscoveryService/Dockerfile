FROM alpine:3.18

LABEL maintainer="zoosmand@gmail.com"
LABEL build_date="2024-01-06"
LABEL app_name="mysql-cluster-sb-11"
LABEL app_version="0.0.1"
LABEL name="MySQL Cluster Discovery Service"

ARG APP=app.sh

ARG BUILD_VERSION=0.0.1

RUN \
	set -eux; \
	apk add --no-cache \
		netcat-openbsd \
        dnsmasq

COPY --chmod=755 ${APP} .

EXPOSE 53 5333

ENTRYPOINT [ "/app.sh" ]
CMD [ "" ]
