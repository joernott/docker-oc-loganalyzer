FROM registry.ott-consult.de/oc/apache-php:5.6
LABEL MAINTAINER="joern.ott@ott-consult.de"

ENV LOGANALYZER_VERSION="4.1.7" \
    LOGANALYZER_MD5="2480784f0aff051c281c814c3670717e" \
    GIT_COMMIT="" \
    IMAGE_HISTORY="x"

COPY src /

RUN /tmp/install/oc-loganalyzer.sh
