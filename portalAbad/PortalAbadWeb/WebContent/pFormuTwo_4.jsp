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
		<div class="card-body" style="align-self: center;width: 1190px;height: 440px;margin-top: 50px;padding-top: 10px;">
			
			<div class="modal-body">
				<div class="h5 modal-title text-center">
					<h4 class="mt-2">
					<span> PASO 3 </span>
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
								<td><%=datos.get("s_nombres")%></td>
								<td><%=datos.get("s_apellidos")%></td>
								<td><%=datos.get("s_usuario")%></td>
							</tr>			
						</tbody>
					</table>
					<table class="mb-0 table">
						<thead>	
							<tr>	
								<th>Correo</th>
								<th>Direccion</th>
								<th>Telefono</th>			
							</tr>
						</thead>
						<tbody>
							<tr>
								<td><%=datos.get("correo")%></td>
								<td><%=datos.get("direccion")%></td>
								<td><%=datos.get("telefono")%></td>
							</tr>			
						</tbody>
					</table>
					
					
				</div>
				<form action="OperacionCBTFServlet?proceso=ejemplo_pr&operacion=ejemplo_op&accion=sigFormulario" method="post">
					<div aria-describedby="exampleInputGroup1__BV_description_" class="form-group" id="exampleInputGroup1" role="group">
						<div>
							<input class="form-control" id="estCivil" name="estCivil" placeholder="Estado Civil"  type="text">
						</div>
						<div style="margin-top: 15px;">
							<input class="form-control" id="noCuenta" name="noCuenta" placeholder="Numero de cuenta"  type="number">
						</div>
						<div style="margin-top: 20px;">
						<select class="custom-select" name="tipoCuenta" >
						  <option selected>Tipo Cuenta</option>
						  <option value="Ahorro">Ahorro</option>
						  <option value="Corriente">Corriente</option>
						</select>
						</div>
						<div style="margin-top: 20px;">
						<select class="custom-select" name="sexo">
						  <option selected>Sexo</option>
						  <option value="Masculino">Masculino</option>
						  <option value="femenino">femenino</option>
						 </select>
						</div>					
					</div>
					<div style="margin-top: 21%">
						<a class="btn btn-primary " href="OperacionCBTFServlet?proceso=ejemplo_pr&operacion=ejemplo_op&accion=antFormulario" style="margin-left: 6px;"> Paso 2 </a>
						<input class="btn btn-primary" value="continuar" type="submit" style="margin-left: 79%;">	
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