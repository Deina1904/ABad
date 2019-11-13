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
					<div>Welcome </div>
					<span> Inicie sesión a continuación.</span>
					</h4>
				</div>
				<div aria-describedby="exampleInputGroup1__BV_description_" class="form-group" id="exampleInputGroup1" role="group">
					<div>
						<input class="form-control" id="Usuario" placeholder="Usuario" required="required" type="email">
					</div>
					
				</div>
				<div class="form-group" id="exampleInputGroup2" role="group">
					<div>
						<input  class="form-control" id="Clave" placeholder="Clave" required="required" type="password">
					</div>
					
				</div>
				
				<div style="margin-top: 42%">
					<a class="btn btn-primary " href="OperacionCBTFServlet?proceso=ejemplo_pr&operacion=ejemplo_op&accion=registro" style="margin-left: 4px;" > Registrarse </a>
					<a class="btn btn-primary " href="OperacionCBTFServlet?proceso=ejemplo_pr&operacion=ejemplo_op&accion=registro" style="margin-left: 82%;">Ingresar</a>
	
				</div>
				
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