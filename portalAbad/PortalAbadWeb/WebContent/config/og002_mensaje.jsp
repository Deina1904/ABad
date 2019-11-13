
<html>
<head>
<META HTTP-EQUIV="EXPIRES" CONTENT="1">
<title></title>
<meta http-equiv="Content-Type" content="text/html; charset=iso-8859-1">
<LINK rel=STYLESHEET type='text/css' href="estilos/tablas.css">
<script language="JavaScript" src="js/tiempo.js"></script>
<script language="JavaScript">

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

</script>
<style type="text/css">
.estilo1 {  font-family: Verdana,sans-serif; font-size: 14px; color: #000080}
</style>

</head>
<body bgcolor="#FFFFFF" onLoad="controlSesion()">
<%@ include file="includecbtf.jsp" %>
<TABLE width="75%" border="0" align="center">
  <TR>
	<TD height="124"><div align="center"><img src="images/BBVAnet.gif" width="450" height="140"></div></TD>
  </TR>
</TABLE>
<P>&nbsp;</P>
<TABLE width="64%" border="0" height="60" align="center">
  <TR>
	<TD align="center" class="estilo1"><strong>
 <%
	com.ibm.dse.base.Hashtable nombrec = (com.ibm.dse.base.Hashtable) datos.get("nombrec");
    %>
	  <p align="center" class="estilo1"><%=datos.get("mensaje")%></p>
	</strong>
	</TD>
  </TR>
</TABLE>
<CENTER>
  <TABLE width="66%" border="0" height="60">
	<TR>
	  <TD align="center"><A href="https://www.bbvanet.com.co/index.html?accion=ganaempresa"><IMG name="Image2" border="0" src="images/aceptar.gif" width="71" height="24"></A> 
      </TD>
	</TR>
  </TABLE>
</CENTER>
</html>
