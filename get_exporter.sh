#!/bin/sh

# make sure the directory exists
cd /opt/rabbitmq/plugins

# Downloads prometheus_rabbitmq_exporter and its dependencies with curl

readonly base_url='https://github.com/deadtrickster/prometheus_rabbitmq_exporter/releases/download/v3.7.9.1'

apk add --update \
    curl \
    && rm -rf /var/cache/apk/*

get() {
  curl -LO "$base_url/$1"
}

get accept-0.3.5.ez
get prometheus-4.3.0.ez
get prometheus_cowboy-0.1.7.ez
get prometheus_httpd-2.1.10.ez
get prometheus_rabbitmq_exporter-3.7.9.1.ez

chown rabbitmq:rabbitmq *
