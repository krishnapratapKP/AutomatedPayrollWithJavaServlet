package com.kp.view;
import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

@WebServlet(urlPatterns="/logout")
public class Logout extends HttpServlet{
	
protected void doGet(HttpServletRequest request,HttpServletResponse response)throws ServletException,IOException{
		
	    request.getSession().invalidate();
		request.getRequestDispatcher("WEB-INF/views/index.jsp").forward(request, response);
	}

}
