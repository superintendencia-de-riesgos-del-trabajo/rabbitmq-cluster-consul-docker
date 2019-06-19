FROM rabbitmq:3.7-management-alpine
LABEL description="RabbitMQ Autocluster" \
      maintainer="SRT <desaadmin@srt.gob.ar>"

COPY rabbitmq.conf /etc/rabbitmq

COPY ./get_exporter.sh /get_exporter.sh
RUN chmod +x ./get_exporter.sh
RUN ./get_exporter.sh

RUN rabbitmq-plugins --offline enable rabbitmq_peer_discovery_consul prometheus_rabbitmq_exporter
