<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
  <link href="vendor/fontawesome-free/css/all.min.css" rel="stylesheet" type="text/css">
  <link href="vendor/datatables/dataTables.bootstrap4.css" rel="stylesheet">
  <link href="css/sb-admin.css" rel="stylesheet">
  
</head>
<body class="container-fluid">

<div class="card h-100">
	<div class="card-header"> Formulario Registro </div>
    
	<div class="card-body">
	
		<h1>BIENVENIDO AL FORMULARIO DE REGISTRO</h1>
		<div>
			<form novalidate="" class="ng-untouched ng-pristine ng-valid" action="LogonAnonimoServlet?proceso=practica1_pr&operacion=practica1_op&accion=datosReg" method="post">
				<div class="row">
					<div class="col-md-6">
						<fieldset class="form-group" id="__BVID__132">
							<div role="group" tabindex="-1">
								<label for="exampleName">Name</label>
								<input class="form-control" id="name" name="nombre" placeholder="Name here..." type="text">
							</div>
							<!----><bfv-messages _nghost-c8="" class="ng-star-inserted"><!----></bfv-messages>
						</fieldset>
					</div>
					<div class="col-md-6">
						<fieldset class="form-group" id="__BVID__134">
							<div role="group" tabindex="-1">
								<label for="exampleLastName"> Last Name </label>
								<input class="form-control" id="lastname" name="apellido" placeholder="Last Name here..." type="text">
							</div>
							<!----><bfv-messages _nghost-c8="" class="ng-star-inserted"><!----></bfv-messages>
						</fieldset>
					</div>
					<div class="col-md-6">
						<fieldset class="form-group" id="__BVID__136">
							<div role="group" tabindex="-1">
								<label for="examplecellPhone"> Cell Phone Number </label>
								<input class="form-control" id="number" name="numero"placeholder="Cell Phone Number here..." type="number">
							</div>
							<!----><bfv-messages _nghost-c8="" class="ng-star-inserted"><!----></bfv-messages>
						</fieldset>
					</div>
					<div class="col-md-6">
						<fieldset class="form-group" id="__BVID__138">
							<div role="group" tabindex="-1">
								<label for="exampleEmail"> Email </label>
								<input class="form-control" id="email" name="correo" placeholder="Email here..." type="email">
							</div>
							<!----><bfv-messages _nghost-c8="" class="ng-star-inserted"><!----></bfv-messages>
						</fieldset>
					</div>
				</div>
				
				<div class="custom-control custom-checkbox">
					<input autocomplete="off" class="custom-control-input" id="exampleCheck" name="check" type="checkbox" value="true">
					<label class="custom-control-label" for="exampleCheck"> Accept our <a >Terms and Conditions</a>.</label>
				</div>
				<div class="mt-4 d-flex align-items-center">
					<h5 class="mb-0"> Already have an account? <a class="text-primary" >Sign in</a></h5>
					<div class="ml-auto">
						<button class="btn btn-wide btn-pill btn-shadow btn-hover-shine btn-secondary btn-lg" type="sumblit" > Create Account </button>
					</div>
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