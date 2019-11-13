<html>
<head>
<META HTTP-EQUIV="EXPIRES" CONTENT="1">
<title></title>
<meta http-equiv="Content-Type" content="text/html; charset=iso-8859-1">
<script language="JavaScript" src="https://www.e-bbva.com.co/common/js/utilidades.js"></script>
<script language="JavaScript" src="https://www.e-bbva.com.co/common/js/principal.js"></script>
<script language="JavaScript" src="js/tiempo.js"></script>
<script language="JavaScript">
<!--

function netscapeKeyPress(e){
   if (e.which == 13)
      Validar(document.entrada)
}

function netscapePress(){
      ValidarApp(document.entrada);
}

function microsoftKeyPress() {
   if (window.event.keyCode == 13)
      Validar(document.entrada);
}



if (navigator.appName == 'Netscape'){
   validarpoli();
   window.captureEvents(Event.KEYPRESS);
   window.onKeyPress = netscapeKeyPress;
}
var scrtxt="En este sitio Usted podrá realizar operaciones de e-Commerce y pagos con sus cuentas y su tarjeta de crédito";
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

function MM_findObj(n, d) { //v3.0
   var p,i,x;  if(!d) d=document;
   if((p=n.indexOf("?"))>0&&parent.frames.length) {
      d=parent.frames[n.substring(p+1)].document; n=n.substring(0,p);
   }
   if(!(x=d[n])&&d.all) x=d.all[n];
   for (i=0;!x&&i<d.forms.length;i++) x=d.forms[i][n];
   for(i=0;!x&&d.layers&&i<d.layers.length;i++) x=MM_findObj(n,d.layers[i].document);
   return x;
}
//-->
</script>
<style type="text/css">
<!--
.estilo1       { font-family: Arial, Helvetica, sans-serif; font-size: 13px; color: #FFFFFF; font-weight: bold}
.estilo11      { font-family: Arial, Helvetica, sans-serif; font-size: 13px; color: #003366}
.estilo12      { font-family: Arial, Helvetica, sans-serif; font-size: 18px; font-style: normal; font-weight: bold; color: #003366; text-align: center;}
.estilo13      { font-family: Arial, Helvetica, sans-serif; font-size: 12px; color: #FFFFFF; font-style: normal; text-align: left;}
.oculto        { font-family: Arial, Helvetica, sans-serif; FONT-SIZE: 16px;  COLOR: white; TEXT-DECORATION: underline}
.oculto1       { font-family: Arial, Helvetica, sans-serif; FONT-SIZE: 18px;  COLOR: white; TEXT-DECORATION: none}
.oculto1:hover { font-family: Arial, Helvetica, sans-serif; FONT-SIZE: 18px;  COLOR: white; TEXT-DECORATION: underline}
//-->

</style>
<LINK href="estilos/nl2_estilos.css" type=text/css rel=stylesheet>
</head>


<body bgcolor="#FFFFFF" onLoad="tiempofuera();scroll();">
   <%@ include file ="includecbtf.jsp" %>
   <%@ include file ="includewebappredirect.jsp"  %>
   <table width="652" height="230" border="0" align="center" cellpadding="0" cellspacing="0">


   </table>

   <table width="652" height="330" border="0" align="center" cellpadding="0" cellspacing="0">
    <tr height="230">
     <td>
      <table width="652" border="0" height="230" cellpadding="0" cellspacing="0">
       <tr height="80">
        <td>
         <table height="80" width="652" border="0" cellspacing="0" cellpadding="0">
          <tr>
           <td height="80" width="343"><img src="images/bbvanetlogin.gif" height="68" width="343"></td>
           <td height="80" width="309" align="center" valign="middle"><p class="estilo12">Bienvenido al Portal e-Commerce de la Banca a Distancia de BBVA</p></td>
          </tr>
         </table>
        </td>
       </tr>
       <tr height="20" bgcolor="#dfe7ef">
        <td height="20">
         <%
          java.util.Vector v = (java.util.Vector)(datos.get("listaWebApps"));
		  java.util.Vector v1 = (java.util.Vector)(datos.get("lista_eComms"));
          java.util.Hashtable elem;
          java.util.Hashtable elem1;
		  java.util.Enumeration e = v.elements();
          java.util.Enumeration e1 = v1.elements();
          String desRefBBVAeComm="";
		  String redirjsp="";
          boolean continuar= true;
		  while (e1.hasMoreElements() & continuar){
            elem1 = (com.ibm.dse.base.Hashtable)(e1.nextElement());
            if(refBBVAeComm.equalsIgnoreCase(((String)elem1.get("RefBBVAeComm")).trim())){
              desRefBBVAeComm= ((String)elem1.get("descriptionData")).trim();
              continuar=false;
		    }
          }
		 %>		
        </td>
       </tr>
       <tr height="130" bgcolor="#dfe7ef">
        <td height="130">
         <table width="652" height="130" border="0" cellpadding="0" cellspacing="0" >
          <tr>
          <td width="10"></td>
           <td>
            <table width="632" height="130" border="0" cellpadding="0" cellspacing="0" >
             <tr height="50"><td height="50" align="left" width="632" valign="top" class="txtadlnt1">
               <table width="632" height="50" border="0" cellpadding="0" cellspacing="0">
                <tr class="txtadlnt1" height="20" width="632">
                 <td height="20" width="160" align="left"><b><font color="#000088" size="2" face="Arial, Helvetica, sans-serif">Servicio de e-Commerce</font></b></td>
                 <td height="20" width="472" align="left" bgcolor="#335EB4" style="border-style: inset; border-width: thin"><p class="estilo13">&nbsp;<%out.print(desRefBBVAeComm);%>&nbsp;</p></td>
                </tr>
                <tr class="txtadlnt2" height="30" width="632" colspan="2">
                 <td valign="top" colspan="2">
                  <p align="justify"><font color="#000088" size="2" face="Arial, Helvetica, sans-serif">Hemos recibido esta solicitud de ingreso a nuestro portal de e-commerce por parte de la entidad comercial donde usted est&aacute; realizando su transacci&oacute;n.</font></p>
                 </td>
                </tr>
               </table>
              </td>
             </tr>
             <tr height="20">
              <td height="20">
               <img src="images/lineaBBVA.gif" height="3" width="632">
              </td>
             </tr>
             <tr height="60" width="632">
              <td height="60">
               <table width="632" border="0">
                <tr>
                 <td height="20" width="440">
                  <b><font color="#000088" size="2" face="Arial, Helvetica, sans-serif">Usted est&aacute; registrado en </font></b>
                 </td>
                 <td height="60" width="192" rowspan="2" valign="top" align="right">
                  <table height="60" border="0" cellspacing="0" cellpadding="0" >
                   <tr>
                    <td valign="top" align="right">
					<form action="" method="post"  name="entrada">
                     <select name="WebApp" class="estilo11" >
                      <option value="" ></option>
                       <% 
                        elem1 = (com.ibm.dse.base.Hashtable)(v1.get(0));
  				        while (e.hasMoreElements()){
                         	elem = (com.ibm.dse.base.Hashtable)(e.nextElement());
							String webApp1 = ((String)elem.get("descriptionData")).trim();
                         	String urlWebApp1 = ((String)elem.get("urlData")).trim() + "?" + ((String)elem1.get("procRedir")).trim();
							if(refBBVAeComm.equals("PSE")){
								if(!webApp1.equals("BBVA net Empresas")){
								 	out.println("<option value=\"" + urlWebApp1 + "\">" + webApp1 + "</option>");
								}
							}
							else{
								 	out.println("<option value=\"" + urlWebApp1 + "\">" + webApp1 + "</option>");
							}
						}
					  %>
                     </select>
                     <% 
					 	out.println(inputRedirect);
					 %>
                     </form>
					 <script language="JavaScript">
					 //----Begin
						function ValidarApp(form){
						   var urlRedirection = form.WebApp.options[form.WebApp.selectedIndex].value;
						   var urlPersonas = '<%=urls.get("personas")%>';
   						   var urlVip = '<%=urls.get("vip")%>';
						   var urlEmpresas = '<%=urls.get("empresas")%>';
						   var bResultado = true;
						   var urlRedirection1="";
						   if(urlRedirection==""){
							  alert("Debe seleccionar Un Portal Transaccional");
							  form.WebApp.focus();
							  bResultado = false;
						   }
						   if(bResultado){
							  if(urlRedirection.indexOf(urlPersonas) != -1){
								 urlRedirection1=urlRedirection;
							  }
							  else{
								if(urlRedirection.indexOf(urlEmpresas) != -1){
								  urlRedirection1=urlRedirection+"&BBVAPortal=ENET";
								}
								else{
									if(urlRedirection.indexOf(urlVip) != -1){
								  		urlRedirection1=urlRedirection+"&BBVAPortal=VNET";
									}
							  	}
							  }
							  form.action = urlRedirection1;
							  form.submit();
						   }
						}
					//----End
					 </script>
					 
                    </td>
                   </tr>
                  </table>
                 </td>
                </tr>
                <tr>
                 <td height="40" width="440">
                  <font color="#000088" size="2" face="Arial, Helvetica, sans-serif">Seleccione el Portal Transaccional donde usted tiene registrada la Cuenta o Tarjeta de Cr&eacute;dito con la que realizar&aacute; el pago de su operaci&oacute;n.</font>
                 </td>
                </tr>
               </table>
              </td>
             </tr>
            </table>
           </td>
           <td width="10"></td>
          </tr>
         </table>
        </td>
       </tr>
      </table>
     </td>
    </tr>
    <tr height="50" bgcolor="#dfe7ef">
     <td>
      <table height="50" border="0" cellpadding="0" cellspacing="0">
       <tr>
        <td height="50">
         <table width="652" border="0" cellpadding="0" cellspacing="0">
          <tr height="50" bgcolor="#dfe7ef">
           <td width="468" ></td>
           <td width="154">
            <table width="202" border="0" cellpadding="0" cellspacing="10">
             <tr>
              <td align="center" bgcolor="70a0d0" height="30"><a href="javascript:netscapePress();" class="oculto1" title="Entrar a BBVA net e-Commerce"><strong>Continuar</strong></a></td>
             </tr>
            </table>
           </td>
          </tr>
         </table>
        </td>
       </tr>
      </table>
     </td>
    </tr>
    <tr height="50" width="652">
     <td>
      <table height="50" border="0" width="652">
       <tr>
        <td width="652">
         <p class="txtadlnt2" align="justify"> <b><font color="#000088" size="2" face="Arial, Helvetica, sans-serif">Importante:
              Este Portal es exclusivo para pago de produtos y servicios de
               e-Commerce previamente vinculados; para ingresar, Usted debe
               estar registrado y ser usuario de los servicios de BBVA net
               empresas, VIP BBVA net y BBVA net; en caso contrario, deber&aacute;
               registrarse y dar de alta su clave de operaciones, ingresando a
               trav&eacute;s de nuestra p&aacutegina www.bbva.com.co.</font></b>
         </p>
        </td>
       </tr>
      </table>
     </td>
    </tr>
   </table>
</body>
</html>
