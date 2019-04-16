<%@ page language="java" contentType="text/html; charset=ISO-8859-1" pageEncoding="ISO-8859-1"%>
<%@ page import="java.sql.*"%>
<%
	String userId = session.getAttribute("userId").toString();
	String newPwd = request.getParameter("password");
	Class.forName("com.mysql.jdbc.Driver");
	Connection con = DriverManager.getConnection("jdbc:mysql://auctionsys.crgsn4ph3240.us-east-2.rds.amazonaws.com:3306/AuctionSystem", "patarj23", "4rjL34rnDB");
	Statement st = con.createStatement();
	int rows = st.executeUpdate("UPDATE User SET password='" + newPwd + "' WHERE userId='" + userId + "';");
	if (rows > 0) { 
		//THIS DOESNT ACCOUNT FOR USERNAME BEING SAME BUT DIFFERENT PASSWORDS
		//THIS TREATS THEM AS SEPERATE ACCOUNTS
		out.println("Password Changed. <br/><br/>");
		out.println("<a href=homepage.jsp> Home </a>");
	} else {
		out.println("Invalid username or password <a href='index.jsp'>try again</a>");
	}
%>
