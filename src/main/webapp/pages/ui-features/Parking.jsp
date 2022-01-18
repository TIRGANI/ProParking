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
	response.sendRedirect("/TIRGANI_parking_V00/Login.jsp");
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
					<div class="content-wrapper">
						<!-- ******************************************************************** -->
						<div style="margin-top: 60px; background-color: #FFFFFF">
						<h4 class="card-title text-center">Etat D'Occupation du parking</h4>
							<div class="chart"
								style="justify-content: center; position: relative; height: 70vh">
								<canvas id="myChartetat"></canvas>
							</div>
						</div>
						<div style="margin-top: 60px; background-color: #FFFFFF">
						<h4 class="card-title text-center">Etat De chaque Section</h4>
						<div class="chart" style="justify-content: center; position: relative; height: 80vh">
							<canvas id="myChart"></canvas>
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
	<script type="text/javascript">
	//

	//
		const ctx = document.getElementById("myChart").getContext("2d");
		const ctx1 = document.getElementById("myChartetat").getContext("2d");
		//
		$(document).ready(function() {
			
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
													label : "Etat d'occupation du chaque section au parking",
													backgroundColor : 'rgb(255, 99, 132)',
													borderColor : '#844fc1',

													data : dat,
												} ]
											};
											const config = {//line ,bar, radar, doughnut and pie,polar area,bubble,scatter
												type : 'bar',
												data : data,
												options : {
													responsive : true,
													maintainAspectRatio:false,
												},
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
			animateScale : true
		}

		//
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
										success : function(etatt, textStatus,
												jqXHR) {
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
													maintainAspectRatio:false,
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

