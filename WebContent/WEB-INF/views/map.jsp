<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@page import="javax.servlet.http.HttpSession" %>
<%@page import="java.io.PrintWriter" %>


<%   HttpSession o=request.getSession(false);
     PrintWriter ot=response.getWriter();
     ot.print(o.getAttribute("string"));
%>