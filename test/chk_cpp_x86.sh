#!/bin/bash

# build the compiler image
pushd ../docker
docker rmi cpp-dev-x86_64_img
docker build --platform linux/amd64 -f Dockerfile_cpp -t cpp-dev-x86_64_img .
popd

echo -e "\n### Compiler Details ###"
docker run -it --platform=linux/amd64 --rm cpp-dev-x86_64_img gcc -v

# compile the test programs
docker run -it -v./cpp:/build -w=/build --platform=linux/amd64 --rm cpp-dev-x86_64_img g++ --std=c++17 -o tst_x86 main.cpp

echo -e "\n### Executable Details ###"
file cpp/tst_x86
