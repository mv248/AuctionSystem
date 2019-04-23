<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
    
<%@ page import="java.io.*,java.util.*,java.sql.*"%>
<%@ page import="javax.servlet.http.*,javax.servlet.*"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Insert title here</title>
</head>
<body>
<%
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
			sql2 = "INSERT INTO `Subscriptions` VALUES ('" + id + "', '" + userId + "', '" + name + "');";
			st2.executeUpdate(sql2);
		}
		con.close();
	%>
</body>
</html>