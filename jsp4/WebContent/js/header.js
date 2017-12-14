$(document).ready(function() {

	var path = window.location.pathname;
	if(path == "/") {
		$("#homejsp").addClass("active");
	} else {
		var filename = path.match(/.*\/([^/]+)\.([^?]+)/i)[1];
		if (filename == "login") {
			$("#loginjsp").addClass("active");
		} else if (filename == "join") {
			$("#joinjsp").addClass("active");
		} else if (filename == "exam") {
			$("#listjsp").addClass("active");
		} else if (filename == "list") {
			$("#userlistjsp").addClass("active");
		} else {
			console.log("Cannot find matching ID");
		}
	}

});