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

Check http://127.0.0.1:8080/

### Suported architectures
Image currently supports `linux/amd64` and `linux/arm64/v8`. If you are on an exotic architecture, you can build the image yourself for any platform supported by [Python image](https://hub.docker.com/_/python) 


## Helm chart
Chart is not published anywhere, but you can use the one in the repo:

```
cd /tmp
git clone https://github.com/horodchukanton/hello-world-service.git
helm install hello-world-service ./hello-world-service/charts/hello-world-service
```


## Publishing docker image
There's a Makefile for this.
If you want to publish a fork, just supply proper DOCKER_IMAGE_NAME.
```
make build DOCKER_IMAGE_NAME=<your-image-name-here>
make push DOCKER_IMAGE_NAME=<your-image-name-here>
```

There's also one target I use to publish multiarch image, which requires `buildx` to be configured (I'm on macOS, can't check other OSes at the moment)
```
docker run --privileged --rm tonistiigi/binfmt --install all
docker buildx create --use
make push-multiarch clean-buildx
```
