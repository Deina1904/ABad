<HTML>
<HEAD>
    <title></title>
    <link rel=stylesheet type='text/css' href="estilos/tablas.css">
    <script language="Javascript" src="js/banner.js"> </script> 
    <script language="Javascript"></script>
    <script language="JavaScript" src="js/tiempo.js"></script>
    <META HTTP-EQUIV="EXPIRES" CONTENT="1">
</HEAD> 
<BODY onLoad="controlSesion();startBanner()" class="pag-contenido" link="#660099">  
<%@ include file ="includecbtf.jsp" %> 
<br>
<div align="center">
<table border="0" cellpadding="0" cellspacing="0">

   <tr>
     <td colspan="3"><img src="images/linea.gif" border="0"></td>
   </tr>
   
   <tr>
     <td ><img src="images/titular.gif" border="0"></td>
     <td  width ="169" class="fondotitular">
        <font class="texttitular"><%=datos.get("usuario")%></font>
     </td>
   </tr>
   
   <tr>
     <td colspan="3"><img src="images/linea.gif" border="0"></td>
   </tr>
   
</table>

<br><br><br><br><br><br>
<table width="70%" border="1" height="36" bgcolor="#335EB4">

   <tr> 
     <td>
        <p class="textablacabecera1"><%=datos.get("mensaje")%></p>
     </td>
   </tr>
   
</table>
<br><br>
</div>
</BODY>
</HTML>
