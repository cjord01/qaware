$(function (){
	if ($(".beacon").length > 0){
		(function refreshLoad() {
				setTimeout(function(){

				var url = "/beacons";
				var request = $.ajax(url, {
					method: "GET"
				});

				request.done(function(response){
					$(".beacons tbody").replaceWith($(response).find("tbody")[0]);
					$("table totals").replaceWith($(response).find("tbody")[1]);
					// debugger;

					// debugger ;
					refreshLoad();
				});

				// var tableUrl = "/completed_forms"
				// var tableRequest = $.ajax(tableUrl, {
				// 	method: "GET"
				// });

				// tableRequest.done(function(response){
				// 	$(".data_totals").replaceWith($(response).find(".data_totals"));
				// });
				// 		debugger ;
				// 		refreshLoad();
			}, 1000);
		})();


	}

});
