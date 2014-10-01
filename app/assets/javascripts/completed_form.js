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

	// tooltip code

	// var bisectDate = d3.bisector(function(d) {return d.xLabels;}).left;
	// var lineSvg = graph.append("g");
	// var focus = graph.append("g")
	// 				.style("display", "none");
	// lineSvg.append("path")
	// 	.attr("class", "line")
	// 	.attr("d", line(data))

	// // adding circle to graph
	// focus.append("circle")
	// 	.attr("class", "y")
	// 	.style("fill", "none")
	// 	.style("stroke", "blue")
	// 	.attr("r", 4);

	// // set area to capture mouse movements

	// graph.append("rect")
	// 	.attr("width", width)
	// 	.attr("height", height)
	// 	.style("fill", "none")
	// 	.style("pointer-events", "all")
	// 	.on("mouseover", function() {focus.style("display", null); })
	// 	.on("mouseout", function() {focus.style("display", "none"); })
	// 	.on("mousemove", mousemove);

	// // determining which date will be highlighted
	// function mousemove() {
	// var x0 = x.invert(d3.mouse(this)[0]),			// returns the x position of the mouse
	// 	i = bisectDate(data, x0, 1),				// find the index of our data array
	// 	d0 = data[i-1],								// subsets of our data array
	// 	d1 = data[i],
	// 	d = x0 - d0.xLabels > d1.xLabels - x0 ? d1 : d0;

	// focus.select("circle.y")
	// 	.attr("transform",
	// 			"translate(" + x(xLabels) + "," + y(yLabels) + ")");
	// }
}



	function timeFormat(date){
		if (date.getHours() > 12){
			return date.getHours()-12 + ":" + date.getMinutes() + "pm";
		}
		else {
			return date.getHours() + ":" + date.getMinutes() + "am";
		}
	}


	function renderNewCompletedForm(responses){
		for (i=0; i < responses.length; i++){
			var date = new Date(responses[i].created_at);
			var month = date.getMonth() + 1 + "/";
			var day = date.getDate() + "/";
			var year = date.getFullYear().toString().substr(2,2);
			var dateFormat = month + day + year;
			var time = timeFormat(date);

			$(".table").append("<tr><td><a class='button' href='/completed_forms/" + lastId + "'>Select</a>" + "</td><td>" +
						dateFormat + "</td><td>" +
						time + "</td><td>" +
						responses[i].form.title + "</td><td>"+
						responses[i].employee.name + "</td><tr>");
				lastId ++;
		}
	}


$(function(){

	if ( $(".completed_form_index").length > 0){
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

		// (function refresh() {
		// 		setTimeout(function(){

		// 		// polling for completed forms list
		// 		// var url = "/completed_forms/refresh/" + lastId;
		// 		// var request = $.ajax(url, {
		// 		// 	method: "GET"
		// 		// });
		// 		// request.done(function(response){
		// 		// 	renderNewCompletedForm(response);
		// 		// 	refresh();
		// 		// });



		// 	}, 5000);
		// })();
});
