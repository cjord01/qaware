describe("Create Graph", function(){
	var data = [1,2];
	var xLabels = ["An X label", "another X label"];
	var yLabels = ["A Y label", "another y label"];
	var title = "The title for a graph"


	// it("creates a line graph", function() {
	// 	expect(createGraph(data, xLabels, yLabels, title)).toEqual();
	// })

	describe('the svg', function(){
		it("should be created", function() {
			expect(createGraph(data,xLabels,yLabels,title)).not.toBeNull();
		})
	})

	it("data should not be null", function(){
		expect(data).not.toBeNull();
	})

	it("data should be an array of number values", function(){
		expect(data[1]).toEqual(jasmine.any(Number));
	})

	it("x-axis labels should be an array of strings", function(){
		expect(xLabels[1]).toEqual(jasmine.any(String));
	})


});