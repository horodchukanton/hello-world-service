DOCKER_IMAGE_NAME=horodchukanton/hello-world-service
DOCKER_BUILD_ARCHS=linux/arm64/v8,linux/amd64
DOCKER_BUILD_CONTEXT=.

.PHONY: build

build:
	docker build --tag "$(DOCKER_IMAGE_NAME)" $(DOCKER_BUILD_CONTEXT)

push:
	docker push "$(DOCKER_IMAGE_NAME)"

push-multiarch:
	# https://github.com/docker/buildx#building-multi-platform-images
	docker run --privileged --rm tonistiigi/binfmt --install all
	docker buildx create --use
	docker buildx build --push --platform "$(DOCKER_BUILD_ARCHS)" --tag "$(DOCKER_IMAGE_NAME)" "$(DOCKER_BUILD_CONTEXT)"

clean-buildx:
	docker buildx rm
