# Same AL version as Lambda execution environment AMI
FROM doc-utils-common:latest as builder

RUN cp -R --recursive /mylambda/lib/python3.6/site-packages/PyPDF2 /tmpbuild/python/PyPDF2 && \
    cp -R --recursive /mylambda/lib/python3.6/site-packages/PIL /tmpbuild/python/PIL && \
    cp -R --recursive /mylambda/lib/python3.6/site-packages/fitz /tmpbuild/python/fitz && \
    cp -R --recursive /mylambda/lib/python3.6/site-packages/pdfminer3 /tmpbuild/python/pdfminer && \
    cp -R --recursive /mylambda/lib/python3.6/site-packages/pdfminer3 /tmpbuild/python/pdfminer3 && \
    cp -R --recursive /mylambda/lib/python3.6/site-packages/ghostscript /tmpbuild/python/ghostscript && \
    cp -R --recursive /mylambda/lib/python3.6/site-packages/camelot /tmpbuild/python/camelot && \
    cp -R --recursive /mylambda/lib/python3.6/site-packages/pikepdf /tmpbuild/python/pikepdf && \
    cp -R --recursive /mylambda/lib/python3.6/site-packages/pgmagick /tmpbuild/python/pgmagick && \
    cp -R --recursive /mylambda/lib/python3.6/site-packages/bs4 /tmpbuild/python/bs4 && \
    cp -R --recursive /mylambda/lib/python3.6/site-packages/pptx /tmpbuild/python/pptx && \
    cp -R --recursive /mylambda/lib/python3.6/site-packages/xlrd /tmpbuild/python/xlrd && \
    cp -R --recursive /mylambda/lib/python3.6/site-packages/pypandoc /tmpbuild/python/pypandoc




###### Create runtime image ######

FROM lambci/lambda:provided as runtime

# Layer 2
COPY --from=builder /tmpbuild /opt/
