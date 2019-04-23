<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<%@ page import="java.io.*,java.util.*,java.sql.*"%>
<%@ page import="javax.servlet.http.*,javax.servlet.*"%>
<!DOCTYPE html >
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Subscribe to an Item</title>
</head>
<body>
	<h3>Subscribe to item with name:</h3>
	<form method="POST" action = submitSubscribe.jsp>
		<input type="text" name="itemName" placeHolder=Keyword> 
		<input type="Submit" value="Subscribe">
	</form>
	<%	
	try {
		String name = request.getParameter("itemName");
		String userId = session.getAttribute("userId").toString();
		Class.forName("com.mysql.jdbc.Driver");
		Connection con = DriverManager.getConnection(
				"jdbc:mysql://auctionsys.crgsn4ph3240.us-east-2.rds.amazonaws.com:3306/AuctionSystem", "patarj23",
				"4rjL34rnDB");
		Statement st1 = con.createStatement();
		Statement st2 = con.createStatement();
		ResultSet rs1, rs2;
		String sql1, sql2;
		int id;
		sql1 = "select max(subId) from Subscriptions;";
		rs1 = st1.executeQuery(sql1);
		if (!rs1.first()) {
			id = 1;
		} else {
			id = rs1.getInt("max(subId)");
			//out.println(id);
		}

		if (name == ("")) {
			//do nothing	
		} else {
			sql2 = "INSERT INTO `Subscriptions` VALUES ('" + (id + 1) + "', '" + userId + "', '" + name + "');";
			st2.executeUpdate(sql2);
		}
		con.close();
	} catch (Exception ex) {
		out.print(ex);
	}
	%>
</body>
</html>