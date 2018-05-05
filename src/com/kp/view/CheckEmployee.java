package com.kp.view;
import java.io.IOException;
import java.io.PrintWriter;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import org.json.simple.JSONObject;

import com.kp.controller.DatabaseConnection;
import com.kp.controller.PayrollController;

import org.json.simple.JSONArray;

@WebServlet(urlPatterns="/checkemployee")
public class CheckEmployee extends HttpServlet {
protected void doGet(HttpServletRequest request,HttpServletResponse response)throws ServletException,IOException{
		
	  
	    JSONArray array=new JSONArray();
	
	     if("ok".equals(request.getParameter("k")))
	     {
	    	 System.out.println("ok");
	    	 array=new PayrollController().employeedetail();
	    	 request.setAttribute("array",array);
	    	 request.getRequestDispatcher("JsonArrayPrint").forward(request,response);
	     }
	     else
	     {
	    	 System.out.println("dis");
	    	 request.getRequestDispatcher("WEB-INF/views/checkemployee.jsp").forward(request, response);
	     }
	     
	}

private JSONArray employeedetail() {
	
	try {
		Class.forName("com.mysql.jdbc.Driver");
		Connection conn=DriverManager.getConnection(DatabaseConnection.DBURL,DatabaseConnection.USERNAME,DatabaseConnection.PASSWORD);
		String sql="select * from registration";
		PreparedStatement pstmt=conn.prepareStatement(sql);
		
		ResultSet resultset=pstmt.executeQuery();
		JSONObject jsonobject=new JSONObject();
		JSONArray jsonarray=new JSONArray();
		while(resultset.next())
		{
			jsonobject.put("id", resultset.getString("Id"));
			jsonobject.put("username",resultset.getString("Username"));
			jsonobject.put("email",resultset.getString("Email"));
			jsonobject.put("mobile", resultset.getString("Number"));
			jsonarray.add(jsonobject);
		}
		
		System.out.print(jsonarray);
		return jsonarray;
		
	} catch (ClassNotFoundException e) {
		// TODO Auto-generated catch block
		e.printStackTrace();
	} catch (SQLException e) {
		// TODO Auto-generated catch block
		e.printStackTrace();
	}
	return null;
}

}
