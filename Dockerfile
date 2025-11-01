FROM webhippie/alpine:latest@sha256:4211297043fa71f4cad1e67cdcd81f611aed2ad0250217e918e55a5bb7dc2d74
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
