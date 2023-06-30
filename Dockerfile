FROM docker.elastic.co/elasticsearch/elasticsearch:7.17.10

ARG azul_docker_elasticsearch_version

RUN \
  apt-get update \
  && apt-get upgrade -y
