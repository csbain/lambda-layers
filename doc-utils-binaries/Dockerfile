# Same AL version as Lambda execution environment AMI
FROM doc-utils-common:latest as builder


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

