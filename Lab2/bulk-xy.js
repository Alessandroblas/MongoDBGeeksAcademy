var c = db.testcoll.initializeUnorderedBulkOp()
var N = 1000;

for (var i=0;i<N;i++) {

	c.insert( { x : i, y : N-i } );
}

var ex =  c.execute();
printjson(ex);


