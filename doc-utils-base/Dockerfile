# Same AL version as Lambda execution environment AMI
FROM amazonlinux:2017.03.1.20170812 as builder

COPY lib /tmpbuild/lib/
COPY bin /tmpbuild/bin/
RUN chmod -R +x /tmpbuild/bin/*

RUN yum update -y && yum install -y \
    gcc48 \
    gcc48-c++ \
    python36 \
    python36-devel \
    boost-devel \
    GraphicsMagick-c++-devel \
    atlas-devel \
    atlas-sse3-devel \
    blas-devel \
    bison \
    lapack-devel \
    zlib-devel \
    libpng-devel \
    libjpeg-turbo-devel \
    zip \
    libcurl-devel \
    libxml2-devel \
    openssl-devel \
    freetype-devel \
    findutils \
    libtiff \
    libtiff-devel \
    tar \
    gzip \
    zip \
    bc \
    unzip \
    git \
    openjpeg-devel \
    libjpeg-devel \
    fontconfig-devel \
    libtiff-devel \
    libpng-devel \
    poppler \
    poppler-utils \
    ImageMagick \
    ImageMagick-devel \
    qpdf-libs \
    qpdf


RUN python36 -m venv --copies /mylambda && source /mylambda/bin/activate && \
    mkdir -p /tmpbuild/python && \
    pip3 install \
        Pillow \
        PyMuPDF \
        pdfminer3 \
        ghostscript \
        camelot-py \
        pikepdf \
        beautifulsoup4 \
        python-pptx \
        opencv-python==4.1.0.25 \
        numpy==1.16.3 \
        environs==4.1.0 \
        xlrd \
        pypandoc \
        python-magic \
        neomodel==3.3.1 \
        boto3==1.9.135 \
        botocore==1.12.135 \
        aws-xray-sdk==2.4.2 \
        requests \
        elasticsearch \
        requests-aws4auth



#
#RUN cp -R --recursive /mylambda/lib/python3.6/site-packages/numpy /tmpbuild/python/PyPDF2 && \
#    cp -R --recursive /mylambda/lib/python3.6/site-packages/PIL /tmpbuild/python/PIL && \
#    cp -R --recursive /mylambda/lib/python3.6/site-packages/fitz /tmpbuild/python/fitz && \
#    cp -R --recursive /mylambda/lib/python3.6/site-packages/pdfminer3 /tmpbuild/python/pdfminer3 && \
#    cp -R --recursive /mylambda/lib/python3.6/site-packages/ghostscript /tmpbuild/python/ghostscript && \
#    cp -R --recursive /mylambda/lib/python3.6/site-packages/camelot /tmpbuild/python/camelot && \
#    cp -R --recursive /mylambda/lib/python3.6/site-packages/pikepdf /tmpbuild/python/pikepdf && \
#
#    cp -R --recursive /mylambda/lib/python3.6/site-packages/bs4 /tmpbuild/python/bs4 && \
#    cp -R --recursive /mylambda/lib/python3.6/site-packages/pptx /tmpbuild/python/pptx && \
#    cp -R --recursive /mylambda/lib/python3.6/site-packages/xlrd /tmpbuild/python/xlrd && \
#    cp -R --recursive /mylambda/lib/python3.6/site-packages/pypandoc /tmpbuild/python/pypandoc
#
#
#
#
#RUN mkdir -p /tmpbuild/python && \
#    cp -R --recursive /mylambda/lib/python3.6/site-packages/botocore /tmpbuild/python/botocore && \
#    cp -R --recursive /mylambda/lib/python3.6/site-packages/aws-xray-sdk /tmpbuild/python/aws-xray-sdk && \
#    cp -R --recursive /mylambda/lib/python3.6/site-packages/environs /tmpbuild/python/environs && \
#    cp -R --recursive /mylambda/lib/python3.6/site-packages/neomodel /tmpbuild/python/neomodel
#
#
####### Create runtime image ######
#
#FROM lambci/lambda:provided as runtime
#
## Layer 1
#COPY --from=builder /tmpbuild /opt/

