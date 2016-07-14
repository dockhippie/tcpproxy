# TCPProxy

These are docker images for an [HAProxy TCPProxy](http://www.haproxy.org/) running on an
[Alpine Linux container](https://registry.hub.docker.com/u/webhippie/alpine/).


## Versions

* [latest](https://github.com/dockhippie/tcpproxy/tree/master)
  available as ```webhippie/tcpproxy:latest``` at
  [Docker Hub](https://registry.hub.docker.com/u/webhippie/tcpproxy/)


## Volumes

* None


## Ports

* 9000


## Available environment variables

```bash
ENV DISCOVERY_TYPE etcd
ENV DISCOVERY_HOST http://etcd
ENV DISCOVERY_PORT 4001
ENV DISCOVERY_INTERVAL 30
ENV DISCOVERY_PREFIX /tcpproxy
ENV DISCOVERY_OPTS # Optional, any allowed confd param
ENV DISCOVERY_CLIENT_KEY # Optional, as string or filename
ENV DISCOVERY_CLIENT_CERT # Optional, as string or filename
ENV DISCOVERY_CLIENT_CA # Optional, as string or filename
ENV TCPPROXY_USERNAME webhippie
ENV TCPPROXY_PASSWORD webhippie
ENV TCPPROXY_OPTS
ENV TCPPROXY_TOTAL_MAXIMUM
ENV TCPPROXY_PROXY_MAXIMUM
ENV TCPPROXY_MEMORY_LIMIT
ENV TCPPROXY_PEER_NAME
```


## Inherited environment variables

```bash
ENV LOGSTASH_ENABLED false
ENV LOGSTASH_HOST logstash
ENV LOGSTASH_PORT 5043
ENV LOGSTASH_CA /etc/ssl/logstash/certs/ca.pem # As string or filename
ENV LOGSTASH_CERT /etc/ssl/logstash/certs/cert.pem # As string or filename
ENV LOGSTASH_KEY /etc/ssl/logstash/private/cert.pem # As string or filename
ENV LOGSTASH_TIMEOUT 15
ENV LOGSTASH_OPTS
```


### Configure with etcd

If you export ```DISCOVERY_TYPE``` with the value ```etcd``` you can use etcd
for configuration:

```
etcdctl set /tcpproxy/app/example/listen ':25565'
etcdctl set /tcpproxy/app/example/servers/srv1 '172.126.1.1:25565'
etcdctl set /tcpproxy/app/example/servers/srv2 '172.126.1.2:25565'
etcdctl set /tcpproxy/app/example/servers/srv3 '172.126.1.3:25565'
etcdctl set /tcpproxy/app/example/options/1 'option tcplog'
```


### Configure with consul

If you export ```DISCOVERY_TYPE``` with the value ```consul``` you can use
consul for configuration:

```
curl -X PUT -d ':25565' http://localhost:8500/v1/kv/tcpproxy/app/example/listen
curl -X PUT -d '172.126.1.1:25565' http://localhost:8500/v1/kv/tcpproxy/app/example/servers/srv1 
curl -X PUT -d '172.126.1.2:25565' http://localhost:8500/v1/kv/tcpproxy/app/example/servers/srv2 
curl -X PUT -d '172.126.1.3:25565' http://localhost:8500/v1/kv/tcpproxy/app/example/servers/srv3 
curl -X PUT -d 'option tcplog' http://localhost:8500/v1/kv/tcpproxy/app/example/options/1 
```


### Configure with environment

If you export ```DISCOVERY_TYPE``` with the value ```env``` you can use
environment for configuration:

```
export TCPPROXY_APP_EXAMPLE_LISTEN=":25565"
export TCPPROXY_APP_EXAMPLE_SERVERS_SRV1="10.2.35.22:25565"
export TCPPROXY_APP_EXAMPLE_SERVERS_SRV2="10.2.35.23:25565"
export TCPPROXY_APP_EXAMPLE_SERVERS_SRV3="10.2.35.24:25565"
export TCPPROXY_APP_EXAMPLE_OPTIONS_1="option tcplog"
```


## Contributing

Fork -> Patch -> Push -> Pull Request


## Authors

* [Thomas Boerger](https://github.com/tboerger)


## License

MIT


## Copyright

```
Copyright (c) 2015-2016 Thomas Boerger <http://www.webhippie.de>
```
