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
        }
        else{
        	response.sendRedirect("/TIRGANI_parking_V00/Login.jsp");
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
					<a href="../../javascript:;"><i
						class="typcn typcn-calendar-outline"></i></a>
				</div>
				<div class="nav-link">
					<a href="../../javascript:;"><i class="typcn typcn-mail"></i></a>
				</div>
				<div class="nav-link">
					<a href="../../javascript:;"><i class="typcn typcn-folder"></i></a>
				</div>
				<div class="nav-link">
					<a href="../../javascript:;"><i
						class="typcn typcn-document-text"></i></a>
				</div>
			</div>
			<div
				class="navbar-menu-wrapper d-flex align-items-center justify-content-end">
				<ul class="navbar-nav mr-lg-2">
					<li class="nav-item ml-0">
						<h4 class="mb-0">Dashboard</h4>
					</li>
					<li class="nav-item">
						<div class="d-flex align-items-baseline">
							<p class="mb-0">Home</p>
							<i class="typcn typcn-chevron-right"></i>
							<p class="mb-0">Main Dahboard</p>
						</div>
					</li>
				</ul>
				<ul class="navbar-nav navbar-nav-right">
					<li class="nav-item nav-search d-none d-md-block mr-0">
						<div class="input-group">
							<input type="text" class="form-control" placeholder="Search..."
								aria-label="search" aria-describedby="search">
							<div class="input-group-prepend">
								<span class="input-group-text" id="search"> <i
									class="typcn typcn-zoom"></i>
								</span>
							</div>
						</div>
					</li>
				</ul>
			</div>
		</nav>
		<div class="container-fluid page-body-wrapper">
			<!-- partial:partials/_settings-panel.html -->
			<div class="theme-setting-wrapper">
				<div id="settings-trigger">
					<i class="typcn typcn-cog-outline"></i>
				</div>
				<div id="theme-settings" class="settings-panel">
					<i class="settings-close typcn typcn-times"></i>
					<p class="settings-heading">SIDEBAR SKINS</p>
					<div class="sidebar-bg-options selected" id="sidebar-light-theme">
						<div class="img-ss rounded-circle bg-light border mr-3"></div>
						Light
					</div>
					<div class="sidebar-bg-options" id="sidebar-dark-theme">
						<div class="img-ss rounded-circle bg-dark border mr-3"></div>
						Dark
					</div>
					<p class="settings-heading mt-2">HEADER SKINS</p>
					<div class="color-tiles mx-0 px-4">
						<div class="tiles success"></div>
						<div class="tiles warning"></div>
						<div class="tiles danger"></div>
						<div class="tiles info"></div>
						<div class="tiles dark"></div>
						<div class="tiles default"></div>
					</div>
				</div>
			</div>
			<div id="right-sidebar" class="settings-panel">
				<i class="settings-close typcn typcn-times"></i>
				<ul class="nav nav-tabs" id="setting-panel" role="tablist">
					<li class="nav-item"><a class="nav-link active" id="todo-tab"
						data-toggle="tab" href="#todo-section" role="tab"
						aria-controls="todo-section" aria-expanded="true">TO DO LIST</a></li>
					<li class="nav-item"><a class="nav-link" id="chats-tab"
						data-toggle="tab" href="#chats-section" role="tab"
						aria-controls="chats-section">CHATS</a></li>
				</ul>
				<div class="tab-content" id="setting-content">
					<div class="tab-pane fade show active scroll-wrapper"
						id="todo-section" role="tabpanel" aria-labelledby="todo-section">
						<div class="add-items d-flex px-3 mb-0">
							<form class="form w-100">
								<div class="form-group d-flex">
									<input type="text" class="form-control todo-list-input"
										placeholder="Add To-do">
									<button type="submit"
										class="add btn btn-primary todo-list-add-btn" id="add-task">Add</button>
								</div>
							</form>
						</div>
						<div class="list-wrapper px-3">
							<ul class="d-flex flex-column-reverse todo-list">
								<li>
									<div class="form-check">
										<label class="form-check-label"> <input
											class="checkbox" type="checkbox"> Team review meeting
											at 3.00 PM
										</label>
									</div> <i class="remove typcn typcn-delete-outline"></i>
								</li>
								<li>
									<div class="form-check">
										<label class="form-check-label"> <input
											class="checkbox" type="checkbox"> Prepare for
											presentation
										</label>
									</div> <i class="remove typcn typcn-delete-outline"></i>
								</li>
								<li>
									<div class="form-check">
										<label class="form-check-label"> <input
											class="checkbox" type="checkbox"> Resolve all the low
											priority tickets due today
										</label>
									</div> <i class="remove typcn typcn-delete-outline"></i>
								</li>
								<li class="completed">
									<div class="form-check">
										<label class="form-check-label"> <input
											class="checkbox" type="checkbox" checked> Schedule
											meeting for next week
										</label>
									</div> <i class="remove typcn typcn-delete-outline"></i>
								</li>
								<li class="completed">
									<div class="form-check">
										<label class="form-check-label"> <input
											class="checkbox" type="checkbox" checked> Project
											review
										</label>
									</div> <i class="remove typcn typcn-delete-outline"></i>
								</li>
							</ul>
						</div>
						<div class="events py-4 border-bottom px-3">
							<div class="wrapper d-flex mb-2">
								<i class="typcn typcn-media-record-outline text-primary mr-2"></i>
								<span>Feb 11 2018</span>
							</div>
							<p class="mb-0 font-weight-thin text-gray">Creating component
								page</p>
							<p class="text-gray mb-0">build a js based app</p>
						</div>
						<div class="events pt-4 px-3">
							<div class="wrapper d-flex mb-2">
								<i class="typcn typcn-media-record-outline text-primary mr-2"></i>
								<span>Feb 7 2018</span>
							</div>
							<p class="mb-0 font-weight-thin text-gray">Meeting with Alisa</p>
							<p class="text-gray mb-0 ">Call Sarah Graves</p>
						</div>
					</div>
					<!-- To do section tab ends -->
					<div class="tab-pane fade" id="chats-section" role="tabpanel"
						aria-labelledby="chats-section">
						<div
							class="d-flex align-items-center justify-content-between border-bottom">
							<p
								class="settings-heading border-top-0 mb-3 pl-3 pt-0 border-bottom-0 pb-0">Friends</p>
							<small
								class="settings-heading border-top-0 mb-3 pt-0 border-bottom-0 pb-0 pr-3 font-weight-normal">See
								All</small>
						</div>
						<ul class="chat-list">
							<li class="list active">
								<div class="profile">
									<img src="../../images/faces/face1.jpg" alt="image"><span
										class="online"></span>
								</div>
								<div class="info">
									<p>Thomas Douglas</p>
									<p>Available</p>
								</div> <small class="text-muted my-auto">19 min</small>
							</li>
							<li class="list">
								<div class="profile">
									<img src="../../images/faces/face2.jpg" alt="image"><span
										class="offline"></span>
								</div>
								<div class="info">
									<div class="wrapper d-flex">
										<p>Catherine</p>
									</div>
									<p>Away</p>
								</div>
								<div class="badge badge-success badge-pill my-auto mx-2">4</div>
								<small class="text-muted my-auto">23 min</small>
							</li>
							<li class="list">
								<div class="profile">
									<img src="../../images/faces/face3.jpg" alt="image"><span
										class="online"></span>
								</div>
								<div class="info">
									<p>Daniel Russell</p>
									<p>Available</p>
								</div> <small class="text-muted my-auto">14 min</small>
							</li>
							<li class="list">
								<div class="profile">
									<img src="../../images/faces/face4.jpg" alt="image"><span
										class="offline"></span>
								</div>
								<div class="info">
									<p>James Richardson</p>
									<p>Away</p>
								</div> <small class="text-muted my-auto">2 min</small>
							</li>
							<li class="list">
								<div class="profile">
									<img src="../../images/faces/face5.jpg" alt="image"><span
										class="online"></span>
								</div>
								<div class="info">
									<p>Madeline Kennedy</p>
									<p>Available</p>
								</div> <small class="text-muted my-auto">5 min</small>
							</li>
							<li class="list">
								<div class="profile">
									<img src="../../images/faces/face6.jpg" alt="image"><span
										class="online"></span>
								</div>
								<div class="info">
									<p>Sarah Graves</p>
									<p>Available</p>
								</div> <small class="text-muted my-auto">47 min</small>
							</li>
						</ul>
					</div>
					<!-- chat tab ends -->
				</div>
			</div>
			<!-- partial -->
			<!-- partial:partials/_sidebar.html -->
			<%@include file="../../template/menu.jsp"%>
			<!-- partial -->
			<div class="main-panel">
				<div class="content-wrapper">
				<!--  -->
					<div class="row">
						<div class="card-body">

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
										<option value="Moto" >Moto</option>
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

					function hidepopup() {
						document.getElementById("popup").style.display = 'none';
						document.getElementById("popupAjouter").style.display = 'none';
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
														data : 'numero',
														"title" : "Numero"
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
						style="float: right;" onclick="pupupajouter()">Ajouter Place</button>
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

