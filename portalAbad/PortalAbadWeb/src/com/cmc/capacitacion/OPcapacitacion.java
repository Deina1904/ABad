package com.cmc.capacitacion;

import com.grupobbva.ii.sf.operacion.OperacionPresentacion;

public class OPcapacitacion extends OperacionPresentacion{

	public OPcapacitacion() {
	    super();
	}

    /**
     * 
     * @param anOperationName
     * @throws java.io.IOException
     */
	public OPcapacitacion(String anOperationName)
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
	public OPcapacitacion(
	    String anOperationName,
	    com.ibm.dse.base.Context aParentContext)
	    throws java.io.IOException, com.ibm.dse.base.DSEInvalidRequestException {
	    super(anOperationName, aParentContext);
	}
	
	
	public void inicio(){
		setEstado("1");
	}
	
}



