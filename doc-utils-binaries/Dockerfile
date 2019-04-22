# Same AL version as Lambda execution environment AMI
FROM amazonlinux:2017.03.1.20170812 as builder

COPY lib/* /tmpbuild/lib/
COPY bin/* /tmpbuild/bin/
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



# Prepare runtime libs
RUN mkdir -p /tmpbuild/lib && \
    cd /usr/lib64 && \
    cp --parents --recursive -H `repoquery -q -l --plugins openjpeg-devel libjpeg-devel fontconfig-devel libtiff-devel libpng-devel poppler poppler-utils ImageMagick ImageMagick-devel qpdf-libs qpdf | grep /usr/lib64 | sed -e "s/^\/usr\/lib64\///"` /tmpbuild/lib && ls -al /tmpbuild/lib
    
# Prepare runtime binaries
RUN mkdir -p /tmpbuild/bin && \
    cd /usr/bin && \
    cp --parents --recursive -H `repoquery -q -l --plugins openjpeg-devel libjpeg-devel fontconfig-devel libtiff-devel libpng-devel poppler poppler-utils ImageMagick ImageMagick-devel qpdf-libs qpdf | grep /usr/bin | sed -e "s/^\/usr\/bin\///"` /tmpbuild/bin && ls -al /tmpbuild/bin
    


###### Create runtime image ######

FROM lambci/lambda:provided as runtime

# Layer 1
COPY --from=builder /tmpbuild /opt/

