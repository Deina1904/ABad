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
<style type="text/css">

</style>
</head>

<body class="container-fluid">

<div class="card h-100">
	<div class="card-header"> Pagina 1 </div>
    
		<div class="card-body">
	
			<h1 class="card-title" style="margin-top: 3%;">Bienvenido a la Practica 1</h1>
			
			<a class="nav-link active" href="OperacionCBTFServlet?proceso=practica1_pr&operacion=practica1_op&accion=cargarDatos&size=10">
			<span>Lista Datos Usuarios </span>
			<a class="nav-link active" href="OperacionCBTFServlet?proceso=practica1_pr&operacion=practica1_op&accion=formulario">
			<span>Formulario</span>
			
			<div class="text-center" style="height: 75%;"> <img src="images/welcome.png"> </div> 
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