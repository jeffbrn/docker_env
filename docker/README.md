# Docker Development Images

## C++ Development

**Dockerfile_cpp** produces an image for building, devleoping and debugging C++ code on x86 and ARM CPUs.

### Building Images

For building an image for an x86 toolchain:

```
docker build --platform linux/amd64 -f Dockerfile_cpp -t cpp-dev-x86_64_img .
```

For building an image for an ARM toolchain:

```
docker build --platform linux/arm64 -f Dockerfile_cpp -t cpp-dev-arm_64_img .
```

### Verify Images

You can get gcc to report toolchain status for each of the images.

```
docker run -it --platform=linux/amd64 --rm cpp-dev-x86_64_img gcc -v
docker run -it --platform=linux/arm64 --rm cpp-dev-arm_64_img gcc -v
```

### Testing the Images

See [here](../test/README.md)
