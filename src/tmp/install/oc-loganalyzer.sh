#!/bin/bash
set -e
set -x

source /tmp/install/functions.sh

function configure_apache() {
    sed -e 's/^Listen/#Listen/' -e 's/^\s*CustomLog/    #CustomLog/' -i /etc/httpd/conf/httpd.conf
    rm /etc/httpd/conf.d/ssl.conf 
    cp /etc/pki/tls/certs/localhost.crt /etc/pki/tls/certs/server.crt
    cp /etc/pki/tls/private/localhost.key /etc/pki/tls/private/server.key

}

cd /tmp
curl -jklsSo loganalyzer.tar.gz "http://download.adiscon.com/loganalyzer/loganalyzer-${LOGANALYZER_VERSION}.tar.gz"
echo "${LOGANALYZER_MD5} *loganalyzer.tar.gz" >loganalyzer.md5
md5sum -c loganalyzer.md5
tar -xzf loganalyzer.tar.gz
rm -rf /var/www/html
mv loganalyzer-${LOGANALYZER_VERSION}/src /var/www/html
rm -rf loganalyzer.tar.gz loganalyzer.md5 loganalyzer-${LOGANALYZER_VERSION}
# Until https://github.com/rsyslog/loganalyzer/issues/21 is resolved
sed -i /var/www/html/include/functions_frontendhelpers.php \
    -e "s|content\['CURRENTURL'\] =.*|content['CURRENTURL'] = ltrim(\$_SERVER['PHP_SELF'],'/');|"
configure_apache
cleanup
