package com.kp.view;


import java.io.IOException;
import java.io.PrintWriter;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

@WebServlet(urlPatterns ="/index")
public class Index  extends HttpServlet{
	
	protected void doGet(HttpServletRequest request,HttpServletResponse response) throws ServletException, IOException{
		 
		request.getRequestDispatcher("WEB-INF/views/index.jsp").forward(request,response);
	}

}

