<%@ page language="java" contentType="text/html; charset=ISO-8859-1" pageEncoding="ISO-8859-1"%>
<%@ page import="java.sql.*"%>
<%
	int itemId = Integer.parseInt(request.getParameter("itemId"));
	String newStartPrice = request.getParameter("newStartPrice");
	String newReserve = request.getParameter("newReserve");
	String newBidInc = request.getParameter("newBidInc");
	String newEndDate = request.getParameter("newEndDate");
	Class.forName("com.mysql.jdbc.Driver");
	Connection con = DriverManager.getConnection("jdbc:mysql://auctionsys.crgsn4ph3240.us-east-2.rds.amazonaws.com:3306/AuctionSystem", "patarj23", "4rjL34rnDB");
	Statement st = con.createStatement();
	if (!newStartPrice.equals("")) {
		st.executeUpdate("UPDATE Auction SET startPrice=" + Float.parseFloat(newStartPrice) + " WHERE itemId=" + itemId);
		out.println("Start Price Changed. <br/><br/>");
	}
	if (!newReserve.equals("")) {
		st.executeUpdate("UPDATE Auction SET reserve=" + Float.parseFloat(newReserve) + " WHERE itemId=" + itemId);
		out.println("Reserve Price Changed. <br/><br/>");
	}
	if (!newBidInc.equals("")) {
		st.executeUpdate("UPDATE Auction SET bidIncrement=" + Float.parseFloat(newBidInc) + " WHERE itemId=" + itemId);
		out.println("Bid Increment Changed. <br/><br/>");
	}
	if (!newEndDate.equals("")) {
		String et = request.getParameter("newEndDate").replace("T", " ") + ":00";
		Timestamp endTime = Timestamp.valueOf(et);
		String update = "UPDATE Auction SET endTime = ? WHERE itemId = ?";
		PreparedStatement aps = con.prepareStatement(update);
		aps.setTimestamp(1, endTime);
		aps.setInt(2, itemId);
		aps.execute();
		Timestamp curr = new Timestamp(System.currentTimeMillis());
		boolean expired = endTime.before(endTime);
		if (!expired) {
			st.executeUpdate("UPDATE Auction set completed=0 WHERE itemId=" + itemId);
		}
		out.println("End Date/Time Changed. <br/><br/>");
	}
	out.println("<br/><br/><a href='homepage.jsp'>Return to Home Page</a>");
%>
