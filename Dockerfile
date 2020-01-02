FROM rabbitmq:3.8.2-management-alpine
LABEL description="RabbitMQ Autocluster" \
      maintainer="SRT <desaadmin@srt.gob.ar>"

COPY rabbitmq.conf /etc/rabbitmq

COPY ./get_exporter.sh /get_exporter.sh
RUN chmod +x ./get_exporter.sh
RUN ./get_exporter.sh

RUN rabbitmq-plugins --offline enable rabbitmq_peer_discovery_consul rabbitmq_prometheus 
