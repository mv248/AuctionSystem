<%@ page language="java" contentType="text/html; charset=ISO-8859-1" pageEncoding="ISO-8859-1"%>
<%@ page import="java.sql.*"%>
<%
	String userid = session.getAttribute("user").toString();
	Class.forName("com.mysql.jdbc.Driver");
	Connection con = DriverManager.getConnection("jdbc:mysql://auctionsys.crgsn4ph3240.us-east-2.rds.amazonaws.com:3306/AuctionSystem", "patarj23", "4rjL34rnDB");
	Statement st = con.createStatement();
	String query = "SELECT * FROM Alerts WHERE userid='" + userid + "'";
	ResultSet res = st.executeQuery(query);
	while (res.next()) { 
		String message = res.getString("message");
	%> <div> <%= message %> </div> <%
	}
%>
