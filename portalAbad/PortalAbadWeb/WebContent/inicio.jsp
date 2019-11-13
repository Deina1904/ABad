<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.0 Transitional//EN" "http://www.w3.org/TR/REC-html40/loose.dtd">
<html lang="en">
<head>
<meta http-equiv="cache-control" content="no-cache">
<meta http-equiv="pragma" content="no-cache">
<META HTTP-EQUIV="EXPIRES" CONTENT="0">
<meta http-equiv="x-ua-compatible" content="ie=emulateie7"/>
<link href="estilos/estilosmenu.css" rel="stylesheet" type="text/css" />
<script language="JavaScript" src="js/tiempo.js"></script>
<script src="js/jquery-1.10.2.min.js" type="text/javascript"></script>
<script src="js/jquery-ui-1.10.3.custom.min.js" type="text/javascript"></script>
<!--  INICIO GP13217 Optimizacion Dinero Ya -->
	<script language="JavaScript" src="js/analytics.js"></script>
<!--  FIN GP13217 Optimizacion Dinero Ya -->
<script type="text/javascript">
<!--
var timeout		= 500;
var closetimer	= 0;
var ddmenuitem	= 0;

// open hidden layer
function mopen(id){
	// cancel close timer
	mcancelclosetime();
	// close old layer
	if(ddmenuitem) ddmenuitem.style.visibility = 'hidden';
	// get new layer and show it
	ddmenuitem = document.getElementById(id);
	ddmenuitem.style.visibility = 'visible';
}
// close showed layer
function mclose(){
	if(ddmenuitem) ddmenuitem.style.visibility = 'hidden';
}
// go close timer
function mclosetime(){
	closetimer = window.setTimeout(mclose, timeout);
}
// cancel close timer
function mcancelclosetime(){
	if(closetimer){
		window.clearTimeout(closetimer);
		closetimer = null;
	}
}
// close layer when click-out
document.onclick = mclose;

// -->
var win=new Object();
var ie4 = (document.all)?true:false;
function salidanormal(){
	window.top.close=1;
	window.location.href="https://www.bbvanet.com.co/bbva/colombianet/LogoutCBTFServlet";
}

function salir12(){
		
	window.location.href="https://www.bbvanet.com.co/bbva/colombianet/LogoutCBTFServlet";		

}
//funcion que abre el demo
function abrirDemo(url,widht,height){

    wid = (widht == 'undefined')?'800':widht;
    hei = (height == 'undefined')?'600':height;
    window.open(url,"_blank","toolbar=no,status=yes,height="+hei+",width="+wid+",menubar=no,resizable=no,directories=no,location=no,scrollbars=no");
}
function ocultarFrame(){
	window.top.close=0;
	window.parent.document.getElementsByTagName('frameset')[1].rows='0,*';
	
}
function MSG(){
	alert('Si usted estaba activo en Banca Móvil y cambió su operador\nmóvil, debe INACTIVAR el servicio por BBVAnet, volverlo a\nREGISTRAR en su celular y ACTIVARLO por BBVAnet.');
}
function sal2(){
	window.top.close=1;
}
//GP12206
function MensajeDivisas(){
	var ie8 = 0;
	var ieVersion = 0;
	if(/MSIE (\d+\.\d+);/.test(navigator.userAgent)){
		ieVersion = new Number(RegExp.$1);					
		if((ieVersion + 1) >= 8){
					alert('Apreciado Cliente: \n \nSi Internet Explorer presenta problemas de visualización, habilite en el menú "Herramientas" la opción "Configuración de Vista de Compatibilidad".');
		} else {		
			ie8 = 1;		
		}		
	} else if(ie8 != 0){
		mensajeError();
	} else if(ieVersion == 0){
		mensajeError();
	}
}

function mensajeError(){
alert('Apreciado Cliente: \n \nLe recordamos que la funcionalidad "Compra y Venta de Divisas" sólo se encuentra disponible para el navegador Internet Explorer 8.0 o versiones superiores.');										
}

