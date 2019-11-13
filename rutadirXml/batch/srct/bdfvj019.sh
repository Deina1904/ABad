#!/bin/ksh

#. $HOME/.profile
echo "inicio";
ENTORNO=/pr
#. /pr/contingencia/batch/cfg/entorno.cfg
. /pr/bdfv_contingencia/batch/cfg/entorno.cfg
cd /pr/bdfv_contingencia/batch/srct

# ************************************************************************
# ** BDFVJ019:Este script realizara los procesos de buzoneo para los    **
# **          usuarios del canal '0023' y banco interno '0001'.		**
# **		SCRIPT QUE REALIZA DOS PROCESOS: 			**
# **		- EL PROCESO QUE TRATA LOS FICHEROS DEPOSITADOS EN EL   **
# **		  BUZON ORDENESCRC.					**
# **		- EL PROCESO QUE REALIZA LA AGRUPACION EN UN UNICO      **
# **		  FICHERO DE LOS FICHEROS PENDIENTES DE ENVIAR A HOST.  **
# **                                                                    **
# ** VARIABLES DE ENTRADA DEL SCRIPT:                                   **  
# **      CANAL = 0023 / 0001                                           **
# **      BANCO = 0001                                                  **
# **      PAIS  = co 	                                                **
# **      CARRIL  = 0 / 1 / 2 / 3 Opcional, por defecto toma 0, pero si **
# **                       lo informamos(1, 2, 3)en la entrada tratamos **
# **                       una agrupacin de ficheros de tama±o         **
# **                       extra, por extensin, o de Red exterior.     **
# ** 	  						    **
# ************************************************************************
#
# ************************************************************************
# **  Declaracion de variables para Script                              **
# ************************************************************************


case $# in 
3) CARRIL=0;;
4) CARRIL=$4;;
*)
	echo "N”mero de parßmetros incorrecto."
	exit 1;;
esac
case $1 in
0011) ALIASAPLI=bdfv_contingencia;;
*) ALIASAPLI=bdfv_contingencia;;
esac
export ALIASAPLI
## Nombre
NOMBRESCRIP=bdfvj019.sh
export NOMBRESCRIP
case $1 in
0011) NOMBREFICHERO=BDFVJ019.BDNO.$1;;
*) NOMBREFICHERO=BDFVJ019.BDFV.$1;;
esac
export NOMBREFICHERO
## Parametros Script
CANAL=$1
export CANAL
BCOINT=$2
export BCOINT
PAIS=$3
export PAIS
export CARRIL
DATOS=$ENTORNO/$ALIASAPLI/batch/dat/di

## Ruta de envio por XCOM o FILESPEED
ENVIO=$ENTORNO/$ALIASAPLI/batch/dat/di

## Fichero de LOG  
FICHEROLOG=${ENTORNO}/${ALIASAPLI}/batch/log/${NOMBREFICHERO}.LOG

export FICHEROLOG
print " " >> $FICHEROLOG
AHORA=`date +"F%d%m%y.H%H%M%S"` 

FECHA1=`date +%d-%m-%Y`
HORA=`date +%T`
print "SCRIPT $NOMBRESCRIP-->$CARRIL lanzado el $FECHA1 a las $HORA." >> $FICHEROLOG
#Inclusion del fichero de rutinas.
#Sustituir el directorio por el de produccion cuando se suba script
. $ENTORNO/$ALIASAPLI/batch/srct/rutinas.sh

#$HOME_JRE_IDC/java -cp $DRIVER_DB2_IDC/db2java.zip:\
#/usr/java_dev2/jre/sh/java -cp $DRIVER_DB2_IDC/db2java.zip:\

