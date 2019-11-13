<HTML>
<HEAD>
 <title></title>
 <link rel="stylesheet" type="text/css" href="estilos/tablas.css">
 <script language="JavaScript" src="https://www.e-bbva.com.co/common/js/principal.js" ></script> 
    <script language="JavaScript" src="js/tiempo.js"></script>
    <script language="Javascript" src="js/banner.js"> </script>
    <script language="Javascript" src="js/utilidades.js"> </script>
    <script language="JavaScript" src="js/pago_ecomm.js"></script>
    <script language="JavaScript" src="js/tiempoecomm.js"></script>
 <%@ include file ="includecbtf.jsp" %>
 <META HTTP-EQUIV="EXPIRES" CONTENT="1">
</HEAD>
<!--<BODY onLoad="controlSesion();startBanner();" onunload="salir();"  class="pag-contenido" link="#660099" bgcolor="#EBEFF8" > -->
<BODY onLoad="controlSesion();startBanner();" class="pag-contenido" link="#660099" bgcolor="#EBEFF8" >

<%
	String url =(String) datos.get("jspUrlComercio");
	String nulo = "S";
	if( url != null && url != " ")
	{
		out.println("<form method=\"post\" name=\"error\" action=\"" + url + "\">");
		nulo="N";
	}
	else
	{
		out.println("<form method=\"post\" name=\"error\" action=\"" + urls.get("cancelar") + "\"> ");
	}
%>

<table width="600" height="300" border="0" align="center" >
  <tr>
  <td height="83" align="center" valign="middle">
   <table width="503" border="0" align="center" cellpadding="0" cellspacing="0" background="images/cabecera.gif" >
    <tr>
	 <td align="center" width="84%"><img src="images/cuadro.gif"  alt="Baner" border="0"></td>
	      <td align="center" width="16%">&nbsp;</td>	 
    </tr>
   </table>
  </td>
 </tr>
 <tr>
    <td height="175" align="center"> 
      <table width="70%" border="1" height="36" bgcolor="#335EB4">
    <tr>
     <td>
      <p class="textablacabecera1"><%=datos.get("mensaje")%></p>
     </td>
    </tr>
   </table>
  </td>
 </tr>
 <tr>
	<td width="100%">
		<div align="center">
		<% 
			if(nulo.equals("N"))
			{
//				out.print("<input type=\"submit\" value=\"Aceptar\" name=\"button1\" onclick=\"MM_goToURL('top','" + datos.get("jspUrlComercio") + "');return document.MM_returnValue\">");
				out.print("<input type=\"button\" value=\"Aceptar\" name=\"button1\" onclick=\"salir();\">");
			}
			else
			{
//				out.print("<input type=\"submit\" value=\"Aceptar\" name=\"button1\" onclick=\"MM_goToURL('top','" + urls.get("cancelar") + "');return document.MM_returnValue\">");
				out.print("<input type=\"submit\" value=\"Aceptar\" name=\"button1\">");
			}
		%>

       	</div>
    </td> 
   </tr>
</table>
</BODY>
</HTML>
