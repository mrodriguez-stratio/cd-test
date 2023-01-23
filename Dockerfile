FROM python:alpine3.17
MAINTAINER CD "cd@stratio.com"

ARG VERSION
COPY target/cd-test-${VERSION}.jar /

CMD ["/usr/bin/tail", "-f", "/dev/null"]
