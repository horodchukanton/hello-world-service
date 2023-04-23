# hello-world-service

I was not able to find an application which provided arm64 docker images, so I created one.

Service has two simple endpoints and self-built documentation (thanks to FastAPI).
 - / 
 - /hello/{name}
 - /docs

## Docker
[Images are published on Docker Hub](https://hub.docker.com/repository/docker/horodchukanton/hello-world-service/general)

Run locally with:
```
docker run --rm -it -p8080:80 docker.io/horodchukanton/hello-world-service:latest
```

## Build
There's a Makefile for this. If you want to publish a fork, just supply proper DOCKER_IMAGE_NAME.
```
make build DOCKER_IMAGE_NAME=<your-image-name-here>
```
