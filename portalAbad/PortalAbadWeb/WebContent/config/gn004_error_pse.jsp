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
	<script language="JavaScript">
function MM_goToURL() { //v3.0
   var i, args=MM_goToURL.arguments; document.MM_returnValue = false;
   for (i=0; i<(args.length-1); i+=2) eval(args[i]+".location='"+args[i+1]+"'");
  }

  function MM_findObj(n, d) { //v3.0
   var p,i,x;  if(!d) d=document; if((p=n.indexOf("?"))>0&&parent.frames.length) {
     d=parent.frames[n.substring(p+1)].document; n=n.substring(0,p);}
   if(!(x=d[n])&&d.all) x=d.all[n]; for (i=0;!x&&i<d.forms.length;i++) x=d.forms[i][n];
   for(i=0;!x&&d.layers&&i<d.layers.length;i++) x=MM_findObj(n,d.layers[i].document); return x;
  }

  function MM_showHideLayers() { //v3.0
   var i,p,v,obj,args=MM_showHideLayers.arguments;
   for (i=0; i<(args.length-2); i+=3) if ((obj=MM_findObj(args[i]))!=null) { v=args[i+2];
     if (obj.style) { obj=obj.style; v=(v=='show')?'visible':(v='hide')?'hidden':v; }
     obj.visibility=v; }
  }
  function MM_preloadImages() { //v3.0
   var d=document; if(d.images){ if(!d.MM_p) d.MM_p=new Array();
     var i,j=d.MM_p.length,a=MM_preloadImages.arguments; for(i=0; i<a.length; i++)
     if (a[i].indexOf("#")!=0){ d.MM_p[j]=new Image; d.MM_p[j++].src=a[i];}}
  }

  function MM_swapImgRestore() { //v3.0
   var i,x,a=document.MM_sr; for(i=0;a&&i<a.length&&(x=a[i])&&x.oSrc;i++) x.src=x.oSrc;
  }

  function MM_swapImage() { //v3.0
   var i,j=0,x,a=MM_swapImage.arguments; document.MM_sr=new Array; for(i=0;i<(a.length-2);i+=3)
    if ((x=MM_findObj(a[i]))!=null){document.MM_sr[j++]=x; if(!x.oSrc) x.oSrc=x.src; x.src=a[i+2];}
  }
</script>
 <META HTTP-EQUIV="EXPIRES" CONTENT="1">
</HEAD>
<BODY onLoad="controlSesion();startBanner();" onunload="salir();" class="pag-contenido" link="#660099" bgcolor="#EBEFF8" >
<%@ include file ="includecbtf.jsp" %>
<%
	String url =(String) datos.get("jspUrlComercio");
	String nulo="S";
	if (url != null && url != " ")
	{
		out.println("<form method=\"post\" name=\"error\" action=\"salir();\"> ");
		nulo="N";
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
      <p class="textablacabecera1">TRANSACCI&Oacute;N CANCELADA</p>
     </td>
    </tr>
   </table>
  </td>
 </tr>
    <tr>
	<td width="100%">
		<div align="center">
		<% 
			if (nulo.equals("N"))
			{
//				out.print("<input type=\"submit\" value=\"Aceptar\" name=\"button1\" onclick=\"javascript:parent.cabecera.auto='1';parent.cabecera.salir1.click();\">");
				out.print("<input type=\"submit\" value=\"Aceptar\" name=\"button1\" onclick=\"MM_goToURL('top','" +  datos.get("jspUrlComercio") + "');return document.MM_returnValue;\">");
			}
			else
			{
//				out.print("<input type=\"submit\" value=\"Aceptar\" name=\"button1\" onclick=\"javascript:parent.cabecera.auto='1';parent.cabecera.salir1.click();\">");
				out.print("<input type=\"button\" value=\"Aceptar\" name=\"button1\" onclick=\"MM_goToURL('top','" + urls.get("urlBbva") + "');return document.MM_returnValue;\">");
			}
		%>
       	</div>
    </td> 
   </tr>
</table>
</form>
</BODY>
</HTML>
