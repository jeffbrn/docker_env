#!/bin/bash

# build the compiler image
pushd ../docker
docker rmi cpp-dev-arm_64_img
docker build --platform linux/arm64 -f Dockerfile_cpp -t cpp-dev-arm_64_img .
popd

echo -e "\n### Compiler Details ###"
docker run -it --platform=linux/arm64 --rm cpp-dev-arm_64_img gcc -v

# compile the test programs
docker run -it -v./cpp:/build -w=/build --platform=linux/arm64 --rm cpp-dev-arm_64_img g++ --std=c++17 --static -o tst_arm main.cpp

echo -e "\n### Executable Details ###"
file cpp/tst_arm
