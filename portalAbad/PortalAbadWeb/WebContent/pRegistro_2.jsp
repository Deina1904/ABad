<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
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
					
					<span> PASO 1</span>
					</h4>
				</div>
				<form action="OperacionCBTFServlet?proceso=ejemplo_pr&operacion=ejemplo_op&accion=continuar" method="post">
				<div aria-describedby="exampleInputGroup1__BV_description_" class="form-group" id="exampleInputGroup1" role="group">
					<div>
						<input class="form-control" id="nombres" name="nombres" placeholder="Nombre .... "  type="text">
					</div>
					<div style="margin-top: 15px;">
						<input class="form-control" id="apellidos" name="apellidos" placeholder="Apellido ...."  type="text">
					</div>
					<div style="margin-top: 15px;">
						<input class="form-control" id="usuario" name="usuario" placeholder="Usuario ...."  type="text">
					</div>
					<div style="margin-top: 15px;">
						<input class="form-control" id="Clave"  placeholder="Clave"  type="password"	>
					</div>
					<div style="margin-top: 15px;">
						<input class="form-control" id="con_clave" placeholder="Confirmar Clave"  type="password">
					</div>
				</div>
				
				<div style="margin-top: 31%">					
					<a class="btn btn-primary" href="OperacionCBTFServlet?proceso=ejemplo_pr&operacion=ejemplo_op&accion=inicio" style="margin-left: 9px;" > Atras </a>
					<input class="btn btn-primary" value="continuar" type="submit" style="margin-left: 84%;">
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