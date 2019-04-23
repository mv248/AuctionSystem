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
<title>Earnings per Item-Type</title>

<h1> Earnings per Item-Type</h1>
</head>
<body>
	<%
	try {

		//Get the database connection
		ApplicationDB db = new ApplicationDB();	
		Connection con = db.getConnection();

		//Create a SQL statement
		Statement stmt = con.createStatement();
		//Statement stmtt = con.createStatement();
		//Statement stmttt = con.createStatement();
	/*	
		out.print("<table border='1'>");
		//make a row
		out.print("<tr>");
		//make a column
	//	out.print("<td>");
		//print out column header
		//make a column
		out.print("<td>");
		out.print("Category");
		out.print("</td>");
		//make a column
		out.print("<td>");
		out.print("Total");
		out.print("</td>");
		out.print("</tr>");
*/
		
		//double totEarnings = 0;
		
		//double amount = 0;
		
		//int bidId = 0;
		
		//int itemId = 0;
		
		//String catName = "";
		
		double sum = 0;
		double sum2=0;
		double sum3=0;
		
		out.print("<table border='1'>");
		//make a row
		out.print("<tr>");
		out.print("<td>");
		out.print("Laptop Earnings]");
		out.print("</td>");
		//make a column
		out.print("<td>");
		out.print("Phone Earnings");
		out.print("</td>");
		out.print("<td>");
		out.print("Computer Earnings");
		out.print("</td>");
		
		
		String str = "SELECT SUM(b.amount) AS 'catSum' FROM Auction a, Bids b, Item i WHERE a.currentBidId = b.bidId AND a.itemId = i.itemId AND a.completed = 1 AND a.currentBidId IS NOT NULL AND i.categoryName = 'Laptop'";
		
		ResultSet resultstr = stmt.executeQuery(str);
		
		if(resultstr.next()){
			
			sum =resultstr.getDouble("catSum");	
			
		}
		

		String str2 = "SELECT SUM(b.amount) AS 'catPhone' FROM Auction a, Bids b, Item i WHERE a.currentBidId = b.bidId AND a.itemId = i.itemId AND a.completed = 1 AND a.currentBidId IS NOT NULL AND i.categoryName = 'Phone'";
		
		ResultSet resultstr2 = stmt.executeQuery(str2);
		
		if(resultstr2.next()){
			
			sum2 =resultstr2.getDouble("catPhone");	
			
		}
		

		String str3 = "SELECT SUM(b.amount) AS 'catComp' FROM Auction a, Bids b, Item i WHERE a.currentBidId = b.bidId AND a.itemId = i.itemId AND a.completed = 1 AND a.currentBidId IS NOT NULL AND i.categoryName = 'Computer'";
		
		ResultSet resultstr3 = stmt.executeQuery(str3);
		
		if(resultstr3.next()){
			
			sum3 =resultstr3.getDouble("catComp");	
			
		}
		
	
		
		/*
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
			
			String zs = "SELECT categoryName FROM Item where itemId = '" + itemId + "'";
			
			ResultSet resultzs = stmttt.executeQuery(zs);
			
			if(resultzs.next()){
				catName = resultzs.getString("categoryName");
			}
			
			out.print("<tr>");
			//make a column
			out.print("<td>");
			out.print(name);
			out.print("</td>");
			out.print("<td>");
			out.print(brand);
			out.print("</td>");
			out.print("</tr>");
				
		}
		
		out.print("</table>");	
		
		*/
		//Close the connection. Don't forget to do it, otherwise you're keeping the resources of the server allocated.
		con.close();

		//out.print(sum);
			
		out.print("<tr>");
		//make a column
		out.print("<td>");
		out.print("$"+sum);
		out.print("</td>");
		out.print("<td>");
		out.print("$" +sum2);
		out.print("</td>");
		out.print("<td>");
		out.print("$"+sum3);
		out.print("</tr>");
		
		
	} catch (Exception ex) {
		out.print(ex);
		out.print(".\nItem Listing DB Failed :()");
	}
%>
</body>
</html>
