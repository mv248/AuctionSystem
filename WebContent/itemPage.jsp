<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ page import="java.sql.*"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Auction - Item Page</title>
</head>
<body>

	<%
	final String itemId = request.getParameter("itemId");
	Class.forName("com.mysql.jdbc.Driver");
	Connection con = DriverManager.getConnection("jdbc:mysql://auctionsys.crgsn4ph3240.us-east-2.rds.amazonaws.com:3306/AuctionSystem", "patarj23", "4rjL34rnDB");
	Statement st = con.createStatement();
	ResultSet item = st.executeQuery("SELECT * FROM Item WHERE itemId=" + itemId);
	item.next();
%>
	<h2>
		Item #<%= itemId %></h2>
	<table>
		<tr>
			<td>Name:</td>
			<td style="padding-left: 1rem;"><%= item.getString("name") %></td>
		</tr>
		<tr>
			<td>Year:</td>
			<td style="padding-left: 1rem;"><%= item.getString("year") %></td>
		</tr>
		<tr>
			<td>Brand:</td>
			<td style="padding-left: 1rem;"><%= item.getString("brand") %></td>
		</tr>
		<tr>
			<td>Category:</td>
			<td style="padding-left: 1rem;"><%= item.getString("categoryName") %>
			</td>
		</tr>
		<tr>
			<td>Seller:</td>
			<td style="padding-left: 1rem;"><%= item.getString("sellerUserId") %>
			</td>
		</tr>
	</table>

	<br />
	<h3>Frequently Asked Questions</h3>

	Ask a Question
	<br />
	<form action="replyToPost.jsp" style="margin-left: 2rem;">
		<input type="hidden" name="itemId" value="<%= itemId %>"></input> <input
			type="hidden" name="parentPostId" value="NULL"></input> <input
			type="text" placeholder="Reply to Post" name="comment"></input>
		<button type="submit">Reply</button>
	</form>

	<br />
	<br />
	<%
	class Traverse {
		public void showPosts(Connection con, int parentPostId, int level, JspWriter out) {
			try {
				Statement stmt = con.createStatement();
				Statement stmt2 = con.createStatement();
				String ppidQuery = parentPostId == 0 ? "parentPostId IS NULL" : ("parentPostId=" + parentPostId);
				ResultSet res = stmt.executeQuery("SELECT * FROM Posts WHERE itemId=" + itemId + " AND " + ppidQuery);
				int i = 0;
				while (res.next()) {
					i++;
					final String comment = res.getString("comment");
					final String author = res.getString("authorId");
					final int postId = res.getInt("postId");
					out.println("<div");
					if (parentPostId > 0) {
						out.print(" style='margin-left: " + (level * 2) + "rem'>");
						out.print("A: ");
					} else {
						out.print(">");
						out.print(i + ": ");
					}
					out.print(comment + " (from " + author);
					ResultSet users = stmt2.executeQuery("SELECT * FROM User WHERE userId='" + author + "'");
					users.next();
					String userType = users.getString("userType");
					if (!userType.equals("normal")) {
						out.print("<span style='color: red'>-" + userType + "-</span>");
					}
					out.println(")");
					out.println("<form style='display:inline-block;margin-bottom:0.5rem;' action='replyToPost.jsp' style='margin-left: 2rem;'>");
					out.println("<input type='hidden' name='itemId' value='" + itemId + "'></input>");
					out.println("<input type='hidden' name='parentPostId' value='" + postId + "'></input>");
					out.println("<input type='text' placeholder='Reply to Post' name='comment'></input>");
					out.println("<button type='submit'>Reply</button>");
					out.println("</form>");
					out.println("</div>");
					showPosts(con, postId, level + 1, out);
				}
			} catch (Exception e) {
				e.printStackTrace();
			}
		}
	}
	
	Traverse t = new Traverse();
	t.showPosts(con, 0, 0, out);
	
%>

	<br />
	<br />
	<a href="homepage.jsp"> Home </a>

</body>
</html>