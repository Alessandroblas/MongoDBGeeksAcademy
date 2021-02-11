var c = db.testcoll.initializeUnorderedBulkOp()

for (var i=0;i<1000;i++) {

	c.insert( { i : i } );
}

var ex =  c.execute();
printjson(ex);


