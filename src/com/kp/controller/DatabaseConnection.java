package com.kp.controller;

import java.sql.Connection;
import java.sql.DriverManager;

public class DatabaseConnection {

	
	  public static final String DBURL="jdbc:mysql://localhost:3306/automatedpayroll";
	  public static  final String USERNAME="root";
	  public static final String PASSWORD="";
	  
	  
		public static  Connection openConnection()
		{try{ Class.forName("com.mysql.jdbc.Driver");
		Connection conn=DriverManager.getConnection(DBURL,USERNAME,PASSWORD);
			return(conn);
			
		}catch(Exception e){System.out.println("Error-OpenConnection "+e);
		return null;
		}
			
		}

}
