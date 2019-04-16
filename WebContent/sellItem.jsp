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
	<td>Item Category</td><td><select name="Category" size=1>
			<option value="Phone">Phone</option>
			<option value="Computer">Computer</option>
			<option value="Laptop">Laptop</option></select></td>
	</tr>
	<tr>
	<td>Item Year (yyyy)</td><td><input type="text" name="year"></td>
	</tr>
	<tr>    
	<td>Item Brand</td><td><input type="text" name="brand"></td>
	</tr>
	<tr>
	<td>Starting Price Value ($$.$$)</td><td><input type="text" name="startValue"></td>
	</tr>
	<tr>
	<td>Reserve Price Value ($$.$$)</td><td><input type="text" name="reserve"></td>
	</tr>
	<tr>
	<td>Increment Bid Value ($$.$$)</td><td><input type="text" name="bidIncrement"></td>
	</tr>
	<tr>
	<td>Item End Date (yyyy-mm-dd hh:mm:ss)</td><td><input type="text" name="endDate"></td>
	</tr>
	</table>
	<input type="Submit" value="Sell Item and List">

	</form>
<br>
</body>

</html>