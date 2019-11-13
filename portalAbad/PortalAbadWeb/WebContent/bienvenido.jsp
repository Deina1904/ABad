<html>
<head>
<title></title>
<META HTTP-EQUIV="EXPIRES" CONTENT="1"> 
<meta http-equiv="Content-Type" content="text/html; charset=iso-8859-1">
<LINK rel=STYLESHEET type='text/css' href="estilos/tablas.css">
<script language="JavaScript" src="js/tiempo.js"></script>
<script language="JavaScript">
<!--
function MM_swapImgRestore() { //v2.0
  if (document.MM_swapImgData != null)
    for (var i=0; i<(document.MM_swapImgData.length-1); i+=2)
      document.MM_swapImgData[i].src = document.MM_swapImgData[i+1];
}

function MM_preloadImages() { //v2.0
  if (document.images) {
    var imgFiles = MM_preloadImages.arguments;
    if (document.preloadArray==null) document.preloadArray = new Array();
    var i = document.preloadArray.length;
    with (document) for (var j=0; j<imgFiles.length; j++) if (imgFiles[j].charAt(0)!="#"){
      preloadArray[i] = new Image;
      preloadArray[i++].src = imgFiles[j];
  } }
}

function MM_swapImage() { //v2.0
  var i,j=0,objStr,obj,swapArray=new Array,oldArray=document.MM_swapImgData;
  for (i=0; i < (MM_swapImage.arguments.length-2); i+=3) {
    objStr = MM_swapImage.arguments[(navigator.appName == 'Netscape')?i:i+1];
    if ((objStr.indexOf('document.layers[')==0 && document.layers==null) ||
        (objStr.indexOf('document.all[')   ==0 && document.all   ==null))
      objStr = 'document'+objStr.substring(objStr.lastIndexOf('.'),objStr.length);
    obj = eval(objStr);
    if (obj != null) {
      swapArray[j++] = obj;
      swapArray[j++] = (oldArray==null || oldArray[j-1]!=obj)?obj.src:oldArray[j];
      obj.src = MM_swapImage.arguments[i+2];
  } }
  document.MM_swapImgData = swapArray; //used for restore
}
//-->
</script>
</head>

<body bgcolor="#FFFFFF" onLoad="controlSesion();MM_preloadImages('images/aceptar.gif','#960883689590')">
<%@ include file="includecbtf.jsp" %>
<div align="center">
<%
	com.ibm.dse.base.Hashtable nombrec = (com.ibm.dse.base.Hashtable) datos.get("nombrec");
%>
<br><br>
  <TABLE width="22%" border="0" align="center" height="95">
    <TR>
	  <TD align="center" height="99"><img src="images/BBVAnet.gif" width="450" height="140"></TD>
  </TR>
</TABLE>
  <p>&nbsp;</p><table width="68%" height="90">
    <tr>
      <td>
        <div align="center">
          <pre><font color="#000080"><font face="arial MT"><font size="3"><b><font face="Arial, Helvetica, sans-serif">Bienvenido(a): <%=nombrec.get("nombrecliente")%>

Usted se ha registrado exitosamente en nuestro sistema.
</font><font color="#ffffff"><font face="arial MT"><font color="#ffffff"><font face="arial MT"><font color="#000080"><font face="arial MT"><font size="3"><b><font face="Arial, Helvetica, sans-serif">Nos complace tenerlo como usuario de nuestros servicios en internet.</font></b></font></font></font></font></font></font></font></b></font></font></font></pre>
        </div>
      </td>
    </tr>
  </table>
  <p>&nbsp;</p>
  <div align="center">
<table align="center" width="100%" cellspacing="0" cellpadding="0" border="0">
	<tr>
		<td align="center">
          <CENTER>
            <TABLE width="66%" border="0" height="60">
	<TR>
	</TR>
	<TR>

<% /*
 	String sidcliente = (String) datos.get("idcliente");
	if(!sidcliente.substring(0,1).equals("4"))
		out.print("<TD align=\"center\"><a href=\"https://www.bbvanet.com.co/index.html?accion=ganaempresa\"\"><img name=\"Image2\" border=\"0\" src=\"images/aceptar.gif\" width=\"71\" height=\"24\"></a>");

	else
		out.print("<TD align=\"center\"><a href=\"https://www.bbvanet.com.co/index.html\"\"><img name=\"Image2\" border=\"0\" src=\"images/aceptar.gif\" width=\"71\" height=\"24\"></a>");
   */
 %>
	  <TD align="center">
	    <a href="https://www.bbvanet.com.co/index.html?accion=ganaempresa">
	      <img name="Image2" border="0" src="images/aceptar.gif" width="71" height="24">
		</a>
	  </TD>
	</TR>
  </TABLE>
</CENTER>
</table>

  </div>
</div></html>









