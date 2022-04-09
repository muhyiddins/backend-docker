#! /bin/bash

docker stop backend-docker && docker container rm  backend-docker && docker image rm  muhyiddin/backend-docker && docker run -d --restart unless-stopped -p 4011:3301 --name backend-docker muhyiddin/backend-docker