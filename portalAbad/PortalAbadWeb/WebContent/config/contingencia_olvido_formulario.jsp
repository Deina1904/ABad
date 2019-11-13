<%@ include file="includecbtf.jsp"%>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<!DOCTYPE>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<link href="estilos/bootstrap.css" rel="stylesheet">
<script type="text/javascript" src="js/jquery.js"></script>
<script type="text/javascript" src="js/bootstrap.js"></script>
<script type="text/javascript" src="js/contingencia_registro_formulario.js"></script>
<title>Olvido de clave Canal de Contingencia - PIBEE</title>

</head>
<body>
	<div class="container">
		<div class="page-header">
		  	<img src="images/LogoBBVA.png">
		</div>
		<div class="col-md-2"></div>
		<div class="col-md-10">
			<h2>Olvido de clave</h2>
			
			<div class="panel panel-default"> 
				<div class="panel-heading">
					Recuperar clave de acceso canal de contingencia
				</div>
				<div class="panel-body">
					<div class="row">
						<div class="col-md-10">&ensp;&ensp;Complete el siguiente formulario para recuperar su clave de acceso</div>
						<div class="col-md-2">Paso 1 de 3</div>
					</div>
					<br>
					<div id="alerta" class="alert alert-danger alert-dismissible" role="alert" style="display:none">
						<div class="col-md-11"><img src="images/danger.png">&emsp;<span id="alertaMsg"></span></div>
						<div class="col-md-1" style="padding-top: 2px;"><a href="#" onclick="cerrarAlerta('#alerta')"><img src="images/cerrarAlerta.png"></a></div>
						<br>
					</div>	
					<%if(datos.get("Estado").equals("UsuarioYaRegistrado"))
					{%>
					<div id="alerta" class="alert alert-danger alert-dismissible" role="alert">
						<div class="col-md-11"><img src="images/danger.png">&emsp;<span id="alertaMsg">El usuario solicitado no está registrado en el canal de contingencia</span></div>
						<div class="col-md-1" style="padding-top: 2px;"><a href="#" onclick="cerrarAlerta('#alerta')"><img src="images/cerrarAlerta.png"></a></div>
						<br>
					</div>
					<%}%>
					<form name="registroForm" id="registroForm" class="form-horizontal"  method="post">	
						<div class="form-group">
							<label for="referenciaText" class="col-sm-4 control-label">&ensp;&ensp;* Número de referencia BBVA Net Cash:</label>
							<div class="col-sm-5">
								<input type="text" class="form-control" id="referenciaText" name="codReferencia" maxlength="8">
							</div>
							<div class="col-sm-3">
								<a href="#" 
								title="Debe ingresar su respetivo número de referencia asignado para ingresar a 
BBVA Net Cash (código de 8 dígitos)">
								  <img src="images/ayudaEmergenteDerecha.png">
								</a>
							</div>
						</div>			
						<div class="form-group">
							<label for="usuarioText" class="col-sm-4 control-label">* Cod. Usuario BBVA Net Cash:</label>
							<div class="col-sm-5">
								<input type="text" class="form-control" id="usuarioText" name="codUsuario" maxlength="8">
							</div>
							<div class="col-sm-2">
								<a href="#" 
									title="Debe ingresar su respetivo código de usuario,
de 8 caracteres alfanuméricos. ">
								  <img src="images/ayudaEmergenteDerecha.png">
								</a>
							</div>
						</div>
			
						<div class="form-group">
							<label for="emailText" class="col-sm-4 control-label">* Correo Electrónico:</label>
							<div class="col-sm-5">
								<input type="text" class="form-control" id="emailText" name="emailUsuario" maxlength="80" >
							</div>
							<div class="col-sm-2">
								<a href="#" 
								title="Debe ingresar una dirección de correo electrónico valida por ejemplo: Example@Example.com">
								  <img src="images/ayudaEmergenteDerecha.png">
								</a>
							</div>
						</div>
						
						<div class="form-group">
							<label for="passwordText" class="col-sm-4 control-label">* Crear Clave de Acceso:</label>
							<div class="col-sm-5">
								<input type="password" class="form-control" id="passwordText" name="password" maxlength="8">
							</div>
							<div class="col-sm-2">
								<a href="#" 
								title="Debe crear una clave alfa numérica de 8 caracteres, 
diferente a su número de referencia  y código de usuario.">
							  	<img src="images/ayudaEmergenteDerecha.png">
								</a>
							</div>
						</div>
			
						<div class="form-group">
							<label for="confPasswordText" class="col-sm-4 control-label">* Confirmar la Clave:</label>
							<div class="col-sm-5">
								<input type="password" class="form-control" id="confPasswordText" name="confPassword" maxlength="8">
							</div>
							<div class="col-sm-2">
								<a href="#" 
								title="Debe confirmar su clave">
								  <img src="images/ayudaEmergenteDerecha.png">
								</a>
							</div>
						</div>
						
						<div class="row">
							<div class="col-md-11">
								<input class="btn btn-primary pull-right" type="button" onclick="validarFormulario(document.registroForm, '<%=urls.get("URL")%>')" value="Continuar"></input>
							</div>
						</div>
					</form>					
				</div>
			</div>			
		</div>
	</div>
</body>
</html>