REGISTRY_NAME ?= markbnj
SHELL = /bin/bash
IMAGE_NAME ?= alpine-jdk
TAG ?= 0.0.1
LOG_NAME ?= image-build.log

clean:
	if (docker images | grep -q $(REGISTRY_NAME)/$(IMAGE_NAME)); then docker rmi $(REGISTRY_NAME)/$(IMAGE_NAME):$(TAG); fi
	rm -f docker/image-build.log

build: clean
	docker build --tag=$(REGISTRY_NAME)/$(IMAGE_NAME):$(TAG) --rm=true --force-rm=true docker | tee docker/$(LOG_NAME)

