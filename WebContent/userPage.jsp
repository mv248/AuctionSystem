<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ page import="java.sql.*,java.text.*,java.util.*"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>User Page</title>
</head>
<style>
table, th, td {
	border: 1px solid black;
	border-collapse: collapse;
}

th, td {
	padding: 15px;
}
</style>
<body>

	<%
	String userId = request.getParameter("userId");
	Class.forName("com.mysql.jdbc.Driver");
	Connection con = DriverManager.getConnection("jdbc:mysql://auctionsys.crgsn4ph3240.us-east-2.rds.amazonaws.com:3306/AuctionSystem", "patarj23", "4rjL34rnDB");
	Statement st = con.createStatement();
	Statement st2 = con.createStatement();
	ResultSet rs = st.executeQuery("SELECT * FROM Item WHERE sellerUserId='" + userId + "';");
	ResultSet rs2 = st2.executeQuery("SELECT * FROM Item AS I INNER JOIN Bids AS B ON I.itemID=B.itemId WHERE B.ownerId= '" + userId + "'; ");
	
	%>
	<h1><%out.println(userId);%>'s Profile </h1>
	<table style="width: 100%">
		<tr>
			<th>Items Posted For Sale</th>
			<th>ItemId</th>
			<th>Category</th>
		</tr>
		<%
			while (rs.next()) {
		%>
		<tr>
			<td><%=rs.getString("name")%></td>
			<td><%=rs.getString("itemId")%></td>
			<td><%=rs.getString("categoryName")%></td>
		</tr>
		<%
			}
		%>
	</table>
	<br />
	<table style="width: 100%">
		<tr>
			<th>Items Bid On</th>
			<th>ItemId</th>
			<th>Category</th>
			<th>Bid Amount</th>
		</tr>
		<%
			while (rs2.next()) {
		%>
		<tr>
			<td><%=rs2.getString("name")%></td>
			<td><%=rs2.getString("itemId")%></td>
			<td><%=rs2.getString("categoryName")%></td>
			<td><%=rs2.getString("amount")%></td>
		</tr>
		<%
			}
		%>
	</table>
	<br />
	<a href="homepage.jsp"> Home </a>
</body>
</html>