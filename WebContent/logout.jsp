<%@ page language="java" contentType="text/html; charset=ISO-8859-1" pageEncoding="ISO-8859-1"%>
<%
	session.invalidate();
	//session.getAttribute("user");   //this will throw an error
	response.sendRedirect("index.jsp"); 
%>
