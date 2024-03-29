<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<%@ page import="java.io.*,java.util.*,java.sql.*"%>
<%@ page import="javax.servlet.http.*,javax.servlet.*"%>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Search Items</title>
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
	<h1>Items Listing</h1>

	<%
		Class.forName("com.mysql.jdbc.Driver");
		Connection con = DriverManager.getConnection(
				"jdbc:mysql://auctionsys.crgsn4ph3240.us-east-2.rds.amazonaws.com:3306/AuctionSystem", "patarj23",
				"4rjL34rnDB");
		Statement std = con.createStatement();
		ResultSet rsd = std.executeQuery("SELECT name FROM Category");
	%>
	<div class="topnav">
		<a class="active" href="homepage.jsp">Home</a>
		<br><br>
		<div class="search-container">
			<form action="filter.jsp" method="get">
				<input type="text" placeholder="filter by name" name="search"> 
				<input type="number" placeholder="filter by max price" name="bidPrice">
				<select name="category">
					<option selected value="all">all categories</option>
					<%
						while (rsd.next()) {
					%>
					<option value="<%=rsd.getString("name").toString()%>"><%=rsd.getString("name").toString()%></option>
					<%
						}
					%>
				</select>
				<button type="submit">Submit</button>
			</form>
		</div>
		<br>
	</div>



	<%
		Statement st = con.createStatement();
		ResultSet rs = st.executeQuery("SELECT * FROM Item");
	%>
	<table style="width: 100%">
		<tr>
			<th>Name</th>
			<th>Category Name</th>
			<th>Seller Name</th>
		</tr>
		<%
			while (rs.next()) {
		%>
		<tr>
			<td><a href="itemPage.jsp?itemId=<%=Integer.toString(rs.getInt("itemId"))%>"><%=rs.getString("name")%></a></td>
			<td><%=rs.getString("categoryName")%></td>
			<td><a href="userPage.jsp?userId=<%=rs.getString("sellerUserId")%>"><%=rs.getString("sellerUserId")%></a></td>
		</tr>
		<%
			}
		%>
	</table>
</body>
</html>