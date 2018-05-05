package com.kp.view;

import java.io.File;
import java.io.IOException;
import java.io.InputStream;
import java.io.PrintWriter;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.SQLException;
import java.util.List;
import java.util.StringJoiner;

import javax.servlet.ServletException;
import javax.servlet.annotation.MultipartConfig;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.Part;

import org.apache.commons.fileupload.disk.DiskFileItemFactory;
import org.apache.commons.fileupload.servlet.ServletFileUpload;
import org.apache.tomcat.util.codec.binary.Base64;

import com.kp.controller.DatabaseConnection;
import com.kp.controller.PayrollController;
import com.kp.model.ModelValue;

import org.apache.commons.fileupload.FileItem;
import org.apache.commons.fileupload.FileUploadException;

@WebServlet(urlPatterns = "/addemployee")

public class AddEmployee extends HttpServlet {

	protected void doGet(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {

		request.getRequestDispatcher("WEB-INF/views/addemployee.jsp").forward(request, response);

	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {

		ModelValue modelValue = new ModelValue();

		StringBuilder stringBuilder = new StringBuilder();

		

		if (!(ServletFileUpload.isMultipartContent(request))) {
			System.out.println("nothing to be upload");
		}
		ServletFileUpload sf = new ServletFileUpload(new DiskFileItemFactory());
		try {
			List<FileItem> file = sf.parseRequest(request);
			int i = 0;

		
			for (FileItem files : file) {
				i++;
			

				String imagePath = "pictures/" + files.getName();
				if (i == 3) {
					stringBuilder.append(imagePath + "  ");

				}
				files.write(new File("C:/wamp64/www/AutomatedPayroll/"+imagePath));

			}

			i = 0;
			for (FileItem files : file) {
				i++;
				String fieldValue = files.getString();
				if (i == 3) {
					continue;

				}
				stringBuilder.append(fieldValue + "  ");

				

			}

			
		} catch (FileUploadException e1) {
			// TODO Auto-generated catch block
			e1.printStackTrace();
		} catch (Exception e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}

	

		try {
			if (new PayrollController().regEmployee(stringBuilder)) {
				PrintWriter out = response.getWriter();
				out.println("success");
			}

		} catch (ClassNotFoundException | SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}

	}

	private String extractFileName(Part part) {
		String contentDisp = part.getHeader("content-disposition");
		String[] items = contentDisp.split(";");
		for (String s : items) {
			if (s.trim().startsWith("filename")) {
				return s.substring(s.indexOf("=") + 2, s.length() - 1);
			}
		}
		return "";
	}

}
