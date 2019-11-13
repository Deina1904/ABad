package com.grupobbva.ii.sf.modelo;

import java.util.Hashtable;
import javax.sql.DataSource;
import java.sql.SQLException;
import java.sql.Connection;
import javax.naming.Context;
import javax.naming.InitialContext;
import javax.naming.NamingException;

/**
 * Inserte aqu� la descripci�n del tipo.

 * Fecha de creaci�n: (13/1/00 10:07:27)
 * @author: Olivier Cruces Robineau
 */

 
public class ConsultaBDMultiple {
	private	static	Context		contexto	=	null;
	private	static	Hashtable	datasources	=	null;
/*
	Al acceder por Data Source no hace falta esto.
	static {
		try {
			Class.forName("COM.ibm.db2.jdbc.net.DB2Driver");
		} catch (ClassNotFoundException cNFE) {
//			cNFE.printStackTrace();
		}
	}
*/
/**
 * Inserte aqu� la descripci�n del m�todo.
 * Fecha de creaci�n: (13/09/2000 16:04:33)
 * @return java.sql.Connection
 * @param pool java.lang.String
 * @param usuario java.lang.String
 * @param password java.lang.String
 * @exception javax.naming.NamingException   Error al localizar el Pool en el servicio de nombres.
 * @exception javax.sql.SQLException         Error al obtener la conexi�n.
 */
public static Connection getConexion(String pool, String usuario, String password) throws NamingException, SQLException {
	return getDataSource(pool).getConnection(usuario, password);
}
/**
 * Inserte aqu� la descripci�n del m�todo.
 * Fecha de creaci�n: (13/1/00 10:16:09)
 * @return javax.naming.Context
 * @exception javax.naming.NamingException   Error al conectar al servicio de nombres.
 */
protected static Context getContexto() throws NamingException {
	if (contexto == null) {
		setContexto(new InitialContext());
	}

	return contexto;
}
/**
 * Inserte aqu� la descripci�n del m�todo.
 * Fecha de creaci�n: (13/09/2000 16:10:23)
 * @return com.ibm.db2.jdbc.app.stdext.javax.sql.DataSource
 * @param pool java.lang.String              Nombre del pool. Se le a�ade autom�ticamente "jdbc/" por delante, ya que el WAS los registra as�.
 * @exception javax.naming.NamingException   Error al localizar el Pool en el servicio de nombres.
 */
protected static DataSource getDataSource(String pool) throws NamingException {
	DataSource dS = null;
	String poolWAS = "jdbc/" + pool;

	// Buscarlo en la lista de DataSources recuperados
	dS = (DataSource)getDatasources().get(poolWAS);

	if (dS == null) {
		dS = (DataSource)getContexto().lookup(poolWAS);
		// Almacenarlo en la lista de DataSources recuperados
		getDatasources().put(poolWAS, dS);
	}
	return dS;
}
/**
 * Inserte aqu� la descripci�n del m�todo.
 * Fecha de creaci�n: (13/09/2000 14:51:47)
 * @return java.util.Hashtable
 */
protected static Hashtable getDatasources() {
	if (datasources == null) {
		datasources = new Hashtable(10);
	}
	return datasources;
}
/**
 * Inserte aqu� la descripci�n del m�todo.
 * Fecha de creaci�n: (14/09/2000 11:47:30)
 */
public static synchronized void liberarRecursos() {

	setContexto(null);
	getDatasources().clear();
}
/**
 * Inserte aqu� la descripci�n del m�todo.
 * Fecha de creaci�n: (13/1/00 10:16:09)
 * @param newContexto javax.naming.Context
 */
protected static void setContexto(Context newContexto) {
	contexto = newContexto;
}
/**
 * Inserte aqu� la descripci�n del m�todo.
 * Fecha de creaci�n: (13/09/2000 14:51:47)
 * @param newDatasources java.util.Hashtable
 */
protected static void setDatasources(Hashtable newDatasources) {
	datasources = newDatasources;
}
}
