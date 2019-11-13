<jsp:include page="inicio.jsp" flush="true" />

<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Prueba Gio 1</title>

<style type="text/css">

	#contenedor{
	    width: 90%;
	    margin: 30px auto;
	    border: 1px solid #4cbbb5;
	    padding: 20px;
	    background-color: #eef7ff;
	    display: block;
	    text-decoration: none;
	    text-align: center;
	    border-radius: 20px;
	    transition: background-color 2s;
	}
	
	#contenedor:visited{
		color: #314f50;
	
	}
	
	#contenedor:hover{
		background-color: #e7f3cd;
	}
	
	h1{
		text-align: center;
	}
	
	
</style>



</head>
<body>
	<a href="OperacionCBTFServlet?proceso=capacitacion_pr&operacion=capacitacion_op&accion=inicio" id="contenedor">
		<h1>CAPACITACI&Oacute;N ABAD</h1>
		<p>Click para iniciar recorrido</p>
	</a>
</body>
</html>