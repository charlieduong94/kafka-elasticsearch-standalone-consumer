#!/bin/sh

# Setup variables
# GHANGE FOR YOUR ENV: absolute path of the indexer installation dir
INDEXER_HOME=/consumer

# GHANGE FOR YOUR ENV: JDK 8 installation dir - you can skip it if your JAVA_HOME env variable is set
#JAVA_HOME=/usr/lib/jvm/java-8-oracle

# GHANGE FOR YOUR ENV: absolute path of the logback config file
LOGBACK_CONFIG_FILE=$INDEXER_HOME/src/main/resources/logback.xml

# GHANGE FOR YOUR ENV: absolute path of the indexer properties file
INDEXER_PROPERTIES_FILE=$INDEXER_HOME/src/main/resources/kafka-es-indexer.properties

# DO NOT CHANGE ANYTHING BELOW THIS POINT (unless you know what you are doing :) )!
echo "Starting Kafka ES Indexer app ..."
echo "INDEXER_HOME=$INDEXER_HOME"
echo "JAVA_HOME=$JAVA_HOME"
echo "LOGBACK_CONFIG_FILE=$LOGBACK_CONFIG_FILE"
echo "INDEXER_PROPERTIES_FILE=$INDEXER_PROPERTIES_FILE"

# add all dependent jars to the classpath
for file in $INDEXER_HOME/bin/lib/*.jar;
do
  CLASS_PATH=$CLASS_PATH:$file
done
echo "CLASS_PATH=$CLASS_PATH"

$JAVA_HOME/bin/java -Xmx1g -cp $CLASS_PATH -Dlogback.configurationFile=$LOGBACK_CONFIG_FILE org.elasticsearch.kafka.indexer.KafkaIndexerDriver $INDEXER_PROPERTIES_FILE
