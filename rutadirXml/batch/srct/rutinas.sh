# ***************************************************************************
# **								                                       **	
# ** VARIABLES DE ENTORNO :                                                **
# **								                                       **	
# **        NOMBRESCRIP  : Nombre del scrip que utiliza una funcion de la  **
# **                       libreria de funciones.		                   ** 
# **        FICHEROLOG   : Nombre de fichero log que recoje las icidencias **   
# **                       sucedidas al ejecutarse una funcion.            **
# **									                                   **   
# ***************************************************************************


# *************************************************************************** 
# ** FUNCION (rmb):				                                           **
# ** La funcion rmb es tiene los mismos efectos que la funcion remove(rm)  **
# ** de Unix, con la unica diferencia que deja en caso de error en su      ** 
# ** ejecucion un mensaje en el fichero de log determinado por la          ** 
# ** variable de entorno FICHEROLOG.                                       ** 
# **                                                                       **
# **    PARAMETROS                                                         **
# **    -NOMTABLA    Nombre de la tabla a la que se le ha realizado        **
# **     el BCP								                               **
# **									                                   **  
# ** PARAMETRO DE ENTRADA 1 : Fichero a borrar                             **
# ** PARAMETRO DE ENTRADA 2: Valor de la criticidad del scrip.Opcional     **
# **                         					                           ** 
# ***************************************************************************

rmb()
{
	/usr/bin/rm $1 > /dev/null 2>&1
	if [ $? -gt 0 ]
	then
#       Asignacion de criticidad al error, en caso de que no se especifique, la 
#       criticidad sera A.
    
          CRITICIDAD=$2
          CRITICIDAD=${CRITICIDAD:-A}

          FECHA2=`date +%y/%m/%d`
          HORA=`date +%T`
          print "$FECHA2 $HORA-TVL-$CRITICIDAD:$NOMBRESCRIP:El rmb  ha fallado"  >> $FICHEROLOG
          print "$FECHA2 $HORA:$NOMBRESCRIP:El rmb de $1  ha fallado"  >> $FICHEROLOG
          FECHA1=`date +%d-%m-%Y`
          HORA=`date +%T`
          print "SCRIPT finalizado con error el $FECHA1 a las $HORA." >> $FICHEROLOG
          exit 1	  
	fi
	return
}

# ************************************************************************ 
# ** FUNCION (cpb):				                                        **
# ** La funcion cpb tiene los mismos efectos que la funcion copy (cp)   **
# ** de Unix, con la unica diferencia que deja en caso de error en su   ** 
# ** ejecucion un mensaje en el fichero de log determinado por la       ** 
# ** variable de entorno FICHEROLOG.                                    ** 
# **                                                                    **
# **    PARAMETROS                                                      **
# **    -NOMTABLA    Nombre de la tabla a la que se le ha realizado     **
# **     el BCP								                            **
# **									                                **  
# ** PARAMETRO DE ENTRADA 1: Fichero origen                             **
# ** PARAMETRO DE ENTRADA 2: Fichero destino                            **
# ** PARAMETRO DE ENTRADA 3: Valor de la criticidad del scrip.Opcional  **
# **                         					                        ** 
# ************************************************************************

cpb()
{
	/bin/cp $1 $2 > /dev/null 2>&1
	if [ $? -gt 0 ]
	then
#       Asignacion de criticidad al error, en caso de que no se especifique, la 
#       criticidad sera A.
    
          CRITICIDAD=$3
          CRITICIDAD=${CRITICIDAD:-A}

          FECHA2=`date +%y/%m/%d`
          HORA=`date +%T`
          print "$FECHA2 $HORA-TVL-$CRITICIDAD:$NOMBRESCRIP:El cpb  ha fallado"  >> $FICHEROLOG
          print "$FECHA2 $HORA:$NOMBRESCRIP:El cpb de $1 a $2  ha fallado"  >> $FICHEROLOG
          FECHA1=`date +%d-%m-%Y`
          HORA=`date +%T`
          print "SCRIPT finalizado con error el $FECHA1 a las $HORA." >> $FICHEROLOG
          exit 1	  
	fi
	return
}

# ************************************************************************ 
# ** FUNCION (mvb):				                                        **
# ** La funcion mvb tiene los mismos efectos que la funcion move (mv)   **
# ** de Unix, con la unica diferencia que deja en caso de error en su   ** 
# ** ejecucion un mensaje en el fichero de log determinado por la       ** 
# ** variable de entorno FICHEROLOG.                                    ** 
# **                                                                    **
# **    PARAMETROS                                                      **
# **    -NOMTABLA    Nombre de la tabla a la que se le ha realizado     **
# **     el BCP								                            **
# **									                                **  
# ** PARAMETRO DE ENTRADA 1: Fichero origen                             **
# ** PARAMETRO DE ENTRADA 2: Fichero destino                            **
# ** PARAMETRO DE ENTRADA 3: Valor de la criticidad del scrip.Opcional  **
# **                         					                        ** 
# ************************************************************************

mvb()
{
	/bin/mv $1 $2 > /dev/null 2>&1
	if [ $? -gt 0 ]
	then
#       Asignacion de criticidad al error, en caso de que no se especifique, la 
#       criticidad sera A.
    
          CRITICIDAD=$3
          CRITICIDAD=${CRITICIDAD:-A}

          FECHA2=`date +%y/%m/%d`
          HORA=`date +%T`
          print "$FECHA2 $HORA-TVL-$CRITICIDAD:$NOMBRESCRIP:El mvb  ha fallado"  >> $FICHEROLOG
          print "$FECHA2 $HORA:$NOMBRESCRIP:El mvb de $1 a $2  ha fallado"  >> $FICHEROLOG
          FECHA1=`date +%d-%m-%Y`
          HORA=`date +%T`
          print "SCRIPT finalizado con error el $FECHA1 a las $HORA." >> $FICHEROLOG
          exit 1	  
	fi
	return
}

# ************************************************************************ 
# ** FUNCION (Comprobacion):   			                                **
# ** Rutina de validacion para los BCP                                  **
# **                                                                    **
# **    PARAMETROS                                                      **
# **    -NOMTABLA    Nombre de la tabla a la que se le ha realizado     **
# **                 el BCP						                        **
# **									                                **  
# ** PARAMETRO DE ENTRADA 1: Numero de paso en el que ha sido llamada   **
# **                         la rutina.					                ** 
# ** PARAMETRO DE ENTRADA 2: Valor del retorno de la operacion de BCP   **
# ** PARAMETRO DE ENTRADA 3: Valor de la criticidad del scrip.Opcional  **
# ************************************************************************

Comprobacion()
{

if [ $2 -ne 0 ]
then
#   Asignacion de criticidad al error, en caso de que no se especifique, la 
#   criticidad sera A.
    
    CRITICIDAD=$3
    CRITICIDAD=${CRITICIDAD:-A}

    FECHA2=`date +%y/%m/%d`                                                  
    HORA=`date +%T`                                                          
    print "$FECHA2 $HORA-TVL-$CRITICIDAD:$NOMBRESCRIP:BCP$NOMTABLA Codigo retorno $2" >> $FICHEROLOG
    FECHA1=`date +%d-%m-%Y`                                                  
    HORA=`date +%T`                                                          
    print "SCRIPT finalizado con error el $FECHA1 a las $HORA." >> $FICHEROLOG
 exit $1
fi
return
}

