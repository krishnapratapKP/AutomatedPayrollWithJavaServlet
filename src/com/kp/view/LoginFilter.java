package com.kp.view;
import java.io.IOException;

import javax.servlet.Filter;
import javax.servlet.FilterChain;
import javax.servlet.ServletException;
import javax.servlet.ServletRequest;
import javax.servlet.ServletResponse;
import javax.servlet.annotation.WebFilter;
import javax.servlet.http.HttpServletRequest;

@WebFilter(urlPatterns= {"/home","/addemployee","/changepassword","/location","/viewimage","/checksalary","/checkemployee"})
public class LoginFilter implements Filter {

	@Override
	public void doFilter(ServletRequest servletRequest, ServletResponse servletResponse, FilterChain filterchain)
			throws IOException, ServletException {
		HttpServletRequest request=(HttpServletRequest)servletRequest;
		
		System.out.println(request.getRequestURI());
		
		if(request.getSession().getAttribute("username")!=null)
		{
			filterchain.doFilter(servletRequest, servletResponse);
		}
		else
		{
			request.getRequestDispatcher("WEB-INF/views/index.jsp").forward(servletRequest, servletResponse);
		}
	}

}
