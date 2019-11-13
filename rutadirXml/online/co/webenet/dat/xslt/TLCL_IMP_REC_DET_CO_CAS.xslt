<?xml version="1.0" encoding="ISO-8859-1"?>
<xsl:stylesheet version="1.0" xmlns:xsl="http://www.w3.org/1999/XSL/Transform" xmlns:javautil="cashlatam/java/tlcl.exportacion.nucleo.TLCLOnXsltUtil" xmlns:javasystem="cashlatam/java.lang.System" extension-element-prefixes="javautil javasystem" exclude-result-prefixes="javautil javasystem">
    <!-- parÃ¡metros de entrada a la hoja de estilo 
    pformatofechainput: formato de la fechas del xml de entrada (formato tipo clase SimpleDateFormat)
    pformatofechaoutput: formato de salida para las fechas (formato tipo clase SimpleDateFormat)
    pformatoimporte: formato utilizado para los informes (formato tipo xslt para la funcion "format-number")
    pformatohora: formate utilizado para visualizar la hora del informe
    pseparadordecimal: separador de decimales
    pseparadormiles: separador de miles
    -->    
    <xsl:param name="pformatofechainput" select="'yyyyMMdd'"/>
    <xsl:param name="pformatofechaoutput" select="'dd-MM-yyyy'"/>
    <xsl:param name="pformatoimporte" select="'#,##0.00'"/>
    <xsl:param name="pformatohora" select="'HH:mm:ss'"/>
    <xsl:param name="pseparadordecimal" select="','"/>
    <xsl:param name="pseparadormiles" select="'.'"/>
    <!-- variables globales para la hoja de estilo -->
    <xsl:output method="html" encoding="ISO-8859-1"/>
    <xsl:variable name="vrutordenante" select="//remesa/cabecera/claveemisor"/>
    <xsl:variable name="vtiposervicio" select="//remesa/cabecera/tiposervicio"/>
    <xsl:variable name="vcoddivisa" select="//remesa/cabecera/coddivisaasunto"/>
    <xsl:variable name="vreferencia" select="//remesa/cabecera/referenciafichero"/>
    <xsl:variable name="vfechainforme" select="javasystem:currentTimeMillis()"/>
    <xsl:variable name="vlimprimerapagina" select="1"/>
    <xsl:variable name="vlimrestopaginas" select="1"/>
    <xsl:variable name="vnombrefichero" select="//remesa/cabecera/nombrefichero"/>
    <xsl:variable name="numcaracteresprimeracolumna" select="20"/>
    <xsl:variable name="numcaracteressegundacolumna" select="20"/>
    <xsl:variable name="vnumtotalordenes" select="count(//remesa/ordenes/orden)"/>
    <!-- Empieza la secuencia...-->
    <xsl:template match="/">
        <xsl:apply-templates select="remesa"/>
    </xsl:template>
    <xsl:template match="remesa">
        <html>
            <head>
                <link rel="stylesheet" type="text/css" href="/mult/TLCLImpresionNueva.css"/>
            </head>
            <body>
                <xsl:call-template name="print_cabecera_informe"/>
                <xsl:apply-templates select="cabecera"/>
                <xsl:apply-templates select="ordenes"/>
                <xsl:apply-templates select="totales"/>
            </body>
        </html>
    </xsl:template>
    <xsl:template match="cabecera">
        <xsl:comment>Datos del Emisor</xsl:comment>
        <table border="0" cellspacing="1" width="100%" cellpadding="1" style="table-layout:fixed">
            <tr>
                <td class="titulo" colspan="4">
                    <nobr>
                        <b>DATOS DEL EMISOR:</b>
                    </nobr>
                </td>
            </tr>
            <tr>
                <td width="25%" class="datosemisortit">
                    <nobr>Clave:</nobr>
                </td>
                <td width="25%" class="datosemisorinf">
                    <nobr>
                        <xsl:value-of select="claveemisor"/>
                    </nobr>
                </td>
                <td width="25%" class="datosemisortit">
                    <nobr>&#160;&#160;Fecha de Proceso:</nobr>
                </td>
                <td width="25%" class="datosemisorinf">
                    <nobr>
                        <xsl:value-of select="javautil:traduceFecha(fechaproceso,$pformatofechainput,$pformatofechaoutput)"/>
                    </nobr>
                </td>                
            </tr>
            <tr>
                <td width="25%" class="datosemisortit">
                    <nobr>Número Identificación:</nobr>
                </td>
                <td width="25%" class="datosemisorinf">
                    <nobr>
                        <xsl:value-of select="numdocidentemisor"/>
                    </nobr>
                </td>
                <td width="25%" class="datosemisortit">
                    <nobr>&#160;&#160;Tipo Identificación:</nobr>
                </td>
                <td width="25%" class="datosemisorinf">
                    <nobr>
                        <xsl:call-template name="getDescriptTipoDocumento">
                            <xsl:with-param name="ptipodocumento" select="tipodocemisor"/>
                        </xsl:call-template>
                    </nobr>
                </td>
            </tr>
            <tr>
                <td width="25%" class="datosemisortit">
                    <nobr>Nombre:</nobr>
                </td>
                <td colspan="3" class="datosemisorinf">
                    <nobr>
                        <xsl:value-of select="nombreemisor"/>
                    </nobr>
                </td>
            </tr>
            <tr>
                <td width="25%" class="datosemisortit">
                    <nobr>Cuenta de Abono:</nobr>
                </td>
                <td colspan="3" class="datosemisorinf">
                    <nobr>
                        <xsl:value-of select="asuntoemisor"/>
                    </nobr>
                </td>
            </tr>
         
        </table>
        <xsl:comment>Fin de los datos del emisor</xsl:comment>
        <br/>
    </xsl:template>
    <xsl:template match="ordenes">
        <table cellspacing="0" border="0" width="100%">
            <tr>
                <td colspan="4" class="titulo"><nobr><b>RECIBOS EMITIDOS:</b></nobr></td>
            </tr>
        </table>
	<xsl:apply-templates select="orden"/>
    </xsl:template>
    <xsl:template match="orden">
        <xsl:variable name="numregistro">
            <xsl:number value="position()"/>
        </xsl:variable>
        <xsl:variable name="paginasalto" select="javautil:checkSaltoPagina($vnumtotalordenes,$vlimprimerapagina,$vlimrestopaginas,$numregistro)"/>
	<xsl:choose>
            <!-- Sin salto de página-->
            <xsl:when test="$paginasalto =0">
		<table border="0" cellspacing="2" width="100%" style="table-layout:fixed">
			<xsl:call-template name="printorden"/>
		</table>
            </xsl:when>
            <xsl:when test="$numregistro =$vnumtotalordenes">
		<table border="0" cellspacing="2" width="100%" style="table-layout:fixed">
			<xsl:call-template name="printorden"/>
		</table>         
            </xsl:when>
            <!-- Con salto de página-->
            <xsl:otherwise>
                <table border="0" cellspacing="2" width="100%" style="table-layout:fixed;page-break-after: always;">
                    <xsl:call-template name="printorden"/>
                </table>
		<div class="header">
			<xsl:call-template name="print_cabecera_informe">
				<xsl:with-param name="numpagina" select="$paginasalto"/>
			</xsl:call-template>
                </div>
            </xsl:otherwise>
        </xsl:choose>
    </xsl:template>
    <xsl:template match="totales">
        <table cellspacing="0" cellpadding="0" width="100%" border="1" rules="none" style="table-layout:fixed">
            <tr>
                <td width="35%" align="left" style="overflow:hidden;"><nobr>&#160;&#160;<b>Número Total de Órdenes:</b></nobr></td>
                <td width="10%" align="left" style="overflow:hidden;"><nobr><xsl:value-of select="$vnumtotalordenes"/></nobr></td>
                <td width="25%" align="right" style="overflow:hidden;"><nobr><b>Importe Total:</b></nobr></td>
                <td width="30%" align="right" style="overflow:hidden;"><nobr>&#160;&#160;
                    <xsl:call-template name="formatimporte">
				<xsl:with-param name="pimporte" select="importetotal"/>
                    </xsl:call-template>
                    &#160;<xsl:value-of select="$vcoddivisa"/></nobr></td>
            </tr>
        </table>
    </xsl:template>
    <xsl:template name="printorden">
        <tr>
            <td width="20%" class="datosordentit">
                  <nobr>Número Identificación:</nobr>
            </td>
            <td width="30%" class="datosordeninf">
                 <nobr>
                      <xsl:value-of select="clavebeneficiario"/>
                 </nobr>
           </td>
                <td width="25%" class="datosordentit">
                    <nobr>&#160;&#160;Tipo Identificación:</nobr>
                </td>
                <td width="25%" class="datosordeninf">
                    <nobr>
                        <xsl:call-template name="getDescriptTipoDocumento">
                            <xsl:with-param name="ptipodocumento" select="tipodocdocdestino"/>
                        </xsl:call-template>
                    </nobr>
                </td>           
        </tr>        
        <tr>
            <td width="20%" class="datosordentit">Nombre:</td>
            <td colspan="3" class="datosordeninf"><nobr><xsl:value-of select="nombrebeneficiario"/></nobr></td>
        </tr>
        <tr>
            <td width="20%" class="datosordentit">E-Mail:</td>
            <td colspan="3" class="datosordeninf"><nobr><xsl:value-of select="email"/></nobr></td>
        </tr>        
        <tr>
            <td width="20%" class="datosordentit">Dirección1:</td>
            <td colspan="3" class="datosordeninf"><nobr><xsl:value-of select="direccionbeneficiario"/></nobr></td>
        </tr>        
        <tr>
            <td width="20%" class="datosordentit">Dirección2:</td>
            <td colspan="3" class="datosordeninf"><nobr><xsl:value-of select="direccionbeneficiario2"/></nobr></td>
        </tr>                
        <tr>
            <td width="20%" class="datosordentit">Importe:</td>
            <td width="30%" class="datosordeninf">
                <xsl:call-template name="formatimporte">
                    <xsl:with-param name="pimporte" select="importe"/>
                </xsl:call-template>
             &#160;<xsl:value-of select="$vcoddivisa"/></td>            
            <td width="30%" class="datosordentit"><nobr>&#160;&#160;Forma Pago:</nobr></td>
            <td width="20%" class="datosordeninf"><nobr><xsl:value-of select="concat(formapagodestino,' - ',descformapagodestino)"/></nobr></td>           
        </tr>
        <xsl:choose>
            <xsl:when test="(formapagodestino=1) and (codbancobeneficiario='0013')">
                <tr>
                    <td width="20%" class="datosordentit">Banco:</td>
                    <td width="30%" class="datosordeninf"><nobr><xsl:value-of select="codbancobeneficiario"/></nobr></td>
                    <td width="20%" class="datosordentit">&#160;&#160;Cuenta:</td>
                    <td width="30%" class="datosordeninf"><nobr><xsl:value-of select="numerocuentabenef"/></nobr></td>
                </tr>
            </xsl:when>
            <xsl:when test="(formapagodestino=1) and not(codbancobeneficiario='0013')">
                <tr>
                    <td width="20%" class="datosordentit">Tipo Cuenta:</td>
                    <td width="30%" class="datosordeninf"><nobr><xsl:value-of select="concat(tipocuentanacham,' - ',desctipocuenta)"/></nobr></td>
                    <td width="20%" class="datosordentit">&#160;&#160;Banco:</td>
                    <td width="30%" class="datosordeninf"><nobr><xsl:value-of select="codbancobeneficiario"/></nobr></td>
                </tr>
                <tr>
                    <td width="20%" class="datosordentit">Cuenta:</td>
                    <td colspan="3" class="datosordeninf"><nobr><xsl:value-of select="cuentanacham"/></nobr></td>
                </tr>            
            </xsl:when>          
            <xsl:when test="formapagodestino=2">
                    <td width="20%" class="datosordentit">Banco:</td>
                    <td width="30%" class="datosordeninf"><nobr><xsl:value-of select="codbancobeneficiario"/></nobr></td>        
                    <td width="20%" class="datosordentit">&#160;&#160;Cuenta/Tarjeta:</td>
                    <td width="30%" class="datosordeninf"><nobr><xsl:value-of select="cuentanacham"/></nobr></td>
            </xsl:when>            
            <xsl:when test="formapagodestino=3">
                <tr>
                    <td width="20%" class="datosordentit">Código Oficina Pagadora:</td>
                    <td colspan="3" class="datosordeninf"><nobr><xsl:value-of select="javautil:lpadTrimRight(plazapagodestino,4,'0')"/></nobr></td>
                </tr>                                    
            </xsl:when>
            <xsl:otherwise>
                <tr>
                    <td width="20%" class="datosordentit">Cuenta/Tarjeta:</td>
                    <td colspan="3" class="datosordeninf"><nobr><xsl:value-of select="cuentanacham"/></nobr></td>
                </tr>                        
            </xsl:otherwise>
        </xsl:choose>
		<tr>
		   <td width="20%" class="datosordentit">Fecha Límite Vencimiento:</td>
                    <td colspan="3" class="datosordeninf"><nobr><xsl:value-of select="javautil:traduceFecha(fechavencimiento,$pformatofechainput,$pformatofechaoutput)"/></nobr></td>
	     </tr>  
        <xsl:for-each select="concepto">
        <tr>
            <td witdh="30%" class="datosordentit">Concepto<xsl:value-of select="position()"/>:</td>
            <td colspan="3" class="datosordeninf"><nobr><xsl:value-of select="cptotextoconcepto"/></nobr></td>
        </tr>            
        </xsl:for-each>
        <xsl:call-template name="conceptosRelleno">
            <xsl:with-param name="piteraciones" select="count(concepto)"/>
        </xsl:call-template>
        <tr>
            <td colspan="4"><hr noshade=""/></td>
        </tr>
    </xsl:template>
    <xsl:template name="conceptosRelleno">
        <xsl:param name="piteraciones"/>
        <xsl:if test="$piteraciones&lt;22">
               <tr>
                   <td width="25%" class="datosordentit">Concepto<xsl:value-of select="$piteraciones+1"/>:</td>
               </tr>            
        <xsl:call-template name="conceptosRelleno">
            <xsl:with-param name="piteraciones" select="$piteraciones+1"/>
        </xsl:call-template>        
        </xsl:if>
    </xsl:template>
    <xsl:template name="print_cabecera_informe">
        <xsl:param name="numpagina" select="1"/>
        <table cellspacing="0" cellpadding="0" width="100%" border="0">
            <tr>
                <td><img src="/mult/logotipoImpresion.gif"/></td>
            </tr>
        </table>
        <xsl:comment>Cabecera del informe</xsl:comment>
        <table cellspacing="0" cellpadding="0" width="100%" border="1" style="table-layout:fixed">
            <tr>
                <td width="45%" class="cabecerainforme">BBVA net cash</td>
                <td width="18%" class="cabecerainforme">Archivo</td>
                <td width="15%" class="cabecerainforme">Fecha</td>
                <td width="11%" class="cabecerainforme">Hora</td>
                <td width="11%" class="cabecerainforme">Página</td>
            </tr>
            <tr>
                <td class="datoscabecerainforme"><b>Recibos</b></td>
                <td class="datoscabecerainforme"><xsl:value-of select="$vnombrefichero"/></td>
                <td class="datoscabecerainforme"><xsl:value-of select="javautil:traduceFecha($vfechainforme,$pformatofechaoutput)"/></td>
                <td class="datoscabecerainforme"><xsl:value-of select="javautil:traduceFecha($vfechainforme,$pformatohora)"/></td>
                <td class="datoscabecerainforme"><xsl:value-of select="$numpagina"/></td>
            </tr>
        </table>
        <br/>
        <table cellspacing="0" cellpadding="0" border="0" width="100%" style="table-layout:fixed">
            <tr>
                <td class="titulo" width="20%"><b>REFERENCIA:</b></td>
                <td align="left" class="titulo">&#160;<xsl:value-of select="$vreferencia"/></td>
            </tr>
        </table>
        <br/>
        <xsl:comment>Fin de la Cabecera del infome</xsl:comment>
    </xsl:template>
    
    <xsl:template name="getDescriptTipoDocumento">
        <xsl:param name="ptipodocumento"/>
        <xsl:value-of select="concat($ptipodocumento,' - ')"/>
        <xsl:choose>
            <xsl:when test="$ptipodocumento=1">
                <xsl:text>Cédula de ciudadanía</xsl:text>
            </xsl:when>
            <xsl:when test="$ptipodocumento=2">
                <xsl:text>Cédula de extranjería</xsl:text>
            </xsl:when>
            <xsl:when test="$ptipodocumento=3">
                <xsl:text>N.I.T</xsl:text>
            </xsl:when>
            <xsl:when test="$ptipodocumento=4">
                <xsl:text>Tarjeta de Identidad</xsl:text>
            </xsl:when>
            <xsl:when test="$ptipodocumento=5">
                <xsl:text>Pasaporte</xsl:text>
            </xsl:when>            
            <xsl:when test="$ptipodocumento=6">
                <xsl:text>Sociedad Extranjera sin N.I.T</xsl:text>
            </xsl:when>
            <xsl:when test="$ptipodocumento=7">
                <xsl:text>Fideicomiso</xsl:text>
            </xsl:when>            
        </xsl:choose>    
    </xsl:template>          
    
    <xsl:template name="formatimporte">
        <xsl:param name="pimporte"/>
        <xsl:variable name="importefrmt" select="javautil:formatNumero($pformatoimporte,$pseparadordecimal,$pseparadormiles,$pimporte)"/>
        <xsl:value-of select="$importefrmt"/>
    </xsl:template>     
</xsl:stylesheet>
