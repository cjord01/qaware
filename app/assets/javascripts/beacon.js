$(function (){
	if ($(".beacon").length > 0){
		(function refreshLoad() {
				setTimeout(function(){

				var url = "/beacons";
				var request = $.ajax(url, {
					method: "GET"
				});

				request.done(function(response){
					$(".beacons tbody").replaceWith($(response).find(".beacons tbody"));
					$(".totals tbody").replaceWith($(response).find(".totals tbody"));
					// debugger;

					refreshLoad();
				});

				// code below works for polling just the data table
				// var tableUrl = "/beacons"
				// var tableRequest = $.ajax(tableUrl, {
				// 	method: "GET"
				// });

				// tableRequest.done(function(response){
				// 	$(".totals tbody").replaceWith($(response).find(".totals tbody"));
				// 		// debugger ;
				// });
						// refreshLoad();
			}, 2000);
		})();


	}

});
