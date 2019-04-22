<%@ page language="java" contentType="text/html; charset=ISO-8859-1" pageEncoding="ISO-8859-1"%>
<%@ page import="java.sql.*"%>
<%
	String userid = session.getAttribute("userId").toString();
	int itemId = Integer.parseInt(request.getParameter("itemId"));
	Class.forName("com.mysql.jdbc.Driver");
	Connection con = DriverManager.getConnection("jdbc:mysql://auctionsys.crgsn4ph3240.us-east-2.rds.amazonaws.com:3306/AuctionSystem", "patarj23", "4rjL34rnDB");
	Statement st = con.createStatement();
	String query = "SELECT * FROM Bids WHERE itemId=" + itemId + " ORDER BY amount DESC";
	ResultSet res = st.executeQuery(query);
	boolean flag = false;
	while (res.next()) {
		flag = true;
		int bidId = res.getInt("bidId");
		String ownerId = res.getString("ownerId");
		float amount = res.getFloat("amount");
		String message = "Bid #" + bidId + " - $" + amount + " by user " + ownerId;
		out.println(message + "<br/>");
	}
	if (!flag) {
		out.println("There are no bids for this item.");
	}
%>
	
	<br/><br/>
	<a href="homepage.jsp"> Home </a>
