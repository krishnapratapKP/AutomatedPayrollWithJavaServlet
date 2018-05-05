package com.kp.view;
import java.io.IOException;
import java.io.PrintWriter;
import java.sql.SQLException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.json.simple.JSONArray;
import org.json.simple.JSONObject;

import com.kp.controller.PayrollController;

@WebServlet(urlPatterns="/location")
public class Location extends HttpServlet{
	
protected void doGet(HttpServletRequest request,HttpServletResponse response)throws ServletException,IOException{
		
		request.getRequestDispatcher("WEB-INF/views/location.jsp").forward(request, response);
		
	}

protected void doPost(HttpServletRequest request,HttpServletResponse response)throws ServletException, IOException{
	
	        String Id=request.getParameter("Id");
	        String date=request.getParameter("date");
	        System.out.println(date);
	        try {
				JSONArray jsonarray=new PayrollController().viewLocation(Id,date);
				HttpSession session=request.getSession(true);
				session.setAttribute("string",jsonarray);
				/*JSONObject jsonobject;
				StringBuilder stringBuilder=new StringBuilder();
//				     stringBuilder.append("[");
				for(int i=0; i<jsonarray.size(); i++)
				{
					     jsonobject=(JSONObject)jsonarray.get(i);
					stringBuilder.append("{").append("lat:").append(jsonobject.get("lat")).append(", lng:").append(jsonobject.get("lng")).append("},");
				}
//				stringBuilder.append("]");
				System.out.println(jsonarray);
				
				PrintWriter out=response.getWriter();
				out.print(stringBuilder);*/
				
				
			} catch (SQLException e) {
				// TODO Auto-generated catch block
				//e.printStackTrace();
			}
}

}
