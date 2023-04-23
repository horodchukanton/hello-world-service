DOCKER_IMAGE_NAME=horodchukanton/hello-world-service
DOCKER_BUILD_ARGS=--platform linux/arm64/v8,linux/amd64
DOCKER_BUILD_CONTEXT=.

.PHONY: build
build:
	docker buildx build $(DOCKER_BUILD_ARGS) --tag $(DOCKER_IMAGE_NAME) $(DOCKER_BUILD_CONTEXT)
