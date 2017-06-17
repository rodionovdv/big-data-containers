# Base java image
FROM centos:latest

# Install required components
RUN yum --enablerepo=extras install -y epel-release
RUN yum upgrade -y
RUN yum install -y git wget java-1.8.0-openjdk.x86_64 npm

# Install maven-3
RUN wget http://www.eu.apache.org/dist/maven/maven-3/3.3.9/binaries/apache-maven-3.3.9-bin.tar.gz
RUN tar -zxf apache-maven-3.3.9-bin.tar.gz -C /usr/local/
RUN rm apache-maven-3.3.9-bin.tar.gz
RUN ln -s /usr/local/apache-maven-3.3.9/bin/mvn /usr/local/bin/mvn


ENV MAVEN_OPTS="-Xmx2g -XX:MaxPermSize=1024m"

# Interactiv command
CMD ["/bin/bash"]
