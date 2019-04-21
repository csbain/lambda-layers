# Same AL version as Lambda execution environment AMI
FROM amazonlinux:2017.03.1.20170812 as builder

COPY lib/* /python-doc-inspection-runtime/lib/
COPY bin/* /python-doc-inspection-runtime/bin/

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



# Lock to 2017.03 release (same as Lambda) and install compilation dependencies
#RUN sed -i 's;^releasever.*;releasever=2017.03;;' /etc/yum.conf && \
#    yum clean all && \
#    yum install -y autoconf \
#                bison \
#                gcc \
#                gcc-c++ \
#                make \
#                libcurl-devel \
#                libxml2-devel \
#                openssl-devel \
#                tar \
#                gzip \
#                zip \
#                unzip \
#                git \
#                openjpeg-devel \
#                libjpeg-devel \
#                fontconfig-devel \
#                libtiff-devel \
#                libpng-devel \
#                poppler \
#                poppler-utils \
#                ImageMagick \
#                ImageMagick-devel \
#                python36

# RUN yum install python36 python36-virtualenv python36-pip




RUN python36 -m venv --copies /mylambda && source /mylambda/bin/activate && \
    mkdir -p /python-doc-inspection-runtime/python && mkdir -p /python-doc-inspection-runtime-vendor/python && \
    pip3 install pypdf2 Pillow PyMuPDF pdfminer3 ghostscript camelot-py pikepdf pgmagick beautifulsoup4 python-pptx xlrd pypandoc


RUN ls -al /mylambda/lib/python3.6/site-packages

RUN cp -R --recursive /mylambda/lib/python3.6/site-packages/PyPDF2 /python-doc-inspection-runtime-vendor/python/PyPDF2 && \
    cp -R --recursive /mylambda/lib/python3.6/site-packages/PIL /python-doc-inspection-runtime-vendor/python/PIL && \
    cp -R --recursive /mylambda/lib/python3.6/site-packages/fitz /python-doc-inspection-runtime-vendor/python/fitz && \
    cp -R --recursive /mylambda/lib/python3.6/site-packages/pdfminer3 /python-doc-inspection-runtime-vendor/python/pdfminer && \
    cp -R --recursive /mylambda/lib/python3.6/site-packages/pdfminer3 /python-doc-inspection-runtime-vendor/python/pdfminer3 && \
    cp -R --recursive /mylambda/lib/python3.6/site-packages/ghostscript /python-doc-inspection-runtime-vendor/python/ghostscript && \
    cp -R --recursive /mylambda/lib/python3.6/site-packages/camelot /python-doc-inspection-runtime-vendor/python/camelot && \
    cp -R --recursive /mylambda/lib/python3.6/site-packages/pikepdf /python-doc-inspection-runtime-vendor/python/pikepdf && \
    cp -R --recursive /mylambda/lib/python3.6/site-packages/pgmagick /python-doc-inspection-runtime-vendor/python/pgmagick && \
    cp -R --recursive /mylambda/lib/python3.6/site-packages/bs4 /python-doc-inspection-runtime-vendor/python/bs4 && \
    cp -R --recursive /mylambda/lib/python3.6/site-packages/pptx /python-doc-inspection-runtime-vendor/python/pptx && \
    cp -R --recursive /mylambda/lib/python3.6/site-packages/xlrd /python-doc-inspection-runtime-vendor/python/xlrd && \
    cp -R --recursive /mylambda/lib/python3.6/site-packages/pypandoc /python-doc-inspection-runtime-vendor/python/pypandoc







# Prepare runtime libs
RUN mkdir -p /python-doc-inspection-runtime/lib && \
    cd /usr/lib64 && \
    cp --parents --recursive -H `repoquery -q -l --plugins openjpeg-devel libjpeg-devel fontconfig-devel libtiff-devel libpng-devel poppler poppler-utils ImageMagick ImageMagick-devel qpdf-libs qpdf | grep /usr/lib64 | sed -e "s/^\/usr\/lib64\///"` /python-doc-inspection-runtime/lib && ls -al /python-doc-inspection-runtime/lib 
    
# Prepare runtime binaries
RUN mkdir -p /python-doc-inspection-runtime/bin && \
    cd /usr/bin && \
    cp --parents --recursive -H `repoquery -q -l --plugins openjpeg-devel libjpeg-devel fontconfig-devel libtiff-devel libpng-devel poppler poppler-utils ImageMagick ImageMagick-devel qpdf-libs qpdf | grep /usr/bin | sed -e "s/^\/usr\/bin\///"` /python-doc-inspection-runtime/bin && ls -al /python-doc-inspection-runtime/bin
    


###### Create runtime image ######

FROM lambci/lambda:provided as runtime

# Layer 1
COPY --from=builder /python-doc-inspection-runtime /opt/

# Layer 2
COPY --from=builder /python-doc-inspection-runtime-vendor /opt/vendor
