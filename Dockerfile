FROM registry.access.redhat.com/ubi8/ubi
LABEL name='deck'
LABEL maintainer='info@opsmx.io'
LABEL release=2
LABEL version='1.18.5'
LABEL summary='Red Hat certified Open Enterprise Spinnaker ubi8 container image for deck'
LABEL description='Certified Open Enterprise Spinnaker is an Enterprise grade, Red Hat certified and OpsMx supported release of the popular and critically acclaimed Continuous Delivery platform Spinnaker'
LABEL vendor='OpsMx'
COPY orca-web/build/install/orca /opt/orca
RUN yum -y update-minimal --security --sec-severity=Important --sec-severity=Critical --setopt=tsflags=nodocs
RUN yum -y install java-11-openjdk-headless.x86_64 wget vim
RUN useradd spinnaker

RUN mkdir -p /opt/orca/plugins && chown -R spinnaker:nogroup /opt/orca/plugins
USER spinnaker
CMD ["/opt/orca/bin/orca"]
