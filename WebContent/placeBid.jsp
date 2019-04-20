<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<%@ page import="java.sql.*"%>
<%
	String userId = session.getAttribute("userId").toString();
	int itemId = Integer.parseInt(request.getParameter("itemId"));
	int auctionId = Integer.parseInt(request.getParameter("auctionId"));
	float upperLimit = Float.parseFloat(request.getParameter("upperLimit"));
	float amount = Float.parseFloat(request.getParameter("bidAmount"));
	Class.forName("com.mysql.jdbc.Driver");
	Connection con = DriverManager.getConnection("jdbc:mysql://auctionsys.crgsn4ph3240.us-east-2.rds.amazonaws.com:3306/AuctionSystem", "patarj23", "4rjL34rnDB");
	Statement st = con.createStatement();
	ResultSet bids = st.executeQuery("SELECT * FROM Bids ORDER BY bidId DESC");
	int lastId = 0;
	if (bids.first()) {
		lastId = bids.getInt("bidId");
	}
	String insert = "INSERT INTO Bids(ownerId, upperLimit, bidId, amount, itemId)"
			+ "VALUES (?, ?, ?, ?, ?)";
	
	//send original bid owner alert saying they've been overtaken (if previous bid exists)
	bids = st.executeQuery("SELECT * FROM Bids WHERE itemId=" + itemId + " ORDER BY amount DESC");
	String prevOwner = "";
	if (bids.first()) {
		bids.first();
		prevOwner = bids.getString("ownerId");
	}
	if (!prevOwner.equals("")) {
		ResultSet alerts = st.executeQuery("SELECT * FROM Alerts ORDER BY alertId DESC");
		int alertId = 1;
		if (alerts.first()) {
			alerts.first();
			alertId = alerts.getInt("alertId") + 1;
		} 
		String insertAlert = "INSERT INTO Alerts (alertId, userId, message) VALUES (?, ?, ?)";
		PreparedStatement ps = con.prepareStatement(insertAlert);
		ps.setInt(1, alertId);
		ps.setString(2, prevOwner);
		String itemLink = "<a href='itemPage.jsp?itemId=" + itemId + "'> item #" + itemId + " - click to view item </a>";
		ps.setString(3, "Your bid for an item (" + itemLink + ") has been overtaken by user " + userId + " for $" + amount + "!");
		ps.executeUpdate();
	}
	
	//Create a Prepared SQL statement allowing you to introduce the parameters of the query
	PreparedStatement aps = con.prepareStatement(insert);

	//Add parameters of the query. Start with 1, the 0-parameter is the INSERT statement itself
	aps.setString(1, userId);
	aps.setFloat(2, upperLimit);
	aps.setInt(3, lastId + 1);
	aps.setFloat(4, amount);
	aps.setInt(5, itemId);
	aps.executeUpdate();
	
	//link to auction
	st.executeUpdate("UPDATE Auction SET currentBidId=" + (lastId + 1) + " WHERE auctionId=" + auctionId + ";");
	con.close();
	response.sendRedirect("itemPage.jsp?itemId=" + itemId);
%>