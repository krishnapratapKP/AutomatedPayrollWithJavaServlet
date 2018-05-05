package com.kp.view;

import java.io.IOException;
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

@WebServlet(urlPatterns = "/registration")
public class Registration extends HttpServlet {

	

	protected void doGet(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		
		  String user=request.getParameter("username");
		                request.setAttribute("valid", "check");
		  
		
		try {
			Class.forName("com.mysql.jdbc.Driver");
		} catch (ClassNotFoundException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		try {
			Connection conn = DriverManager.getConnection(DatabaseConnection.DBURL, DatabaseConnection.USERNAME,
					DatabaseConnection.PASSWORD);
			String sql="select user from registration";
			PreparedStatement pstmt=conn.prepareStatement(sql);
			ResultSet k=pstmt.executeQuery();
			while(k.next())
			{
			      	
				  
				if(k.getString("user").equals(user))
				{
					
					System.out.println("yes");
					break;
				}
				
			}
			
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}

	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {

		String username = request.getParameter("username");
		String password = request.getParameter("password");
		String mobile = request.getParameter("mobile");
		String position = request.getParameter("positon");
		String address = request.getParameter("address");
		String city = request.getParameter("city");
		String state = request.getParameter("state");
		String country = request.getParameter("country");

		boolean k = false;
		try {
			System.out.println(k);
			k = validateLogin(username, password, mobile, position, address, city, state, country);
		} catch (Exception e) {
			System.out.print(e);
		}
		System.out.println(k);
		if (k) {

			request.getRequestDispatcher("WEB-INF/views/index.jsp").forward(request, response);
		} else {
			System.out.println("Registration Unsuccessful");
		}
	}

	protected boolean validateLogin(String user, String pass, String mobile, String position, String address,
			String city, String state, String country) throws ClassNotFoundException, SQLException {
		
		Class.forName("com.mysql.jdbc.Driver");
		Connection conn = DriverManager.getConnection(DatabaseConnection.DBURL, DatabaseConnection.USERNAME,
				DatabaseConnection.PASSWORD);
		String sql = "insert into registration values(?,?,?,?,?,?,?,?)";

		PreparedStatement pstmt = conn.prepareStatement(sql);
		pstmt.setString(1, user);
		pstmt.setString(2, pass);
		pstmt.setString(3, position);
		pstmt.setString(4, mobile);
		pstmt.setString(5, address);
		pstmt.setString(6, city);
		pstmt.setString(7, state);
		pstmt.setString(8, country);

		int rs = pstmt.executeUpdate();

		if (rs > 0) {

			System.out.println("check");
			return true;
		} else {
			return false;
		}
	}

}