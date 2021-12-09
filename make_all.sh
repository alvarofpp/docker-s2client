#!/bin/bash

VERSIONS=(
  3.16.1
  3.17
  4.0.2
  4.1.2
  4.6
  4.6.1
  4.6.2
  4.7
  4.7.1
  4.8.2
  4.8.3
  4.8.4
  4.8.6
  4.9.0
  4.9.1
  4.9.2
  4.9.3
  4.10
)

for VERSION in "${VERSIONS[@]}"; do
  docker build --build-arg VERSION="${VERSION}" image/. -t alvarofpp/s2client:"${VERSION}"
done

docker build --build-arg VERSION="${VERSION}" image/. -t alvarofpp/s2client:latest
