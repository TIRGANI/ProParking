<%@page import="beans.Users"%>
<%@page import="beans.Place"%>
<%@page import="service.PlaceService"%>
<%@page import="java.util.List"%>
<%@page import="beans.Section"%>
<%@page import="service.SectionService"%>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
	 
        <%
         
        HttpSession sessio = request.getSession();
        Users  c = (Users) sessio.getAttribute("user");
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
<script src="script/jquery-3.3.1.min.js" type="text/javascript"></script>
<!-- endinject -->
<!-- plugin css for this page -->
<!-- End plugin css for this page -->
<!-- inject:css -->
<link rel="stylesheet" href="../../css/vertical-layout-light/style.css">
<!-- endinject -->
<link rel="shortcut icon" href="../../images/favicon.png" />


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

					<div class="row">
						<!-- modif -->

						<div class="card-body">
							<div id="popup" class="p-3 mb-2 bg-primary text-white"
								style="display: none; position: fixed; transform: translate(20%, -10%) scale(1); transition: 200ms ease-in-out; boder: 2px solid black; border-radius: 5px; z-index: 10; background-color: #cbc6c6; width: 600px; height: 200px; max-width: 80%;">

								<h4 class="card-title text-center">Modifier section</h4>

								<form class="forms-sample"
									action="../../TestServlette?op=modpro" method="post">
									<input type="hidden" name="id" id="id" />
									<div class="input-group mb-3">
										<div class="input-group-prepend">
											<span class="input-group-text " style="color: black;"
												id="basic-addon1">Code</span>
										</div>
										<input type="text" class="form-control" aria-label="Username"
											name="code" id="code" aria-describedby="basic-addon1">
									</div>
									<div style="float: right; margin-top: 30px">
										<button type="submit" class="btn btn-success  mr-2">Modifier</button>
										<button type="button" onclick="hidepopup()"
											class="btn btn-light">Annuler</button>
									</div>
							</div>

							</form>
						</div>
					</div>
					<!-- ajouter Section  -->
					<div class="row">
						<!-- modif -->

						<div class="card-body">
							<div id="popupajouter" class="p-3 mb-2 bg-primary text-white"
								style="display: none; position: fixed; transform: translate(20%, -10%) scale(1); transition: 200ms ease-in-out; boder: 2px solid black; border-radius: 5px; z-index: 10; background-color: #cbc6c6; width: 600px; height: 200px; max-width: 80%;">

								<h4 class="card-title text-center">Ajouter section</h4>

								<form class="forms-sample"
									action="../../TestServlette?op=ajouter" method="post">
									<input type="hidden" name="id" id="id" />
									<div class="input-group mb-3">
										<div class="input-group-prepend">
											<span class="input-group-text " style="color: black;"
												id="basic-addon1">Code</span>
										</div>
										<input type="text" class="form-control" aria-label="Username"
											name="code" id="code" aria-describedby="basic-addon1">
									</div>
									<div style="float: right; margin-top: 30px">
										<button type="submit" class="btn btn-success  mr-2">Ajouter</button>
										<button type="button" onclick="hidepopup()"
											class="btn btn-light">Annuler</button>
									</div>
							</div>

							</form>
						</div>
					</div>
					<!-- ***************************************** -->
					<script type="text/javascript">
						window.onload = function() {
							document.getElementById("popup").style.display = 'none';
						};

						function showpopup() {
							document.getElementById("popup").style.display = 'block';

							for (var i = 0; i < table.rows.length; i++) {
								table.rows[i].onclick = function() {

									document.getElementById("code").value = this.cells[1].innerHTML;
									document.getElementById("id").value = this.cells[0].innerHTML;

								}

							}
							//--------------------------------

						}

						function hidepopup() {
							document.getElementById("popup").style.display = 'none';
							document.getElementById("popupajouter").style.display = 'none';
						}
						function pupupajouter()
						{
							document.getElementById("popupajouter").style.display = 'block';
						}
					</script>

					<!-- ***************************************** -->
					<div>
						<button type="button" class="btn btn-primary mr-2 btn-lg"
							style="float: right;" onclick="pupupajouter()">Ajouter
							Section</button>
						<h4 style="margin-left: 10px">Liste des Section</h4>
					</div>
					</div>
					<div class="col-md-12" style="margin-top: 20px">

						<div class="card">
							<div class="table-responsive pt-3 farrii">

								<table id="table"
									class="table table-striped project-orders-table">
									<thead>
										<tr>
											<th class="ml-5">ID</th>
											<th>Code</th>
											<th>Etat d'Occupation</th>
											<th>nbr du place</th>
											<th></th>
											<th></th>


										</tr>
									</thead>

									<tbody id="content">
										<input name="operation" type="hidden" value="xm234jq">

										<%
											SectionService ms = new SectionService();

											List<Section> sections = ms.findAll();
											for (Section section : sections) {
											%>
										<tr>
											<td><%=section.getId()%></td>
											<td><%=section.getCode()%></td>
											<td>
												<%
												
													PlaceService ps = new PlaceService();
													List<Place> places = ps.findAll();
													int cpt = 0;
													int etat = 0;
													for (Place p : places) {
														if (p.getIdsection() == section.getId()) {
															cpt++;
															if (p.getEtat().equals("Occupee")) {
														etat++;
															}
														}
													}

													if (etat == 0 ) {//success|danger
														
														out.print("<div class='progress'><div class='progress-bar bg-success' role='progressbar' style='width: 0%' aria-valuenow='75' aria-valuemin='0' aria-valuemax='100'></div></div><div style='margin-top:6px'>"+etat + " %</div> <td> " + cpt + " place </td> ");
													} 
													
													
													else
													{
													//	out.print(" <div class='progress-bar bg-danger' role='progressbar' style='width: 100%' aria-valuenow='75' aria-valuemin='0' aria-valuemax='100'>");
													if((etat * 100 / cpt)>0 &&(etat * 100 / cpt)<=35  )
													{
														out.print("<div class='progress'><div class='progress-bar bg-success' role='progressbar' style='width: "+etat * 100 / cpt+"%' aria-valuenow='75' aria-valuemin='0' aria-valuemax='100'></div></div><div style='margin-top:6px'>"+etat * 100 / cpt+ " % </div><td> " + cpt + " place </td> ");
													}
													if((etat * 100 / cpt)>35 && (etat * 100 / cpt)<=65)
													{
														out.print("<div class='progress'><div class='progress-bar bg-warning' role='progressbar' style='width: "+etat * 100 / cpt+"%' aria-valuenow='75' aria-valuemin='0' aria-valuemax='100'></div></div><div style='margin-top:6px'>"+etat * 100 / cpt+ " % </div><td> " + cpt + " place </td> ");
													}
													if((etat * 100 / cpt)>65 && (etat * 100 / cpt)<=100)
													{
														out.print("<div class='progress'><div class='progress-bar bg-danger' role='progressbar' style='width: "+etat * 100 / cpt+"%' aria-valuenow='75' aria-valuemin='0' aria-valuemax='100'></div></div><div style='margin-top:6px'>"+etat * 100 / cpt+ " % </div><td> " + cpt + " place </td> ");
													}
													}
													//	out.print("<div class='progress'><div class='progress-bar bg-success' role='progressbar' style='width: "+etat * 100 / cpt+"%' aria-valuenow='75' aria-valuemin='0' aria-valuemax='100'></div></div><div style='margin-top:6px'>"+etat * 100 / cpt+ " % </div><td> " + cpt + " place </td> ");	
													//out.print(etat * 100 / cpt+ " % <td>" + cpt + " place </td>");
													%>
												</div>
											</td>


											<td>
												<!--  <a
													href="../../TestServlette?id=<%=section.getId()%>&op=update"><button
															type="button" class="btn btn-success btn-sm" onclick="showpopup();">Modifier</button></a>
															-->
												<button type="button" class="btn btn-success btn-sm"
													onclick="showpopup();">Modifier</button>
											</td>

											<td><a
												href="../../TestServlette?id=<%=section.getId()%>&op=delete"><button
														type="button" class="btn btn-danger btn-sm">Supprimer</button></a></td>




											<%
											}
											%>


										</tr>
									</tbody>

								</table>
							</div>
						</div>
					</div>
				</div>

			</div>

		</div>
		<%@include file="../../template/footer.jsp"%>
		<!-- main-panel ends -->
	</div>
	<!-- page-body-wrapper ends -->
	</div>
	<!-- container-scroller -->

	<!-- base:js -->
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

