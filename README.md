# Docker image: LogAnalyzer on CentOS 7 with Apache and PHP 5.6 from IUS

Running LogAnalyzer (http://loganalyzer.adiscon.com/downloads/). You should expose /var/log to
the container (e.g. from a running rsyslog container)

## Usage:
### Simple usage
```
docker run -d -p 80:80 \
    -v /data/loganalyzer/var/www/html/include/config.php:/var/www/html/include/config.php \
    -v /data/rsyslog/var/log:/var/log \
    registry.ott-consult.de/oc/loganalyzer:latest
```
