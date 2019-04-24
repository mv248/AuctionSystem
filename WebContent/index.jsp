<%@ page language="java" contentType="text/html; charset=ISO-8859-1" pageEncoding="ISO-8859-1"%>
<%@ page import="java.util.Timer,java.util.*,java.text.*,java.sql.*"%>
 <!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Landing Page</title>
</head>
<body>
	<h1>Auction System</h1>
	
	<%
		class MyTask extends TimerTask {
			
			public MyTask() {}
			
			@Override
			public void run() {
				try {
					Class.forName("com.mysql.jdbc.Driver");
					Connection con = DriverManager.getConnection("jdbc:mysql://auctionsys.crgsn4ph3240.us-east-2.rds.amazonaws.com:3306/AuctionSystem", "patarj23", "4rjL34rnDB");
					Statement st = con.createStatement();
					Statement st2 = con.createStatement();
					ResultSet auctions = st.executeQuery("SELECT * FROM Auction");
					while (auctions.next()) {
						Timestamp endTime = auctions.getTimestamp("endTime");
						int offset = 1000 * 60 * 60 * 4;
						Timestamp curr = new Timestamp(System.currentTimeMillis() - offset);
						boolean expired = endTime.before(curr);
						
						//if auction is done - mark done
						if (expired && !auctions.getBoolean("completed")) {
							int auctionId = auctions.getInt("auctionId");
							int itemId = auctions.getInt("itemId");
							int bidId = auctions.getInt("currentBidId");
							//set auction completed
							st2.executeUpdate("UPDATE Auction SET completed=true WHERE auctionId=" + auctionId);
							//get bid/buyer info
							ResultSet bids = st2.executeQuery("SELECT * FROM Bids WHERE bidId=" + bidId);
							bids.first();
							String buyerId = bids.getString("ownerId");
							float buyAmount = bids.getFloat("amount");
							//if reserve value is met
							if (buyAmount >= auctions.getFloat("reserve")) {
								String sellerId = auctions.getString("sellerId");
								//send alert to seller
								ResultSet alerts = st2.executeQuery("SELECT * FROM Alerts ORDER BY alertId DESC");
								int alertId = 1;
								if (alerts.first()) {
									alerts.first();
									alertId = alerts.getInt("alertId") + 1;
								} 
								String insertAlert = "INSERT INTO Alerts (alertId, userId, message) VALUES (?, ?, ?)";
								PreparedStatement ps = con.prepareStatement(insertAlert);
								ps.setInt(1, alertId);
								ps.setString(2, sellerId);
								String itemLink = "<a href='itemPage.jsp?itemId=" + itemId + "'> item #" + itemId + " - click to view item </a>";
								ps.setString(3, "Your auction (" + itemLink + ") has sold to user " + buyerId + " for $" + buyAmount + "!");
								ps.executeUpdate();		
								//send alert to buyer
								insertAlert = "INSERT INTO Alerts (alertId, userId, message) VALUES (?, ?, ?)";
								ps = con.prepareStatement(insertAlert);
								ps.setInt(1, alertId + 1);
								ps.setString(2, buyerId);
								ps.setString(3, "You won an auction (" + itemLink + ")" + " for $" + buyAmount + "!");
								ps.executeUpdate();
							} 
							else {
								st2.executeUpdate("UPDATE Auction SET currentBidId=NULL WHERE auctionId=" + auctionId);
								String sellerId = auctions.getString("sellerId");
								//send alert to seller
								ResultSet alerts = st2.executeQuery("SELECT * FROM Alerts ORDER BY alertId DESC");
								int alertId = 1;
								if (alerts.first()) {
									alerts.first();
									alertId = alerts.getInt("alertId") + 1;
								} 
								String insertAlert = "INSERT INTO Alerts (alertId, userId, message) VALUES (?, ?, ?)";
								PreparedStatement ps = con.prepareStatement(insertAlert);
								ps.setInt(1, alertId);
								ps.setString(2, sellerId);
								String itemLink = "<a href='itemPage.jsp?itemId=" + itemId + "'> item #" + itemId + " - click to view item </a>";
								ps.setString(3, "Your auction (" + itemLink + ") has expired! (Secret Reserve Price not met)");
								ps.executeUpdate();
							}
						}
					}
					con.close();
				} catch (Exception e) {
					System.out.println(e);
					//e.printStackTrace();
				}
			}
		}
	
		Class.forName("com.mysql.jdbc.Driver");
		Connection con = DriverManager.getConnection("jdbc:mysql://auctionsys.crgsn4ph3240.us-east-2.rds.amazonaws.com:3306/AuctionSystem", "patarj23", "4rjL34rnDB");
		Timer timer = new Timer();
		timer.scheduleAtFixedRate(new MyTask(), 1000, 1000);
	%>

	<h2>Login or Create an Account</h2>
	<form action="CheckLoginDetails.jsp" method="POST">
		Username: <input type="text" name="username" required/> <br /> 
		Password:<input type="password" name="password" required/> <br /> 
		<input type="hidden" name="userType" value="normal"/>
		<input type="submit" value="Login" /> <br /> 
		<input type="submit" formaction="CreateAccount.jsp" value="Create Login"> <br /> 
	</form> <br />
	
</body>
</html>