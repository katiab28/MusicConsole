package it.unisa.utils;

import java.sql.Connection;
import java.sql.DatabaseMetaData;
import java.sql.SQLException;

import javax.naming.Context;
import javax.naming.InitialContext;
import javax.naming.NamingException;
import javax.servlet.ServletContext;
import javax.servlet.ServletContextEvent;
import javax.servlet.ServletContextListener;
import javax.servlet.annotation.WebListener;
import javax.sql.DataSource;

@WebListener
public class MainContext implements ServletContextListener {

	static DataSource ds;
	@Override
	public void contextInitialized(ServletContextEvent sce) {
		Utility.print("Startup web application");
		
		ServletContext context = sce.getServletContext();
		
		//ds = null;
		
		try {
			Context initCtx = new InitialContext();//accediamo ai servizi di tomcat
			Context envCtx = (Context) initCtx.lookup("java:comp/env");
		
			ds = (DataSource) envCtx.lookup("jdbc/musicdb");
			/*context.setAttribute("dataSource", ds);*/
		
			Connection con = null;
		try {
		    con = ds.getConnection();
		    
		DatabaseMetaData metaData = con.getMetaData();
		Utility.print("DBMS name :" + metaData.getDatabaseProductName());
		Utility.print("DBMS version :" + metaData.getDatabaseProductVersion());
		
		}finally {
			if( con != null)
				con.close();
			}
		} catch(SQLException | NamingException e ) {
			Utility.print(e);
		}
		
	context.setAttribute("DataSource", ds);	
	Utility.print("DataSource creation : " + ds.toString());
}
	
	@Override
	public void contextDestroyed(ServletContextEvent sce) {
		ServletContext context = sce.getServletContext();
		
		context.removeAttribute("DataSource");
		
		Utility.print("Shotdown web application");
	}
	
	public static Connection getConnection() throws SQLException {
	    System.out.println(ds.getConnection());
		return ds.getConnection();
	  }
	

}
