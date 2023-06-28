FROM docker.elastic.co/elasticsearch/elasticsearch:7.17.10

RUN \
  apt-get update \
  && apt-get upgrade -y
