#!/bin/sh
set -e
export PATH=/sbin:/bin:/usr/sbin:/usr/bin:/usr/local/sbin:/usr/local/bin:$PWD:PATH
get https://github.com/awslabs/aws-lambda-container-image-converter/releases/download/0.1.0/linux-amd64-img2lambda
chmod +x linux-amd64-img2lambda
cd doc-utils-binaries && docker build -t doc-utils-binaries . && cd ..
cd doc-utils-pythonlibs && docker build -t doc-utils-pythonlibs . && cd ..
linux-amd64-img2lambda -n doc-utils-binaries -i doc-utils-binaries:latest -r us-west-2 --cr python3.6 --cr python3.7 --desc "Add on layer for python 3.6 and 3.7 to give extra binaries relevant for document inspection/extraction Part 1 of 2"
linux-amd64-img2lambda -n doc-utils-pythonlibs -i doc-utils-pythonlibs:latest -r us-west-2 --cr python3.6 --cr python3.7 --desc "Add on layer for python 3.6 and 3.7 to give pip libs relevant for document inspection/extraction Part 2 of 2"