/$HOME_JRE_IDC/java  -cp /$DRIVER_DB2_IDC/db2jcc.jar:\
/$DRIVER_DB2_IDC/db2jcc_license_cu.jar:\
$ENTORNO/$ALIASAPLI/batch/jar/btf.jar:\
$ENTORNO/$ALIASAPLI/batch/jar/bbvaarq.jar:\
$ENTORNO/$ALIASAPLI/batch/jar/BDFVSvGeneralBAD.jar:\
$ENTORNO/$ALIASAPLI/batch/jar/BDFVSvGeneralAST.jar:\
$ENTORNO/$ALIASAPLI/batch/jar/BDFVSvGeneralBuzon.jar:\
$ENTORNO/$ALIASAPLI/batch/jar/BDFVSvUtilidadGestor.jar:\
$ENTORNO/$ALIASAPLI/batch/jar/BDFVSvGeneralControl.jar:\
$ENTORNO/$ALIASAPLI/batch/jar/BDFVSvUtilidadConversor.jar:\
$ENTORNO/$ALIASAPLI/batch/jar/BDFVSvBuzonesGenerales.jar:\
$ENTORNO/$ALIASAPLI/batch/jar/BDFVSvBuzonesAgrupacion.jar bdfv.ii.sf.buzones.agrupacion.BDFVSvSubidaFicheros $CANAL $BCOINT $ENTORNO/$ALIASAPLI/batch/cfg/SubidaFichero.ini $CARRIL

result=$?

if [ $result -ne 0 ]
 then 
  exit 1
fi

#si todo ha sido correcto avisar al host de que todo ha ido bien
#1.- Copiamos el fichero agrupado al directorio $ENVIO para ser enviado al host

FECHA=`date +%Y%m%d`
HORA=`date +%H%M%S`

case $1 in
#0011) cut -c 1-1000 $DATOS/BDFVJ019_${CANAL}_HOST_${BCOINT}.OUT > $DATOS/BDFVJ019_${CANAL}_HOST_${BCOINT}.LR1000; mvb $DATOS/BDFVJ019_${CANAL}_HOST_${BCOINT}.LR1000 $DATOS/BDFVJ019_${CANAL}_HOST_${BCOINT}.OUT; cp $DATOS/BDFVJ019_${CANAL}_HOST_${BCOINT}.OUT $DATOS/BDNO.BDFVJ019.OUT.F$FECHA.H$HORA; mvb $DATOS/BDFVJ019_${CANAL}_HOST_${BCOINT}.OUT $ENVIO/BDNO.BDFVJ019.OUT >/dev/null 2>&1;rm $DATOS/BDFVJ019.00110001.ctl;;
#0011) 	cut -c 1-1000 $DATOS/BDFVJ019_${CANAL}_HOST_${BCOINT}.OUTS000 > $DATOS/BDFVJ019_${CANAL}_HOST_${BCOINT}.LR1000S000; 
#	mvb $DATOS/BDFVJ019_${CANAL}_HOST_${BCOINT}.LR1000S000 $DATOS/BDFVJ019_${CANAL}_HOST_${BCOINT}.S000.OUT; 
#	cp $DATOS/BDFVJ019_${CANAL}_HOST_${BCOINT}.S000.OUT $DATOS/BDNO.BDFVJ019.S000.OUT.F$FECHA.H$HORA; 
#	mvb $DATOS/BDFVJ019_${CANAL}_HOST_${BCOINT}.S000.OUT $ENVIO/BDNO.BDFVJ019.S000.OUT >/dev/null 2>&1;
#	rm $DATOS/BDFVJ019.00110001.S000ctl;;

##0023) cut -c 1-1000 $DATOS/BDFVJ019_${CANAL}_HOST_${BCOINT}.OUT > $DATOS/BDFVJ019_${CANAL}_HOST_${BCOINT}.LR1000; mvb $DATOS/BDFVJ019_${CANAL}_HOST_${BCOINT}.LR1000 $DATOS/BDFVJ019_${CANAL}_HOST_${BCOINT}.OUT; cp $DATOS/BDFVJ019_${CANAL}_HOST_${BCOINT}.OUT $DATOS/TLSB.BDFVJ019.OUT.F$FECHA.H$HORA; mvb $DATOS/BDFVJ019_${CANAL}_HOST_${BCOINT}.OUT $ENVIO/TLSB.BDFVJ019.OUT >/dev/null 2>&1;;
#*)
#	if [ $CARRIL -eq 0 ]
#		then
#			cut -c 1-1000 $DATOS/BDFVJ019_${CANAL}_HOST_${BCOINT}.OUT > $DATOS/BDFVJ019_${CANAL}_HOST_${BCOINT}.LR1000
#			mvb $DATOS/BDFVJ019_${CANAL}_HOST_${BCOINT}.LR1000 $DATOS/BDFVJ019_${CANAL}_HOST_${BCOINT}.OUT
#			cp $DATOS/BDFVJ019_${CANAL}_HOST_${BCOINT}.OUT $DATOS/TLSB.BDFVJ019.OUT.F$FECHA.H$HORA
#			mvb $DATOS/BDFVJ019_${CANAL}_HOST_${BCOINT}.OUT $ENVIO/TLSB.BDFVJ019.OUT >/dev/null 2>&1
#			rm $DATOS/BDFVJ019.00230001.ctl
			
