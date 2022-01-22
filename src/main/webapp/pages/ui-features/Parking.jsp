<%@page import="beans.Users"%>
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
<script
	src="https://cdnjs.cloudflare.com/ajax/libs/Chart.js/2.4.0/Chart.min.js"></script>

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

<script src="https://kit.fontawesome.com/a076d05399.js"></script>

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
						<h4 class="mb-0">Gestion Parking</h4>
					</li>
					<li class="nav-item">
						<div class="d-flex align-items-baseline">
							<p class="mb-0">Home</p>
							<i class="typcn typcn-chevron-right"></i>
							<p class="mb-0">Statistiques Parking</p>
						</div>
					</li>
				</ul>
				<ul class="navbar-nav navbar-nav-right">
					<li class="nav-item nav-search d-none d-md-block mr-0"></li>
				</ul>
			</div>
		</nav>
		<div class="container-fluid page-body-wrapper">
			<!-- partial:partials/_settings-panel.html -->

			<!-- partial -->
			<!-- partial:partials/_sidebar.html -->
			<%@include file="../../template/menu.jsp"%>
			<!-- partial -->
			<div class="main-panel">
				<div class="content-wrapper">
					<!--  -->
					<div class="content-wrapper">
						<!-- ********************************** -->



						<!-- ******************************************************************** -->
						<div class="container">
							<div class="row">
								<div class="col">
									<div style="margin-top: 60px; background-color: #FFFFFF">
										<h4 class="card-title text-center">Etat D'Occupation du
											parking</h4>
										<div class="chart"
											style="justify-content: center; position: relative; height: 70vh">
											<canvas id="myChartetat"></canvas>
										</div>
									</div>
								</div>
							</div>

							<div class="row">
								<div class="col">
									<div style="margin-top: 60px; background-color: #FFFFFF" cla>
										<h4 class="card-title text-center">Etat Etages</h4>
										<div class="chart"
											style="justify-content: center; position: relative; height: 80vh">
											<canvas id="myChartetatEtage"></canvas>
										</div>
									</div>
								</div>
							</div>
							<div class="row">
								<div class="col">
									<div style="margin-top: 60px; background-color: #FFFFFF" cla>
										<h4 class="card-title text-center">Etat Sections</h4>
										<div class="chart"
											style="justify-content: center; position: relative; height: 80vh">
											<canvas id="myChart"></canvas>
										</div>
									</div>
								</div>
							</div>


							<!--  -->

							<!-- **************************************************************** -->

						</div>

					</div>
					<!--  -->
				</div>
			</div>

		</div>

		<script src="jquery.waypoints.min.js"></script>

		<script type="text/javascript">
			//

			//
			const ctx = document.getElementById("myChart").getContext("2d");
			const ctx1 = document.getElementById("myChartetat").getContext("2d");
			const gretage = document.getElementById("myChartetatEtage").getContext("2d");
			//
			$(document).ready(function() {
				graphEtage();
				graph();
				graphEtatParking();
			});
			function graph() {

				$
						.ajax({
							url : "../../PlaceServellet",
							data : {
								op : "parck",
							//id : id,numero,type,section,

							},
							type : 'POST',
							success : function(da, textStatus, jqXHR) {
								//
								$
										.ajax({
											url : "../../PlaceServellet",
											data : {
												op : "parckpro",
											//id : id,numero,type,section,

											},
											type : 'POST',
											success : function(dat, textStatus,
													jqXHR) {
												//alert(dat);
												const data = {
													labels : da,
													datasets : [ {
														label : "Etat d'occupation du section en /100 ",
														backgroundColor : ['rgb(255,99, 132,0.7)','rgb(255,159, 64,0.7)','rgb(75,192,192,0.7)','rgb(54,162, 235,0.7)','rgb(153, 102, 255,0.7)'],
														borderColor : ['rgb(255,99, 132,1)','rgb(255,159, 64,1)','rgb(75,192,192,1)','rgb(54,162, 235,1)','rgb(153, 102, 255,1)'],
														borderWidth :1,
														data : dat,
													} ]
												};
												const config = {//line ,bar, radar, doughnut and pie,polar area,bubble,scatter
													type : 'bar',
													data,
													options : {
														responsive : true,
														maintainAspectRatio : false,
														scales: {
															y: {
																beginAtZero: true,
																min: 0,
																max: 100,
																ticks: {
																	stepSize: 1
																}
															}
														}
													}
												};
												const mychart = new Chart(ctx,
														config);
											}
										});
								//

								//
							},
							error : function(jqXHR, textStatus, errorThrown) {
								alert("erreur !!! ");

							}
						});

			}
			//

			var pieOptions = {
				segmentShowStroke : false,
				animateScale : false
			}

			//graph etat Etage 
			function graphEtage() {

				$
						.ajax({
							url : "../../PlaceServellet",
							data : {
								op : "parckM",
							//id : id,numero,type,section,

							},
							type : 'POST',
							success : function(da, textStatus, jqXHR) {
								//
								$
										.ajax({
											url : "../../PlaceServellet",
											data : {
												op : "parkEtage",
											//id : id,numero,type,section,

											},
											type : 'POST',
											success : function(dat, textStatus,
													jqXHR) {
												//alert(dat);
												const data = {
													labels : da,
													datasets : [ {
														label : "Etat d'occupation Etage /100",
														backgroundColor : ['rgb(255,159, 64,0.4)','rgb(255,99, 132,0.4)','rgb(54,162, 235,0.4)','rgb(75,192,192,0.4)','rgb(153, 102, 255,0.4)'],
														borderColor : ['rgb(255,159, 64,1)','rgb(255,99, 132,1)','rgb(54,162, 235,1)','rgb(75,192,192,1)','rgb(153, 102, 255,1)'],
														borderWidth :1,

														data : dat,
													} ]
												};
												const config = {//line ,bar, radar, doughnut and pie,polar area,bubble,scatter
													type : 'bar',
													data:data,
													options: {
														responsive : true,
														maintainAspectRatio : false,
														scales: {
															y: {
																beginAtZero: true,
																min: 0,
																max: 100,
																ticks: {
																	stepSize: 5,
																}
															}
														}
													},
												};
												const mychart = new Chart(gretage,
														config);
											}
										});
								//

								//
							},
							error : function(jqXHR, textStatus, errorThrown) {
								alert("erreur !!! ");

							}
						});

			}
			//

			


			//end graph etat Etage
			function graphEtatParking() {

				$
						.ajax({
							url : "../../PlaceServellet",
							data : {
								op : "parcketatrest",
							//id : id,numero,type,section,

							},
							type : 'POST',
							success : function(rest, textStatus, jqXHR) {
								//
								$
										.ajax({
											url : "../../PlaceServellet",
											data : {
												op : "parcketat",
											//id : id,numero,type,section,

											},
											type : 'POST',
											success : function(etatt,
													textStatus, jqXHR) {
												//alert(dat);
												var nem = etatt - rest;
												const data = {
													labels : [ "Place Occupée",
															"Place Vide" ],
													datasets : [ {
														label : "Etat d'occupation du chaque section au parking",

														backgroundColor : [
																"#FF4136",
																"#FFFFFF" ],
														borderColor : '#844fc1',

														data : [ rest, nem ],
													} ]
												};
												const config = {//line ,bar, radar, doughnut and pie,polar area,bubble,scatter
													type : 'pie',
													data : data,
													options : {
														responsive : true,
														maintainAspectRatio : false,
													},
												};
												const mychart = new Chart(ctx1,
														config);
											}
										});
								//

								//
							},
							error : function(jqXHR, textStatus, errorThrown) {
								alert("erreur !!! ");

							}
						});

			}

			//
			function remplir(data) {
				var labels = "['";
				data.forEach(function(e) {
					labels += "" + e.code + "',";
					//alert(e.code)
				});
				labels += "];"

				return labels;
			};
			//alert (remplir());
			//
		</script>
		<%@include file="../../template/footer.jsp"%>

	</div>

	</div>

	</div>

	<!--  <script src="https://cdnjs.cloudflare.com/ajax/libs/Chart.js/3.5.1/chart.min.js" 
		crossorigin="anonymos" referrerpolicy="no-referrer"></script>-->

	<script src="../../vendors/js/vendor.bundle.base.js"></script>
	<!-- endinject -->
	<!-- Plugin js for this page-->
	<script
		src="http://cdnjs.cloudflare.com/ajax/libs/waypoints/2.0.3/waypoints.min.js"></script>
	<script src="jquery.counterup.min.js"></script>

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

