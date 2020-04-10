package com.bibliotheque.Config;

import java.sql.Connection;
import java.sql.DriverManager;


public class OracleConnection {
	

	private static  Connection con ;
		
	
	public static Connection getconnect() {
		
		try {
		
		//System.out.println("1");
			Class.forName("oracle.jdbc.driver.OracleDriver");
		//System.out.println("2");	
			con = DriverManager.getConnection("jdbc:oracle:thin:@localhost:1521:xe", "bibliotheque", "bibliotheque");
		//System.out.println("3");
		
		}catch(Exception e1) {}
		
		return con ;
		
	}	

}


