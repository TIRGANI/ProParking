<%@page import="beans.Place"%>
<%@page import="service.PlaceService"%>
<%@page import="beans.Section"%>
<%@page import="service.SectionService"%>
<%@page import="beans.Etage"%>
<%@page import="service.EtageService"%>
<%@page import="java.util.List"%>
<%@page import="service.UsersService"%>
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
					<a href="https://tirgani.com/"><i class="typcn typcn-mail"></i></a>
				</div>
			</div>
			<div
				class="navbar-menu-wrapper d-flex align-items-center justify-content-end">
				<ul class="navbar-nav mr-lg-2">
					<li class="nav-item ml-0">
						<h4 class="mb-0">Gestion Etagers</h4>
					</li>
					<li class="nav-item">
						<div class="d-flex align-items-baseline">
							<p class="mb-0">Home</p>
							<i class="typcn typcn-chevron-right"></i>
							<p class="mb-0">gérer vos Etages</p>
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

					<div class="row">
						<!-- modif -->

						<div class="card-body">
							<div id="popup" class="p-3 mb-2 bg-primary text-white"
								style="display: none; position: fixed; transform: translate(20%, -10%) scale(1); transition: 200ms ease-in-out; boder: 2px solid black; border-radius: 5px; z-index: 10; background-color: #cbc6c6; width: 600px; height: 200px; max-width: 80%;">

								<h4 class="card-title text-center">Modifier Etage</h4>

								<form class="forms-sample"
									action="../../EtageServelett?op=update" method="post">
									<input type="hidden" name="id" id="id" />
									<div class="input-group mb-3">
										<div class="input-group-prepend">
											<span class="input-group-text "
												style="color: black; width: 100px" id="basic-addon1">Code</span>
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

								<h4 class="card-title text-center">Ajouter Etage</h4>

								<form class="forms-sample" action="../../EtageServelett?op=ajou"
									method="post">
									<input type="hidden" name="id" id="id" />
									<div class="input-group mb-3">
										<div class="input-group-prepend">
											<span class="input-group-text "
												style="color: black; width: 100px" id="basic-addon1">Code</span>
										</div>
										<input type="text" class="form-control" aria-label="Username"
											name="code" id="code" aria-describedby="basic-addon1">
									</div>





									<div style="float: right; margin-top: 30px">
										<button type="submit" class="btn btn-success  mr-2">Ajouter</button>
										<button type="button" onclick="hidepopup()"
											class="btn btn-light">Annuler</button>
									</div>


								</form>
							</div>
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

									document.getElementById("id").value = this.cells[0].innerHTML;
									document.getElementById("code").value = this.cells[1].innerHTML;

								}

							}
							//--------------------------------

						}

						function hidepopup() {
							document.getElementById("popup").style.display = 'none';
							document.getElementById("popupajouter").style.display = 'none';
						}
						function pupupajouter() {
							document.getElementById("popupajouter").style.display = 'block';
						}
					</script>

					<!-- ***************************************** -->
					<div>
						<button type="button" class="btn btn-primary mr-2 btn-lg"
							style="float: right;" onclick="pupupajouter()">Ajouter
							Etage</button>
						<h4 style="margin-left: 10px">Liste des Etages</h4>
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
										<th>Etat d'occupation</th>
										<th>nembre de section</th>
										<th></th>
										<th></th>

									</tr>
								</thead>

								<tbody id="content">
									<input name="operation" type="hidden" value="xm234jq">

									<%
									 PlaceService ps = new PlaceService();
									SectionService ms = new SectionService();
									List<Section> sectionss = ms.findAll();
									EtageService mss = new EtageService();
									List<Etage> etages = mss.findAll();
									for (Etage etage : etages) {
									%>
									<tr>
										<td><%=etage.getId()%></td>
										<td><%=etage.getCode()%></td>

										<td>
											<%
											
										

				

					int etat = 0;
					int cpt = 0;
					
					for (Section section : sectionss) {

						if (section.getEtage() == etage.getId()) {
							PlaceService pss = new PlaceService();
							List<Place> places = ps.findAll();

							for (Place p : places) {
								if (p.getIdsection() == section.getId()) {
									cpt++;
									if (p.getEtat().equals("Occupee")) {
										etat++;
									}
								}
							}

						}

					}
										//
										//	System.out.println(etage.getCode() + " -||cpt  : " + cpt + " -etat : " + etat);
											if (etat == 0) {//success|danger

												out.print(
												"<div class='progress'><div class='progress-bar bg-success' role='progressbar' style='width: 0%' aria-valuenow='75' aria-valuemin='0' aria-valuemax='100'></div></div><div style='margin-top:6px'>"
														+ etat + " %</div> <td> " + cpt + " sections </td> ");
											}

											else {

												//	out.print(" <div class='progress-bar bg-danger' role='progressbar' style='width: 100%' aria-valuenow='75' aria-valuemin='0' aria-valuemax='100'>");
												if ((etat * 100 / cpt) > 0 && (etat * 100 / cpt) <= 35) {
													out.print("<div class='progress'><div class='progress-bar bg-success' role='progressbar' style='width: "
													+ (etat * 100 / cpt)
													+ "%' aria-valuenow='75' aria-valuemin='0' aria-valuemax='100'></div></div><div style='margin-top:6px'>"
													+ (etat * 100 / cpt) + " % </div><td> " + etat + " sections </td> ");
												}
												if ((etat * 100 / cpt) > 35 && (etat * 100 / cpt) <= 65) {
													out.print("<div class='progress'><div class='progress-bar bg-warning' role='progressbar' style='width: "
													+ (etat * 100 / cpt)
													+ "%' aria-valuenow='75' aria-valuemin='0' aria-valuemax='100'></div></div><div style='margin-top:6px'>"
													+ (etat * 100 / cpt) + " % </div><td> " + etat + " sections </td> ");
												}
												if ((etat * 100 / cpt) > 65 && (etat * 100 / cpt) <= 100) {
													out.print("<div class='progress'><div class='progress-bar bg-danger' role='progressbar' style='width: "
													+ (etat * 100 / cpt)
													+ "%' aria-valuenow='75' aria-valuemin='0' aria-valuemax='100'></div></div><div style='margin-top:6px'>"
													+ (etat * 100 / cpt) + " % </div><td> " + etat + " place </td> ");
												}
											}
											//	out.print("<div class='progress'><div class='progress-bar bg-success' role='progressbar' style='width: "+etat * 100 / cpt+"%' aria-valuenow='75' aria-valuemin='0' aria-valuemax='100'></div></div><div style='margin-top:6px'>"+etat * 100 / cpt+ " % </div><td> " + cpt + " place </td> ");	
											//out.print(etat * 100 / cpt+ " % <td>" + cpt + " place </td>");
											%>
											</div>
										</td>

										<td>

											<button type="button" class="btn btn-success btn-sm"
												onclick="showpopup();">Modifier</button>
										</td>

										<td>
											<form class="forms-sample"
												action="../../EtageServelett?op=delete&id=<%=etage.getId()%>"
												method="post">
												<input type="hidden" name="id">
												<button type="submit" class="btn btn-danger btn-sm">Supprimer</button>

											</form>
										</td>

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

