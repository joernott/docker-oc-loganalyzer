FROM registry.ott-consult.de/oc/apache-php:5.6
LABEL MAINTAINER="joern.ott@ott-consult.de"

ENV LOGANALYZER_VERSION="4.1.6" \
    LOGANALYZER_MD5="b301450d023c9644806b959dba168f58" \
    GIT_COMMIT="" \
    IMAGE_HISTORY="x"

COPY src /

RUN /tmp/install/oc-loganalyzer.sh
