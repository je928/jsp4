$(document).ready(function() {

	var path = window.location.pathname;
	// var filename = path.match(/.*\/([^/]+)\.([^?]+)/i)[0];
	if(path == "/") {
		$("#homejsp").addClass("active");
	} else {
		var folder = path.split('/');
		var menu1 = folder[1];
		var menu2 = folder[2].replace(".jsp", "");
		if(menu1 == "user") {
			if (menu2 == "login") {
				$("#loginjsp").addClass("active");
			} else if (menu2 == "join") {
				$("#joinjsp").addClass("active");
			} else if (menu2 == "board") {
				$("#boardjsp").addClass("active");
			} else if (menu2 == "list") {
				$("#userlistjsp").addClass("active");
			}
		}else if(menu1 == "depart") {
			if (menu2 == "list") {
				$("#deptlistjsp").addClass("active");
			}
		}else {
			console.log("Cannot find matching ID");
		}
	}

});