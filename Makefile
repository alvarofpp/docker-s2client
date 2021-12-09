# Variables
DOCKER_IMAGE=alvarofpp/s2client
DOCKER_IMAGE_LINTER=alvarofpp/docker-image-linter:latest
ROOT=$(shell pwd)
DIR=image/
LINT_COMMIT_TARGET_BRANCH=origin/main
VERSION=4.10

# Commands
.PHONY: install-hooks
install-hooks:
	git config core.hooksPath .githooks

.PHONY: build
build: install-hooks
	@docker build --build-arg VERSION=${VERSION} ${DIR} -t alvarofpp/s2client:${VERSION}

.PHONY: build-all
build-all: install-hooks
	@./make_all.sh

.PHONY: build-no-cache
build-no-cache: install-hooks
	@docker build --build-arg VERSION=${VERSION} ${DIR} -t alvarofpp/s2client:${VERSION} --no-cache

.PHONY: push
push:
	@docker push ${DOCKER_IMAGE}:${VERSION}

.PHONY: push-all
push-all:
	@./push_all.sh

.PHONY: lint
lint:
	@docker pull ${DOCKER_IMAGE_LINTER}
	@docker run --rm -v ${ROOT}:/app ${DOCKER_IMAGE_LINTER} " \
		lint-commit ${LINT_COMMIT_TARGET_BRANCH} \
		&& lint-markdown \
		&& lint-dockerfile \
		&& lint-shell-script \
		&& lint-yaml"
