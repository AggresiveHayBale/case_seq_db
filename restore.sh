#!/bin/sh

usr=$1
pass=$2
server="case-sequencing-db-shard-00-00.usoro.mongodb.net:27017,case-sequencing-db-shard-00-01.usoro.mongodb.net:27017,case-sequencing-db-shard-00-02.usoro.mongodb.net:27017"
curr_date=$(date +"%Y_%m_%d")

mongorestore --host $server --username $usr --password $pass --authenticationDatabase admin --ssl case/mongodump_$curr_date.bson --drop
