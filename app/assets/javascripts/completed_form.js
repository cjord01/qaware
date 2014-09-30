function createGraph(data, xLabels, yLabels, title){

	var data = data;
	var xLabels = xLabels;
	var yLabels = yLabels;
	var title = title;

	var m = [80, 80, 80, 320]; 		// margins
	var width = 750 - m[1] - m[3]; 	// width: margin.right - margin.left
	var height = 450 - m[0] - m[2]; // height: margin.top - margin.bottom
		
	var x = d3.scale.linear()			// by default will create a domain [0,1] and range [1,0]
		.domain([0, data.length-1])		// customize our domain or how many data points on x-axis
		.range([0, width]); 				// how wide the x-axis stretches
	var y = d3.scale.linear()
		.domain([0, d3.max(data)])  	// d3.max calculates the max value in the data
		.range([height, 0]); 				// chart's y-axis will scale with data

	var line = d3.svg.line() 			// create a line function to convert data into x and y points

	// assign the X function to plot line
	.x(function createX(d,i) { 
		// console.log('Plotting X value for data point: ' + d + ' using index: ' + i + ' to be at: ' + x(i) + ' using our xScale.');
		// return the X coordinate where we want to plot this datapoint
		return x(i); 
	})
	.y(function createY(d) { 
		// console.log('Plotting Y value for data point: ' + d + ' to be at: ' + y(d) + " using our yScale.");
		// return the Y coordinate where we want to plot this datapoint
		return y(d); 
	})

	// Add an SVG element with the desired dimensions and margin.
	var graph = d3.select("#graph").append("svg:svg")
	    .attr("width", width + m[1] + m[3])
	    .attr("height", height + m[0] + m[2])
	    .append("svg:g")
	    .attr("transform", "translate(" + m[3] + "," + m[0] + ")");
	    // .attr("width", '25%')
	    // .attr("height", '30%')
	    // .attr('viewBox','0 0 '+Math.min(width,height)+' '+ Math.min(width,height))
	    // .attr('preserveAspectRatio','xMinYMin')
	    // .append("g")
	    // .attr("transform", "translate(" + Math.min(width,height) / 2 + "," + Math.min(width,height) / 2 + ")");

	// create yAxis
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
	    	.attr("dx", "-2em") 			// moves axis labels up or down (negative for down)
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

// function updateCompletedForms(){
// 	$.getScript("/completed_forms.js")
// 	// $.ajax({
// 	// 	url: '/completed_forms',
// 	// 	dataType: "html",
// 	// 	success: success
// 	// });

// 	// $("completed_forms").append()
// 	setTimeout(updateCompletedForms, 3000)							// setInterval can do the same thing as setTimeout but setTimeout will only trigger once just in case request takes more time 
// }


$(function(){


	createGraph(rest_q1_data, rest_q1_xLabels, rest_q1_yLabels, rest_q1_title);
	createGraph(rest_q2_data, rest_q2_xLabels, rest_q2_yLabels, rest_q2_title);
	createGraph(rest_q3_data, rest_q3_xLabels, rest_q3_yLabels, rest_q3_title);

	createGraph(kitchen_q1_data, kitchen_q1_xLabels, kitchen_q1_yLabels, kitchen_q1_title);
	createGraph(kitchen_q2_data, kitchen_q2_xLabels, kitchen_q2_yLabels, kitchen_q2_title);
	createGraph(kitchen_q3_data, kitchen_q3_xLabels, kitchen_q3_yLabels, kitchen_q3_title);

	createGraph(keg_q1_data, keg_q1_xLabels, keg_q1_yLabels, keg_q1_title);
	createGraph(keg_q2_data, keg_q2_xLabels, keg_q2_yLabels, keg_q2_title);
	createGraph(keg_q3_data, keg_q3_xLabels, keg_q3_yLabels, keg_q3_title);

	

	(function refresh() {
			setTimeout(function(){

			var url = "/completed_forms/refresh/" + lastId;
			var request = $.ajax(url, {
				method: "GET"
			});
					// debugger;
			request.done(function(response){
				// $forms = $(response).find("table");
				// $("table").html($forms);
				// console.log(response[0])
				renderNewCompletedForm(response);
				refresh();
			});
		}, 3000);
	})();


	function timeFormat(date){
		if (date.getHours() > 12){
			return date.getHours()-12 + ":" + date.getMinutes();
		}
		else {
			return date.getHours() + ":" + date.getMinutes();
		}
	}


	function renderNewCompletedForm(responses){
		for (i=0; i < responses.length; i++){
			var date = new Date(responses[i].created_at);
			var month = date.getMonth() + 1 + "/";
			var day = date.getDate() + "/";
			var year = date.getFullYear();
			var dateFormat = month + day + year;
			var time = timeFormat(date);

			$(".table").append("<tr><td><a href='/completed_forms/" + lastId + "'>Select</a>" + "</td><td>" + 
						dateFormat + "</td><td>" +
						time + "</td><td>" + 
						responses[i].form.title + "</td><td>"+  
						responses[i].employee.name + "</td><tr>");
				lastId ++;
				// console.log(lastId);
		}
	}


});