//GP12206 - Fin
</script>
<style type="text/css" media="screen,print">
<!--
body,td,th {font-family: Geneva, Arial, Helvetica, sans-serif;font-size: 12px; color:#00000;}
.style15 {color: #004c93}
body {margin-left: 0px; margin-top: 0px; margin-right: 0px; margin-bottom: 0px;}
-->
</style>
<style rel="stylesheet" type="text/css" media="print">
@media print {
#noImprimir {display:none;}
}
</style>
</head>
<body class="pag-contenido" onunload = "sal2();" onLoad="ocultarFrame();controlSesion();" link="#660099" >

<div class="cabezote2">
	<div id="noImprimir" class="menuppal style15">
	  <div align="right"><a href="OperacionCBTFServlet?proceso=campanatc_pr&operacion=campanatc_inscripcion_op&accion=consultarCampana">Campaña TC</a> |<a href="OperacionCBTFServlet?proceso=posicion_global_pr&operacion=posicion_global_op&accion=menuPosicion">Posici&oacute;n Global</a> | <a href="actualizacion.jsp" id="alerta">Actualizaci&oacute;n de Datos</a> | <a href="javascript:abrirDemo('atencion-cliente2.html','800','400')">Atenci&oacute;n al cliente</a> | <a href="contrato.html">Condiciones del servicio</a> | <a href="#" onclick="salidanormal();">Salir de BBVA net</a>  </div>
	  <!--<div align="right"><a href="OperacionCBTFServlet?proceso=posicion_global_pr&operacion=posicion_global_op&accion=menuPosicion">Posici&oacute;n Global</a> | <a href="actualizacion.jsp" id="alerta">Actualizaci&oacute;n de Datos</a> | <a href="javascript:abrirDemo('atencion-cliente2.html','800','400')">Atenci&oacute;n al cliente</a> | <a href="contrato.html">Condiciones del servicio</a> | <a href="javascript:abrirDemo('http://www.bbva.com.co/images/destacados/swfBBVAnet/Demo-RedisenoNet.swf')">&iquest;C&oacute;mo usar BBVA net?</a> | <a href="#" onclick="salidanormal();">Salir de BBVA net</a>  </div>-->
	</div>
	<div id="noImprimir" class="menu">
		<ul id="sddm">
			<li id="pestGrande"><a href="consultasyextractos.jsp" class="style1" onmouseover="mopen('m1')" onmouseout="mclosetime()">Consultas y Extractos </a>
				<div class="subMenu" id="m1" onmouseover="mcancelclosetime()" onmouseout="mclosetime()">
					<a href="OperacionCBTFServlet?proceso=posicion_global_pr&operacion=posicion_global_op&accion=menuPosicion">Resumen de mis productos</a>
					<a href="OperacionCBTFServlet?proceso=detalle_productos_pr&operacion=detalle_productos_op&accion=inicio">Detalle de mis productos</a>
					<a href="OperacionCBTFServlet?proceso=consultas_ctas_pr&operacion=relacion_ctas_op&accion=menuMtosFiltro&tipo=ctas">Bajar movimientos</a>
					<!-- GP9811 INICIO -->
					<a href="consultasyextractos.jsp">Leasing</a>
					<!-- GP9811 FIN -->
					<a href="OperacionCBTFServlet?proceso=log_consulta_pr&operacion=log_consulta_movimientos_op&accion=inicio">Consulta por transacci&oacute;n</a>
					<%--<a href="OperacionCBTFServlet?proceso=consulta_prestamos_dbasicos_pr&operacion=consulta_prestamos_dbasicos_ctasord_op&accion=ctasord">Pr&eacute;stamos</a>--%>
					<a href="prestamos.jsp">Pr&eacute;stamos</a>					
					<a href="OperacionCBTFServlet?proceso=consulta_adquirencia_pr&operacion=consulta_adquirencia_ctas_ord_op&accion=menuCtasOrd">Adquirencia</a>
					<a href="OperacionCBTFServlet?proceso=remesa_consulta_pr&operacion=remesa_consulta_opciones_op&accion=menuOrdTras">Remesas</a>
					<a href="OperacionCBTFServlet?proceso=consulta_tarjetas_domic_pr&operacion=consulta_tarjetas_domic_tarord_op&accion=ctasord">Domiciliaci&oacute;n</a>
					<a href="estadooperaciones.jsp">Estado Operaciones</a>
					<a href="pagatiempo.jsp">PagAtiempo (pagos programados)</a>
					<a href="consultaCreditoVirtual.jsp">Consulta datos para comprar</a>
					<a href="extractose.jsp">Extractos electr&oacute;nicos</a>
					<a href="comercioexterior.jsp">Comercio Exterior</a>
				</div>
			</li>
			<li id="pestGrande"><a href="seguridad.jsp" onmouseover="mopen('m2')" onmouseout="mclosetime()"><span class="style1">Seguridad y Claves</span></a>
				<div class="subMenu" id="m2" onmouseover="mcancelclosetime()" onmouseout="mclosetime()">
					<a href="cambios.jsp">Cambios de Clave</a>
					<a href="clave.jsp">Creación de Clave</a>			
					<a href="personalizacion.jsp">Personalizaci&oacute;n</a>
					<a href="bloqueos.jsp">Bloqueos</a>
					<a href="alertas.jsp">Alertas</a>
					<a href="OperacionCBTFServlet?proceso=autorizacion_linea_pr&operacion=verificar_op&accion=continuar">Habilitar / Deshabilitar Transferencias</a>					
				</div>
			</li>
			<!--  INICIO GP13896 - Optimización Inversión Online V 2.0 -->
			<li id="pestGrande">
			<a id="btnTraspasosPagos" href="traspasos.jsp" class="style1" onmouseover="mopen('m3')" onmouseout="mclosetime()">Traspasos y Pagos</a>
				<div class="subMenu" id="m3" onmouseover="mcancelclosetime()" onmouseout="mclosetime()">
					<a id="btnTraspasos" href="traspasos.jsp">Traspasos</a>
					<a href="pagos.jsp">Pagos</a>
					<a href="recargas.jsp">Recarga de Celulares</a>
					<a href="inscripcion.jsp">Inscripci&oacute;n/Eliminaci&oacute;n de Productos</a>
					
				</div>
			</li>
			
			<li id="pestGrande">
			<a id="btnSolicitudesyServicios" href="solicitudes.jsp" class="style1" onmouseover="mopen('m4')" onmouseout="mclosetime()">Solicitudes y Servicios</a>
				<div class="subMenu" id="m4" onmouseover="mcancelclosetime()" onmouseout="mclosetime()">
					<a id="btnSolicitudesSobreProductosExistentes" href="solicitudes.jsp">Solicitudes sobre productos existentes</a>
					<a href="actualizacion.jsp">Actualizaci&oacute;n de datos</a>
					<a href="descargas.jsp">Descarga de certificados</a>
					<a href="OperacionCBTFServlet?proceso=participa_sorteo_pr&operacion=participa_sorteo_op&accion=inicio">Participar en Sorteo Seguro</a>
					<a href="OperacionCBTFServlet?proceso=consulta_cupones_pr&operacion=consulta_cupones_op&accion=inicio">Consulta Sorteo Seguro</a>
				</div>
			</li>

			<li id="pestMediana">
			<a id="btnAbrirProducto" href="abrirproducto.jsp" onmouseover="mopen('m5')" onmouseout="mclosetime()">Abrir Productos</a>
				<div class="subMenu" id="m5" onmouseover="mcancelclosetime()" onmouseout="mclosetime()">
					<a id="btnAbrirInversion" href="OperacionCBTFServlet?proceso=consti_cdts_pr&operacion=datos_cdts_op&accion=datosini">Inversion On-Line</a>
					<!--  INICIO GP11491 CDTs Desmaterializado -->
                    	<a href="abrirproducto.jsp">CDT Desmaterializado</a>
                    <!--  FIN GP11491 CDTs Desmaterializado -->
                    
                    <!-- GP14236 - Gesi COL472315S604635 Mejoras Inversión OnLine/Compra de Cartera operatividad y tagging INICIO -->
						<a id="btnAbrirSeguro" href="OperacionCBTFServlet?proceso=venta_seguros_pr&operacion=venta_seguros_acc_personales_op&accion=datosini">Seguro Multiasistencia</a>
                    <!-- GP14236 - Gesi COL472315S604635 Mejoras Inversión OnLine/Compra de Cartera operatividad y tagging FIN -->
                    
				</div>
			</li>
			<!--  FIN GP13896 - Optimización Inversión Online V 2.0 -->

			<li id="pestXGrande">
				<a href="OperacionCBTFServlet?proceso=comercio_exterior_bbva_pr&operacion=contrato_op&accion=continuar&tipoProceso01=1">Compra y Venta de Divisas</a>
			    <!--<a href="OperacionCBTFServlet?proceso=comercio_exterior_bbva_pr&operacion=contrato_op&accion=continuar&tipoProceso01=1" onclick="MensajeDivisas();">Compra y Venta de Divisas</a>-->
			</li>
			<!-- GP11944 fin-->
			<!-- VYGTS 100301 - Inicio -->		
<!-- 			<li id="pestMediana"> -->
<!-- 				<a href="ofertasdisponibles.jsp">Mis Ofertas</a> -->
<!-- 			</li> 
			<li id="pestMediana">
				<a href="ofertasdisponibles.jsp">Pruebas</a>
			</li>-->
			<li id="pestGrande">
				<a href="practicas.jsp">Capacitaci&oacute;n</a>
			</li>	
			<!-- VYGTS 100301 - Fin -->
		</ul>
	</div>
</div>
<div class="alturaPag">&nbsp;<!-- Este DIV mantiene la distacia del contenido de la pagina con el menu y debe tener la misma altura de ".cabezote2"--></div>

<!--  INICIO GP13896 - Optimización Inversión Online V 2.0 -->
<script type="text/javascript">


	ga('send', 'event', 'Botones Menu', 'click', 'Boton-Solicitud-y-Apertura-de-Productos');


	$('#btnAbrirProducto').on('click', function() {
	 	ga('send', 'event', 'Botones Menu', 'click', 'Boton-Solicitud-y-Apertura-de-Productos');
	});	
	$('#btnAbrirInversion').on('click', function() {
	 	ga('send', 'event', 'botones-menu', 'click', 'MenuBBVANet-AbrirProducto-Boton-InversionOnline');
	});	
	$('#btnAbrirSeguro').on('click', function() {
		ga('send', 'event', 'botones-menu', 'click', 'MenuBBVANet-AbrirProducto-Boton-VentaSeguros');
	});	
	$('#btnSolicitudesyServicios').on('click', function() {
  		ga('send', 'event', 'Botones Menu-Nuevo', 'click', 'Boton-Solicitudes-Servicios');
  	});
  	$('#btnSolicitudesSobreProductosExistentes').on('click', function() {
		ga('send', 'event', 'Botones Menu-Nuevo', 'click', 'Boton-Solicitudes-Servicios-Productos-Existentes');
  	});
  	$('#btnTraspasosPagos').on('click', function() {
		ga('send', 'event', 'Botones Menu-Nuevo', 'click', 'Boton-Traspasos-y-Pagos');
  	});
  	$('#btnTraspasos').on('click', function() {
  		ga('send', 'event', 'Botones Menu-Nuevo', 'click', 'Boton-Traspasos-y-Pagos-Traspasos');
  	});
</script>
<!--  FIN GP13896 - Optimización Inversión Online V 2.0 -->
</body>
</html>