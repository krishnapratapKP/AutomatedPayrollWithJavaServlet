package com.kp.view;

import java.io.IOException;
import java.io.PrintWriter;
import java.sql.SQLException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.kp.controller.PayrollController;

/**
 * Servlet implementation class ForgetPassword
 */
@WebServlet("/forgetpassword")
public class ForgetPassword extends HttpServlet {
	private static final long serialVersionUID = 1L;

	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		 request.getRequestDispatcher("WEB-INF/views/forgetpassword.jsp").forward(request, response);
	}

	
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
	
		String type=request.getParameter("type");
		
		if(type.equals("email"))
		{
			try {
				if(new PayrollController().checkEmail(request.getParameter("email")))
				{
					PrintWriter out=response.getWriter();
					out.print("success");
				}
			} catch (SQLException e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			}
		}
		
		if(type.equals("change"))
		{
			try {
				if(new PayrollController().changePass(request.getParameter("Email"),request.getParameter("Pass")))
				{
					PrintWriter out=response.getWriter();
					out.print("success");
				}
			} catch (SQLException e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			}
		}
	}

}
