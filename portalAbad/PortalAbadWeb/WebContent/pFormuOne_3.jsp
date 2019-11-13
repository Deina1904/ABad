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
	<link href="vendor/fontawesome-free/css/all.min.css" rel="stylesheet"
		type="text/css">
	<link href="vendor/datatables/dataTables.bootstrap4.css"
		rel="stylesheet">
	<link href="css/sb-admin.css" rel="stylesheet">
	<style type="text/css"> </style>
</head>
<body class="container-fluid">

<div class="card h-100">
		<div class="card-body" style="align-self: center;width: 1190px;height: 440px;margin-top: 60px;padding-top: 10px;">
			<div class="card-header"> PRACTICA </div>
			<div class="modal-body">
				<div class="h5 modal-title text-center">
					<h4 class="mt-2">
					
					<span> PASO 2 </span>
					</h4>
					<table class="mb-0 table">
						<thead>
							<tr>
								<th>Nombres</th>
								<th>Apellidos</th>
								<th>Usuario</th>	
							</tr>
						</thead>
						<tbody>
							<tr>
								<td><%=datos.get("nombres")%></td>
								<td><%=datos.get("apellidos")%></td>
								<td><%=datos.get("usuario")%></td>
							</tr>			
						</tbody>
					</table>
					
				</div>
				<form action="OperacionCBTFServlet?proceso=ejemplo_pr&operacion=ejemplo_op&accion=siguientePaso" method="post">
					<div aria-describedby="exampleInputGroup1__BV_description_" class="form-group" id="exampleInputGroup1" role="group">
						<div>
							<input class="form-control" id="correo" name="correo" placeholder="Correo"  type="email">
						</div>
						<div style="margin-top: 15px;">
							<input class="form-control" id="direccion" name="direccion" placeholder="Direccion"  type="text">
						</div>
						<div style="margin-top: 15px;">
							<input class="form-control" id="telefono" name="telefono" placeholder="Telefono"  type="number">
						</div>		
					</div>
				
					<div style="margin-top: 31%">
						<a class="btn btn-primary " href="OperacionCBTFServlet?proceso=ejemplo_pr&operacion=ejemplo_op&accion=pasoAnterior" > Paso 1 </a>
						<input class="btn btn-primary" value="continuar" type="submit" style="margin-left: 80%;">
					</div>
				</form>
			</div>
		</div>	
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