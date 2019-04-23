<%@ page language="java" contentType="text/html; charset=ISO-8859-1" pageEncoding="ISO-8859-1"%>
<%@ page import="java.sql.*"%>
<%
	int bidId = Integer.parseInt(request.getParameter("bidId"));
	String newAmount = request.getParameter("newAmount");
	String newUpperLimit = request.getParameter("newUpperLimit");
	Class.forName("com.mysql.jdbc.Driver");
	Connection con = DriverManager.getConnection("jdbc:mysql://auctionsys.crgsn4ph3240.us-east-2.rds.amazonaws.com:3306/AuctionSystem", "patarj23", "4rjL34rnDB");
	Statement st = con.createStatement();
	if (!newAmount.equals("")) {
		st.executeUpdate("UPDATE Bids SET amount=" + Float.parseFloat(newAmount) + " WHERE bidId=" + bidId);
		out.println("Bid Amount Changed. <br/><br/>");
	}
	if (!newUpperLimit.equals("")) {
		st.executeUpdate("UPDATE Bids SET upperLimit=" + Float.parseFloat(newUpperLimit) + " WHERE bidId=" + bidId);
		out.println("Bid upper limit Changed. <br/><br/>");
	}
	out.println("<br/><br/><a href='homepage.jsp'>Return to Home Page</a>");
%>
