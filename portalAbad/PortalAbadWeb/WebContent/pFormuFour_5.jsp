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
	  <form action="OperacionCBTFServlet?proceso=ejemplo_pr&operacion=ejemplo_op&accion=formularioSig" method="post" id="formulario1">			
	
	 	<div class="row" style="margin-top: 120px;margin-left: 50px;margin-right: 50px;margin-bottom: 50px;">
		  <div class="col-sm-6">
		  	<div class="card">
				<div class="card-body">
					<div class="modal-body">
						<div class="h5 modal-title text-center">
							<h4 class="mt-2">
							<div>Welcome </div>
							<span> PASO 4 </span>
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
										<td><%=datos.get("s_correo")%></td>
										<td><%=datos.get("s_direccion")%></td>
										<td><%=datos.get("s_telefono")%></td>
									</tr>			
								</tbody>
							</table>
							<table class="mb-0 table">
								<thead>
									<tr>
										<th>Estado Civil</th>
										<th>Numero de Cuenta</th>	
										<th>Tipo Cuenta</th>
										<th>Sexo</th>					
									</tr>
								</thead>
								<tbody>
									<tr>
										<td><%=datos.get("estCivil")%></td>
										<td><%=datos.get("noCuenta")%></td>
										<td><%=datos.get("tipoCuenta")%></td>
										<td><%=datos.get("sexo")%></td>	
									</tr>			
								</tbody>
							</table>
						</div>
						
					</div>
				</div>	
			</div>
		  </div>
	 
		  <div class="col-sm-6">
		  	<div class="card">
				<div class="card-body">
					<div>
						<div class="file-field">
							<div class="btn btn-primary btn-sm float-left">
									<span>Choose file</span>
									<input type="file" id="imagen" name="imagen"/> <!--  form="formulario1" con esto se manda la accion a el form del formulario -->
							</div>
						</div>
						<div class="file-field">
							<div class="btn btn-primary btn-sm float-left" style="margin-top: 15%;clear: both;">
									<label style="margin-top: 15px;">File text</label>
									<input type="file" id="texto" name="text" />
							</div>
						</div>
					</div>
					
				</div> 
			</div>
		  </div>
	 	</div>
	 	<div style="margin-top: 11%">
					<a class="btn btn-primary " href="OperacionCBTFServlet?proceso=ejemplo_pr&operacion=ejemplo_op&accion=formularioAnt" style="margin-left: 6%;"> Paso 3 </a>
					<input class="btn btn-primary" value="continuar" type="submit" style="margin-left: 80%;">
		</div>
	  </form>
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