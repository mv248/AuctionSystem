<%@ page language="java" contentType="text/html; charset=ISO-8859-1" pageEncoding="ISO-8859-1"%>
<%@ page import="java.util.Timer,java.util.*,java.text.*"%>
<!DOCTYPE html>
<html>
<head>
	<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
	<title>Home Page</title>
</head>
<body>
	<h1>Home Page</h1>

	<a href = "sellItem.jsp">Sell Item</a>
	<br/>
	<a href = "editAccInfo.jsp">Edit Account Information</a>
	<br/>
	<a href = "alerts.jsp">View Alerts</a>
	<br/>
	<a href = "search.jsp">Search / View Item Listings</a>
	
	<br/><br/>
	
	<%
		String userType = session.getAttribute("userId").toString();
		if (userType.equals("admin")) {
			%>
			<a href = "createCustomerRep.jsp">Create Customer Representative Account</a>
			<%
		} 
		else if (userType.equals("customerRep")) {
			%>
			<a href = "editAccInfo.jsp">Edit User Account Information</a>
			<%
		}
	%>
	
	<br/><br/><br/>
	<a href='logout.jsp'>Log out</a>
</body>
</html>