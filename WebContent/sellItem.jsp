<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">

<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Sell Item</title>
</head>



<body>
<h1>Sell Item</h1>



<br>
	<form method="POST" action="enterItem.jsp">
	<table>
	<tr>    
	<td>Item Category</td><td><select name="category" size=1>
			<option value="Phone">Phone</option>
			<option value="Computer">Computer</option>
			<option value="Laptop">Laptop</option></select></td>
	</tr>
	
	<tr>
	<td>Item Year (yyyy)</td><td><input type="text" name="year" required></td>
	</tr>
	<tr>    
		<td>Item Name</td><td><input type="text" name="itemName" required></td>
	</tr>
	<tr>    
	<td>Item Brand</td><td><input type="text" name="brand"></td>
	</tr>
	<tr>
	<tr> <td> <h3>Auction Information</h3> </td> </tr>
	<td>Starting Price Value ($$.$$)</td><td><input type="number" min="0" step="0.01" name="startPrice" value="0" required></td>
	</tr>
	<tr>
	<td>Reserve Price Value ($$.$$)</td><td><input type="number" min="0" step="0.01" name="reservePrice" value="0" required></td>
	</tr>
	<tr>
	<td>Increment Bid Value ($$.$$)</td><td><input type="number" min="0.01" step="0.01" name="bidIncrement" value="0.01" required></td>
	</tr>
	<tr>
	<td>Item End Date/Time </td><td><input type="datetime-local" name="endTime" required></td>
	</tr>
	</table>
	<br/><br/>
	<input type="Submit" value="Post Item">

	</form>
	
	<br/><br/>
	<a href=homepage.jsp> Home </a>
<br>
</body>

</html>