<?xml version="1.0" encoding="ISO-8859-1"?>
<xsl:stylesheet version="1.0" xmlns:xsl="http://www.w3.org/1999/XSL/Transform" xmlns:javautil="cashlatam/java/tlcl.exportacion.nucleo.TLCLOnXsltUtil" xmlns:javasystem="cashlatam/java.lang.System" >
    <xsl:output method="text" encoding="ISO-8859-1"/>
    <xsl:param name="adaptacion" select="'false'"/>
    <xsl:param name="claseutil" select="javautil:new()"/>
    <!-- Estos parámetros sólo se utilizan en la adaptacion -->
    <xsl:param name="numdocidentemisor"/>
    <xsl:param name="tipodocemisor"/>
    <xsl:param name="sufijo"/>
    <xsl:param name="fechaproceso"/>
    
    <xsl:variable name="rellenolibre" select="'&#32;'"/>
    <xsl:variable name="newLine" select="javautil:getLineSeparator()"/>
    <xsl:variable name="formatofechainput" select="'yyyyMMdd'"/>
    <xsl:variable name="formatofechaoutput" select="'yyyyMMdd'"/>
    <!-- Estas dos  variables se utiliza sólo en la exportación -->
    <xsl:variable name="vEmisor" select="//remesa/cabecera/numdocidentemisor"/>
    <xsl:variable name="vtipodocemisor" select="//remesa/cabecera/tipodocemisor"/>
    <xsl:variable name="vsufijo" select="//remesa/cabecera/sufijo"/>
    <xsl:variable name="vfechaproceso" select="//remesa/cabecera/fechaproceso"/>
    <xsl:variable name="vImporteTotal" select="//remesa/cabecera/importetotal"/>
       
    <xsl:template match="/">
        <xsl:apply-templates select="remesa"/>
    </xsl:template>
    
    <xsl:template match="remesa">
        <xsl:apply-templates select="cabecera"/>
        <xsl:apply-templates select="ordenes"/>
        <xsl:choose>
            <xsl:when test="$adaptacion='true'">
                <xsl:apply-templates select="totales"/>
            </xsl:when>
            <xsl:otherwise>
                <xsl:call-template name="totalescalculados"/>
            </xsl:otherwise>
        </xsl:choose>
    </xsl:template>
    
    <xsl:template match="cabecera">
        <!-- primer registro de cabecera -->
        <xsl:variable name="vcontadorRegistros" select="javautil:incContador($claseutil,'totalregistros')"/>
        <xsl:text>4110</xsl:text>
        <xsl:variable name="vemisorcab">
            <xsl:call-template name="getIdentificadorEmisor"/>
        </xsl:variable>
        <xsl:value-of select="$vemisorcab"/>
        <xsl:value-of select="javautil:traduceFecha(fechafichero,$formatofechainput,$formatofechaoutput)"/>
        <xsl:call-template name="getFechaProceso"/>
        <xsl:value-of select="javautil:lpadTrimRight(asuntoemisor,20,'0')"/>
        <xsl:value-of select="javautil:lpad(coddivisaasunto,3,'0')"/>
        <xsl:text>0</xsl:text>
        <xsl:value-of select="javautil:rpadTrimRight(nombrefichero,12,$rellenolibre)"/>
        <xsl:value-of select="javautil:rpadTrimRight(claveemisor,15,$rellenolibre)"/>
        <xsl:value-of select="javautil:rpad('',79,$rellenolibre)"/>
        <xsl:value-of select="$newLine"/>
        <!-- segundo registro de cabecera -->
        <xsl:variable name="vcontadorRegistros" select="javautil:incContador($claseutil,'totalregistros')"/>
        <xsl:text>4120</xsl:text>
        <xsl:value-of select="$vemisorcab"/>
        <xsl:value-of select="javautil:rpadTrimRight(nombreemisor,36,$rellenolibre)"/>
        <xsl:value-of select="javautil:rpadTrimRight(domicilioemisor1,36,$rellenolibre)"/>
        <xsl:value-of select="javautil:rpadTrimRight(domicilioemisor2,36,$rellenolibre)"/>
        <xsl:value-of select="javautil:rpad('',38,$rellenolibre)"/>
        <xsl:value-of select="$newLine"/>
        <!-- tercer registro de cabecera opcional -->
        <xsl:variable name="vcontadorRegistros" select="javautil:incContador($claseutil,'totalregistros')"/>
        <xsl:text>4130</xsl:text>
        <xsl:value-of select="$vemisorcab"/>
        <xsl:value-of select="javautil:rpadTrimRight(localidademisor,36,$rellenolibre)"/>
        <xsl:value-of select="javautil:lpadTrimRight(codigopostalemisor2,2,'0')"/>
        <xsl:value-of select="javautil:lpadTrimRight(codigopostalemisor,5,'0')"/>
        <xsl:value-of select="javautil:rpad('',103,$rellenolibre)"/>
        <xsl:value-of select="$newLine"/>
    </xsl:template>
    
    <xsl:template match="ordenes">
        <xsl:apply-templates select="orden"/>
    </xsl:template>
    
    <xsl:template match="orden">
        <xsl:variable name="vemisorcab">
            <xsl:call-template name="getIdentificadorEmisor"/>
        </xsl:variable>
        <xsl:variable name="vdestinocab">
                <xsl:value-of select="javautil:lpadTrimRight(tipodocdocdestino,2,'0')"/>
                <xsl:value-of select="javautil:lpadTrimRight(clavebeneficiario,16,'0')"/>
        </xsl:variable>
        <!-- primer registro individual -->        
        <xsl:variable name="vcontadorOrdenes" select="javautil:incContador($claseutil,'contadorOrdenes')"/>
        <xsl:variable name="vcontadorRegistros" select="javautil:incContador($claseutil,'totalregistros')"/>
        <xsl:text>4210</xsl:text>
        <xsl:value-of select="$vemisorcab"/>
        <xsl:value-of select="$vdestinocab"/>
        <xsl:value-of select="javautil:lpadTrimLeft(formapagodestino,1,'0')"/>
        <xsl:value-of select="javautil:lpadTrimRight(codbancobeneficiario,4,'0')"/>                
        <xsl:value-of select="javautil:lpadTrimRight(numerocuentabenef,16,'0')"/>
        <xsl:value-of select="javautil:lpadTrimRight(tipocuentanacham,2,'0')"/>                
        <xsl:value-of select="javautil:rpadTrimRight(cuentanacham,17,$rellenolibre)"/>        
        <xsl:call-template name="formatimporte">
            <xsl:with-param name="pimporte" select="importe"/>
        </xsl:call-template>
        <xsl:call-template name="getFechaProceso"/>
        <xsl:value-of select="javautil:traduceFecha(fechavencimiento,$formatofechainput,$formatofechaoutput)"/>
        <xsl:value-of select="javautil:rpadTrimRight('',6,$rellenolibre)"/>
        <xsl:call-template name="getReferencia"/>
        <xsl:value-of select="javautil:lpadTrimRight(plazapagodestino,4,'0')"/>
        <xsl:value-of select="javautil:rpad('',32,$rellenolibre)"/>
        <xsl:value-of select="$newLine"/>
        <!-- segundo registro individual -->        
        <xsl:variable name="vcontadorRegistros2" select="javautil:incContador($claseutil,'totalregistros')"/>
        <xsl:text>4220</xsl:text>
        <xsl:value-of select="$vemisorcab"/>
        <xsl:value-of select="$vdestinocab"/>
        <xsl:value-of select="javautil:rpadTrimRight(nombrebeneficiario,36,$rellenolibre)"/>     
        <xsl:value-of select="javautil:rpadTrimRight(direccionbeneficiario,36,$rellenolibre)"/>      
        <xsl:value-of select="javautil:rpadTrimRight(direccionbeneficiario2,36,$rellenolibre)"/>        
        <xsl:value-of select="javautil:rpad('',20,$rellenolibre)"/>
        <xsl:value-of select="$newLine"/>
        <!-- tercer registro individual -->        
        <xsl:variable name="vcontadorRegistros2" select="javautil:incContador($claseutil,'totalregistros')"/>
        <xsl:text>4230</xsl:text>
        <xsl:value-of select="$vemisorcab"/>
        <xsl:value-of select="$vdestinocab"/>
        <xsl:value-of select="javautil:rpad('',80,$rellenolibre)"/>        
        <xsl:value-of select="javautil:rpad(email,48,$rellenolibre)"/>
        <xsl:value-of select="$newLine"/>
        <!-- conceptos -->
        <xsl:if test="concepto">
            <xsl:choose>
                <xsl:when test="$adaptacion='true'">
                    <xsl:call-template name="conceptosAdaptacion">
                        <xsl:with-param name="pinfemisor" select="$vemisorcab"/>
                        <xsl:with-param name="pinfbenef" select="$vdestinocab"/>
                    </xsl:call-template>
                </xsl:when>
                <xsl:otherwise>
                    <xsl:call-template name="conceptosExportacion">
                        <xsl:with-param name="pinfemisor" select="$vemisorcab"/>
                        <xsl:with-param name="pinfbenef" select="$vdestinocab"/>
                    </xsl:call-template>
                </xsl:otherwise>
            </xsl:choose>
        </xsl:if>
    </xsl:template>
        
    <xsl:template name="conceptosAdaptacion">
        <xsl:param name="pinfemisor"/>
        <xsl:param name="pinfbenef"/>
        <xsl:variable name="vresetnumConceptos" select="javautil:resetContador($claseutil,'numConceptos')"/>
        <xsl:variable name="vresetidConceptos" select="javautil:resetContador($claseutil,'idConceptos')"/>
        <xsl:variable name="vinitIdConceptos" select="javautil:incContador($claseutil,4240,'idConceptos')"/>        
        <xsl:for-each select="./concepto/child::*">
            <xsl:variable name="sw" select="position() mod 2"/>
            <xsl:variable name="incNumConceptos" select="javautil:incContador($claseutil,'numConceptos')"/>
            <xsl:choose>
                <xsl:when test="$sw=1">
                   <!-- registro de concepto -->
                   <xsl:variable name="vcontadorRegistros" select="javautil:incContador($claseutil,'totalregistros')"/>
                    <xsl:variable name="idContador" select="javautil:getContador($claseutil,'idConceptos')"/>
                    <xsl:if test="not($idContador=4240)">
                        <xsl:value-of select="javautil:rpad('',48,$rellenolibre)"/>
                        <xsl:value-of select="$newLine"/>
                    </xsl:if>
                    <xsl:value-of select="javautil:getContador($claseutil,'idConceptos')"/>
                    <xsl:value-of select="$pinfemisor"/>
                    <xsl:value-of select="$pinfbenef"/>
                    <xsl:variable name="incId" select="javautil:incContador($claseutil,1,'idConceptos')"/>
                    <xsl:value-of select="javautil:rpadTrimRight(current(),40,$rellenolibre)"/>
                </xsl:when>
                <xsl:when test="$sw=0">
                    <xsl:value-of select="javautil:rpadTrimRight(current(),40,$rellenolibre)"/>
                </xsl:when>
            </xsl:choose>
        </xsl:for-each>        
        <xsl:variable name="numEspaciosRelleno" select="(javautil:getContador($claseutil,'numConceptos') mod 2)"/>
        <xsl:if test="$numEspaciosRelleno='1'">
             <xsl:value-of select="javautil:rpad('',40,$rellenolibre)"/>
        </xsl:if>
        <xsl:value-of select="javautil:rpad('',48,$rellenolibre)"/>
        <xsl:value-of select="$newLine"/>
    </xsl:template>        
        
    <xsl:template name="conceptosExportacion">
        <xsl:param name="pinfemisor"/>
        <xsl:param name="pinfbenef"/>        
        <xsl:variable name="vresetnumConceptos" select="javautil:resetContador($claseutil,'numConceptos')"/>
        <xsl:variable name="vresetidConceptos" select="javautil:resetContador($claseutil,'idConceptos')"/>
        <xsl:variable name="vinitIdConceptos" select="javautil:incContador($claseutil,4240,'idConceptos')"/>        
        <xsl:variable name="vtextoConceptos" select="concepto"/>        
        <xsl:for-each select="$vtextoConceptos">
            <xsl:variable name="sw" select="position() mod 2"/>
            <xsl:variable name="incNumConceptos" select="javautil:incContador($claseutil,'numConceptos')"/>
            <xsl:choose>
                <xsl:when test="$sw=1">
                   <!-- registro de concepto -->
                   <xsl:variable name="vcontadorRegistros" select="javautil:incContador($claseutil,'totalregistros')"/>
                    <xsl:variable name="idContador" select="javautil:getContador($claseutil,'idConceptos')"/>
                    <xsl:if test="not($idContador=4240)">
                        <xsl:value-of select="javautil:rpad('',48,$rellenolibre)"/>
                        <xsl:value-of select="$newLine"/>
                    </xsl:if>
                    <xsl:value-of select="javautil:getContador($claseutil,'idConceptos')"/>
                    <xsl:value-of select="$pinfemisor"/>
                    <xsl:value-of select="$pinfbenef"/>
                    <xsl:variable name="incId" select="javautil:incContador($claseutil,1,'idConceptos')"/>
                    <xsl:value-of select="javautil:rpadTrimRight(cptotextoconcepto,40,$rellenolibre)"/>
                </xsl:when>
                <xsl:when test="$sw=0">
                    <xsl:value-of select="javautil:rpadTrimRight(cptotextoconcepto,40,$rellenolibre)"/>
                </xsl:when>
            </xsl:choose>
        </xsl:for-each>
        <xsl:variable name="numEspaciosRelleno" select="(javautil:getContador($claseutil,'numConceptos') mod 2)"/>
        <xsl:if test="$numEspaciosRelleno='1'">
             <xsl:value-of select="javautil:rpad('',40,$rellenolibre)"/>
        </xsl:if>
        <xsl:value-of select="javautil:rpad('',48,$rellenolibre)"/>
        <xsl:value-of select="$newLine"/>
    </xsl:template>        
        
    <!-- solo se aplica a la adaptacion -->
    <xsl:template match="totales">
         <xsl:call-template name="totalescalculados">
            <xsl:with-param name="pimportetotal" select="importetotal"/>
        </xsl:call-template>
    </xsl:template>
    
    <xsl:template name="totalescalculados">
       <xsl:param name="pimportetotal" select="$vImporteTotal"/>
        <xsl:text>4910</xsl:text>
        <xsl:call-template name="getIdentificadorEmisor"/>
        <xsl:call-template name="formatimporte">
            <xsl:with-param name="pimporte" select="$pimportetotal"/>
        </xsl:call-template>        
        <xsl:variable name="vTotalOperaciones" select="javautil:lpad(javautil:getContador($claseutil,'contadorOrdenes'),8,'0')"/>
        <xsl:variable name="vTotalRegistros" select="javautil:lpad(javautil:getContador($claseutil,'totalregistros')+1,8,'0')"/>        
        <xsl:value-of select="$vTotalOperaciones"/>
        <xsl:value-of select="$vTotalRegistros"/>
        <xsl:value-of select="javautil:rpad('',115,$rellenolibre)"/>
    </xsl:template>
    
    <xsl:template name="formatimporte">
        <xsl:param name="pimporte"/>
        <xsl:variable name="vparteentera" select="javautil:lpadTrimLeft(substring-before($pimporte,'.'),13,'0')"/>
        <xsl:variable name="vpartedecimal" select="javautil:lpadTrimRight(substring-after($pimporte,'.'),2,'0')"/>
        <xsl:value-of select="concat($vparteentera,$vpartedecimal)"/>
    </xsl:template>
       
        <xsl:template name="getIdentificadorEmisor">
        <xsl:choose>
            <xsl:when test="$adaptacion='true'">
                <xsl:value-of select="javautil:lpadTrimRight($tipodocemisor,2,'0')"/>
                <xsl:value-of select="javautil:lpadTrimRight($numdocidentemisor,16,'0')"/>
                <xsl:value-of select="javautil:lpadTrimRight($sufijo,2,'0')"/>
            </xsl:when>
            <xsl:otherwise>
                <xsl:value-of select="javautil:lpadTrimRight($vtipodocemisor,2,'0')"/>
                <xsl:value-of select="javautil:lpadTrimRight($vEmisor,16,'0')"/>
               <xsl:value-of select="javautil:lpadTrimRight($vsufijo,2,'0')"/>
            </xsl:otherwise>
        </xsl:choose>
    </xsl:template>
    
        <xsl:template name="getFechaProceso">
        <xsl:choose>
            <xsl:when test="$adaptacion='true'">
               <xsl:value-of select="javautil:traduceFecha($fechaproceso,$formatofechainput,$formatofechaoutput)"/>
            </xsl:when>
            <xsl:otherwise>
               <xsl:value-of select="javautil:traduceFecha($vfechaproceso,$formatofechainput,$formatofechaoutput)"/>
            </xsl:otherwise>
        </xsl:choose>
    </xsl:template>

    <xsl:template name="getReferencia">
        <xsl:choose>
            <xsl:when test="$adaptacion='true'">
                   <xsl:variable name="vfechaactual" select="javasystem:currentTimeMillis()"/>
		   <xsl:variable name="vtemporal" select="javautil:traduceFecha($vfechainforme,'yyyyMMddkkmmss')"/>
                   <xsl:value-of select="javautil:rpadTrimRight($vtemporal,15,$rellenolibre)"/>
            </xsl:when>
            <xsl:otherwise>
                   <xsl:value-of select="javautil:rpadTrimRight(referenciaorden,15,$rellenolibre)"/>
            </xsl:otherwise>
        </xsl:choose>
     </xsl:template>

    <xsl:variable name="vfechainforme" select="javasystem:currentTimeMillis()"/>

                       
</xsl:stylesheet>