<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1" import="com.helpers.pkg.*"%>
<!--Import some libraries that have classes that we need -->
<%@ page import="java.io.*,java.util.*,java.sql.*"%>
<%@ page import="javax.servlet.http.*,javax.servlet.*"%>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Insert title here</title>
</head>
<body>
	<%
	try {

		//Get the database connection
		ApplicationDB db = new ApplicationDB();	
		Connection con = db.getConnection();

		//Create a SQL statement
		Statement stmt = con.createStatement();

		//Get parameters from the HTML form at the index.jsp
		String category = request.getParameter("Category");
		String year = request.getParameter("year");
		String brand = request.getParameter("brand");

		//Make an insert statement for the Sells table:
		ResultSet res = stmt.executeQuery("SELECT COUNT(*) FROM Item");
		res.next();
		int count = res.getInt(1);
		String insert = "INSERT INTO Item(name, year, brand, itemId)"
				+ "VALUES (?, ?, ?, ?)";
		//Create a Prepared SQL statement allowing you to introduce the parameters of the query
		PreparedStatement ps = con.prepareStatement(insert);

		//Add parameters of the query. Start with 1, the 0-parameter is the INSERT statement itself
		ps.setString(1, category);
		ps.setString(2, year);
		ps.setString(3, brand);
		ps.setInt(4, count);
		ps.executeUpdate();

		//Close the connection. Don't forget to do it, otherwise you're keeping the resources of the server allocated.
		con.close();
		out.println("Posted Item! <br/><br/>");
		out.println("<a href=homepage.jsp> Home </a>");
		
	} catch (Exception ex) {
		out.println(ex);
		out.println("\n-- insert failed");
	}
%>
</body>
</html>