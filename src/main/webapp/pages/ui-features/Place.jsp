<%@page import="beans.Section"%>
<%@page import="service.SectionService"%>
<%@page import="java.util.List"%>
<%@page import="beans.Place"%>
<%@page import="service.PlaceService"%>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<%
HttpSession sessio = request.getSession();
Users c = (Users) sessio.getAttribute("user");
// System.out.println(sessio.getAttribute("user"));
if (c != null) {

	//System.out.println(c.toString());
	//  System.out.println("bien venu"+c.getLogin());
} else {
	response.sendRedirect("/Login.jsp");
	//System.out.println("session vide");
}
%>
<!DOCTYPE html>
<html lang="en">

<head>
<!-- Required meta tags -->
<meta charset="utf-8">
<meta name="viewport"
	content="width=device-width, initial-scale=1, shrink-to-fit=no">
<title>TIRGANI Parking</title>
<!-- base:css -->
<link rel="stylesheet" href="../../vendors/typicons/typicons.css">
<link rel="stylesheet" href="../../vendors/css/vendor.bundle.base.css">

<!-- endinject -->
<!-- plugin css for this page -->
<!-- End plugin css for this page -->
<!-- inject:css -->
<link rel="stylesheet" href="../../css/vertical-layout-light/style.css">
<!-- endinject -->
<link rel="shortcut icon" href="../../images/favicon.png" />
<!-- datatable -->

<!-- end datatable -->
<!-- *************************************** -->

<link rel="stylesheet" type="text/css"
	href="https://cdn.datatables.net/1.11.3/css/jquery.dataTables.css">
<script
	src="https://ajax.googleapis.com/ajax/libs/jquery/3.6.0/jquery.min.js"></script>
<script type="text/javascript" charset="utf8"
	src="https://cdn.datatables.net/1.11.3/js/jquery.dataTables.js"></script>

<!-- ************************************ -->
<style type="text/css">
#popupQr {
	display: none;
	position: fixed;
	transform: translate(-120%, 10%) scale(1);
	transition: 200ms ease-in-out;
	boder: 5px solid black;
	border-radius: 15px;
	z-index: 17;
	background-color: red;
	width: 240px;
	height: 260p
}

@media ( max-width : 480px) {
	#popupQr {
		display: none;
		position: fixed;
		transform: translate(10%, 10%) scale(0.6);
		transition: 200ms ease-in-out;
		boder: 5px solid black;
		border-radius: 15px;
		z-index: 17;
		background-color: black;
		width: 240px;
		height: 260p
	}
}
</style>




<!--  -->

