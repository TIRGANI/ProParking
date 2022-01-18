$(document).ready(function() {
	
	$.ajax({
		url: "http://localhost:8087/TIRGANI_parking_V00/TestServlette",
		data: { op: "load" },
		type: 'POST',
		success: function(data, textStatus, jqXHR) {
			remplir(data);
			alert("R");
		},
		error: function(jqXHR, textStatus, errorThrown) {
			console.log(textStatus);
		}
	});



	function remplir(data) {
		var ligne = "";
		data.forEach(function(e) {
			ligne += "<tr><td>" + e.id + "</td><td>" + e.code + "</td><td><button class='delete'>Supprimer</button></td><td><button class='update'>Modifier</button></td></tr>";
		});
		$("#contents").html(ligne);
	}
});
