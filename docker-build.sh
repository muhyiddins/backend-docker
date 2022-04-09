#! /bin/bash

docker buildx build --platform=linux/amd64 --push -t muhyiddin/backend-docker .
