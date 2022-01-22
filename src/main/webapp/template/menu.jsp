<%@page import="beans.Users"%>

<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>

<nav class="sidebar sidebar-offcanvas" id="sidebar">
	<ul class="nav">
		<%
		HttpSession sess = request.getSession();

		if (sess.getAttribute("user") != null) {
			Users c1 = (Users) sess.getAttribute("user");
			//System.out.println(c1.getRole());
			if (c1.getRole().equals("Administrateur")) {
		%>
		<div style="margin-bottom: 20px">
		Espace Administrateur
		</div>
		<%
			}else{
				%>
				<div style="margin-bottom: 20px">
		Espace User
		</div>
				<% 
			}
				}
		%>
		<li class="nav-item"><a class="nav-link"
			href="/pages/ui-features/Parking.jsp"> <i
				class="typcn typcn-device-desktop menu-icon"></i> <span
				class="menu-title">Dashboard</span>
				<div class="badge badge-danger">new</div>
		</a></li>
		
		<li class="nav-item"><a class="nav-link"
			href="/pages/ui-features/etages.jsp"><i
				class="typcn typcn-download menu-icon"></i> <span
				class="menu-title">Gestion Etage</span>
		</a></li>
		<!--  -->
		<!--  -->
		<li class="nav-item"><a class="nav-link"
			href="/pages/ui-features/section.jsp"><i class="typcn typcn-flow-children menu-icon"></i> <span
				class="menu-title">Gestion Section</span>
		</a></li>
		
		<!--  -->
		<li class="nav-item"><a class="nav-link"
			href="/pages/ui-features/Place.jsp"><i
				class="typcn typcn-beaker menu-icon"></i> <span
				class="menu-title">Gestion Place</span>
		</a></li>
		<!--  -->
		<%
		if (sess.getAttribute("user") != null) {
			Users c1 = (Users) sess.getAttribute("user");
			//System.out.println(c1.getRole());
			if (c1.getRole().equals("Administrateur")) {
		%>
		<li class="nav-item"><a class="nav-link"
			href="/pages/ui-features/Users.jsp"><i
				class="typcn typcn-user-add menu-icon"></i> <span
				class="menu-title">Gestion Personnel</span>
		</a></li>
	
		<%
		}
		}
		%>
		<!--  -->
		
	<li class="nav-item"><a class="nav-link"
			href="/pages/ui-features/Parking.jsp"> <i class="typcn typcn-chart-pie-outline menu-icon"></i> <span
				class="menu-title">Statistique
							Parking</span>
		</a></li>

		<form class="nav-item" action="../../TestServlette?op=logout"
			method="post"  style="margin-top: 40px">
			<input type="submit" value="Logout" class="btn btn-primary me-md-2 btn-sm">
		</form>




	</ul>
</nav>