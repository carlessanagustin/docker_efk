# Docker compose EFK stack: Elasticsearch, Fluentd & Kibana

A basic docker-compose.yml file that will setup Elasticsearch, Fluentd & Kibana. It also enables testing the configuration via Apache HTTPD container.

> FROM: https://github.com/kzk/docker-compose-efk

## Requirements

* Docker
* Docker Compose
* Make

## Usage

1. Start EFK: `make up`
2. Start test HTTPD: `make up_example`
3. Generate HTTPD logs:`make test`
4. Check Kibana: http://localhost:5601
5. Stop test HTTPD: `make down_example`
6. Stop EFK: `make down`

> Fluentd configurations: https://docs.fluentd.org/v0.12/articles/in_forward

## Troubleshooting: Elasticsearch ERROR messages

* ERROR: max file descriptors [4096] for elasticsearch process is too low, increase to at least [65536]

```shell
ulimit -n 65536
```

or set `nofile` to `65536` in `/etc/security/limits.conf`

* ERROR: max number of threads [1024] for user [xxx] is too low, increase to at least [2048]

```shell
ulimit -u 2048
```

Or set the `nproc` value to `2048` or above in `/etc/security/limits.conf` before starting elasticsearch.

* ERROR: max virtual memory areas vm.max_map_count [65530] is too low, increase to at least [262144]

set `vm.max_map_count=262144` in `/etc/sysctl.conf` then do `sysctl -p`

> FROM: https://stackoverflow.com/questions/42300463/elasticsearch-5-x-bootstrap-checks-failing

## Start Fluentd UI

* Login to running docker container: `make enter_fluentd`
* Run `fluentd-ui start`
* Open http://localhost:9292/
* The default account is username=“admin” and password=“changeme”

> FROM: https://docs.fluentd.org/v0.12/articles/fluentd-ui
