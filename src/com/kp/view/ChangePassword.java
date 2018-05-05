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

@WebServlet(urlPatterns = "/changepassword")
public class ChangePassword extends HttpServlet {
	protected void doGet(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {

		request.getRequestDispatcher("WEB-INF/views/changepassword.jsp").forward(request, response);
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		
		String type=request.getParameter("type");
		
		if(type.equals("check"))
		{
			System.out.println(type);
		    try {
				if(new PayrollController().checkPassword(request.getParameter("Id"),request.getParameter("Pass")))
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
				if(new PayrollController().changePassword(request.getParameter("Id"),request.getParameter("Pass")))
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
