# docker_env

## Authenticating with Container Registry

Assuming you have the github personal access token in the environment variable **GH_TOK**
and that your username is **jeffbrn**

```
echo $GH_TOK | docker login ghcr.io -u jeffbrn --password-stdin
```

## Building dev_cpp_x86

```
docker build -f Dockerfile_cpp_x86 -t dev_cpp_x86_img .
docker tag dev_cpp_x86_img ghcr.io/jeffbrn/docker_env/dev_cpp_x86_img:latest
docker push ghcr.io/jeffbrn/docker_env/dev_cpp_x86_img:latest
```

## Local build containers

For setting up a build system on a local machine see [here](./user/README.md)

## Running the image

docker run --rm -it cpp-dev-x86_img /bin/bash
