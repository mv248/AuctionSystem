<%@ page language="java" contentType="text/html; charset=ISO-8859-1" pageEncoding="ISO-8859-1"%>
<%@ page import="java.io.*,java.util.*,java.sql.*"%>
<%@ page import="javax.servlet.http.*,javax.servlet.*"%>

<%
	String name = request.getParameter("search");
	String category = request.getParameter("category");
	String price = request.getParameter("bidPrice");
	Class.forName("com.mysql.jdbc.Driver");
	Connection con = DriverManager.getConnection(
			"jdbc:mysql://auctionsys.crgsn4ph3240.us-east-2.rds.amazonaws.com:3306/AuctionSystem", "patarj23",
			"4rjL34rnDB");
	Statement st = con.createStatement();
	ResultSet rs;
	String sql;
	if (category.equals("all")) {
		sql = ("SELECT * FROM Item WHERE name LIKE '%" + name + "%'");
	} else {
		sql = ("SELECT * FROM Item WHERE name LIKE '%" + name + "%' " + "AND categoryName='" + category + "'");
	}
	if (price != "") {
		sql = sql.concat(" AND itemID IN (SELECT itemId FROM Auction WHERE currentBidId IN (SELECT bidId FROM Bids WHERE (amount < " + price + " ))) ");
	}
	//out.println(sql);
	rs = st.executeQuery(sql);
%>

<!DOCTYPE html>
<html>
<head>
	<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
</head>


<title>Search Results</title>

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

	<h2>Search results for '<%out.println(name);%>' and category '<%out.println(category);%>' in  price range under '<%out.println(price);%>' </h2>
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
			<td><a
				href="itemPage.jsp?itemId=<%=Integer.toString(rs.getInt("itemId"))%>"><%=rs.getString("name")%></a></td>
			<td><%=rs.getString("categoryName")%></td>
			<td><%=rs.getString("sellerUserId")%></td>
		</tr>
		<%
			}
		%>
	</table>

</body>
</html>