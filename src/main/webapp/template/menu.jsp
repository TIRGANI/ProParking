<%@page import="beans.Users"%>

<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>

<nav class="sidebar sidebar-offcanvas" id="sidebar">
	<ul class="nav">
		<li class="nav-item"><a class="nav-link"
			href="/TIRGANI_parking_V00/index.jsp"> <i
				class="typcn typcn-device-desktop menu-icon"></i> <span
				class="menu-title">Dashboard</span>
				<div class="badge badge-danger">new</div>
		</a></li>
		<li class="nav-item"><a class="nav-link" data-toggle="collapse"
			href="#ui-basic" aria-expanded="false" aria-controls="ui-basic">
				<i class="typcn typcn-chart-pie-outline menu-icon"></i> <span
				class="menu-title">Gestion Parking</span> <i class="menu-arrow"></i>
		</a>
			<div class="collapse" id="ui-basic">
				<ul class="nav flex-column sub-menu">

					<li class="nav-item"><a class="nav-link"
						href="/TIRGANI_parking_V00/pages/ui-features/Parking.jsp">Statistique
							Parking</a></li>

				</ul>
			</div></li>
		<li class="nav-item"><a class="nav-link" data-toggle="collapse"
			href="#ui-basic" aria-expanded="false" aria-controls="ui-basic">
				<i class="typcn typcn-document-text menu-icon"></i> <span
				class="menu-title">Gestion Section</span> <i class="menu-arrow"></i>
		</a>
			<div class="collapse" id="ui-basic">
				<ul class="nav flex-column sub-menu">

					<li class="nav-item"><a class="nav-link"
						href="/TIRGANI_parking_V00/pages/ui-features/section.jsp">G�rer
							Vos Section</a></li>

				</ul>
			</div></li>
		<li class="nav-item"><a class="nav-link" data-toggle="collapse"
			href="#form-elements" aria-expanded="false"
			aria-controls="form-elements"> <i
				class="typcn typcn-film menu-icon"></i> <span class="menu-title">Gestion
					Place</span> <i class="menu-arrow"></i>
		</a>

			<div class="collapse" id="form-elements">
				<ul class="nav flex-column sub-menu">
					<li class="nav-item"><a class="nav-link"
						href="/TIRGANI_parking_V00/pages/ui-features/Place.jsp">Gerer
							Vos place </a></li>
				</ul>
			</div></li>

		<%
		HttpSession sess = request.getSession();

		if (sess.getAttribute("user") != null) {
			Users c1 = (Users) sess.getAttribute("user");
			//System.out.println(c1.getRole());
			if (c1.getRole().equals("Administrateur")) {
		%>
		<li class="nav-item"><a class="nav-link" data-toggle="collapse"
			href="#form-elements" aria-expanded="false"
			aria-controls="form-elements"> <i
				class="typcn typcn-film menu-icon"></i> <span class="menu-title">Gestion
					Personnel</span> <i class="menu-arrow"></i>
		</a>

			<div class="collapse" id="form-elements">
				<ul class="nav flex-column sub-menu">
					<li class="nav-item"><a class="nav-link"
						href="/TIRGANI_parking_V00/pages/ui-features/Users.jsp">Gerer
							Vos Utilisateurs </a></li>
				</ul>
			</div></li>
		<%
		}
		}
		%>

		<form class="nav-item" action="../../TestServlette?op=logout"
			method="post">
			<input type="submit" value="Logout" class="btn btn-primary me-md-2 ">
		</form>






		<!--   <li class="nav-item">
            <a class="nav-link" data-toggle="collapse" href="#charts" aria-expanded="false" aria-controls="charts">
              <i class="typcn typcn-chart-pie-outline menu-icon"></i>
              <span class="menu-title">Charts</span>
              <i class="menu-arrow"></i>
            </a>
            <div class="collapse" id="charts">
              <ul class="nav flex-column sub-menu">
                <li class="nav-item"> <a class="nav-link" href="pages/charts/chartjs.html">ChartJs</a></li>
              </ul>
            </div>
          </li>
          <li class="nav-item">
            <a class="nav-link" data-toggle="collapse" href="#tables" aria-expanded="false" aria-controls="tables">
              <i class="typcn typcn-th-small-outline menu-icon"></i>
              <span class="menu-title">Tables</span>
              <i class="menu-arrow"></i>
            </a>
            <div class="collapse" id="tables">
              <ul class="nav flex-column sub-menu">
                <li class="nav-item"> <a class="nav-link" href="pages/tables/basic-table.html">Basic table</a></li>
              </ul>
            </div>
          </li>
          <li class="nav-item">
            <a class="nav-link" data-toggle="collapse" href="#icons" aria-expanded="false" aria-controls="icons">
              <i class="typcn typcn-compass menu-icon"></i>
              <span class="menu-title">Icons</span>
              <i class="menu-arrow"></i>
            </a>
            <div class="collapse" id="icons">
              <ul class="nav flex-column sub-menu">
                <li class="nav-item"> <a class="nav-link" href="pages/icons/mdi.html">Mdi icons</a></li>
              </ul>
            </div>
          </li>
          <li class="nav-item">
            <a class="nav-link" data-toggle="collapse" href="#auth" aria-expanded="false" aria-controls="auth">
              <i class="typcn typcn-user-add-outline menu-icon"></i>
              <span class="menu-title">User Pages</span>
              <i class="menu-arrow"></i>
            </a>
            <div class="collapse" id="auth">
              <ul class="nav flex-column sub-menu">
                <li class="nav-item"> <a class="nav-link" href="pages/samples/login.html"> Login </a></li>
                <li class="nav-item"> <a class="nav-link" href="pages/samples/register.html"> Register </a></li>
              </ul>
            </div>
          </li>
          <li class="nav-item">
            <a class="nav-link" data-toggle="collapse" href="#error" aria-expanded="false" aria-controls="error">
              <i class="typcn typcn-globe-outline menu-icon"></i>
              <span class="menu-title">Error pages</span>
              <i class="menu-arrow"></i>
            </a>
            <div class="collapse" id="error">
              <ul class="nav flex-column sub-menu">
                <li class="nav-item"> <a class="nav-link" href="pages/samples/error-404.html"> 404 </a></li>
                <li class="nav-item"> <a class="nav-link" href="pages/samples/error-500.html"> 500 </a></li>
              </ul>
            </div>
          </li>
          <li class="nav-item">
            <a class="nav-link" href="https://bootstrapdash.com/demo/polluxui-free/docs/documentation.html">
              <i class="typcn typcn-mortar-board menu-icon"></i>
              <span class="menu-title">Documentation</span>
            </a>
          </li>
          -->
	</ul>
</nav>