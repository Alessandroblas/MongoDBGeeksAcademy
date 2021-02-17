kill -9 $(pgrep mongo)
rm -rf /data

mkdir -p /data/db1
mkdir -p /data/db2
mkdir -p /data/db3

mkdir -p /data/log1
mkdir -p /data/log2
mkdir -p /data/log3


chown -R mongodb:mongodb /data

mongod --dbpath /data/db1 --port 27001 --replSet "MyReplSet" --fork --logpath /data/log1/db.log
mongod --dbpath /data/db2 --port 27002 --replSet "MyReplSet" --fork --logpath /data/log2/db.log
mongod --dbpath /data/db3 --port 27003 --replSet "MyReplSet" --fork --logpath /data/log3/db.log

sleep 5

mongo --port 27001 --eval "rs.initiate({ _id: 'MyReplSet', members: [{ _id: 0, host : 'localhost:27001' }, { _id: 1, host : 'localhost:27002' }, { _id: 2, host : 'localhost:27003'}]});"