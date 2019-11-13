package com.cmc.ejemplo;

import java.io.IOException;

import com.grupobbva.ii.sf.operacion.Proceso;
import com.ibm.dse.base.Context;
import com.ibm.dse.base.DSEInvalidRequestException;

public class PRejemplo extends Proceso{
	
	public PRejemplo() {
		super();
	}
	
	public PRejemplo(String anOperationName) 
		throws IOException {
		super(anOperationName);
	}
	
	public PRejemplo(
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
