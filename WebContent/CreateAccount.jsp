<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<%@ page import="java.sql.*"%>
<%
	String userid = request.getParameter("username");
	String pwd = request.getParameter("password");
	Class.forName("com.mysql.jdbc.Driver");
	Connection con = DriverManager.getConnection("jdbc:mysql://auctionsys.crgsn4ph3240.us-east-2.rds.amazonaws.com:3306/LoginInfo", "patarj23", "4rjL34rnDB");
	Statement st = con.createStatement();
	int rows = st.executeUpdate("INSERT INTO `User` VALUES ('" + userid + "', '" + pwd + "')");
	if (rows == 1) {
		out.println("Account created for " + userid);
		out.println("<a href='index.jsp'>Return to Home Page</a>");
	} else { 
		//UPDATE ALWAYS WILL WORK SO IT WILL NEVER HIT THIS
		//MULTIPLE ACCOUNTS WIT SAME USERNAME NOT ACCOUNTED FOR
		out.println("Account already exists <a href='index.jsp'>try again</a>");
	} 
%>