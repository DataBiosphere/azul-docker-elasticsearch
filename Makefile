.PHONY: all
all: build push

es_version=7.17.10
image := azul-elasticsearch:$(es_version)

.PHONY: build
build:
	docker buildx build \
	       --platform linux/amd64,linux/arm64 \
	       --tag $(image) .

.PHONY: push
push:
	docker push $(image)
