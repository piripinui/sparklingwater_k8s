FROM ubuntu:latest
FROM openjdk:8
WORKDIR /app
COPY . /app
WORKDIR /app/src
RUN tar -xvzf spark-2.4.0-bin-hadoop2.7.tgz
RUN unzip sparkling-water-2.4.2.zip

# Overwrite default command for starting the Spark cluster.
COPY src/launch-spark-cloud.sh /app/src/sparkling-water-2.4.2/bin
COPY src/launch-master.sh /app/src/sparkling-water-2.4.2/bin
COPY src/spark-daemon.sh /app/src/spark-2.4.0-bin-hadoop2.7/sbin

WORKDIR /app

ENV PATH $PATH:$JAVA_HOME/bin
ENV PATH $PATH:$JAVA_HOME/lib
ENV SPARK_HOME /app/src/spark-2.4.0-bin-hadoop2.7
ENV PATH $PATH:$SPARK_HOME/bin
ENV SPARKLING_WATER_HOME /app/src/sparkling-water-2.4.2

# Setup environment
ENV SPARK_HOME /app/src/spark-2.4.0-bin-hadoop2.7
ENV SPARKLING_WATER_HOME /app/src/sparkling-water-2.4.2
ENV SPARK_MASTER_IP '127.0.0.1'
ENV MASTER "local-cluster[2,1,1024]"

WORKDIR ${SPARKLING_WATER_HOME}

CMD bin/launch-master.sh

EXPOSE 54321
EXPOSE 54327
EXPOSE 54325
EXPOSE 4040
EXPOSE 7077
EXPOSE 8080
