# kafka-sandbox
__kafka-sandbox__ are Docker images (Alpine Linux and Zulu OpenJDK 11) and code examples which you can use to play around with Apache Kafka.

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
To test the connection to Apache Kafka and Zookeeper you should install the Apache Kafka and Apache Zookeeper on your local machine, so that you have access to the Kafka (kafka-topics, kafka-console-producer, kafka-console-consumer, etc.)  and Zookeeper command line tools (zookeeper-shell). This means that you should install Apache Kafka on your local machine as well.

- How to install Apache Kafka, see https://kafka.apache.org/downloads 
- How to install Apache Zookeeper, see https://zookeeper.apache.org/doc/current/
- For Mac you could use Hombrew, see [brew kafka](https://brewformulas.org/kafka) and [brew zookeeper](https://brewformulas.org/zookeeper)

For more details have a look at the [Apache Kafka Quickstart](https://kafka.apache.org/quickstart) and [Zookeeper Kafka Quickstart](https://zookeeper.apache.org/doc/current/zookeeperStarted.html) documentation.

#### Create a Topic
Let's create a topic named "test" with a single partition and only one replica:
```bash
kafka-topics --create --zookeeper localhost:2181 --replication-factor 1 --partitions 1 --topic test
```

We can now see that topic if we run the list topic command:
```bash
kafka-topics --list --zookeeper localhost:2181
```

The output might look like this.
```bash
__consumer_offsets
test
```

#### Produce a Message
You can run the producer command line and then type a few messages into the console to send to the server.

```bash
kafka-console-producer --broker-list localhost:9092 --topic test
```
You can then create message. Every new line is a messages. You can quit with _^D_. The output might look like this.
```bash
>Test Message 1
>Test Message 2
^D
```

#### Consume a Message
With Kafka consumer command line  you dump out messages to standard output.

```bash
kafka-console-consumer --bootstrap-server localhost:9092 --topic test --from-beginning
```

The output might look like this.
```bash
Test Message 1
Test Message 2
```

#### List all Kafka Brokers
With the Zookeeper command line you can query the data tha is stored from Apache Kafka. For exmaple to lista ll Apache Kafka brokers you can run the following command.

```bash
zookeeper-shell localhost:2181 <<< "ls /brokers/ids"
```

The output might look like this.
```bash
Connecting to localhost:2181
Welcome to ZooKeeper!
JLine support is disabled

WATCHER::

WatchedEvent state:SyncConnected type:None path:null
[0]
```

Other commands are:
- _ls /brokers/ids_  Gives the list of active brokers
- _ls /brokers/topics_ Gives the list of topics
- _get /brokers/ids/0_ Gives more detailed information of the broker id '0'


## Code Examples
tbd