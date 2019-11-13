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
    <xsl:variable name="vcoddivisa" select="//remesa/cabecera/coddivisaasunto"/>
    <xsl:variable name="vreferencia" select="//remesa/cabecera/referenciafichero"/>
    <xsl:variable name="vfechainforme" select="javasystem:currentTimeMillis()"/>
    <xsl:variable name="vlimprimerapagina" select="38"/>
    <xsl:variable name="vlimrestopaginas" select="43"/>
    <xsl:variable name="vnombrefichero" select="//remesa/cabecera/nombrefichero"/>
    <xsl:variable name="numcaracteresprimeracolumna" select="20"/>
    <xsl:variable name="numcaracteressegundacolumna" select="20"/>
    <xsl:variable name="vnumtotalordenes" select="count(//remesa/ordenes/orden)"/>
	
	<xsl:template match="/">
		<xsl:apply-templates select="remesa"/>		
	</xsl:template>
	
	<xsl:template match="remesa">
		<xsl:apply-templates select="ordenes"/>				
	</xsl:template>
	
	<xsl:template match="ordenes">		
		<xsl:apply-templates select="orden"/>		
	</xsl:template>
	
	<xsl:template match="orden">
	
		<xsl:variable name="numregistro">
            <xsl:number value="position()"/>
        </xsl:variable>
	
		<xsl:variable name="importeFormateado">
            <xsl:call-template name="formatimporte">
            	<xsl:with-param name="pimporte" select="importe" />
            </xsl:call-template>            
        </xsl:variable>
	
		<xsl:variable name="descFormaPago">
			<xsl:call-template name="getDescTipoFormaPago">
            	<xsl:with-param name="pTipoFormaPago" select="formapagodestino"/>
            </xsl:call-template>
		</xsl:variable>
	
		<xsl:variable name="descTipoIdentificacion">
			<xsl:call-template name="getDescriptTipoDocumento">
            	<xsl:with-param name="ptipodocumento" select="tipodocdocdestino"/>
            </xsl:call-template>
		</xsl:variable>
	
		<xsl:variable name="descBancoBeneficiario">
			<xsl:call-template name="getDescBanco">
            	<xsl:with-param name="pCodBanco" select="codbancobeneficiario"/>
            </xsl:call-template>
		</xsl:variable>
		
		<xsl:variable name="descNumCuentaBenef">
			<xsl:call-template name="getNumCuenta">
				<xsl:with-param name="pCodBanco" select="codbancobeneficiario"/>
				<xsl:with-param name="pNumCuentaBenef" select="numerocuentabenef"/>
				<xsl:with-param name="pNumCuentaBenefNacham" select="cuentanacham"/>
			</xsl:call-template>
		</xsl:variable>
	
		<xsl:variable name="desTipoCuenta">
			<xsl:call-template name="getTipoCuenta">
				<xsl:with-param name="pCodBanco" select="codbancobeneficiario"/>
				<xsl:with-param name="pNumCuenta" select="numerocuentabenef"/>
				<xsl:with-param name="pCodTipoCuentaNacham" select="tipocuentanacham"/>
			</xsl:call-template>
		</xsl:variable>
	
		<div id="listaBeneficiarios" class="panel panel-listaCompleta">
			
			<h5 class="panel-title azul">
				<table>
					<tr>
						<td>
						<xsl:text disable-output-escaping="yes">  </xsl:text><a class="collapsed" data-toggle="collapse" data-parent="#accordion"
							href="#detalleBeneficiario_{$numregistro}"><img src="images/mas.png" style="padding-left:10px; padding-right:10px"/> </a><xsl:text disable-output-escaping="yes">  </xsl:text>
						</td>
						<td>
							<h4><xsl:value-of select="normalize-space(nombrebeneficiario)"/> | Importe: <xsl:value-of select="$importeFormateado"/> COP</h4>
						</td>
					</tr>
				</table>
			</h5>
			
			<div id="detalleBeneficiario_{$numregistro}" class="panel-collapse collapse">
				<div class="jumbotron">
					<div class="container">
						<div class="row col-md-6">
							<div class="row">
								<b>Nombre: </b><xsl:value-of select="normalize-space(nombrebeneficiario)"/>
							</div>
							<div class="row">
								<b>Tipo de identificación: </b><xsl:value-of select="$descTipoIdentificacion"/>
							</div>
							<div class="row">
								<b>No. de identificación: </b><xsl:value-of select="clavebeneficiario"/>
							</div>
							<div class="row">
								<b>Email: </b><xsl:value-of select="normalize-space(email)"/>
							</div>
							<div class="row">
								<b>Dirección: </b><xsl:value-of select="normalize-space(direccionbeneficiario)"/>
							</div>
						</div>
						<div class="row col-md-6">
							<div class="row">
								<b>Forma de pago: </b><xsl:value-of select="$descFormaPago"/>
							</div>
							<div class="row">
								<b>Banco: </b><xsl:value-of select="$descBancoBeneficiario"/>
							</div>
							<div class="row">
								<b>Tipo de Cuenta: </b><xsl:value-of select="$desTipoCuenta"/>
							</div>
							<div class="row">
								<b>No. de cuenta: </b><xsl:value-of select="$descNumCuentaBenef"/>
							</div>
							<div class="row">
								<b>Sucursal: </b><xsl:value-of select="plazapagodestino"/>
							</div>
						</div>
					</div>
				</div>
			</div>
		</div>
	</xsl:template>
	
	<xsl:template name="formatimporte">
        <xsl:param name="pimporte"/>
        <xsl:variable name="importefrmt" select="javautil:formatNumero($pformatoimporte,$pseparadordecimal,$pseparadormiles,$pimporte)"/>
        <xsl:value-of select="$importefrmt"/>
    </xsl:template>
	
	<xsl:template name="getDescTipoFormaPago">
		<xsl:param name="pTipoFormaPago"></xsl:param>
		<xsl:choose>
			<xsl:when test="$pTipoFormaPago=1">
				<xsl:text>Abono en cuenta</xsl:text>
			</xsl:when>
			<xsl:when test="$pTipoFormaPago=2">
				<xsl:text>Abono mediante cheque</xsl:text>
			</xsl:when>
			<xsl:when test="$pTipoFormaPago=3">
				<xsl:text>Abono mediante efectivo</xsl:text>
			</xsl:when>			
		</xsl:choose>
	</xsl:template>
	
	<xsl:template name="getDescriptTipoDocumento">
        <xsl:param name="ptipodocumento"/>        
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
	
	<xsl:template name="getDescBanco">
		<xsl:param name="pCodBanco"/>
		<xsl:choose>
			<xsl:when test="$pCodBanco=0001">
				<xsl:text>BANCO DE BOGOTA</xsl:text>
			</xsl:when>
			<xsl:when test="$pCodBanco=0002">
				<xsl:text>BANCO POPULAR</xsl:text>
			</xsl:when>
			<xsl:when test="$pCodBanco=0006">
				<xsl:text>BANCO CORPBANCA </xsl:text>
			</xsl:when>
			<xsl:when test="$pCodBanco=0007">
				<xsl:text>BANCOLOMBIA</xsl:text>
			</xsl:when>
			<xsl:when test="$pCodBanco=0009">
				<xsl:text>CITIBANK</xsl:text>
			</xsl:when>
			<xsl:when test="$pCodBanco=0012">
				<xsl:text>GNB SUDAMERIS</xsl:text>
			</xsl:when>
			<xsl:when test="$pCodBanco=0013">
				<xsl:text>BBVA COLOMBIA</xsl:text>
			</xsl:when>
			<xsl:when test="$pCodBanco=0014">
				<xsl:text>HELM BANK</xsl:text>
			</xsl:when>
			<xsl:when test="$pCodBanco=0019">
				<xsl:text>RED MULTIBANCA COLPATRIA </xsl:text>
			</xsl:when>
			<xsl:when test="$pCodBanco=0023">
				<xsl:text>BANCO DE OCCIDENTE</xsl:text>
			</xsl:when>
			<xsl:when test="$pCodBanco=0032">
				<xsl:text>BANCO CAJA SOCIAL</xsl:text>
			</xsl:when>
			<xsl:when test="$pCodBanco=0040">
				<xsl:text>BANCO AGRARIO</xsl:text>
			</xsl:when>
			<xsl:when test="$pCodBanco=0042">
				<xsl:text>BNP Paribas Colombia</xsl:text>
			</xsl:when>
			<xsl:when test="$pCodBanco=0051">
				<xsl:text>BANCO DAVIVIENDA</xsl:text>
			</xsl:when>
			<xsl:when test="$pCodBanco=0052">
				<xsl:text>BANCO AV VILLAS</xsl:text>
			</xsl:when>
			<xsl:when test="$pCodBanco=0054">
				<xsl:text>GRANAHORRAR</xsl:text>
			</xsl:when>
			<xsl:when test="$pCodBanco=0058">
				<xsl:text>BANCO PROCREDIT</xsl:text>
			</xsl:when>
			<xsl:when test="$pCodBanco=0059">
				<xsl:text>BANCAMIA</xsl:text>
			</xsl:when>
			<xsl:when test="$pCodBanco=0060">
				<xsl:text>BANCO PICHINCHA S.A.</xsl:text>
			</xsl:when>
			<xsl:when test="$pCodBanco=0061">
				<xsl:text>BANCO COOMEVA S.A.</xsl:text>
			</xsl:when>
			<xsl:when test="$pCodBanco=0065">
				<xsl:text>BANCO SANTANDER</xsl:text>
			</xsl:when>
			<xsl:when test="$pCodBanco=0066">
				<xsl:text>BANCO COOPCENTRAL</xsl:text>
			</xsl:when>
			<xsl:when test="$pCodBanco=0121">
				<xsl:text>FINANCIERA JURISCOOP</xsl:text>
			</xsl:when>
			<xsl:when test="$pCodBanco=0283">
				<xsl:text>COOFIANTIOQUIA</xsl:text>
			</xsl:when>
			<xsl:when test="$pCodBanco=0289">
				<xsl:text>COTRAFA COOPERATIVA FINANCIERA</xsl:text>
			</xsl:when>
			<xsl:when test="$pCodBanco=0292">
				<xsl:text>CONFIAR S.A.</xsl:text>
			</xsl:when>
			<xsl:when test="$pCodBanco=0370">
				<xsl:text>COLTEFINANCIERA S.A. - COMPANIA DE F</xsl:text>
			</xsl:when>
			<xsl:when test="$pCodBanco=0502">
				<xsl:text>FIDUCIARIA SKANDIA</xsl:text>
			</xsl:when>
			<xsl:when test="$pCodBanco=0683">
				<xsl:text>DIRECCION DEL TESORO  NACIONAL</xsl:text>
			</xsl:when>
			<xsl:when test="$pCodBanco=1062">
				<xsl:text>BANCO FALABELLA S.A</xsl:text>
			</xsl:when>
		</xsl:choose>		
	</xsl:template>
	
	<xsl:template name="getNumCuenta">
	
		<xsl:param name="pCodBanco"/>
		<xsl:param name="pNumCuentaBenef"/>
		<xsl:param name="pNumCuentaBenefNacham"/>
		
		<xsl:if test="$pCodBanco=0013">
			<xsl:value-of select="$pCodBanco"/><xsl:value-of select="$pNumCuentaBenef"/>
		</xsl:if>
		<xsl:if test="$pCodBanco!=0013">
			<xsl:value-of select="$pNumCuentaBenefNacham"/>
		</xsl:if>		
	</xsl:template>
	
	<xsl:template name="getTipoCuenta">
		<xsl:param name="pCodBanco"/>
		<xsl:param name="pNumCuenta"/>
		<xsl:param name="pCodTipoCuentaNacham"/>
		
		<xsl:variable name="codTipoCuentaAux">
			<xsl:choose>			
				<xsl:when test="$pCodBanco=0013">
					<xsl:value-of select="substring($pNumCuenta,7,2)"/>
				</xsl:when>
				<xsl:otherwise>
					<xsl:value-of select="$pCodTipoCuentaNacham"/>
				</xsl:otherwise>				
			</xsl:choose>
		</xsl:variable>
		
		<xsl:choose>
			<xsl:when test="$codTipoCuentaAux=01">
				<xsl:text>Cuenta corriente</xsl:text>
			</xsl:when>
			<xsl:when test="$codTipoCuentaAux=02">
				<xsl:text>Cuenta de ahorros</xsl:text>
			</xsl:when>
			<xsl:otherwise >
				<xsl:value-of select="$codTipoCuentaAux"/>
			</xsl:otherwise>
		</xsl:choose>
	</xsl:template>
</xsl:stylesheet>