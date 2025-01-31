## Building Images

```
docker build --platform linux/amd64 -f Dockerfile_cpp -t cpp-dev-x86_64-img .
docker build --platform linux/arm64 -f Dockerfile_cpp -t cpp-dev-arm_64-img .
```

## Verify Images

```
docker run -it --platform=linux/amd64 --rm cpp-dev-x86_64-img gcc -v
docker run -it --platform=linux/arm64 --rm cpp-dev-arm_64-img gcc -v
```
