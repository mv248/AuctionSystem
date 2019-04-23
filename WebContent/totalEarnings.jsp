<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1" %> 
<!--Import some libraries that have classes that we need -->
<%@ page import="com.helpers.pkg.*"%>
<%@ page import="java.io.*,java.util.*,java.sql.*"%>
<%@ page import="javax.servlet.http.*,javax.servlet.*"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Total Earnings</title>
</head>
<h1> Total Earnings to Date</h1>
<body>
	<%
	try {

		//Get the database connection
		ApplicationDB db = new ApplicationDB();	
		Connection con = db.getConnection();

		//Create a SQL statement
		Statement stmt = con.createStatement();
		Statement stmtt = con.createStatement();
		
		double totEarnings = 0;
		
		double amount = 0;
		
		int bidId = 0;
		
		
		String ss = "SELECT currentBidId FROM Auction WHERE completed = 1 AND currentBidId IS NOT NULL";
		
		ResultSet resultss = stmt.executeQuery(ss);
		
		while(resultss.next()){
			
			bidId = resultss.getInt("currentBidId");
			
			String xs = "SELECT amount FROM Bids where bidId = '" + bidId + "' ORDER BY amount DESC";
			
			ResultSet resultxs = stmtt.executeQuery(xs);
			
			
			if(resultxs.next()){
				
				amount = resultxs.getDouble("amount");	
				
			}
			
			totEarnings = totEarnings + amount;
			
		}
		
		
		//Close the connection. Don't forget to do it, otherwise you're keeping the resources of the server allocated.
		con.close();

		out.print("Total Earnings: $" + totEarnings);
		
	} catch (Exception ex) {
		out.print(ex);
		out.print(".\nItem Listing DB Failed :()");
	}
%>
</body>
</html>
