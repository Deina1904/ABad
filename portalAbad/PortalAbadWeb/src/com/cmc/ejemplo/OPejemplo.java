package com.cmc.ejemplo;

import java.io.IOException;
import java.sql.Connection;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;

import com.grupobbva.ii.sf.base.BbvaException;
import com.grupobbva.ii.sf.modelo.ConsultaBD;
import com.grupobbva.ii.sf.operacion.OperacionPresentacion;
import com.ibm.dse.base.Context;
import com.ibm.dse.base.DSEInvalidRequestException;

public class OPejemplo extends OperacionPresentacion {
	
	public OPejemplo() {
		super();
	}
	
	public OPejemplo(String anOperationName) 
		throws IOException {
		super(anOperationName);
	}
	
	public OPejemplo(
		String anOperationName, 
		Context aParentContext) 
		throws IOException, DSEInvalidRequestException {
		super(anOperationName,aParentContext);
	}
	
	public void inicio() throws BbvaException{
		/*String query="SELECT * FROM NOTIFICATION.USUARIO";
		Connection con=null;
		ResultSet rs=null;
		   try {
			   con=ConsultaBD.getConexionBBVNet();
			   Statement st=con.createStatement();
			   rs= st.executeQuery(query);
			   while (rs.next()){
				   System.out.println(rs.getString(1)+" - "+rs.getString(2)+" - "+rs.getString(3));
			   }
			   
		} catch (Exception e) {
			throw (BbvaException) e;
		}finally {
			try {
				con.close();
				rs.close();
			} catch (Exception e) {
				throw (BbvaException) e;
			}
			
		}*/
		
		setEstado("1");
	}
	
	public void registro(){
		setEstado("2");	
		
	}
	
	public void segundoPaso(){
		setEstado("3");	
		try {
			setValueAt("nombrePr", getValueAt("nombres").toString());
			setValueAt("apellidoPr", getValueAt("apellidos").toString());
			setValueAt("usuarioPr", getValueAt("usuario").toString());
			

		} catch (Exception e) {
			System.out.println("Estado 3 excepcion"+ e);			
		}
	}
	
	public void tercerPaso(){
		setEstado("4");
		try {
			setValueAt("s_nombres", getValueAt("nombrePr").toString());
			setValueAt("s_apellidos", getValueAt("apellidoPr").toString());
			setValueAt("s_usuario", getValueAt("usuarioPr").toString());
			
			setValueAt("correoPr", getValueAt("correo").toString());
			setValueAt("direccionPr", getValueAt("direccion").toString());
			setValueAt("telefonoPr", getValueAt("telefono").toString());
			
		} catch (Exception e) {
			System.out.println("Estado 3 excepcion"+ e);		
		}	
	}
	
	public void cuartoPaso(){
		setEstado("5");	
		try {
			setValueAt("s_nombres", getValueAt("nombrePr").toString());
			setValueAt("s_apellidos", getValueAt("apellidoPr").toString());
			setValueAt("s_usuario", getValueAt("usuarioPr").toString());
			
			setValueAt("s_correo", getValueAt("correoPr").toString());
			setValueAt("s_direccion", getValueAt("direccionPr").toString());
			setValueAt("s_telefono", getValueAt("telefonoPr").toString());
			
			setValueAt("estCivilPr", getValueAt("estCivil").toString());
			setValueAt("noCuentaPr", getValueAt("noCuenta").toString());
			setValueAt("tipoCuentaPr", getValueAt("tipoCuenta").toString());
			setValueAt("sexoPr", getValueAt("sexo").toString());
			
		} catch (Exception e) {
			System.out.println("Estado 5 excepcion"+ e);		
		}
	}
	
	public void quintoPaso(){
		setEstado("6");	
		try {
			
			setValueAt("imagenPr", getValueAt("imagen").toString());
			setValueAt("textoPr", getValueAt("text").toString());
			
			setValueAt("s_nombres", getValueAt("nombrePr").toString());
			setValueAt("s_apellidos", getValueAt("apellidoPr").toString());
			setValueAt("s_usuario", getValueAt("usuarioPr").toString());
			
			setValueAt("s_correo", getValueAt("correoPr").toString());
			setValueAt("s_direccion", getValueAt("direccionPr").toString());
			setValueAt("s_telefono", getValueAt("telefonoPr").toString());
			
			setValueAt("s_estCivil", getValueAt("estCivilPr").toString());
			setValueAt("s_noCuenta", getValueAt("noCuentaPr").toString());
			setValueAt("s_tipoCuenta", getValueAt("tipoCuentaPr").toString());
			setValueAt("s_sexo", getValueAt("sexoPr").toString());
			
			setValueAt("s_imagen", getValueAt("imagenPr").toString());
			setValueAt("s_text", getValueAt("textoPr").toString());
			
			System.out.println("imagen paso 5 " +getValueAt("s_imagen"));
			
		} catch (Exception e) {
			System.out.println("Estado 6 excepcion"+ e);		
		}
	}

	
}
