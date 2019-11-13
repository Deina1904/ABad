package com.cmc.practica1;

import java.io.IOException;
import java.util.Random;

import com.grupobbva.ii.sf.operacion.OperacionMulticanal;
import com.ibm.dse.base.DSEInvalidArgumentException;
import com.ibm.dse.base.DSEObjectNotFoundException;
import com.ibm.dse.base.DataElement;
import com.ibm.dse.base.IndexedCollection;
import com.ibm.dse.base.KeyedCollection;

public class OMpractica1 extends OperacionMulticanal {

	public void execute() throws Exception {
		
		
			
		//String nombre = (String) getValueAt("Entrada.nombre");
		//setValueAt("Salida.nomMdoficado", nombre+ "modificado");
		
		if (getValueAt("Entrada.size")!= null ) {
			
			int tamanoLista = (Integer)getValueAt("Entrada.size");
			recibirDato(tamanoLista);
		}
		
		if (getValueAt("Entrada.objetoU") != null) {
		
			objetoU usuario = (objetoU)getValueAt("Entrada.objetoU");
			System.out.println(usuario.toString() );
			
			setValueAt("Salida.objetoU", usuario);
		}
	
		
	}
		
	public void recibirDato (int tamaño) throws DSEObjectNotFoundException, IOException, DSEInvalidArgumentException{
		
		System.out.println("Datos valdiados");
		
		IndexedCollection lista =(IndexedCollection) getElementAt("Salida.listaDatos");
		lista.removeAll();
	
		for (int i = 0; i < tamaño; i++) {
			KeyedCollection datos=(KeyedCollection) DataElement.getExternalizer().convertTagToObject(lista.getElementSubTag());
			datos.setValueAt("nombre", nombreDec()+""+nombreDec());
			datos.setValueAt("apellido", apellidoDec());
			datos.setValueAt("edad", edadDec());
			datos.setValueAt("fechaN", fechaNaDec());
			
			lista.addElement(datos);	
		}
		
		System.out.println(lista); 

	}
	
	
	public String nombreDec(){
		Random r = new Random();
	 String [] vector1 = new String[10]; 
	 vector1[0]="Alejandro";
	 vector1[1]="Steven";
	 vector1[2]="Daniel";
	 vector1[3]="Camilo";
	 vector1[4]="Alejandro";
	 vector1[5]="Sofia";
	 vector1[6]="Natalia";
	 vector1[7]="Laura";
	 vector1[8]="Valentina";
	 vector1[9]="Nicolas";
	 
	  return vector1[r.nextInt(10)];
	}
	
	private String apellidoDec(){
		Random r = new Random();
		 String [] vector1 = new String[10]; 
		 vector1[0]="Arevalo";
		 vector1[1]="Moreno";
		 vector1[2]="Martinez";
		 vector1[3]="Lopez";
		 vector1[4]="Camacho";
		 vector1[5]="Hernandez";
		 vector1[6]="Gonzalez";
		 vector1[7]="Agudelo";
		 vector1[8]="Sanchez";
		 vector1[9]="Gomez";
		 
		 return vector1[r.nextInt(10)];
		}
	
	private String edadDec(){
		Random r = new Random ();
		 String [] vector1 = new String[10]; 
		 vector1[0]="20";
		 vector1[1]="18";
		 vector1[2]="22";
		 vector1[3]="30";
		 vector1[4]="28";
		 vector1[5]="25";
		 vector1[6]="23";
		 vector1[7]="24";
		 vector1[8]="29";
		 vector1[9]="17";
		 
		 return vector1[r.nextInt(10)]; 
	}
	
	private String fechaNaDec(){
		Random r = new Random();
		 String [] vector1 = new String[10]; 
		 vector1[0]="01/2000";
		 vector1[1]="04/2006";
		 vector1[2]="03/2001";
		 vector1[3]="05/2006";
		 vector1[4]="06/2002";
		 vector1[5]="07/2015";
		 vector1[6]="02/20019";
		 vector1[7]="10/2012";
		 vector1[8]="11/2000";
		 vector1[9]="10/2008";
		 
		 return vector1[r.nextInt(10)]; 
		}
	
	
	
	
	
}
