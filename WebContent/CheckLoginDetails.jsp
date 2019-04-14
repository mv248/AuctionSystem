<%@ page language="java" contentType="text/html; charset=ISO-8859-1" pageEncoding="ISO-8859-1"%>
<%@ page import="java.sql.*"%>
<%
	String userid = request.getParameter("username");
	String pwd = request.getParameter("password");
	Class.forName("com.mysql.jdbc.Driver");
	Connection con = DriverManager.getConnection("jdbc:mysql://auctionsys.crgsn4ph3240.us-east-2.rds.amazonaws.com:3306/LoginInfo", "patarj23", "4rjL34rnDB");
	Statement st = con.createStatement();
	ResultSet rs;
	rs = st.executeQuery("SELECT * FROM User WHERE username='" + userid + "' AND password='" + pwd + "'");
	if (rs.next()) { 
		//THIS DOESNT ACCOUNT FOR USERNAME BEING SAME BUT DIFFERENT PASSWORDS
		//THIS TREATS THEM AS SEPERATE ACCOUNTS
		session.setAttribute("user", userid); // the username will be stored in the session
		out.println("welcome " + userid);
		out.println("<a href='logout.jsp'>Log out</a>");
		response.sendRedirect("success.jsp");
	} else {
		out.println("Invalid password <a href='index.jsp'>try again</a>");
	}
%>
