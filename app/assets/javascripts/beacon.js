$(function (){
	if ($(".beacon").length > 0){
		(function refreshLoad() {
				setTimeout(function(){

				var url = "/beacons";
				var request = $.ajax(url, {
					method: "GET"
				});
				request.done(function(response){
					// debugger ;
					$(".beacons tbody").replaceWith($(response).find("tbody"));

				});

				var tableUrl = "/completed_forms"
				var tableRequest = $.ajax(tableUrl, {
					method: "GET"
				});

				tableRequest.done(function(response){
					$(".data_totals").replaceWith($(response).find(".data_totals"));
				});
						refreshLoad();
			}, 1000);
		})();


	}

});
