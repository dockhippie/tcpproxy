FROM webhippie/alpine:latest@sha256:35bfd4356d7b17c259d7962bac57c7d57c917fa91106df34e96b3d33c5d15102
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
