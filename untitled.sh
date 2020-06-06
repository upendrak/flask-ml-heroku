https://blog.insightdatascience.com/how-to-get-hadoop-and-spark-up-and-running-on-aws-7a1b0ab55459

git clone https://github.com/InsightDataScience/pegasus

cd pegasus

pip install awscli



peg up master.yml 

peg up workers.yml 

peg fetch spark_cluster

peg install spark_cluster ssh

peg install spark_cluster aws

peg install spark_cluster hadoop

peg sshcmd-cluster spark_cluster "sudo apt-get update"

peg sshcmd-cluster spark_cluster "sudo apt-get install -y openjdk-8-jre-headless python"

peg service spark_cluster hadoop start

peg install spark_cluster spark

peg service spark_cluster spark start

# peg sshcmd-cluster spark_cluster "sudo apt-get install -y python"

peg ssh spark_cluster 1

vi alice.txt

hdfs dfs -mkdir /user

hdfs dfs -ls /user

hdfs dfs -copyFromLocal alice.txt /user/alice.txt

hdfs dfs -cat /user/alice.txt

wget https://raw.githubusercontent.com/apache/spark/master/examples/src/main/python/wordcount.py

# spark-submit --master spark://ec2-18-216-179-154.us-east-2.compute.amazonaws.com:7077 wordcount.py hdfs://ec2-18-216-179-154.us-east-2.compute.amazonaws.com:9000/user/alice.txt

spark-submit --master spark://ec2-18-223-159-167.us-east-2.compute.amazonaws.com:7077 wordcount.py ec2-18-223-159-167.us-east-2.compute.amazonaws.com:9000/user/alice.txt




peg stop spark_cluster


import sys

from pyspark import SparkContext, SparkConf

if __name__ == "__main__":

  # create Spark context with Spark configuration
  conf = SparkConf().setAppName("Spark Count")
  sc = SparkContext(conf=conf)

  # get threshold
  threshold = int(sys.argv[2])

  # read in text file and split each document into words
  tokenized = sc.textFile(sys.argv[1]).flatMap(lambda line: line.split(" "))

  # count the occurrence of each word
  wordCounts = tokenized.map(lambda word: (word, 1)).reduceByKey(lambda v1,v2:v1 +v2)

  # filter out words with fewer than threshold occurrences
  filtered = wordCounts.filter(lambda pair:pair[1] >= threshold)

  # count characters
  charCounts = filtered.flatMap(lambda pair:pair[0]).map(lambda c: c).map(lambda c: (c, 1)).reduceByKey(lambda v1,v2:v1 +v2)

  list = charCounts.collect()
  print repr(list)[1:-1]


#AWS_IMAGE=ami-05c1fa8df7187511

# Pegasus (Spark)
export AWS_ACCESS_KEY_ID=xxxxxxxxxxxxxxxxxxxxxx
export AWS_SECRET_ACCESS_KEY=xxxxxxxxxxxxxxxxxxxxxx
export AWS_DEFAULT_REGION=us-east-2
export REM_USER=ubuntu
export PEGASUS_HOME=/Users/upendra_35/Documents/git.repos/pegasus
export PATH=$PEGASUS_HOME:$PATH

https://www.infoq.com/articles/aws-vpc-explained/

CREATE TABLE `BucketList`.`tbl_user` (
  `user_id` BIGINT NOT NULL AUTO_INCREMENT,
  `user_name` VARCHAR(45) NULL,
  `user_username` VARCHAR(45) NULL,
  `user_password` VARCHAR(45) NULL,
  PRIMARY KEY (`user_id`));
