<%@page import="com.cmc.practica1.objetoU"%>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%><%@page import="jdk.nashorn.internal.ir.WhileNode"%>
<%@ include file ="includecbtf.jsp" %>
<%@ page import="com.ibm.dse.base.Hashtable"%>
<%@ page import="java.util.Vector"%>
<%@ page import="java.util.Enumeration"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Insert title here</title>
</head>
<body class="container-fluid">

<h1 class="card-title">Datos del formulario</h1>
	<div class="card h-100"; style="left: 15%;">
		<table>
			<thead>
				<tr class="table-primary">
					<th>No°</th>
					<th>Name</th>
					<th>Last Name</th>
					<th>Number</th>
					<th>Email</th>
					
				</tr>
			</thead>
			<tbody>
				<tr>
					<th scope="row">1</th>
					<td><%=datos.get("nombre")%></td>
					<td><%=datos.get("apellido")%></td>
					<td><%=datos.get("numero")%></td>
					<td><%=datos.get("correo")%></td>
					
				</tr>			
			</tbody>
		</table>
		
		<table>
			<thead>
				<tr class="table-primary">
					<th>No°</th>
					<th>Name</th>
					<th>Last Name</th>
					<th>Number</th>
					<th>Email</th>
					
				</tr>
			</thead>
			<tbody>
			<% objetoU usuarioO = (objetoU)datos.get("objetoU");   %>
				<tr>
					<th scope="row">1</th>
					<td><%=usuarioO.getNombre()%></td>
					<td><%=usuarioO.getApellido()%></td>
					<td><%=usuarioO.getNumero()%></td>
					<td><%=usuarioO.getCorreo()%></td>
					
				</tr>			
			</tbody>
		</table>
		
	</div>

</body>
</html>