</head>
<body>

	<div class="container-scroller">
		<!-- partial:partials/_navbar.html -->
		<%@include file="../../template/header.jsp"%>
		<!-- partial -->
		<nav class="navbar-breadcrumb col-xl-12 col-12 d-flex flex-row p-0">
			<div class="navbar-links-wrapper d-flex align-items-stretch">

				<div class="nav-link">
					<a href="https://tirgani.com/"><i class="typcn typcn-mail"></i></a>
				</div>


			</div>
			<div
				class="navbar-menu-wrapper d-flex align-items-center justify-content-end">
				<ul class="navbar-nav mr-lg-2">
					<li class="nav-item ml-0">
						<h4 class="mb-0">Gestion Place</h4>
					</li>
					<li class="nav-item">
						<div class="d-flex align-items-baseline">
							<p class="mb-0">Home</p>
							<i class="typcn typcn-chevron-right"></i>
							<p class="mb-0">gérer vos places</p>
						</div>
					</li>
				</ul>
				<ul class="navbar-nav navbar-nav-right">
					<li class="nav-item nav-search d-none d-md-block mr-0"></li>
				</ul>
			</div>
		</nav>

		<div class="container-fluid page-body-wrapper">

			<%@include file="../../template/menu.jsp"%>
			<!-- partial -->
			<div class="main-panel">
				<div class="content-wrapper">
					<!--  -->

					<!--  -->
					<div class="row">
						<div class="card-body">
							<div id="popupQr" class="p-3 mb-2 bg-light text-black ">
								<img
									src="https://chart.googleapis.com/chart?cht=qr&chl=https://www.1formatik.com&chs=200x200&chld=L|0"
									id="qrcode">


								<div style="margin-top: 10px" class="text-center">
									<button type="button" class="btn bg-primary btn-sm"
										onclick="hidepopup();">Annuler</button>
								</div>
							</div>

							<div id="popup" class="p-3 mb-2 bg-primary text-white"
								style="display: none; position: fixed; transform: translate(20%, -10%) scale(1); transition: 200ms ease-in-out; boder: 2px solid black; border-radius: 5px; z-index: 17; background-color: #cbc6c6; width: 600px; height: 300px; max-width: 80%;">

								<h4 class="card-title">Modifier Places</h4>
								<input type="hidden" name="id" id="idm" class="id">
								<div class="input-group mb-3">
									<div class="input-group-prepend">
										<span class="input-group-text "
											style="width: 100px; color: black;" id="basic-addon1">Numéro</span>
									</div>
									<input type="text" class="form-control" aria-label="Username"
										name="numero" id="numerom" aria-describedby="basic-addon1">
								</div>
								<div class="input-group mb-3">
									<div class="input-group-prepend">
										<span class="input-group-text "
											style="width: 100px; color: black;" id="basic-addon1">Type</span>
									</div>
									<select class="form-control" aria-describedby="basic-addon1"
										name="type" id="typem">
										<option value="Moto">Moto</option>
										<option value="Voiture">Voiture</option>
										<option value="Camion">Camion</option>
										<option value="Bus">Bus</option>
									</select>

								</div>
								<div class="input-group mb-3">
									<div class="input-group-prepend">
										<span class="input-group-text "
											style="width: 100px; color: black;" id="basic-addon1">Section</span>
									</div>
									<select class="form-control" aria-describedby="basic-addon1"
										name="section" id="sectionm">
										<%
										SectionService sv = new SectionService();
										List<Section> sectiones = sv.findAll();
										for (Section sec : sectiones) {
										%>
										<option value=<%=sec.getId()%>><%=sec.getCode()%></option>
										<%
										}
										%>
									</select>
								</div>
								<!--  -->
								<div style="float: right; margin-top: 10px">
									<button type="submit" class="btn btn-success  mr-2"
										onclick="modifPlace();">Modifier</button>
									<button type="button" class="btn btn-light"
										onclick="hidepopup();">Annuler</button>
								</div>
							</div>

						</div>
					</div>
					<!--  -->
					<!--  -->
					<div class="row">
						<div class="card-body">

							<div id="popupAjouter" class="p-3 mb-2 bg-primary text-white"
								style="display: none; position: fixed; transform: translate(20%, -10%) scale(1); transition: 200ms ease-in-out; boder: 2px solid black; border-radius: 5px; z-index: 17; background-color: #cbc6c6; width: 600px; height: 300px; max-width: 80%;">

								<h4 class="card-title">Ajouter Place Dans Un section</h4>
								<input type="hidden" name="id" id="ida" class="id">
								<div class="input-group mb-3">
									<div class="input-group-prepend">
										<span class="input-group-text "
											style="width: 100px; color: black;" id="basic-addon1">Numéro</span>
									</div>
									<input type="text" class="form-control" aria-label="Username"
										name="numero" id="numeroa" aria-describedby="basic-addon1">
								</div>
								<div class="input-group mb-3">
									<div class="input-group-prepend">
										<span class="input-group-text "
											style="width: 100px; color: black;" id="basic-addon1">Type</span>
									</div>
									<select class="form-control" aria-describedby="basic-addon1"
										name="typea" id="typea">
										<option value="Moto">Moto</option>
										<option value="Voiture">Voiture</option>
										<option value="Camion">Camion</option>
										<option value="Bus">Bus</option>
									</select>

								</div>
								<div class="input-group mb-3">
									<div class="input-group-prepend">
										<span class="input-group-text "
											style="width: 100px; color: black;" id="basic-addon1">Section</span>
									</div>
									<select class="form-control" aria-describedby="basic-addon1"
										name="section" id="sectiona">
										<%
										for (Section sec : sectiones) {
										%>
										<option value=<%=sec.getId()%>><%=sec.getCode()%></option>
										<%
										}
										%>
									</select>
								</div>
								<!--  -->
								<div style="float: right; margin-top: 10px">
									<button type="submit" class="btn btn-success  mr-2"
										onclick="ajouter();">Ajouter</button>
									<button type="button" class="btn btn-light"
										onclick="hidepopup();">Annuler</button>
								</div>
							</div>

						</div>
					</div>
					<!--  -->
				</div>
				<!-- ***************************************** -->
				<script type="text/javascript">

					function showpopup(id,numero ){
						document.getElementById("popup").style.display = 'block';
						var table=	$('#table_').DataTable();
										
						 $('#table_ tbody').on('click', 'tr', function () {
						
							document.getElementById("idm").value = table.cell(this, 0).data();
							document.getElementById("numerom").value = table.cell(this, 1).data();
							document.getElementById("typem").value = table.cell(this, 3).data();
							
						 });
					}
					function showQR(id){
					
						document.getElementById("popupQr").style.display = 'block';
						var url = "https://chart.googleapis.com/chart?cht=qr&chl=https://www.1formatik.com&chs=200x200&chld=L|0";
						var qrcode = 'https://chart.googleapis.com/chart?cht=qr&chl=ProParking -Place : ' +id + '&chs=200x200&choe=UTF-8&chld=L|0';
						document.getElementById("qrcode").src = qrcode;
						
					}

					function hidepopup() {
						document.getElementById("popup").style.display = 'none';
						document.getElementById("popupAjouter").style.display = 'none';
						document.getElementById("popupQr").style.display = 'none';
					}
					function modifPlace()
					{
						var id = document.getElementById("idm").value;
						var numero = document.getElementById("numerom").value;
						var type = document.getElementById("typem").value;
						var section = document.getElementById("sectionm").value;
						$.ajax({
							url : "../../PlaceServellet",
							data : {
								op : "modpro",
								id : id,numero,type,section,

							},
							type : 'POST',
							success : function(data, textStatus, jqXHR) {
								alert("Place bien modifier");
								$('#table_').dataTable().fnDestroy();
								document.getElementById("popup").style.display = 'none';
								zoo();

							},
							error : function(jqXHR, textStatus, errorThrown) {
								alert("erreur !!! ");

							}
						});

					}
					function pupupajouter()
					{
						
						document.getElementById("popupAjouter").style.display = 'block';
						
					}
					function ajouter()
					{
						var id = document.getElementById("ida").value;
						var numero = document.getElementById("numeroa").value;
						var type = document.getElementById("typea").value;
						var section = document.getElementById("sectiona").value;
						$.ajax({
							url : "../../PlaceServellet",
							data : {
								op : "ajouter",
								numero : numero,type:type,section:section,

							},
							type : 'POST',
							success : function(data, textStatus, jqXHR) {
								alert("Place bien Ajouter");
								$('#table_').dataTable().fnDestroy();
								document.getElementById("popupAjouter").style.display = 'none';
								zoo();

							},
							error : function(jqXHR, textStatus, errorThrown) {
								alert("erreur !!! ");

							}
						});
					}
					//supprimer place 
						function supprimer(id)
					{
					//	var id = document.getElementById("ida").value;
						
						$.ajax({
							url : "../../PlaceServellet",
							data : {
								op : "delete",
								id:id,

							},
							type : 'POST',
							success : function(data, textStatus, jqXHR) {
								alert("Place bien Supprimer");
								$('#table_').dataTable().fnDestroy();
							//	document.getElementById("popupAjouter").style.display = 'none';
								zoo();

							},
							error : function(jqXHR, textStatus, errorThrown) {
								alert("erreur !!! ");

							}
						});
					}
					function Etat(id) {

						$.ajax({
							url : "../../PlaceServellet",
							data : {
								op : "etat",
								id : id,

							},
							type : 'POST',
							success : function(data, textStatus, jqXHR) {
								alert("Etat bien changer");
								$('#table_').dataTable().fnDestroy();
								zoo();

							},
							error : function(jqXHR, textStatus, errorThrown) {
								alert("erreur !!! ");

							}
						});

					}
				
					$(document).ready(function() {

						$.noConflict();
						var table = $('#table_id').DataTable({
							ordering : true,
							searching : true,
							select : true
						});
						zoo();
					});
					function zoo() {
						$('#table_')
								.DataTable(
										{
											 
											"autoWidth" : false,
											
									        responsive: true,
											ajax : {
												url : "../../PlaceServellet",
												dataSrc : '',
												data : {
													op : "trier",
												},
												type : 'POST'
											},
											columns : [
													{
														data : 'id',
														"title" : "Id"

													},
													{
														"title" : "Code QR",
														"render" : function(data, type, row) {
															var ata = row['type'];
															return '<button type="button" class="btn btn-success btn-sm" onclick="showQR('+row['id']+');">QR</button>';
														}
													},
													{
														data : 'numero',
														"title" : "Numero"
													},

													{
														data : 'etat',
														"title" : "Changer Etat",
														"render" : function(
																data, type, row) {

															if (data == 'Occupee') {

																return '<button type="button" class="btn btn-primary mr-2 btn-sm" onclick="Etat('
																		+ row['id']
																		+ ');">Vidée  </button>';
															} else if (data == 'Vide') {

																return '<button type="button" class="btn btn-primary mr-2 btn-sm" onclick="Etat('
																		+ row['id']
																		+ ');">Remplir</button>';
															}
														}
													},
													{
														data : 'etat',
														"title" : "Etat"
													},
													{
														data : 'type',
														"title" : "Type"
													},
													{
														data : 'idsection',
														"title" : "Section"
													},
													
													{
														"title" : "Modifier",
														"render" : function(data, type, row) {
															var ata = row['type'];
															return '<button type="button" class="btn btn-success btn-sm" onclick="showpopup('+row['id']+');">Modifier</button>';
														}
													},
													{
														"title" : "Supprimer",
														"render" : function(data, type, row) {
															return '<button type="button" class="btn btn-danger btn-sm" onclick="supprimer('+row['id']+');">Supprimer</button>';
														}
													} ]

										});
					}
				</script>
				<div style="margin-bottom: 20px">
					<button type="button" class="btn btn-primary mr-2 btn-lg"
						style="float: right;" onclick="pupupajouter()">Ajouter
						Place</button>
					<h4 style="margin-left: 10px">Liste des Places</h4>
				</div>


				<div class="col-md-12 ">


					<div class="card mb-5" id="card">
						<table id="table_" class="display">


						</table>
					</div>
				</div>
			</div>

		</div>
		<%@include file="../../template/footer.jsp"%>

	</div>

	</div>

	</div>


	<script src="../../vendors/js/vendor.bundle.base.js"></script>
	<!-- endinject -->
	<!-- Plugin js for this page-->
	<script src="../../vendors/chart.js/Chart.min.js"></script>
	<!-- End plugin js for this page-->
	<!-- inject:js -->
	<script src="../../js/off-canvas.js"></script>
	<script src="../../js/hoverable-collapse.js"></script>
	<script src="../../js/template.js"></script>
	<script src="../../js/settings.js"></script>
	<script src="../../js/todolist.js"></script>
	<!-- endinject -->
	<!-- Custom js for this page-->
	<script src="../../js/dashboard.js"></script>
	<!-- End custom js for this page-->
</body>

</html>

