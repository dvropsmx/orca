FROM ubuntu:bionic
MAINTAINER sig-platform@spinnaker.io
COPY ./orca-web/build/install/orca /opt/orca
RUN apt-get update && apt-get -y install openjdk-8-jre-headless wget
RUN adduser --disabled-login --system spinnaker
RUN mkdir -p /opt/orca/plugins && chown -R spinnaker:nogroup /opt/orca/plugins
USER spinnaker
CMD ["/opt/orca/bin/orca"]