#		else if [ $CARRIL -eq 1 ]
#			then
#				cut -c 1-1000 $DATOS/BDFVJ019_${CANAL}_HOST_${BCOINT}.OUTTA > $DATOS/BDFVJ019_${CANAL}_HOST_${BCOINT}.LR1000TA
#				mvb $DATOS/BDFVJ019_${CANAL}_HOST_${BCOINT}.LR1000TA $DATOS/BDFVJ019_${CANAL}_HOST_${BCOINT}.OUTTA
#				cp $DATOS/BDFVJ019_${CANAL}_HOST_${BCOINT}.OUTTA $DATOS/TLSB.BDFVJ019TA.OUT.F$FECHA.H$HORA
#				mvb $DATOS/BDFVJ019_${CANAL}_HOST_${BCOINT}.OUTTA $ENVIO/TLSB.BDFVJ019TA.OUT >/dev/null 2>&1
#				rm $DATOS/BDFVJ019.00230001.ctlta
#				
#			else	
#			
#				cut -c 1-1000 $DATOS/BDFVJ019_${CANAL}_HOST_${BCOINT}.OUTS00$CARRIL > $DATOS/BDFVJ019_${CANAL}_HOST_${BCOINT}.LR1000S00$CARRIL
#				mvb $DATOS/BDFVJ019_${CANAL}_HOST_${BCOINT}.LR1000S00$CARRIL $DATOS/BDFVJ019_${CANAL}_HOST_${BCOINT}.S00$CARRIL.OUT
#				cp $DATOS/BDFVJ019_${CANAL}_HOST_${BCOINT}.S00$CARRIL.OUT $DATOS/TLSB.BDFVJ019S00$CARRIL.OUT.F$FECHA.H$HORA
#				mvb $DATOS/BDFVJ019_${CANAL}_HOST_${BCOINT}.S00$CARRIL.OUT $ENVIO/TLSB.BDFVJ019S00$CARRIL.OUT >/dev/null 2>&1
#				rm $ENTORNO/tlsb/batch/$PAIS/dat/di/BDFVJ019.00230001.S00${CARRIL}ctl
#			
#		fi
#	fi;;


#	cut -c 1-1000 $DATOS/BDFVJ019_${CANAL}_HOST_${BCOINT}.OUTS00$CARRIL > $DATOS/BDFVJ019_${CANAL}_HOST_${BCOINT}.LR1000S00$CARRIL
#	mvb $DATOS/BDFVJ019_${CANAL}_HOST_${BCOINT}.LR1000S00$CARRIL $DATOS/BDFVJ019_${CANAL}_HOST_${BCOINT}.S00$CARRIL.OUT
#	cp $DATOS/BDFVJ019_${CANAL}_HOST_${BCOINT}.S00$CARRIL.OUT $DATOS/TLSB.BDFVJ019S00$CARRIL.OUT.F$FECHA.H$HORA
#	mvb $DATOS/BDFVJ019_${CANAL}_HOST_${BCOINT}.S00$CARRIL.OUT $ENVIO/TLSB.BDFVJ019S00$CARRIL.OUT >/dev/null 2>&1
#	#rm $ENTORNO/tlsb/batch/$PAIS/dat/di/BDFVJ019.${CANAL}${BCOINT}.S00${CARRIL}ctl;;


esac

print "SCRIPT $NOMBRESCRIP-->$CARRIL finalizado el $FECHA1 a las $HORA." >> $FICHEROLOG

exit 0
# ************************************************************************
# ** BDFVJ019          FIN     EJECUCION                                **
# **                                                                    **
#*************************************************************************    
