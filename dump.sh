#!/bin/sh

#The script will archive the database with naming convention "mongodump_YYYY_MM__DD"
#
#The script require a connection string as a parameter to access the database
#usr - username
#pass - password
#server - cluster server names (should be 3)
#database - database name


usr=$1
pass=$2
server="case-sequencing-db-shard-00-00.usoro.mongodb.net:27017,case-sequencing-db-shard-00-01.usoro.mongodb.net:27017,case-sequencing-db-shard-00-02.usoro.mongodb.net:27017"
database=case_sequencing_db
curr_date=$(date +"%Y_%m_%d")

#Sanity checks, check if MongoDB Database Tools were installed


mongodump --host $server --username $usr --password $pass --authenticationDatabase admin --ssl --archive="mongodump_$curr_date" --db $database
