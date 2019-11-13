package com.cmc.capacitacion;

public class PRcapacitacion extends com.grupobbva.ii.sf.operacion.Proceso{
	
	public PRcapacitacion() {
	    super();
	}
	
    /**
     * 
     * @param anOperationName
     * @throws java.io.IOException
     */
	public PRcapacitacion(String anOperationName)
	    throws java.io.IOException {
	    super(anOperationName);
	}
	
     /**
      * 
      * @param anOperationName
      * @param aParentContext
      * @throws java.io.IOException
      * @throws com.ibm.dse.base.DSEInvalidRequestException
      */
	public PRcapacitacion(
	    String anOperationName,
	    com.ibm.dse.base.Context aParentContext)
	    throws java.io.IOException, com.ibm.dse.base.DSEInvalidRequestException {
	    super(anOperationName, aParentContext);
	}
	
	public void actualizarEstado() {
	     setEstado("0");
	}		    

	/*Metodo para acceder a Url segun acción*/
	public void actualizarUrlData() {
		    
	}
}


