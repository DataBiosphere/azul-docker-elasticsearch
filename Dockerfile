ARG azul_docker_elasticsearch_upstream_version

FROM --platform=${TARGETPLATFORM} docker.io/library/elasticsearch:${azul_docker_elasticsearch_upstream_version}

ARG azul_docker_elasticsearch_internal_version

RUN apt-get update && apt-get upgrade -y

# https://nvd.nist.gov/vuln/detail/CVE-2023-1370
RUN rm /usr/share/elasticsearch/modules/x-pack-security/nimbus-jose-jwt-9.23.jar

# https://nvd.nist.gov/vuln/detail/CVE-2023-44487
RUN rm /usr/share/elasticsearch/modules/{transport-netty4,x-pack-core}/netty-{buffer,codec,codec-http,common,handler,resolver,transport,transport-native-unix-common}-4.1.94.Final.jar
COPY netty-*.jar /usr/share/elasticsearch/modules/transport-netty4
COPY netty-*.jar /usr/share/elasticsearch/modules/x-pack-core
