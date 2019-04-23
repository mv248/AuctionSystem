<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
	<%@ page  import="com.helpers.pkg.*"%>
<!--Import some libraries that have classes that we need -->
<%@ page import="java.io.*,java.util.*,java.sql.*"%>
<%@ page import="javax.servlet.http.*,javax.servlet.*"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>

<%

	
/*		String url = "jdbc:mysql://auctionsys.crgsn4ph3240.us-east-2.rds.amazonaws.com:3306/AuctionSystem";
		Connection conn = null;			
		PreparedStatement ps1 = null; */
		Connection con=null;	
	//	Statement st = con.createStatement();

		try {
			
			int itemId = Integer.parseInt(request.getParameter("itemId"));
			
		//	String itemId = request.getParameter("itemId");
			Class.forName("com.mysql.jdbc.Driver");
			con = DriverManager.getConnection("jdbc:mysql://auctionsys.crgsn4ph3240.us-east-2.rds.amazonaws.com:3306/AuctionSystem", "patarj23", "4rjL34rnDB");
			Statement st = con.createStatement();
			//Class.forName("com.mysql.jdbc.Driver").newInstance();
			//conn = DriverManager.getConnection(url, "patarj23", "4rjL34rnDB");
			//int itemId = Integer.parseInt(request.getParameter("itemId"));
			
			
			st.executeUpdate("UPDATE Posts SET parentPostId = NULL where itemId =" + itemId);
			st.executeUpdate("DELETE FROM Posts WHERE itemId = "+itemId);
			
			String delete = "DELETE FROM Auction WHERE itemId=" +itemId;
		//	String deletePost = "DELETE FROM Posts WHERE parentPostId IS NOT NULL AND itemId=" +itemId;
		//	String deletePost2 = "DELETE FROM Posts WHERE itemId=" +itemId;
					
			String deleteBid = "DELETE FROM Bids WHERE itemId=" +itemId;
			
			String deleteItem = "DELETE FROM Item WHERE itemId=" +itemId;
			
	//		st = con.createStatement(delete);
			//	st.setInt(1,itemId);
			st.executeUpdate(delete);
		//	st.executeUpdate(deletePost);
		//	st.executeUpdate(deletePost2);
			
			st.executeUpdate(deleteBid);
			
			st.executeUpdate(deleteItem);
			//ps1 = conn.prepareStatement(delete);
			//ps1.setInt(1, itemId);
			out.print("Auction Cancelled Successfully");
			//ps1.executeUpdate();
		} catch(Exception e) {
			out.print("<p>Error connecting to MYSQL server.</p>");
		    e.printStackTrace();
		} 
		
		/*finally {
			try { st.close(); } catch (Exception e) {}
	        try { con.close(); } catch (Exception e) {}
		} */
	
%>