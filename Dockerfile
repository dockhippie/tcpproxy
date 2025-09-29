FROM webhippie/alpine:latest@sha256:e2c496756f621cb9f09f66c2bf21e6553431f8a6fe05dd428db4a8eeedce3dcd
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
