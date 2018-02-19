#!/bin/bash
set -e
set -x

source /tmp/install/functions.sh

cd /tmp
curl -jklsSo loganalyzer.tar.gz "http://download.adiscon.com/loganalyzer/loganalyzer-${LOGANALYZER_VERSION}.tar.gz"
echo "${LOGANALYZER_MD5} *loganalyzer.tar.gz" >loganalyzer.md5
md5sum -c loganalyzer.md5
tar -xzf loganalyzer.tar.gz
rm -rf /var/www/html
mv loganalyzer-${PHPMYADMIN_VERSION}/src /var/www/html
rm -rf loganalyzer.tar.gz loganalyzer.md5 loganalyzer-${PHPMYADMIN_VERSION}
cleanup
