<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<%@ page import="java.sql.*"%>
<%
	String userId = session.getAttribute("userId").toString();
	String parentPostId = request.getParameter("parentPostId");
	String itemId = request.getParameter("itemId");
	String comment = request.getParameter("comment");
	Class.forName("com.mysql.jdbc.Driver");
	Connection con = DriverManager.getConnection("jdbc:mysql://auctionsys.crgsn4ph3240.us-east-2.rds.amazonaws.com:3306/AuctionSystem", "patarj23", "4rjL34rnDB");
	Statement st = con.createStatement();
	ResultSet posts = st.executeQuery("SELECT * FROM Posts ORDER BY postId DESC");
	posts.next();
	int lastId = posts.getInt("postId");
	String insert = "INSERT INTO Posts(postId, comment, parentPostId, itemId, authorId)"
			+ "VALUES (?, ?, ?, ?, ?)";
	PreparedStatement ps = con.prepareStatement(insert);
	
	ps.setInt(1, lastId + 1);
	ps.setString(2, comment);
	if (!parentPostId.equals("NULL")) {
		ps.setInt(3, Integer.parseInt(parentPostId));
	}
	else {
		ps.setNull(3, 0);
	}
	ps.setInt(4, Integer.parseInt(itemId));
	ps.setString(5, userId);
	ps.executeUpdate();
	response.sendRedirect("itemPage.jsp?itemId=" + itemId);
%>