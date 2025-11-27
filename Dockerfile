FROM webhippie/alpine:latest@sha256:99d99e5b29c450d387425c03ee3e43361a25db01797f3b4c68035da42ac84e1c
MAINTAINER Thomas Boerger <thomas@webhippie.de>

# VOLUME []

EXPOSE 9000

WORKDIR /root
CMD ["/bin/s6-svscan", "/etc/s6"]

RUN apk update && \
  apk add \
    haproxy \
    curl \
    confd@testing  \
    etcd@testing && \
  rm -rf \
    /var/cache/apk/*

ADD rootfs /
