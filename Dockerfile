FROM haproxy:2.9

USER root

RUN apt update && apt install -y postgresql-client
RUN mkdir -p /usr/local/pgsql/bin

USER haproxy
