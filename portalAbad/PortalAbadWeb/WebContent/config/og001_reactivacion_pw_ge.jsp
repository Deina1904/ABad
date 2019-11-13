<html>
 <head>
  <META HTTP-EQUIV="EXPIRES" CONTENT="1">
  <title>BBVANET COLOMBIA.- Alta de Usuario</title>
  <meta http-equiv="Content-Type" content="text/html; charset=iso-8859-1">
  <LINK rel=STYLESHEET type='text/css' href="estilos/tablas.css">
  <script language="JavaScript" src="js/utilidades.js"></script>
  <script language="JavaScript" src="js/og001_reactivacion_pw_ge.js"></script>
  <script language="JavaScript" src="js/tiempo.js"></script>
  <script language="JavaScript"></script>
  <script language="JavaScript">

  var scrtxt="En este sitio Usted podrá realizar consultas y transacciones con sus cuentas "+ "y su tarjeta de crédito";
  var lentxt=scrtxt.length;
  var width=100;
  var pos=1-width;

  function scroll() {
   pos++;
   var scroller="";
   if (pos==lentxt) {
    pos=1-width;
   }

   if (pos<0) {
    for (var i=1; i<=Math.abs(pos); i++) {
      scroller=scroller+" ";}
    scroller=scroller+scrtxt.substring(0,width-i+1);
   }
   else {
    scroller=scroller+scrtxt.substring(pos,width+pos);
   }
   window.status = scroller;
   setTimeout("scroll()",100);
  }
  </script>
  <style type="text/css">
