$(function(){
	var m = [80, 80, 80, 80]; // margins
	var w = 500 - m[1] - m[3]; // width: margin.right - margin.left
	var h = 400 - m[0] - m[2]; // height: margin.top - margin.bottom
		
	var x = d3.scale.linear()			// by default will create a domain [0,1] and range [1,0]
		.domain([0, data.length-1])		// customize our domain or how many data points on x-axis
		.range([0, w]); 				// how wide the x-axis stretches
	var y = d3.scale.linear()
		.domain([0, d3.max(data)])  	// d3.max calculates the max value in the data
		.range([h, 0]); 				// chart's y-axis will scale with data

	var line = d3.svg.line() 			// create a line function to convert data into x and y points

		// assign the X function to plot line
		.x(function(d,i) { 
			// console.log('Plotting X value for data point: ' + d + ' using index: ' + i + ' to be at: ' + x(i) + ' using our xScale.');
			// return the X coordinate where we want to plot this datapoint
			return x(i); 
		})
		.y(function(d) { 
			// console.log('Plotting Y value for data point: ' + d + ' to be at: ' + y(d) + " using our yScale.");
			// return the Y coordinate where we want to plot this datapoint
			return y(d); 
		})

		// Add an SVG element with the desired dimensions and margin.
		var graph = d3.select("#graph").append("svg:svg")
		    .attr("width", w + m[1] + m[3])
		    .attr("height", h + m[0] + m[2])
		    .append("svg:g")
		    .attr("transform", "translate(" + m[3] + "," + m[0] + ")");

		// create yAxis
		var xAxis = d3.svg.axis().scale(x).tickSize(-h).tickSubdivide(true);
		// Add the x-axis.
		graph.append("svg:g")
		    .attr("class", "x axis")
		    .attr("transform", "translate(0," + h + ")")
		    .call(xAxis);



		// create left yAxis
		var yLabels = ["label", "another", "wegeg", "werwrw"];
		// console.log(yLabels.length)
		var yAxisLeft = d3.svg.axis().scale(y)
							.tickFormat(function(ylabels, i) {
								// return "day" + d + i
	
								for (var label=0; label < yLabels.length; label+=1){
									console.log( ylabels[label])
								}
							})
							.ticks(4).orient("left");
		// Add the y-axis to the left
		graph.append("svg:g")
		    .attr("class", "y axis")
		    .attr("transform", "translate(-25,0)")
		    .call(yAxisLeft);
		
		
		graph.append("svg:path").attr("d", line(data));
});


