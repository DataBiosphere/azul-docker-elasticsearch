ARG azul_docker_elasticsearch_upstream_version

FROM --platform=${TARGETPLATFORM} docker.elastic.co/elasticsearch/elasticsearch:${azul_docker_elasticsearch_upstream_version}

ARG azul_docker_elasticsearch_internal_version

RUN apt-get update && apt-get upgrade -y

# https://nvd.nist.gov/vuln/detail/CVE-2021-40690
RUN rm /usr/share/elasticsearch/modules/x-pack-{identity-provider,security}/xmlsec-2.1.4.jar
