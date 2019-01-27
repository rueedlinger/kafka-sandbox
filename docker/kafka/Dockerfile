FROM alpine:3.7
###
# Install base packages
###
RUN apk add --no-cache wget bash

###
# Install Zulu JDK
####
ENV JDK_ARCH zulu11.29.3-ca-jdk11.0.2-linux_musl_x64
ENV JDK_FILE $JDK_ARCH.tar.gz
ENV JDK_URL https://cdn.azul.com/zulu/bin/$JDK_FILE

ENV JDK_DIR  /usr/lib/jvm

RUN mkdir $JDK_DIR
RUN wget -O $JDK_FILE $JDK_URL
RUN tar -xzvf $JDK_FILE -C $JDK_DIR

ENV JAVA_HOME $JDK_DIR/$JDK_ARCH
ENV PATH $JDK_DIR/$JDK_ARCH/bin:$PATH
RUN rm $JDK_FILE 

###
# Install Apache Kafka
####
ENV KAFKA_VERSION 2.1.0
ENV KAFKA_SCALA_VERSION 2.12
ENV KAFKA_FILE kafka_$KAFKA_SCALA_VERSION-$KAFKA_VERSION.tgz
ENV KAFKA_URL https://www-us.apache.org/dist/kafka/$KAFKA_VERSION/$KAFKA_FILE
ENV KAFKA_DIR /usr/local/kafka

RUN wget -O $KAFKA_FILE $KAFKA_URL 
RUN tar -zxf $KAFKA_FILE -C  /usr/local
RUN mv /usr/local/kafka_$KAFKA_SCALA_VERSION-$KAFKA_VERSION $KAFKA_DIR
RUN mkdir /tmp/kafka-logs

ADD server.properties $KAFKA_DIR/config
ADD keepalive.sh /usr/local/bin
RUN chmod 755 /usr/local/bin/keepalive.sh

ENV PATH $KAFKA_DIR/bin:$PATH
RUN rm $KAFKA_FILE

ENTRYPOINT [ "keepalive.sh", "kafka-server-start.sh", "/usr/local/kafka/config/server.properties"]