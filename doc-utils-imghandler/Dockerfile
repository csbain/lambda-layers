# Same AL version as Lambda execution environment AMI
FROM doc-utils-base:latest as builder

RUN cp -R --recursive /mylambda/lib/python3.6/site-packages/numpy /tmpbuild/python/numpy && \
    cp -R --recursive /mylambda/lib/python3.6/site-packages/cv2 /tmpbuild/python/cv2

###### Create runtime image ######

FROM lambci/lambda:provided as runtime

# Layer 2
COPY --from=builder /tmpbuild /opt/

