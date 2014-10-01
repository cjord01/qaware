function createGraph(data, xLabels, yLabels, title){

	var data = data;
	var xLabels = xLabels;
	var yLabels = yLabels;
	var title = title;

	var m = [80, 80, 80, 320];
	var width = 750 - m[1] - m[3];
	var height = 450 - m[0] - m[2];

	var x = d3.scale.linear()
		.domain([0, data.length-1])
		.range([0, width]);
	var y = d3.scale.linear()
		.domain([0, d3.max(data)])
		.range([height, 0]);

	var line = d3.svg.line()
	.x(function createX(d,i) {
		// console.log('Plotting X value for data point: ' + d + ' using index: ' + i + ' to be at: ' + x(i) + ' using our xScale.');
		return x(i);
	})
	.y(function createY(d) {
		// console.log('Plotting Y value for data point: ' + d + ' to be at: ' + y(d) + " using our yScale.");

		return y(d);
	})

	var graph = d3.select("#graph").append("svg:svg")
	    .attr("width", width + m[1] + m[3])
	    .attr("height", height + m[0] + m[2])
	    .append("svg:g")
	    .attr("transform", "translate(" + m[3] + "," + m[0] + ")");

	var xAxis = d3.svg.axis().scale(x)
					.tickFormat(function(index){
						return xLabels[index]
					})
					.tickSize(-height)
					.tickSubdivide(true)

	// Add the x-axis.
	graph.append("svg:g")
	    .attr("class", "x axis")
	    .attr("transform", "translate(0," + height + ")")
	    .call(xAxis)
	    .selectAll("text")
	    	.attr("dy", "0.3em")
	    	.attr("dx", "-2em")
			.attr("transform", function(d) {
				return "rotate(-65)"
			});



	// create left yAxis
	var yAxisLeft = d3.svg.axis().scale(y)
						.tickFormat(function(index) {
							return yLabels[index]
						})
						.ticks(4).orient("left");

	// Add the y-axis to the left
	graph.append("svg:g")
	    .attr("class", "y axis")
	    .attr("transform", "translate(-25,0)")
	    .call(yAxisLeft);

    // Adding the title
    graph.append("text")
    	.attr ("x", (width/2))
    	.attr("y", 0 - (m[0]/2))
    	.attr("text-anchor", "middle")
    	.style("font-size", "1.8rem")
    	.style("font-weight", "bold")
    	.text(title)


	graph.append("svg:path").attr("d", line(data));


}

$(function(){

	if ( $(".graphs").length > 0){
		createGraph(rest_q1_data, rest_q1_xLabels, rest_q1_yLabels, rest_q1_title);
		createGraph(rest_q2_data, rest_q2_xLabels, rest_q2_yLabels, rest_q2_title);
		createGraph(rest_q3_data, rest_q3_xLabels, rest_q3_yLabels, rest_q3_title);

		createGraph(kitchen_q1_data, kitchen_q1_xLabels, kitchen_q1_yLabels, kitchen_q1_title);
		createGraph(kitchen_q2_data, kitchen_q2_xLabels, kitchen_q2_yLabels, kitchen_q2_title);
		createGraph(kitchen_q3_data, kitchen_q3_xLabels, kitchen_q3_yLabels, kitchen_q3_title);

		createGraph(keg_q1_data, keg_q1_xLabels, keg_q1_yLabels, keg_q1_title);
		createGraph(keg_q2_data, keg_q2_xLabels, keg_q2_yLabels, keg_q2_title);
		createGraph(keg_q3_data, keg_q3_xLabels, keg_q3_yLabels, keg_q3_title);
	}

		
});