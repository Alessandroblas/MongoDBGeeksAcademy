kill -9 $(pgrep mongo)
rm -rf /datashard

mkdir -p /datashard/configsvr
mkdir -p /datashard/logconfisrv
mkdir -p /datashard/logmongos
mkdir -p /datashard/dbsh1
mkdir -p /datashard/dbsh2
mkdir -p /datashard/log1
mkdir -p /datashard/log2
chown -R mongodb:mongodb /datashard

# Config Replica Set
mongod --dbpath /datashard/configsvr --port 20000 --configsvr --replSet "configreplset" --fork --logpath /datashard/logconfisrv/db.log
mongo --port 20000 --eval "rs.initiate({ _id: 'configreplset', members: [{ _id: 0, host : 'localhost:20000' }]});"

# Mongos
mongos --port 30000 --configdb configreplset/localhost:20000 --fork --logpath /datashard/logmongos/db.log

# Mongod
mongod --port 10001 --dbpath /datashard/dbsh1 --shardsvr --fork --logpath /datashard/log1/db.log
mongod --port 10002 --dbpath /datashard/dbsh2 --shardsvr --fork --logpath /datashard/log2/db.log

mongo --port 30000 --eval "use admin; db.runCommand({addshard: "localhost:10001", allowLocal: true})"
mongo --port 30000 --eval "use admin; db.runCommand({addshard: "localhost:10002", allowLocal: true})"

## Add shard databases
# mongo localhost:30000
# use admin
# db.runCommand({addshard: "localhost:10001", allowLocal: true})
# db.runCommand({addshard: "localhost:10002", allowLocal: true})

## Insert test data on test.testcoll collection
# use test 
# db.testcoll.insert({x:1})


## enable test.testcoll sharding
# use admin
# db.runCommand({enablesharding: "test"})
## OR
# sh.enableSharding("test")

## add index to enable shard key
# use test 
# db.testcoll.createIndex({x:1}) 

## Shard collection
# db.runCommand({shardcollection: "test.testcoll", key: {x: 1}})
## OR
# sh.shardCollection("database.collection",{x:1})

# printShardingStatus()
## example:
# db.runCommand( { split : "test.people", middle : { _id : 99 } } )