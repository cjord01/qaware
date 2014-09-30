$(function (){
	(function employeeLocation() {
			setTimeout(function(){

			var url = "/beacons";
			var request = $.ajax(url, {
				method: "GET"
			});
			request.done(function(response){
				// debugger ; 
				$("tbody").replaceWith($(response).find("tbody"));
			
				employeeLocation();
			});
		}, 500);
	})();

});