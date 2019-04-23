# lambda-layers
This project stemmed from the need to use image proecssing binaries within an AWS lambda environment.
The project consists of an automated build (circleci - yaml found within the .circleci folder) and a build script.

Currently the build script produces two layers - one with the image handling binaries, and one with image hanndling python libs.
Both the doc-utils-binaries and doc-utils-pythonlibs dockerimages are built off the doc-utils-common base image, which in turn is based off the amazonlinux:2017.03.1.20170812 docker image (same base used for lambdas).

in addition to installed binaries and python libs, the base dockerfile also copies over pre built selected binaries and libs deemed useful - and not available through yum.

As this is a work in progress - the commit history is quite erratic to test the circleci build functionallity (this will be squashed in time).

Currently the circleci build process can only build the binary layer due to size constraints of the python lib layer (when uploaded to aws) - and will most probably be removed as they can be installed through SAM.


The library used to create these layers can be found here: https://github.com/awslabs/aws-lambda-container-image-converter