<!--
.estilo1 {  font-family: Verdana,sans-serif; font-size: 12px; color: #000080 }
.estilo2 {  font-family: Verdana,sans-serif; font-size: 11px; color: #000080 }
.estilo3 {  font-family: Arial, Helvetica, sans-serif; font-size: 15px; color: #02E8CB; font-weight: bold}
.estilo4 {  font-family: Arial, Helvetica, sans-serif; font-size: 13px; color: #FFFFFF; font-weight: bold}
.estilo5 {  font-family: Arial, Helvetica, sans-serif; font-size: 4px}
.estilo11 {  font-family: Arial, Helvetica, sans-serif; font-size: 14px}
.estilo12 {  font-family: Arial, Helvetica, sans-serif; font-size: 13px; color: #FFFFFF; font-weight: bold}
.estilox {  font-family: Arial, Helvetica, sans-serif; font-size: 9px; color: #000080; font-weight: bold}
-->
  </style>
 </head>

  <body onLoad="controlSesion();scroll();return true" bgcolor="#FFFFFF">
<%@ include file ="includecbtf.jsp" %>
<%
	out.print("<form action=\"" + urls.get("confirmar") + "\" name=\"alta\" method=\"post\">" );
%>
  <div align="center">
   <br>
    <table width="668" border="0" cellpadding="0" cellspacing="2">
     <tr> 
      <td height="21">
       <table width="100%" border="0" cellspacing="0" cellpadding="0">
        <tr><td><img src="images/logoempresascompleto.gif" width="661" height="131"></td></tr>
       </table>
       <table width="100%" border="0" cellspacing="0" cellpadding="0">
        <tr>
         <td width="2%" height="15" bgcolor="#DDDDDD"> </td>
         <td width="98%" height="15" bgcolor = "#DDDDDD"> </td>
        </tr>
  	    <tr>
         <td width="2%" height="25"bgcolor="#DFE7EF"> </td>
         <td height="25" bgcolor="#DFE7EF">
		  <font class="estilo2"> Para crear su clave de acceso al sistema complete la informaci&oacute;n solicitada en los siguientes campos</font>
		 </td>
        </tr>
  	   </table>
<table width="100%" border="0" cellspacing="0" cellpadding="0">
        <tr>
 	     <td width="2%" height="39"bgcolor="#DFE7EF"> </td>
         <td width="62%" height="21"bgcolor="#DFE7EF">

		  <font color="#003399" class= "estilo1">
		   <strong>C&oacute;digo de Empresa:</strong>
		  </font>
		  <font color="#003399" class= "estilo2"> 
           C&oacute;digo asignado por el Banco, conformado por 6 dig&iacute;tos. No es necesario digitar los ceros de la izquierda.
		  </font>
		 </td>
         <td width="35%" class="estilo11" bgcolor="#DFE7EF" > &nbsp; &nbsp; <input type="text" name="NumeroTarjeta2" size="6" maxlength="6" class="estilo11"> </td>
        </tr>
        <tr> 
		 <td colspan="2"  height="10" bgcolor="#DFE7EF" > </td>
         <td  height="10" bgcolor="#DFE7EF" > </td>
        </tr>
        <tr> 
          <td width="2%" height="39"bgcolor="#DFE7EF"> </td>
		  <td width="65%" height="21"bgcolor="#DFE7EF" >
		  <font color="#003399" class= "estilo1"  ><strong>C&oacute;digo de Usuario: </strong></font>
		  <font color="#003399" class= "estilo2"  >
		   C&oacute;digo asignado por el Banco,conformado por 4 d&iacute;gitos. No es necesario digitar los ceros de la izquierda.
		  </font>
		 </td>
         <td width="35%" class="estilo11"bgcolor="#DFE7EF" >&nbsp; &nbsp; <input type="text" name="NumeroTarjeta3" size="6" maxlength="6" class="estilo11"></td>
        </tr>
        <tr> 
          <td colspan="2"  height="10" bgcolor="#DFE7EF"  > </td>
          <td  height="10" bgcolor="#DFE7EF" > </td>
        </tr>
        <tr> 
          	     <td width="2%" height="39"bgcolor="#DFE7EF"> </td>
		 <td width="65%" height="21"bgcolor="#DFE7EF">
		  <font color="#003399" class= "estilo1" ><strong>Clave inicial de acceso</strong></font>
		  <font color="#003399" class= "estilo2" >Clave suministrada por el Banco.</font>
		 </td>
         <td width="35%" class="estilo11"bgcolor="#DFE7EF" >&nbsp; &nbsp; <input type="password" name="Nip" size="6" maxlength="4" class="estilo11"> </td>
        </tr>
        <tr> 
         <td colspan="2" height="10" bgcolor="#DFE7EF" > </td>
         <td  height="10" bgcolor="#DFE7EF" > </td>
        </tr>
        <tr> 
          	     <td width="2%" height="39"bgcolor="#DFE7EF"> </td>
		 <td width="65%" height="21"bgcolor="#DFE7EF">
		  <font color="#003399" class= "estilo1" ><strong>Crear Clave</strong></font><br>
          <font><font color="#003399" class= "estilo2">Elija su clave personal de acceso a BBVA net empresas*</font></font>
		 </td>
         <td width="35%" class="estilo11"bgcolor="#DFE7EF" >&nbsp; &nbsp; <input type="password" name="PasswordSistema" size="8" maxlength="8"class="estilo11"></td>
        </tr>
        <tr> 
		 <td colspan="2"  height="10" bgcolor="#DFE7EF" > </td>
         <td  height="10" bgcolor="#DFE7EF" > </td>
        </tr>
        <tr> 
          	     <td width="2%" height="39"bgcolor="#DFE7EF"> </td>
		 <td width="65%" height="21"bgcolor="#DFE7EF">
		  <font color="#003399" class= "estilo2" >Confirme su clave personal de acceso a BBVA net empresas*</font>
		  <font face="Verdana, Arial, Helvetica, sans-serif" class="estilo3">&nbsp;</font>
		  <font face="Verdana, Arial, Helvetica, sans-serif" class="estilo1">&nbsp;</font>
		 </td>
         <td width="35%" class="estilo11"bgcolor="#DFE7EF" >&nbsp; &nbsp; <input type="password" name="ConfSistema" size="8" maxlength="8" class="estilo11"></td>
        </tr>
        <tr> 
		 <td colspan="2"  height="10" bgcolor="#DFE7EF" > </td>
         <td  height="10" bgcolor="#DFE7EF" > </td>
        </tr>
       </table>
       <table width="661" border="0" cellspacing="0" cellpadding="0">
        <tr> 
          	     <td width="2%" height="39"bgcolor="#DFE7EF"> </td>
		<td width="660" bgcolor="#DFE7EF">
 		  <font color="#003399" class= "estilox">* La clave debe ser conformada m&iacute;nimo por 5, m&aacute;ximo por 8 caracteres alfanum&eacute;ricos.<br></font>
		  <font color="#003399" class= "estilox" >El sistema tiene en cuenta min&uacute;sculas y may&uacute;sculas.</font>
		 </td>
        </tr>
        <tr> 
         <td colspan="2" height="10" bgcolor="#DFE7EF" > </td>
         <td width="1"  height="20" bgcolor="#DFE7EF" > </td>
        </tr>
       </table>
       <table width="661" border="0" cellspacing="0" cellpadding="0">
        <tr> 
         <td width="2%" height="39"bgcolor="#DFE7EF"> </td>
		 <td width="65%" height="21"bgcolor="#DFE7EF" >
		  <font color="#003399" class= "estilo2" >Ingrese su correo electr&oacute;nico de contacto (Opcional)</font>
		 </td>
         <td width="35%" class="estilo11"bgcolor="#DFE7EF" > &nbsp; &nbsp; <input type="text" name="Correo" size="25" maxlength="37" class="estilo11"> </td>
        </tr>
       </table>
       <table width="661" border="0" cellspacing="0" cellpadding="0">
        <tr> <td colspan="5"  height="10" bgcolor="#DFE7EF" ></td></tr>
        <tr> 
         <td colspan="5" height="21" align="center" bgcolor="#DFE7EF">
		  <a href="JavaScript:Validar(document.alta)"><img src="images/aceptar.gif" width="71" height="24" border="0"></a>
		  &nbsp;
		  <a href="#" onClick="top.location='http://www.bbva.com.co'"><img src="images/cancelar.gif" width="81" height="24" border="0"></a>
		 </td>
        </tr>
        <tr><td colspan="5"  height="10" bgcolor="#DFE7EF"></td></tr>
        <tr><td colspan="5" height="10" bgcolor="#DDDDDD"></td></tr>
        <tr><td colspan="5" height="10" bgcolor="#DFE7EF"></td></tr>
       </table>
	  </td>
      <td width="16">&nbsp;</td>
     </table>

     <input type="hidden" name="NumeroCuenta" size="20" maxlength="20" style="visibility: hidden">
     <input type="hidden" name="NumeroTarjeta" size="16" maxlength="16" style="visibility: hidden">
     <input type="hidden" name="ConfOperacion" size="8" maxlength="8" style="visibility: hidden">
     <input type="hidden" size="8" maxlength="8" style="visibility: hidden" name="PasswordOperacion">
    </form>
    <div align="left" >
     <script language="JavaScript">
<!--
 if(document.all){
  document.write("<div id=\"Layer2\" style=\"position:absolute; width:522px; height:20px; z-index:2; left: 14%; top: 152px\">");
 }
 else{
  document.write("<layer id=\"Layer2\" left=\"14%\" top=\"152\" width=\"522\" height=\"20\" z-index=\"2\">");
 }
//-->
     </script><font class="estilo1">
     <script language="JavaScript">
<!--
 if(document.all){
  document.write("<div id=\"Layer2\" style=\"position:absolute; width:500px; height:20px; z-index:2; left: 0%; top: 211px\">");
 }
 else{
  document.write("<layer id=\"Layer2\" left=\"0%\" top=\"217\" width=\"450\" height=\"20\" z-index=\"2\">");
 }
//-->
     </script>
	<br>
  </body>
</html>
