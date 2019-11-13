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
	<form action="OperacionCBTFServlet?proceso=ejemplo_pr&operacion=ejemplo_op&accion=finalizar" method="post">	
		<div class="row" style="margin-top: 120px;margin-left: 50px;margin-right: 50px;margin-bottom: 50px;">
	 		<div class="col-sm-6" style="width: 630px;height: 635px;">
	    		<div class="card">
	     			 <div class="card-body">
	        			<div class="h5 modal-title text-center">
							<h4 class="mt-2">
							<div>REGISTRO EXITOSO </div>
							<span> PASO 5 </span>
							</h4>
								<table class="mb-0 table">
									<thead>
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
											<th>Estado Civil</th>
											<th>Numero de Cuenta</th>	
											<th>Tipo Cuenta</th>
											<th>Sexo</th>					
										</tr>
									</thead>
									<tbody>
										<tr>
											<td><%=datos.get("s_estCivil")%></td>
											<td><%=datos.get("s_noCuenta")%></td>
											<td><%=datos.get("s_tipoCuenta")%></td>
											<td><%=datos.get("s_sexo")%></td>	
										</tr>			
									</tbody>
								</table>
					
						</div>
	        
	     			 </div>
	   			 </div>
	  		</div>
	  
	  		<div class="col-sm-6">
	    		<div class="card">
	      			<div class="card-body">
		      			<div class="h5 modal-title text-center">
		      			<h4 class="mt-2">
							<div>Descripción e imagen </div>
						</h4>
		      			<table class="mb-0 table">
									<thead>
										<tr> <th>Imagen</th>	</tr>
									</thead>
									<tbody>
										<tr> <td> <img src= "images/<%=datos.get("s_imagen")%>" style="height: 53%;" >  </td> </tr>			
									</tbody>
						</table>
			       		<table class="mb-0 table">
									<thead>
										<tr> <th>Descripción</th> </tr>
									</thead>
									<tbody>
										<tr> <td> <embed  src= "images/<%=datos.get("s_text")%>"> </td> </tr>			
									</tbody>
						</table>
						</div>
					</div>
				</div>
			</div>
					  
		</div>
		<div style= "margin-left: 4%;">
			<a class="btn btn-primary " href="OperacionCBTFServlet?proceso=ejemplo_pr&operacion=ejemplo_op&accion=pasoCuarto" style="margin-left: 8px;"> Paso 4 </a>
			<input class="btn btn-primary" value="Finalizar" type="submit" style="margin-left: 85%;"> 					
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