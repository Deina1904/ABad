package com.cmc.practica1;

import java.io.IOException;

import com.grupobbva.ii.sf.operacion.Proceso;
import com.ibm.dse.base.Context;
import com.ibm.dse.base.DSEInvalidRequestException;

public class PRpractica1 extends Proceso {
	
	public PRpractica1() {
		super();
	}
	
	public PRpractica1(String anOperationName) 
		throws IOException {
		super(anOperationName);
	}
	
	public PRpractica1(
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


