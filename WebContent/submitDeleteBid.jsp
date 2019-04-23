<%@ page language="java" contentType="text/html; charset=ISO-8859-1" pageEncoding="ISO-8859-1"%>
<%@ page import="java.sql.*"%>
<%
	int bidId = Integer.parseInt(request.getParameter("bidId"));
	Class.forName("com.mysql.jdbc.Driver");
	Connection con = DriverManager.getConnection("jdbc:mysql://auctionsys.crgsn4ph3240.us-east-2.rds.amazonaws.com:3306/AuctionSystem", "patarj23", "4rjL34rnDB");
	Statement st = con.createStatement();
	Statement st2 = con.createStatement();
	String query = "SELECT * FROM Auction WHERE currentBidId=" + bidId;
	ResultSet res = st.executeQuery(query);
	if (res.first()) {
		int itemId = res.getInt("itemId");
		res = st.executeQuery("SELECT * from Bids where itemId=" + itemId + " and bidId != " + bidId + " ORDER BY bidId DESC");
		if (res.first()) {
			int newBidId = res.getInt("bidId");
			System.out.println(newBidId);
			st.executeUpdate("UPDATE Auction set currentBidId=" + newBidId + " where currentBidId=" + bidId);
		}
	} else {
		st.executeUpdate("UPDATE Auction set currentBidId=NULL where currentBidId=" + bidId);
	}
	st.executeUpdate("DELETE FROM Bids where bidId=" + bidId);
	
	out.println("Deleted Bid #" + bidId);
	out.println("<br/><br/><a href='home.jsp'>Return to Home Page</a>");
%>
