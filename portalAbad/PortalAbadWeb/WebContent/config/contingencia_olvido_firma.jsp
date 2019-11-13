<%@ include file="includecbtf.jsp"%>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<!DOCTYPE>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<link href="estilos/estilosB.css" rel="stylesheet">
<link href="estilos/bootstrap.css" rel="stylesheet">
<script type="text/javascript" src="js/jquery.js"></script>
<script type="text/javascript" src="js/bootstrap.js"></script>
<script type="text/javascript" src="js/contingencia_registro_formulario.js"></script>
<title>Firma Olvido de clave Canal de Contingencia - PIBEE</title>


</head>
<body>
	<%
		String codReferencia = (String) datos.get("codReferencia");
		String codUsuario = (String) datos.get("codUsuario");
	%>
	<div class="container">
		<div class="page-header">
		  	<img src="images/LogoBBVA.png">
		</div>
		<div class="col-md-2"></div>
		<div class="col-md-10">
			<h2>Olvido de clave</h2>
			
			<div class="panel panel-default"> 
				<div class="panel-heading">
					Finalización y Firma
				</div>
				<div class="panel-body">
					<div class="row">
						<div class="col-md-10"><h5><b>Finalice y firme el cambio de clave</b></h5></div>
						<div class="col-md-2"><h5><b>Paso 2 de 3</b></h5></div>
					</div>
					<div class="row">
						<div class="col-md-12"><b>Resumen de la Operación</b></div>
					</div>
					<div id="alerta" class="alert alert-danger alert-dismissible" role="alert" style="display:none">
						<div class="col-md-11"><img src="images/danger.png">&emsp;<span id="alertaMsg"></span></div>
						<div class="col-md-1" style="padding-top: 2px;"><a href="#" onclick="cerrarAlerta('#alerta')"><img src="images/cerrarAlerta.png"></a></div>
						<br>
					</div>
					<% if(datos.get("Estado").equals("ErrorToken"))
					{%>
					<div id="alerta2" class="alert alert-danger alert-dismissible" role="alert">
						<div class="col-md-11"><img src="images/danger.png">&emsp;<span id="alertaMsg">Clave de token o clave de operaciones invalida</span></div>
						<div class="col-md-1" style="padding-top: 2px;"><a href="#" onclick="cerrarAlerta('#alerta2')"><img src="images/cerrarAlerta.png"></a></div>
						<br>
					</div>
					<%}%>
					<div class="form-group">
						<table class="simple2" border="1">
							<tr class="active">
								<td>CÓDIGO</td>
								<td>NOMBRE DEL USUARIO</td>
								<td>TIPO</td>
								<td>ESTADO</td>
								<td>CORREO</td>
								<td>OPERACIÓN</td>			
							</tr>
							<tr>
								<td><%=(String)datos.get("codUsuario")%></td>
								<td><%=(String)datos.get("nombreUsuario") %></td>
								<td><%=(String)datos.get("tipoUsuario") %></td>
								<td><%=(String)datos.get("estadoUsuario") %></td>
								<td><%=(String)datos.get("emailUsuario")%></td>
								<td>Recuperar clave</td>
							</tr>
						</table>
					</div>
					<div class="row">
						<div class="col-md-1"></div>
						<div class="col-md-11"><b>Termine de realizar su cambio de clave de acceso para el canal de contingencia, rellenando los siguientes datos:</b></div>
					</div>
					<div class="row">
						<div class="col-md-1"></div>
						<div class="col-md-11">Debe completar los datos del siguiente formulario</div>						
					</div>
					<br>			
					<form name="firmaForm" id="firmaForm" class="form-horizontal"  method="post">	
						
						<div class="form-group">
							<label for="pdClaveOperaciones" class="col-sm-4 control-label">* Clave de operaciones</label>
							<div class="col-sm-5">
								<input type="password" class="form-control" id="pdClaveOperaciones" name="pdClaveOperaciones" maxlength="8">
							</div>
						</div>
			
						<div class="form-group">
							<label for="pdToken" class="col-sm-4 control-label">* Clave del token</label>
							<div class="col-sm-5">
								<input type="password" class="form-control" id="pdToken" name="pdToken"  maxlength="8">
							</div>
							<div class="col-sm-1" style="padding-top: 5px;">
								<img src="images/token.png">
							</div>
						</div>
						
						<div class="row">
							<div class="col-md-11">
								<input class="btn btn-primary pull-right" type="button" onclick="validarFirma(document.firmaForm, '<%=urls.get("URL")%>')" value="Firmar"></input>
							</div>
						</div>
					</form>					
				</div>
			</div>			
		</div>
	</div>
</body>
</html>