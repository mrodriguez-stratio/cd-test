# FROM python:alpine3.17
# MAINTAINER CD "cd@stratio.com"

# ARG VERSION
# COPY target/cd-test-${VERSION}.jar /

# CMD ["/usr/bin/tail", "-f", "/dev/null"]

FROM maven:3.8.7-eclipse-temurin-11

ARG UNAME=jenkins
ARG UID=1000
ARG GID=1000

RUN groupadd -g $GID $UNAME
RUN useradd -m -u $UID -g $GID -s /bin/bash $UNAME

RUN chown -R $UNAME:$UNAME /home/$UNAME

RUN apt-get update && apt-get install -y fakeroot rpm

ENTRYPOINT ["/usr/local/bin/mvn-entrypoint.sh"]
CMD ["mvn"]
