<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<!--Import some libraries that have classes that we need -->
<%@ page  import="com.helpers.pkg.*"%>
<%@ page import="java.io.*,java.util.*,java.sql.*"%>
<%@ page import="javax.servlet.http.*,javax.servlet.*"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Best Buyers</title>

<h1> Best Buyers</h1>
</head>
<body>
	<%
	try {

		//Get the database connection
		ApplicationDB db = new ApplicationDB();	
		Connection con = db.getConnection();

		//Create a SQL statement
		Statement stmt = con.createStatement();
		Statement stmtt = con.createStatement();
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
		String seller = "";
		
		
		out.print("<table border='1'>");
		//make a row
		out.print("<tr>");
		out.print("<td>");
		out.print("Buyer");
		out.print("</td>");
		//make a column
		out.print("<td>");
		out.print("Earnings");
		out.print("</td>");
		
	
	//	String str = "SELECT sellerUserId FROM Auction a, Bids b, Item i WHERE a.sellerId = i.sellerUserId AND a.completed = 1 AND a.currentBidId IS NOT NULL";
		String str = "SELECT DISTINCT u.userId FROM User u, Bids b WHERE u.userId = b.ownerId AND u.userType = 'normal' ORDER BY b.amount DESC";
	
		ResultSet resultstr = stmt.executeQuery(str);
		
		while(resultstr.next()){
			
			seller = resultstr.getString("userId");	
			
			
		
		//out.print(seller);

		String str2 = "SELECT SUM(b.amount) AS 'catPhone' FROM Auction a, Bids b, Item i WHERE a.currentBidId = b.bidId AND a.itemId = i.itemId AND a.completed = 1 AND a.currentBidId IS NOT NULL AND b.ownerId='"+ seller+"'";
		
		ResultSet resultstr2 = stmtt.executeQuery(str2);
		
		if(resultstr2.next()){
			
			sum =resultstr2.getDouble("catPhone");	
			
		}
		
		out.print("<tr>");
		//make a column
		out.print("<td>");
		out.print(seller);
		out.print("</td>");
		out.print("<td>");
		out.print("$"+sum);
		out.print("</tr>");
		
		}
		
		
		
/*
		String str3 = "SELECT SUM(b.amount) AS 'catComp' FROM Auction a, Bids b, Item i WHERE a.currentBidId = b.bidId AND a.itemId = i.itemId AND a.completed = 1 AND a.currentBidId IS NOT NULL AND i.categoryName = 'Computer'";
		
		ResultSet resultstr3 = stmt.executeQuery(str3);
		
		if(resultstr3.next()){
			
			sum3 =resultstr3.getDouble("catComp");	
			
		}
		
	/*
			
		*/
		//Close the connection. Don't forget to do it, otherwise you're keeping the resources of the server allocated.
		con.close();

		//out.print(sum);
		/*	
		out.print("<tr>");
		//make a column
		out.print("<td>");
		out.print(seller);
		out.print("</td>");
		out.print("<td>");
		out.print(sum);
		out.print("</tr>");
		*/
		
	} catch (Exception ex) {
		out.print(ex);
		out.print(".\nItem Listing DB Failed :()");
	}
%>
</body>
</html>
