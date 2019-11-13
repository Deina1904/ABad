<%@page import="jdk.nashorn.internal.ir.WhileNode"%>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<%@ include file ="includecbtf.jsp" %>
<%@ page import="com.ibm.dse.base.Hashtable"%>
<%@ page import="java.util.Vector"%>
<%@ page import="java.util.Enumeration"%>
<!DOCTYPE html>
<html >
<head>
<meta charset="ISO-8859-1">

  <link href="vendor/fontawesome-free/css/all.min.css" rel="stylesheet" type="text/css">
  <link href="vendor/datatables/dataTables.bootstrap4.css" rel="stylesheet">
  <link href="css/sb-admin.css" rel="stylesheet">
  <style type="text/css">

  </style>
</head>

<body class="container-fluid">

<div class="card h-100">

	<div class="card-body" style="overflow: scroll;">
			
	<h1 class="card-title" style="margin-top: 3%;"> Tabla de Registros </h1>
			
		<table class="mb-0 table table-hover">
			<thead>
					<tr class="table-primary">
						<th>No°</th>
						<th>Nombre</th>
						<th>Apellido</th>
						<th>Edad</th>
						<th>Fecha Nacimineto</th>
					</tr>
				<tbody>
						<% 
						Vector lista =(Vector) datos.get("listaDatos");
						Enumeration numLista=lista.elements();
						int a = 0;
						while(numLista.hasMoreElements()){
							Hashtable d = (Hashtable) numLista.nextElement(); 
							a++;
							%>
							<tr>
							<th scope="row"><%= a %> </th>
							<td><%= d.get("nombre")%></td>
						   <td><%= d.get("apellido")%></td>
						   <td><%= d.get("edad")%></td>
						   <td><%= d.get("fechaN")%></td>
						   </tr>
						<%
						}
						%>
				</tbody>
			</thead>
		</table> 		
	</div>
	
	<nav aria-label="Page navigation example">
		  <ul class="pagination">
		    <li class="page-item">
		      <a class="page-link" href="#" aria-label="Previous">
		        <span aria-hidden="true">&laquo;</span>
		        <span class="sr-only">Previous</span>
		      </a>
		    </li>
		    <li class="page-item"><a class="page-link" href="LogonAnonimoServlet?proceso=practica1_pr&operacion=practica1_op&accion=cargarDatos&size=20">1</a></li>
		    <li class="page-item"><a class="page-link" href="LogonAnonimoServlet?proceso=practica1_pr&operacion=practica1_op&accion=cargarDatos&size=30">2</a></li>
		    <li class="page-item">
		      <a class="page-link" href="#" aria-label="Next">
		        <span aria-hidden="true">&raquo;</span>
		        <span class="sr-only">Next</span>
		      </a>
		    </li>
		  </ul>
		</nav>
</div>
   
  <script src="vendor/jquery/jquery.min.js"></script>
  <script src="vendor/bootstrap/js/bootstrap.bundle.min.js"></script>
  <script src="vendor/jquery-easing/jquery.easing.min.js"></script>
  <script src="vendor/datatables/jquery.dataTables.js"></script>
  <script src="vendor/datatables/dataTables.bootstrap4.js"></script>
  <script src="js/sb-admin.min.js"></script>
  <script src="js/demo/datatables-demo.js"></script>
  <script src="js/demo/chart-area-demo.js"></script>
  
</body>
</html>