<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<%@ page import="java.sql.*"%>
<%
	String userid = request.getParameter("username");
	String pwd = request.getParameter("password");
	String userType = request.getParameter("userType");
	Class.forName("com.mysql.jdbc.Driver");
	Connection con = DriverManager.getConnection("jdbc:mysql://auctionsys.crgsn4ph3240.us-east-2.rds.amazonaws.com:3306/AuctionSystem", "patarj23", "4rjL34rnDB");
	Statement st = con.createStatement();
	ResultSet res = st.executeQuery("SELECT * FROM `User` WHERE userId='" + userid + "'");
	if (!res.first()) {
		int rows = st.executeUpdate("INSERT INTO `User` (userId, password, userType) VALUES ('" + userid + "', '" + pwd + "', '" + userType + "')");
		out.println("Account created for " + userid);
		out.println("<br/><br/><a href='index.jsp'>Return to Home Page</a>");
	} else {
		out.println("Account already exists <a href='index.jsp'>try again</a>");
	} 
%>