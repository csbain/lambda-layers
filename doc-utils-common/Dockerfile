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
        pypdf2 \
        Pillow \
        PyMuPDF \
        pdfminer3 \
        ghostscript \
        camelot-py \
        pikepdf \
        beautifulsoup4 \
        python-pptx \
        xlrd \
        pypandoc \
        python-magic \
        neomodel \
        boto3 \
        botocore \
        aws-xray-sdk \
        requests \
        elasticsearch \
        requests-aws4auth


