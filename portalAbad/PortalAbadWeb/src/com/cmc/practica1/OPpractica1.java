package com.cmc.practica1;

import java.io.IOException;

import com.grupobbva.ii.sf.base.BbvaException;
import com.grupobbva.ii.sf.operacion.OperacionMulticanal;
import com.grupobbva.ii.sf.operacion.OperacionPresentacion;
import com.ibm.dse.base.Context;
import com.ibm.dse.base.DSEInvalidRequestException;
import com.ibm.dse.base.DSEObjectNotFoundException;
import com.ibm.dse.base.DataElement;
import com.ibm.dse.base.IndexedCollection;
import com.ibm.dse.base.KeyedCollection;

public class OPpractica1 extends OperacionPresentacion{
	
	private String usuario_prueba;

	public OPpractica1() {
		super();
	}
	
	public OPpractica1(String anOperationName) 
		throws IOException {
		super(anOperationName);
	}
	
	public OPpractica1(
		String anOperationName, 
		Context aParentContext) 
		throws IOException, DSEInvalidRequestException {
		super(anOperationName,aParentContext);
	}
	
	public void inicio(){
		setEstado("1");
	}
	
	public void formulario(){
		setEstado("2");			
	}
	public void cargarDatos(){
		setEstado("3");
		try {
			System.out.println("Metodo cargardatos");
			String size = (String) getValueAt("size");
			
			OperacionMulticanal om = creaOM("practica1_om");
			om.setValueAt("Entrada.size", size);
			ejecutarOM(om);
			
			IndexedCollection listaOm =(IndexedCollection) om.getElementAt("Salida.listaDatos");
			IndexedCollection listaOp =(IndexedCollection) getElementAt("listaDatos");
			
			//forma 2
			/* lection(listaOm, listaOp);*/
			
			//forma 1
			
			listaOp.removeAll();
			for (int i = 0; i < listaOm.size(); i++) {
				 KeyedCollection usuarioOm= (KeyedCollection)listaOm.getElementAt(i);
				
				KeyedCollection datos=(KeyedCollection) DataElement.getExternalizer().convertTagToObject(listaOp.getElementSubTag());
				datos.setValueAt("nombre", (String)usuarioOm.getValueAt("nombre"));
				datos.setValueAt("apellido", (String)usuarioOm.getValueAt("apellido"));
				datos.setValueAt("edad", (String)usuarioOm.getValueAt("edad"));
				datos.setValueAt("fechaN", (String)usuarioOm.getValueAt("fechaN"));
				
				listaOp.addElement(datos);	
			}
		} catch (Exception e) {
			System.out.println("Estado 3 excepcion"+ e);
		}	
	}
	
	public void datosReg(){
		setEstado("4");
		try {
			objetoU obejtoUsu = new objetoU();
			
			obejtoUsu.setNombre((String)getValueAt("nombre"));
			obejtoUsu.setApellido((String)getValueAt("apellido"));
			obejtoUsu.setNumero((String)getValueAt("numero"));
			obejtoUsu.setCorreo((String)getValueAt("correo"));
			
			OperacionMulticanal om = creaOM("practica1_om");
			
			om.setValueAt("Entrada.objetoU", obejtoUsu);
			
			ejecutarOM(om);
			
			setValueAt("objetoU", om.getValueAt("Salida.objetoU"));
		
		} catch (Exception e) {
			System.out.println("Estado 3 excepcion"+ e);
		}
			
	}

}




