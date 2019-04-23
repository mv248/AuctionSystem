<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<%@ page  import="com.helpers.pkg.*"%>
<!--Import some libraries that have classes that we need -->
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

		Statement stmttt = con.createStatement();
		Statement stmtttt = con.createStatement();
		
		double totEarnings = 0;
		
		double amount = 0;
		
		int bidId = 0;
/////where i added

		out.print("<table border='1'>");
		//make a row
		out.print("<tr>");
		//make a column
	//	out.print("<td>");
		//print out column header
		//make a column
		out.print("<td>");
		out.print("Name");
		out.print("</td>");
		//make a column
		out.print("<td>");
		out.print("Brand");
		out.print("</td>");
		out.print("<td>");
		out.print("Year");
		out.print("</td>");
		out.print("<td>");
		out.print("Price");
		out.print("</td>");
		out.print("</tr>");
		
		
		
		int itemId = 0;
		
		String name = "";
		int year = 0;
		String brand = "";
		
		String ss = "SELECT itemId, currentBidId FROM Auction WHERE completed = 1 AND currentBidId IS NOT NULL";
		
		ResultSet resultss = stmt.executeQuery(ss);
		
		while(resultss.next()){
			
			bidId = resultss.getInt("currentBidId");
			
			itemId = resultss.getInt("itemId");
			
			String xs = "SELECT amount FROM Bids where bidId = '" + bidId + "' ORDER BY amount DESC";
			
			ResultSet resultxs = stmtt.executeQuery(xs);
			
			if(resultxs.next()){
				
				amount = resultxs.getDouble("amount");		
			}
			
			String zs = "SELECT * FROM Item where itemId = '" + itemId + "'";
			
			ResultSet resultzs = stmttt.executeQuery(zs);
			
			if(resultzs.next()){
				name = resultzs.getString("name");
				year = resultzs.getInt("year");
				brand = resultzs.getString("brand");
			}
			
			out.print("<tr>");
			//make a column
			out.print("<td>");
			out.print(name);
			out.print("</td>");
			out.print("<td>");
			out.print(brand);
			out.print("</td>");
			out.print("<td>");
			out.print(year);
			out.print("</td>");
			out.print("<td>");
			out.print("$"+ amount);
			out.print("</td>");
			out.print("</tr>");
				
		}
		
		out.print("</table>");
	
	
	
	///
		
		String sss = "SELECT currentBidId FROM Auction WHERE completed = 1 AND currentBidId IS NOT NULL";
		
		ResultSet resultsss = stmtttt.executeQuery(sss);
		
		while(resultsss.next()){
			
			bidId = resultsss.getInt("currentBidId");
			
			String xss = "SELECT amount FROM Bids where bidId = '" + bidId + "' ORDER BY amount DESC";
			
			ResultSet resultxss = stmtt.executeQuery(xss);
			
			
			if(resultxss.next()){
				
				amount = resultxss.getDouble("amount");	
				
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
