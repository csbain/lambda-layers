#!/bin/bash

cd python-doc-inspection && docker build -t python-doc-inspection && cd ..

./linux-amd64-img2lambda -n python-doc-inspection -i python-doc-inspection:latest -r us-west-2 --cr python3.6 --cr python3.7 --desc "Add on layer for python 3.6 and 3.7 to give extra binaries and pip libs relevant for document inspection/extraction"