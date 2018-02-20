# Docker image: LogAnalyzer on CentOS 7 with Apache and PHP 5.6 from IUS

Running LogAnalyzer (http://loganalyzer.adiscon.com/downloads/). You should expose /var/log to
the container (e.g. from a running rsyslog container)

To provide a correct ssl certificate and key, mount them in
* /etc/pki/tls/certs/server.crt
* /etc/pki/tls/private/server.key
* /etc/pki/tls/certs/chain.crt (if you need a certificate chain)

Set the enviromnemt variable SERVERNAME to math thew server name to the certificate.

## Environment variables

| Variable   | Purpose                                                                                   |
|------------|-------------------------------------------------------------------------------------------|
| SERVERNAME | Specify the Servername for the VHost, this should match the SSL certificate               | 
| SERVERALIAS| Specify ServerAlias directive for the VHost, the entries should match the SSL certificate |

## Usage:
### Simple usage
```
docker run -d -p 443:443 \
    -v /data/loganalyzer/var/www/html/include/config.php:/var/www/html/include/config.php \
    -v /data/rsyslog/var/log:/var/log \
    registry.ott-consult.de/oc/loganalyzer:latest
```
### Full example
```
docker run -d -p 443:443  \
    -e LOCK=yes \
    -e SERVERNAME=logs.example.com \
    -e SERVERALIAS=example.com \
    -v /etc/pki/tls/certs/logs.example.com.crt:/etc/pki/tls/certs/server.crt \
    -v /etc/pki/tls/certs/chain.example.com.crt:/etc/pki/tls/certs/chain.crt \
    -v /etc/pki/tls/private/logs.example.com.key:/etc/pki/tls/private/server.key \
    -v /data/loganalyzer/var/www/html/include/config.php:/var/www/html/include/config.php \
    -v /data/rsyslog/var/log:/var/log \
    registry.ott-consult.de/oc/loganalyzer:latest
```
