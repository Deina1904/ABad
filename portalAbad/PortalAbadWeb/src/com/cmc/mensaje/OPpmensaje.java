package com.cmc.mensaje;

import java.io.IOException;

import com.grupobbva.ii.sf.operacion.OperacionPresentacion;
import com.ibm.dse.base.Context;
import com.ibm.dse.base.DSEInvalidRequestException;

public class OPpmensaje extends OperacionPresentacion {

	public OPpmensaje() {
		super();
	}
	
	public OPpmensaje(String anOperationName) 
		throws IOException {
		super(anOperationName);
	}
	
	public OPpmensaje(
		String anOperationName, 
		Context aParentContext) 
		throws IOException, DSEInvalidRequestException {
		super(anOperationName,aParentContext);
	}
	
	public void inicio(){
		setEstado("1");
	}
	
}
