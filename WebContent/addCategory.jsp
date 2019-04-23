<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1" import="com.helpers.pkg.*"%>
<!--Import some libraries that have classes that we need -->
<%@ page import="java.io.*,java.util.*,java.sql.*"%>
<%@ page import="javax.servlet.http.*,javax.servlet.*"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>

<%
	String category = request.getParameter("category");
	Class.forName("com.mysql.jdbc.Driver");
	Connection con = DriverManager.getConnection("jdbc:mysql://auctionsys.crgsn4ph3240.us-east-2.rds.amazonaws.com:3306/AuctionSystem", "patarj23", "4rjL34rnDB");
	Statement st = con.createStatement();
	ResultSet res = st.executeQuery("SELECT * FROM Category WHERE name='" + category + "';");
	if (!res.first()) {
		st.executeUpdate("INSERT INTO Category (name) values ('" + category + "')");
		out.println("Inserted new category \"" + category + "\". <br/><br/>");
	} else {
		out.println("\"" + category + "\" is already a category, please try again.");
	}
	out.println("<br/><br/><a href='homepage.jsp'>Return to Home Page</a>");
	con.close();
%>