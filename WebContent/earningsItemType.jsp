<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1" import="com.helpers.pkg.*"%>
<!--Import some libraries that have classes that we need -->
<%@ page import="java.io.*,java.util.*,java.sql.*"%>
<%@ page import="javax.servlet.http.*,javax.servlet.*"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Earnings per Item-Type</title>


<style>
table, th, td {
	border: 1px solid black;
	border-collapse: collapse;
}

th, td {
	padding: 15px;
}
</style>
<h1> Earnings per Item-Type</h1>
</head>
<body>
	<%
	try {

		ApplicationDB db = new ApplicationDB();	
		Connection con = db.getConnection();

		//Create a SQL statement
		Statement stmt = con.createStatement();
		//Statement stmtt = con.createStatement();
		
		double sum = 0;
		double sum2=0;
		double sum3=0;
		
			
		
	String str = "SELECT DISTINCT i.categoryName, SUM(b.amount) AS 'catSum' FROM Auction a, Bids b, Item i WHERE a.currentBidId = b.bidId AND a.itemId = i.itemId AND a.completed = 1 AND a.currentBidId IS NOT NULL GROUP BY i.categoryName";
		
		ResultSet resultstr = stmt.executeQuery(str);
		
	%>
	
	<table style="width: 100%">
		<tr>
			<th>Category Name</th>
			<th>Earnings</th>
		</tr>
		<%
			while (resultstr.next()) {
		%>
		<tr>
			<td><%=resultstr.getString("categoryName")%></td>
			<td>$<%=resultstr.getFloat("catSum")%></td>
			
		</tr>
		<%
			}
		%>

<%		
		con.close();
		
	} catch (Exception ex) {
		out.print(ex);
		out.print(".\nItem Listing DB Failed :()");
	}
%>
</body>
</html>