describe("Polling for manager dashboard", function(){

	var value; 

	beforeEach(function(done){
		setTimeout(function(){
			value = 0;
			done();
		}, 1);
	});

	
	it("should be polling", function(done){
		value++;
		expect(value).toBeGreaterThan(0);
		done();
	});


});

