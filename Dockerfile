ARG azul_docker_elasticsearch_upstream_version

FROM --platform=${TARGETPLATFORM} docker.elastic.co/elasticsearch/elasticsearch:${azul_docker_elasticsearch_upstream_version}

ARG azul_docker_elasticsearch_internal_version

RUN apt-get update && apt-get upgrade -y
