<%@ page language="java" contentType="text/html; charset=ISO-8859-1" pageEncoding="ISO-8859-1"%>

<!DOCTYPE html>
<html>
<head>
	<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
	<title>Home Page</title>
</head>
<body>
	<h1>Home Page</h1>

		<%
		String userType = session.getAttribute("userType").toString();
		if (userType.equals("admin")) {
		%>
			<a href = "createCustomerRep.jsp">Create Customer Representative Account</a>
			<br/>
			<a href = "salesReport.jsp">Generate Sales Report</a>
			<br/>
		<%
		} else {
		%>
			<a href = "sellItem.jsp">Sell Item</a>
			<br/>
			<a href = "editAccInfo.jsp">Edit Account Information</a>
			<br/>
			<a href = "alerts.jsp">View Alerts</a>
			<br/>
			<a href = "search.jsp">Search</a>
			
			<br/><br/>
			<h3>Customer Rep Features</h3>
			<%
			if (userType.equals("customerRep")) {
			%>
			<a href = "editAccInfo.jsp">Edit User Account Information</a>
			<br/><a href = "deleteAuction.jsp"> Delete Auction</a>
			<%
			}
			%>
		
		<%
		}	
		%>
	
	<br/><br/><br/>
	<a href='logout.jsp'>Log out</a>
</body>
</html>