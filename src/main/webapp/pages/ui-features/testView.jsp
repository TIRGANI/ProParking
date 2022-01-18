<%@page import="org.eclipse.jdt.internal.compiler.ast.ForeachStatement"%>
<%@page import="beans.Section"%>
<%@page import="org.apache.jasper.tagplugins.jstl.core.ForEach"%>
<%@page import="service.SectionService"%>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Insert title here</title>
</head>
<body>

bien Enregistrer!!!! 
<br>
<!--declarion java  -->
<%
	SectionService l=(SectionService) request.getAttribute("listeSection");
for(Section sc : l.findAll())
{
	out.println(sc.getCode());
	%>
	<br>
	<%
}
	
	
%>



</body>
</html>