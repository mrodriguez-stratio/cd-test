FROM ubuntu:lunar
MAINTAINER CD "cd@stratio.com"

ARG VERSION
COPY target/cd-test-${VERSION}.jar /

CMD ["/usr/bin/tail", "-f", "/dev/null"]
