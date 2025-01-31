#!/bin/bash

function set_env() {
    if [ ! -f .env ]; then
        echo "USER=${USER}" > .env
        echo "USER_UID=`id -u`" >> .env
        echo "USER_GID=`id -g`" >> .env
    fi
}

set_env
mkdir -p build
docker-compose up -d
docker exec -ti -u ${USER} --workdir /build toolchain-builder /bin/bash
