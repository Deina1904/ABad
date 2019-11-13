package com.cmc.mensaje;

import java.io.IOException;

import com.grupobbva.ii.sf.operacion.Proceso;
import com.ibm.dse.base.Context;
import com.ibm.dse.base.DSEInvalidRequestException;

public class PRpmensaje extends Proceso{
	
	public PRpmensaje() {
		super();
	}
	
	public PRpmensaje(String anOperationName) 
		throws IOException {
		super(anOperationName);
	}
	
	public PRpmensaje(
		String anOperationName, 
		Context aParentContext) 
		throws IOException, DSEInvalidRequestException {
		super(anOperationName,aParentContext );
	}
	
	public void actualizarEstado() {
		setEstado("0");	     
	}
	
	public void actualizarUrlData() {
	    
	}

}
