# Base java image
FROM ubuntu:17.04

# Install required components

RUN apt-get update
RUN apt-get install -y git wget openjdk-8-jdk npm libfontconfig python python-pip

# Install maven-3
RUN wget http://www.eu.apache.org/dist/maven/maven-3/3.3.9/binaries/apache-maven-3.3.9-bin.tar.gz
RUN tar -zxf apache-maven-3.3.9-bin.tar.gz -C /usr/local/
RUN ln -s /usr/local/apache-maven-3.3.9/bin/mvn /usr/local/bin/mvn


ENV MAVEN_OPTS="-Xmx2g -XX:MaxPermSize=1024m"

# Interactiv command
CMD ["/bin/bash"]
