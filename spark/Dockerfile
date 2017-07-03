FROM centos

ENV SPARK_PROFILE 2.1
ENV SPARK_VERSION 2.1.1
ENV FLINK_VERSION 1.3.1
ENV HADOOP_PROFILE 2.7
ENV HADOOP_VERSION 2.7.0
ENV SPARK_HOME /usr/local/spark/
ENV SPARK_MASTER_PORT 7077
ENV SPARK_MASTER_WEBUI_PORT 8080
ENV SPARK_WORKER_PORT 8888
ENV SPARK_WORKER_WEBUI_PORT 8081

# Update the image with the latest packages
RUN yum update -y; yum clean all
RUN yum install -y epel-release
RUN yum -y install dnf

# Install python components
RUN dnf install -y python-devel gcc python-setuptools python-pip

# Get utils
RUN dnf install -y wget tar curl svn cyrus-sasl-md5 libevent-devel
#libevent2-devel

# install jdk7
RUN dnf install -y java-1.7.0-openjdk-devel
ENV JAVA_HOME /usr/lib/jvm/java
ENV PATH $PATH:$JAVA_HOME/bin

# install supervisor
RUN pip install --upgrade pip
RUN pip install supervisor setuptools meld3==1.0.0

# clean
RUN dnf clean all

# install spark
RUN curl -s http://www.apache.org/dist/spark/spark-$SPARK_VERSION/spark-$SPARK_VERSION-bin-hadoop$HADOOP_PROFILE.tgz | tar -xz -C /usr/local/
RUN curl -s spark/spark-$SPARK_VERSION/spark-$SPARK_VERSION-bin-hadoop$HADOOP_PROFILE.tgz | tar -xz -C /usr/local/
RUN cd /usr/local && ln -s spark-$SPARK_VERSION-bin-hadoop$HADOOP_PROFILE spark


RUN cp $SPARK_HOME/conf/spark-env.sh.template $SPARK_HOME/conf/spark-env.sh
RUN cp $SPARK_HOME/conf/spark-defaults.conf.template $SPARK_HOME/conf/spark-defaults.conf

#spark
EXPOSE 8080 7077 7072 8081 8082

#mesos
EXPOSE 5050 5051

#supervisor
EXPOSE 9001
