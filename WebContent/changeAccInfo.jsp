<%@ page language="java" contentType="text/html; charset=ISO-8859-1" pageEncoding="ISO-8859-1"%>
<%@ page import="java.sql.*"%>
<%
	String userId = request.getParameter("userId");
	String newPwd = request.getParameter("password");
	String cardNum = request.getParameter("cardNum");
	Class.forName("com.mysql.jdbc.Driver");
	Connection con = DriverManager.getConnection("jdbc:mysql://auctionsys.crgsn4ph3240.us-east-2.rds.amazonaws.com:3306/AuctionSystem", "patarj23", "4rjL34rnDB");
	Statement st = con.createStatement();
	String update = "";
	if (!newPwd.equals("")) {
		st.executeUpdate("UPDATE User SET password='" + newPwd + "' WHERE userId='" + userId + "';");
		out.println("Password Changed. <br/><br/>");
	}
	if (!cardNum.equals("")) {
		st.executeUpdate("UPDATE User SET cardNum='" + cardNum + "' WHERE userId='" + userId + "';");
		out.println("Card Number Changed. <br/><br/>");
	}
	out.println("<br/><br/><a href='homepage.jsp'>Return to Home Page</a>");
%>
