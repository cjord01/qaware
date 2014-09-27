$(document).ready(function (){
	var data = [4, 8, 23, 43, 57, 34]

	var width = 420,
		barHeight = 20;

	var x = d3.scale.linear()
		.domain([0, d3.max(data)])
		.range([0, width]);

	var chart = d3.

	d3.select(".chart")
		.selectAll("div")
			.data(data)
		.enter().append("div")
			.style("width", function(d) {return x(d) + "px";})
			.text(function(d) {return d;});
});