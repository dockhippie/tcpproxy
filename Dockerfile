FROM webhippie/alpine:latest@sha256:dc1e5004b67d73f49669d39843e75e8ea5573f40d1330c3bc7dbf73ee7e03421
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
