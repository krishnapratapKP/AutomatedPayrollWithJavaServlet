package com.kp.view;

import java.io.IOException;
import java.io.PrintWriter;
import java.io.Writer;
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
import javax.servlet.http.HttpSession;

import com.kp.controller.DatabaseConnection;
import com.kp.controller.PayrollController;
import com.kp.model.ModelValue;
import com.kp.model.PassEncoding;

@WebServlet(urlPatterns = "/login")
public class Login extends HttpServlet {

	public ModelValue modelValue = new ModelValue();

	protected void doGet(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {

	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {

		String username = request.getParameter("username");
		String password = request.getParameter("password");

		ModelValue MV;
		try {
			MV = new PayrollController().validateLogin(username, password);

			if ((MV) != null) {

				HttpSession session = request.getSession();
				session.setAttribute("username", MV.getUsername());
				
				PrintWriter out=response.getWriter() ;
				out.print("success");

				//request.getRequestDispatcher("WEB-INF/views/success.jsp").forward(request, response);
			} else {
				request.getRequestDispatcher("WEB-INF/views/index.jsp").forward(request, response);
			}
		} catch (ClassNotFoundException | SQLException e1) {
			// TODO Auto-generated catch block
			e1.printStackTrace();
		}
	}

}