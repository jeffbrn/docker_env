## Building Images

```
docker build --platform linux/amd64 -f Dockerfile_cpp -t cpp-dev-x86_64_img .
docker build --platform linux/arm64 -f Dockerfile_cpp -t cpp-dev-arm_64_img .
```

## Verify Images

```
docker run -it --platform=linux/amd64 --rm cpp-dev-x86_64_img gcc -v
docker run -it --platform=linux/arm64 --rm cpp-dev-arm_64_img gcc -v
```

## Test Build

```
cd ../../test/cpp
docker run -it -v.:/build -w=/build --platform=linux/amd64 --rm cpp-dev-x86_64_img g++ --std=c++17 -o tst_x86 main.cpp
docker run -it -v.:/build -w=/build --platform=linux/arm64 --rm cpp-dev-arm_64_img g++ --std=c++17 -o tst_arm main.cpp
```

## Check Build

For x86 build:

```
$ file tst_x86
tst_x86: ELF 64-bit LSB pie executable, x86-64, version 1 (SYSV), dynamically linked, interpreter /lib64/ld-linux-x86-64.so.2, BuildID[sha1]=???, for GNU/Linux 3.2.0, not stripped
```

For ARM builds:

```
$ file tst_arm
tst_arm: ELF 64-bit LSB pie executable, ARM aarch64, version 1 (SYSV), dynamically linked, interpreter /lib/ld-linux-aarch64.so.1, BuildID[sha1]=???, for GNU/Linux 3.7.0, not stripped
```
