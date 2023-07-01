ARG azul_docker_elasticsearch_upstream_version

FROM docker.elastic.co/elasticsearch/elasticsearch:${azul_docker_elasticsearch_upstream_version}

ARG azul_docker_elasticsearch_version

RUN \
  apt-get update \
  && apt-get upgrade -y
