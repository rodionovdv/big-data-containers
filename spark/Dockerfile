FROM centos

ENV SPARK_PROFILE 2.1
ENV SPARK_VERSION 2.1.1
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
RUN cd /usr/local && ln -s spark-$SPARK_VERSION-bin-hadoop$HADOOP_PROFILE spark

# install mesos
RUN wget http://repos.mesosphere.com/el/7/x86_64/RPMS/mesos-1.3.0-2.0.2.el7.x86_64.rpm
RUN rpm -Uvh mesos-1.3.0-2.0.2.el7.x86_64.rpm


# update boot script
COPY ./spark/entrypoint.sh /etc/entrypoint.sh
#COPY ./spark/supervisord.conf /etc/supervisord.conf
RUN chown root.root /etc/entrypoint.sh
RUN chmod 700 /etc/entrypoint.sh


RUN cp $SPARK_HOME/conf/spark-env.sh.template $SPARK_HOME/conf/spark-env.sh
RUN echo "export MESOS_NATIVE_JAVA_LIBRARY=/usr/lib/libmesos.so" >> $SPARK_HOME/conf/spark-env.sh

RUN cp $SPARK_HOME/conf/spark-defaults.conf.template $SPARK_HOME/conf/spark-defaults.conf
RUN echo "spark.master mesos://spark:5050" >> $SPARK_HOME/conf/spark-defaults.conf
RUN echo "spark.mesos.executor.home /usr/local/spark" >> $SPARK_HOME/conf/spark-defaults.conf

#spark
EXPOSE 8080 7077 7072 8081 8082

#mesos
EXPOSE 5050 5051

#supervisor
EXPOSE 9001

#start
ENTRYPOINT ["/etc/entrypoint.sh"]
