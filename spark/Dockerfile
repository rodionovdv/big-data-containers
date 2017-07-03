FROM centos

ENV SPARK_PROFILE 2.1
ENV SPARK_VERSION 2.1.1
ENV FLINK_VERSION 1.1.5
ENV FLINK_HADOOP_PROFILE 27
ENV HADOOP_PROFILE 2.7
ENV HADOOP_VERSION 2.7.0
ENV SPARK_HOME /usr/local/spark/
ENV FLINK_HOME /usr/local/flink/
ENV SPARK_MASTER_PORT 7077
ENV SPARK_MASTER_WEBUI_PORT 8080
ENV SPARK_WORKER_PORT 8888
ENV SPARK_WORKER_WEBUI_PORT 8081

ENV JOB_MANAGER_RPC_ADDRESS 172.18.0.10
ENV FLINK_PORT 8085

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
RUN cd /usr/local && ln -s spark-$SPARK_VERSION-bin-hadoop$HADOOP_PROFILE spark

# install flink
RUN curl -s http://www.apache.org/dist/flink/flink-$FLINK_VERSION/flink-$FLINK_VERSION-bin-hadoop$FLINK_HADOOP_PROFILE-scala_2.11.tgz  | tar -xz -C /usr/local/
RUN cd /usr/local && ln -s flink-$FLINK_VERSION flink


# Create spark configs
RUN cp $SPARK_HOME/conf/spark-env.sh.template $SPARK_HOME/conf/spark-env.sh
RUN cp $SPARK_HOME/conf/spark-defaults.conf.template $SPARK_HOME/conf/spark-defaults.conf

# Configure flink
RUN sed -i -e "s/jobmanager.rpc.address: localhost/jobmanager.rpc.address: ${JOB_MANAGER_RPC_ADDRESS}/g" $FLINK_HOME/conf/flink-conf.yaml
RUN sed -i -e "s/jobmanager.web.port: 8081/jobmanager.web.port: ${FLINK_PORT}/g" $FLINK_HOME/conf/flink-conf.yaml

#spark
EXPOSE 8080 7077 7072 8081 8082

#flink
EXPOSE 8085

#supervisor
EXPOSE 9001
