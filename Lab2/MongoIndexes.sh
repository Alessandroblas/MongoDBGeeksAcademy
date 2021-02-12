# cd /root/MongoDB-SampleCollection/Lab2
# mongo localhost/x bulk-x.js
# mongo localhost/xy bulk-xy.js

## Connect to mongo shell
#> use x
#> db.testcollx.find({x:5}).explain()
#> db.testcollx.createIndex({x:-1})
#> db.testcollx.find({x:5}).explain()

#> db.testcollxy.createIndex({x:-1,y:1})
#> db.testcollxy.find().sort({x:-1,y:-1}).explain()
