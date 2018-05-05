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

import com.kp.controller.DatabaseConnection;
import com.kp.controller.PayrollController;

@WebServlet(urlPatterns="/checksalary")
public class CheckSalary extends HttpServlet{
	
	 private int  count=0;
	
	protected void doGet(HttpServletRequest request,HttpServletResponse response)throws ServletException,IOException{
		
		request.getRequestDispatcher("WEB-INF/views/checksalary.jsp").forward(request, response);
		
		
	}
	
	protected void doPost(HttpServletRequest request,HttpServletResponse response) throws ServletException,IOException{
		
		String EmpId=request.getParameter("Id");
		String FromDate=request.getParameter("fdate");
		String ToDate=request.getParameter("tdate");
		
		
	
			
		try {
			count= new PayrollController().checkSalary(EmpId, FromDate,ToDate);
		} catch (ClassNotFoundException | SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		
	//	int totalRupees=Integer.valueOf(PayPerDay)*count;
		
	
		 PrintWriter out=response.getWriter();
		 out.print(count);
		
	}

	private String localDateFormat(String date) {
		
		   String [] mdate=date.split("-");
		   StringBuilder stringbuilder=new StringBuilder();
		
			   stringbuilder.append(mdate[2]).append("/").append(mdate[1]).append("/").append(mdate[0]);
			
			   
		 
 		return stringbuilder.toString();
	}
	
	protected boolean validateLogin(String empId, String fromDate, String toDate) throws ClassNotFoundException, SQLException {

		Class.forName("com.mysql.jdbc.Driver");
		Connection conn = DriverManager.getConnection(DatabaseConnection.DBURL, DatabaseConnection.USERNAME,
				DatabaseConnection.PASSWORD);
		String sql = "select * from emp_log where empDate=?  between empDate= ? and empId=?";

		PreparedStatement pstmt = conn.prepareStatement(sql);
		pstmt.setString(1, fromDate);
		pstmt.setString(2, toDate);
		pstmt.setString(3, empId);

		ResultSet rs = pstmt.executeQuery();

		if (rs.next()) {

			count++;
			return true;
		} else {
			return false;
		}
	}

}
