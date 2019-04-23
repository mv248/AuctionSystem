<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1" %>
<!--Import some libraries that have classes that we need -->
<%@ page  import="com.helpers.pkg.*"%>
<%@ page import="java.io.*,java.util.*,java.sql.*"%>
<%@ page import="javax.servlet.http.*,javax.servlet.*"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Best Selling Items</title>

<h1> Best Selling Items</h1>
</head>
<body>
	<%
	try {

		//Get the database connection
		ApplicationDB db = new ApplicationDB();	
		Connection con = db.getConnection();

		//Create a SQL statement
		Statement stmt = con.createStatement();
			
		double sum = 0;
		double sum2=0;
		double sum3=0;
		/*
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
		
		*/
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
		
	
		
				//Close the connection. Don't forget to do it, otherwise you're keeping the resources of the server allocated.
	//	con.close();

		//out.print(sum);
	/*		
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
		
//		<h2> Best Selling Item: </h2>
		*/
		if((sum>sum2) && (sum>sum3)){
			out.print("Best Selling Item: Laptops");
		}
		else if((sum2>sum) && (sum2>sum3)){
			out.print("Best Selling Item: Phones");
		}
		else if((sum3>sum)&&(sum3>sum2)){
			out.print("Best Selling Item: Computers");
			}
		else if(sum==sum3){
			out.print("Best Selling Items: Laptops and Computers");
		}
		else if(sum2==sum3){
			out.print("Best Selling Items: Phones and Computers");
		}
		else if(sum==sum2){
			out.print("Best Selling Items: Laptops and Phones");
		}
		
		
		Statement stmtt = con.createStatement();
		Statement stmttt = con.createStatement();
		Statement stmtttt = con.createStatement();
		
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

		
		//double totEarnings = 0;
		
		double amount = 0;
		
		int bidId = 0;
		
		int itemId = 0;
		String bestName ="";
		String name = "";
		int year = 0;
		String brand = "";
		
		String ss = "SELECT a.itemId, a.currentBidId FROM Auction a, Bids b WHERE a.currentBidId = b.bidId AND a.completed = 1 AND a.currentBidId IS NOT NULL ORDER BY b.amount DESC";
		
		ResultSet resultss = stmtt.executeQuery(ss);
		
		while(resultss.next()){
			
			bidId = resultss.getInt("currentBidId");
			
			itemId = resultss.getInt("itemId");
			
			String xs = "SELECT amount FROM Bids where bidId = '" + bidId + "' ORDER BY amount DESC";
			
			ResultSet resultxs = stmttt.executeQuery(xs);
			
			if(resultxs.next()){
				
				amount = resultxs.getDouble("amount");		
			}
			
			String zs = "SELECT * FROM Item where itemId = '" + itemId + "'";
			
			ResultSet resultzs = stmtttt.executeQuery(zs);
			
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
		con.close();
		
	} catch (Exception ex) {
		out.print(ex);
		out.print(".\nItem Listing DB Failed :()");
	}
%>
</body>
</html>
