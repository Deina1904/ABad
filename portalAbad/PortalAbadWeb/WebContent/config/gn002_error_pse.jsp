<HTML>
<HEAD>
    <title>.- posicion global</title>
    <link rel=stylesheet type='text/css' href="estilos/tablas.css">
    <script language="Javascript"></script>
    <script language="JavaScript" src="js/tiempo.js"></script>
    <script language="Javascript" src="js/banner.js"> </script>
    <script language="Javascript" src="js/utilidades.js"> </script>
    <script language="JavaScript" src="js/pago_ecomm.js"></script>
    <script language="JavaScript" src="js/tiempoecomm.js"></script>
	<script language="JavaScript">
  <!--
  parent.cabecera.confirmPago = '0';
  parent.cabecera.auto = '0';
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

  function Validar(cuentas){
        var cuenta  =cuentas.ClaveOperacion.value;
        var bResultado = true;

        if(cuenta==""){
            alert("Introduzca su clave de operaciones");
            cuentas.ClaveOperacion.focus();
            return (false);
        } else{
           return (true);
        }
  }


  function excluirAsunto(forma1, opcion) { //v3.0
    if(opcion == 1){
       forma1.NumTarjeta.options[0].selected = true;
       forma1.Cuotas.options[0].selected = true;
    }
    else{
     forma1.AsuntoPropio.options[0].selected = true;
    }
  }
  //-->
  </script>	
    <META HTTP-EQUIV="EXPIRES" CONTENT="1">
    <META HTTP-EQUIV="CACHE-CONTROL" CONTENT="NO-CACHE">
    <META HTTP-EQUIV="PRAGMA" CONTENT="NO-CACHE">
</HEAD>
<BODY onLoad="controlSesion();startBanner()" class="pag-contenido" link="#660099">
<%@ include file ="includecbtf.jsp"  %>

<%
	String url = (String) urls.get("urlComercio");
	if( url != null && url != " ")
	{
		out.println("<form method=\"post\" name=\"error\" action=\"" + urls.get("cancelar") + "\"> ");
	}
	else
	{
		out.println("<form method=\"post\" name=\"error\" action=\"" + urls.get("urlBbva") + "\"> ");	
	}
//<form method="post" name="error" action= "<%=urls.get("cancelar")">
%>

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
<table cellpadding="9" cellspacing="0" border="0" width="70%" >
   <tr bgcolor="#335EB4">
     <td>
        <p class="textablacabecera1"><%=datos.get("mensaje")%></p>
     </td>
   </tr>
   <tr>
	<td width="100%">
		<div align="center">
		<%
//			String est = null;
//			est = (String) datos.get("estado_usuario");
//			if((url != null && url != " " && est == "0") || (url != null && url != " " && (est == null || est == " "))
			String men = null;
			men = (String) datos.get("mensaje");
			if(url != null && url != " " && men.indexOf("P-") == -1)

			{
				out.print("<input type=\"submit\" value=\"Aceptar\" name=\"button1\" onclick=\"MM_goToURL('top','" + urls.get("urlComercio") + "');return document.MM_returnValue;\">");
			}
			else
			{
//				if((url != null && url != " " && est == "1") || (url != null && url != " " && (est == null || est == " "))
				if(url != null && url != " " && men.indexOf("P-") > 0)
				{
					out.print("<input type=\"submit\" value=\"Aceptar\" name=\"button1\" onclick=\"MM_goToURL('self','" + urls.get("cancelar") + "');return document.MM_returnValue;\">");			
				}
				else
				{
					out.print("<input type=\"submit\" value=\"Aceptar\" name=\"button1\" onclick=\"javascript:parent.cabecera.auto='1';parent.cabecera.salir1.click();\">");			
				}					
			}
//			<input type="submit" value="Aceptar" name="button1" onClick="MM_goToURL('top','<%=urls.get("urlComercio")>');return document.MM_returnValue">
		%>
			
       	</div>
    </td> 
   </tr>
</table>
</div>
</form>
</BODY>
</HTML>
