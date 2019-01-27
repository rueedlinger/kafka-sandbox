# kafka-sandbox
__kafka-sandbox__ are Docker images and code examples which you can use to play around with Apache Kafka.

## Firs Steps...

### Build the Docker Images
This will build the Docker images for Apache Kafka and Zookeeper with default settings. To change the settings just adapt the files [docker/kafka/server.properties](server.properties) for Kafka and [docker/zookeeper/zoo.cfg](zoo.cfg) for Zookeeper before you build the Docker images.


```bash
docker-compose up
```

### Start Kafka and Zookeeper
With _docker-compose_ you can start up Apache Kafka and Zookeeper.

```bash
docker-compose up
```

### Test the Apache Kafka and Zookeeper
To test the connection to Apache Kafka you should install the Apache Kafka on your local machine, so that you have access to the Kafka command line tools (kafka-topics, kafka-console-producer, kafka-console-consumer, etc.). This means that you should install Apache Kafka on your local machine as well.

- How to install Apache Kafka, see https://kafka.apache.org/downloads 
- For Mac you could use Hombrew, see [brew](https://brewformulas.org/kafka)

For more details have a look at the [Apache Kafka Quickstart](https://kafka.apache.org/quickstart) documentation.

#### Create a Topic
Let's create a topic named "test" with a single partition and only one replica:
```bash
kafka-topics --create --zookeeper localhost:2181 --replication-factor 1 --partitions 1 --topic test
```
We can now see that topic if we run the list topic command:

```bash
kafka-topics --list --zookeeper localhost:2181
__consumer_offsets
test
```

#### Produce a Message
You can run the producer command line and then type a few messages into the console to send to the server.

```bash
kafka-console-producer --broker-list localhost:9092 --topic test
>Test Message 1
>Test Message 2
^D
```

#### Consume a Message
With Kafka consumer command line  you dump out messages to standard output.

```bash
kafka-console-consumer --bootstrap-server localhost:9092 --topic test --from-beginning
Test Message 1
Test Message 2
```

## Code Examples
tbd