# Development containers

These files show how to run a container as the current user to make sure there aren't any file permission issues on volumes mounted in the container.

## Dockerfile

The file [Dockerfile_user](./Dockerfile_user) shows the structure of the dockerfile used.

The current user information should be passed as arguments to buildx as it contructs the development image.

**NOTE** The example file uses a C++ x86 development image but any image can be used

## Compose

The [example file](./docker-compose.yml) shows an example compose file that sets up the environment for the container to run in.

It will use a **.env** file in the same directory as the compose file to setup the user environment variables

## Run script

You will usually use a bash script to setup and run the container then exec into it like the following:

```
#!/bin/bash

function set_env() {
    if [ ! -f .env ]; then
        echo "USER=${USER}" > .env
        echo "USER_UID=`id -u`" >> .env
        echo "USER_GID=`id -g`" >> .env
    fi
}

pushd .devcontainer
set_env
docker-compose up -d
docker exec -ti -u ${USER} --workdir /workspace cpp-user-dev /bin/bash
popd
```

This script assumes that all the docker files are in the subdirectory **.devcontainer**
