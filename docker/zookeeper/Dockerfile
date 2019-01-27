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
# Install Zookeeper
####

ENV ZOOKEPER_VERSION 3.4.13
ENV ZOOKEPER_FILE zookeeper-$ZOOKEPER_VERSION.tar.gz
ENV ZOOKEEPER_URL https://www-us.apache.org/dist/zookeeper/zookeeper-$ZOOKEPER_VERSION/$ZOOKEPER_FILE
ENV ZOOKEEPER_DIR /usr/local/zookeeper

RUN mkdir /var/lib/zookeeper
RUN wget -O $ZOOKEPER_FILE $ZOOKEEPER_URL
RUN tar -zxf $ZOOKEPER_FILE -C /usr/local
RUN mv /usr/local/zookeeper-$ZOOKEPER_VERSION $ZOOKEEPER_DIR

ENV PATH $ZOOKEEPER_DIR/bin:$PATH
ADD zoo.cfg $ZOOKEEPER_DIR/conf
RUN rm $ZOOKEPER_FILE 

ENTRYPOINT [ "zkServer.sh", "start-foreground" ]