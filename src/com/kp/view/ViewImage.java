package com.kp.view;
import java.io.IOException;
import com.kp.controller.*;
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

import org.json.simple.JSONArray;
import org.json.simple.JSONObject;

@WebServlet(urlPatterns = "/viewimage")
public class ViewImage extends HttpServlet {
	protected void doGet(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {

		  PayrollController payrollController=new PayrollController();
		  JSONArray array=new JSONArray();
			
		     if("ok".equals(request.getParameter("k")))
		     {
		    	 String Id=request.getParameter("Id");
		    	 String date=request.getParameter("date");
		    	 System.out.println("ok");
		    	 array=payrollController.employeedetail(Id, date);
		    	 request.setAttribute("array",array);
		    	 request.getRequestDispatcher("JsonArrayPrint").forward(request,response);
		     }
		     else
		     {
		    	 System.out.println("dis");
		    	 request.getRequestDispatcher("WEB-INF/views/viewimage.jsp").forward(request, response);
		     }
		
		
	}
	
	
	

}
